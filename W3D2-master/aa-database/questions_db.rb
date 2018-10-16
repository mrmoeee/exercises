require 'sqlite3'
require 'singleton'
require 'byebug'
class QuestionsDBConnection < SQLite3::Database
  include Singleton
  
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end 

end 

class User 
  attr_accessor :fname, :lname
  
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
  
  def self.all 
    data = QuestionsDBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end
  
  def self.find_by_name(fname, lname)
    user = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT 
        *
      FROM 
        users
      WHERE 
        fname = ? AND lname = ?
    SQL
    user
  end  
  
  def authored_questions
    Question.find_by_author_id(@id)
  end 
  
  def authored_replies 
    Reply.find_by_user_id(@id)
  end
end 

class Question
  attr_accessor :title, :body, :author_id
  
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end
  
  def self.find_by_author_id(author_id)
    author = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT 
        *
      FROM 
        questions
      WHERE 
        author_id = ?
    SQL
    author
  end  
  
  def author 
    @author_id
  end
  
  def replies 
    Reply.find_by_question_id(@id)
  end
  
end 

class Reply
  attr_accessor :q_id, :p_id, :u_id, :r_body 
  def initialize(options) 
    @id = options['id']
    @q_id = options['q_id']
    @p_id = options['p_id']
    @u_id = options['u_id']
    @r_body = options['r_body']
  end
  
  def self.find_by_user_id(u_id)
    reply = QuestionsDBConnection.instance.execute(<<-SQL, u_id)
      SELECT 
        * 
      FROM 
        replies 
      WHERE 
        u_id = ? 
    SQL
    reply  
  end
  
  def self.find_by_question_id(q_id)
    question = QuestionsDBConnection.instance.execute(<<-SQL, q_id)
      SELECT 
        * 
      FROM 
        replies 
      WHERE 
        q_id = ?
    SQL
    raise "No responses yet. . . " if question.empty?
    question
  end
  
  def author
    @u_id
  end 
  
  def question
    @q_id
  end 
  
  def parent_reply
    @p_id
  end 
  
  def child_replies
    if @p_id.nil?
      return 1
    else 
      return @p_id + 1
    end 
  end 
  
end


class QuestionFollow
  attr_accessor :user_id, :question_id
  
  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end 
  
  
  def self.followers_for_question_id(question_id)
    users = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT 
        *
      FROM 
        users 
      JOIN 
        question_follows 
      ON 
        users.id = question_follows.user_id 
      WHERE 
        question_id = ?;
    SQL
    users.map { |user| User.new(user) }
  end 
  
  def self.followed_question_for_user_id(user_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT 
        *
      FROM 
        questions
      JOIN 
        question_follows 
      ON 
        questions.id = question_follows.question_id 
      WHERE 
        user_id = ?;
    SQL
    questions.map { |question| Question.new(question) }
  end
  
end 


class Response < ApplicationRecord
  
  
  # def sibling_responses
  # 
  # end
  
  
  
  belongs_to :answer,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :Answer 
  
  belongs_to :respondent,
    primary_key: :id, 
    foreign_key: :user_id,
    class_name: :User
    
  has_one :question,
    through: :answer,
    source: :question
  
end
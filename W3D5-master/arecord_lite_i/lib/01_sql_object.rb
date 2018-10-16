require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    #we wanna get the columns, interpolate table name in FROM lause.
    #first element = list of names of columns
    #store in @columns, and return as symbols.
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
      SELECT 
        * 
      FROM 
        #{self.table_name}
    SQL
    cols.map! do |col|
      col.to_sym 
    end
    @columns = cols
  end

  def self.finalize!
    #get and set for each column , call attribute since it returns hash?
    self.columns.each do |col|
      define_method(col) do 
        self.attributes[col]
      end 
      
      define_method("#{col}=") do |value| 
        self.attributes[col] = value 
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    #default convert the cass name to snake_Case and pluralize 
    @table_name || self.name.underscore.pluralize
  end

  def self.all
    # ...
    # SELECT
    #   humans.*
    # FROM
    #   humans
    #fetch all records from the database 
    #first generate necessary  query . use heredoc syntax to define query.
    results = DBConnection.execute(<<-SQL)
      SELECT 
        #{self.table_name}.*
      FROM
        #{self.table_name}
    SQL
    #returns an array of raw hash objects, key = column name, values = column value
    self.parse_all(results)
  end

  def self.parse_all(results)
    # ...
    #iterate through results, use new to create a new instance for each 
    #we want the object that self is. Human.all = human objects, Cat.all = cat objects
    results = results.map { |result| self.new(result) }
  end

  def self.find(id)
    # ...
    results = DBConnection.execute(<<-SQL, id)
      SELECT 
        #{table_name}.*
      FROM 
        #{table_name} 
      WHERE 
        #{table_name}.id = ?
    SQL
    parse_all(results).first
  end

  def initialize(params = {})
    # ...
    #iterate through each attr_name, value pairs. convert name to symbol and check
    #if attr_name is in columns. raise error if not. 
    params.each do |attr_name, value|
      #convert to symbol 
      attr_name = attr_name.to_sym
      #check if in columns 
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name)
      #send syntax(object.send(method_name, value))
      #set the attribute, call send
      self.send("#{attr_name}=", value)
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    self.class.columns.map { |col| self.send(col) }
    
  end

  def insert
    # ...
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(', ')
    question_marks = (["?"] * columns.length).join(', ')
    #keep first column for id.
    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
    INSERT INTO 
      #{self.class.table_name} (#{col_names})
    VALUES 
      (#{question_marks})
    SQL
    
    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    # UPDATE
    #   table_name
    # SET
    #   col1 = ?, col2 = ?, col3 = ?
    # WHERE
    #   id = ?
    columns = self.class.columns
    set_line = columns.map { |attr_name| "#{attr_name} = ?" }.join(', ')
    DBConnection.execute(<<-SQL, *attribute_values, id) 
      UPDATE 
        #{self.class.table_name}
      SET 
        #{set_line}
      WHERE 
        #{self.class.table_name}.id = ?
    SQL
    #debugger
    # puts "god dammit i fucking suck"
  end

  def save
    # ...
    self.id.nil? ? insert : update
  end
end

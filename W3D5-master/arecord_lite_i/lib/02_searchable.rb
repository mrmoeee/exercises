require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    # ...
    where_line = params.keys.map { |key| "#{key} = ?"}.join(' AND ')
  end
end

class SQLObject
  # Mixin Searchable here...
end

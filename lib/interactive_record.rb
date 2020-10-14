require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    DB[:conn].results_as_hash = true

    sql = "pragma table_data ('#{table_name}')"

    table_data = DB[:conn].execute(sql)
    column_names = []
    table_data.each do |temp|
      column_names << temp["name"]
    end
    column_names.compact
  end

end

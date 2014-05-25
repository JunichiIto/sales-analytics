class SalesInfo < ActiveRecord::Base
  def self.normalize_column_name(name)
    name.gsub("%", "Percentage").titleize.gsub(" ", "").underscore
  end
end

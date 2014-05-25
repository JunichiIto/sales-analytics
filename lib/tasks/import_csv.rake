require 'csv'

desc "import CSV"
task import_csv: :environment do
  puts "start"

  SalesInfo.transaction do
    SalesInfo.destroy_all

    csv_text = File.read("#{Rails.root}/tmp/sales.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      hash = row.to_hash.map{|k,v| [SalesInfo.normalize_column_name(k), v]}.to_h
      puts hash
      SalesInfo.create! hash
    end

  end

  puts "end"
end

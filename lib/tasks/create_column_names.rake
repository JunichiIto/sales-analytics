desc "create column names"
task create_column_names: :environment do
  text = "Book Title	URL	Purchase ID	Total Paid for Bundle	Book Revenue from Bundle	Total Paid for Book	Total Book Royalty	Author Name	Author % of Total Royalty	Affiliate Code	Affiliate Cut	Author and Cause Royalties	Cause Name	Cause % of Author Royalty	Cause Royalties Portion	Author Royalties Portion	Package Name	Bundle Name	Date Purchased	Royalty Held Until At Least	Date Author Royalty Was Paid	Date Publisher Royalty Was Paid	Date Cause Royalty Was Paid	Coupon Code	Coupon Note	Email If Shared"
  column_text = text.split("\t").map{|s| s.gsub("%", "Percentage").titleize.gsub(" ", "").underscore }.join("\n")
  puts column_text.length
end
class SharedEmailsReport < Dossier::Report
  def sql
    <<-SQL
with sales_view AS (
    SELECT DISTINCT
      purchase_id,
      date_purchased,
      total_paid_for_book,
      total_book_royalty,
      package_name,
      email_if_shared
    FROM sales_infos
)
select
date_purchased,
email_if_shared,
total_paid_for_book,
package_name
from sales_view
where email_if_shared != ''
order by
  date_purchased DESC, purchase_id
    SQL
  end
end
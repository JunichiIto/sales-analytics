class PaymentDistributionReport < Dossier::Report
  def sql
    <<-SQL
with sales_view AS (
    SELECT DISTINCT
      purchase_id,
      total_paid_for_book,
      package_name
    FROM sales_infos
)
select
  package_name,
  sum (case when total_paid_for_book = 16 then 1 else 0 end) AS paid_16,
  sum (case when total_paid_for_book > 16 and total_paid_for_book < 20 then 1 else 0 end) AS paid_16_20,
  sum (case when total_paid_for_book = 20 then 1 else 0 end) AS paid_20,

  sum (case when total_paid_for_book > 20 and total_paid_for_book < 25 then 1 else 0 end) AS paid_20_25,
  sum (case when total_paid_for_book >= 25 and total_paid_for_book < 30 then 1 else 0 end) AS paid_25_30,
  sum (case when total_paid_for_book >= 30 then 1 else 0 end) AS paid_over_30
from sales_view
where package_name = 'パーソナル（シングルユーザーライセンス）'
group by package_name
    SQL
  end
end
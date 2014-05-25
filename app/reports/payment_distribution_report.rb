class PaymentDistributionReport < Dossier::Report
  def sql
    <<-SQL
with sales_view AS (
  SELECT DISTINCT
    purchase_id,
    total_paid_for_book
  FROM sales_infos
  where package_name = 'パーソナル（シングルユーザーライセンス）'
),
paid_distribution AS (
  select
    1 AS id,
    sum (case when total_paid_for_book = 16 then 1 else 0 end) AS paid_16,
    sum (case when total_paid_for_book > 16 and total_paid_for_book < 20 then 1 else 0 end) AS paid_16_20,
    sum (case when total_paid_for_book = 20 then 1 else 0 end) AS paid_20,
    sum (case when total_paid_for_book > 20 and total_paid_for_book < 25 then 1 else 0 end) AS paid_20_25,
    sum (case when total_paid_for_book >= 25 and total_paid_for_book < 30 then 1 else 0 end) AS paid_25_30,
    sum (case when total_paid_for_book >= 30 then 1 else 0 end) AS paid_over_30,
    count(*) as purchase_count
  from sales_view
),
paid_percentage AS (
  select
    1 AS id,
    round(cast(paid_16 as dec) / purchase_count * 100, 2) AS paid_16_percent,
    round(cast(paid_16_20 as dec) / purchase_count * 100, 2) AS paid_16_20_percent,
    round(cast(paid_20 as dec) / purchase_count * 100, 2) AS paid_20_percent,
    round(cast(paid_20_25 as dec) / purchase_count * 100, 2) AS paid_20_25_percent,
    round(cast(paid_25_30 as dec) / purchase_count * 100, 2) AS paid_25_30_percent,
    round(cast(paid_over_30 as dec) / purchase_count * 100, 2) AS paid_over_30_percent
  from paid_distribution
)
select
  purchase_count,
  paid_16 || ' (' || paid_16_percent || '%)' as paid_16,
  paid_16_20 || ' (' || paid_16_20_percent || '%)' as paid_16_20,
  paid_20 || ' (' || paid_20_percent || '%)' as paid_20,
  paid_20_25 || ' (' || paid_20_25_percent || '%)' as paid_20_25,
  paid_25_30 || ' (' || paid_25_30_percent || '%)' as paid_25_30,
  paid_over_30 || ' (' || paid_over_30_percent || '%)' as paid_over_30
from paid_distribution
inner join paid_percentage
on paid_distribution.id = paid_percentage.id
    SQL
  end
end
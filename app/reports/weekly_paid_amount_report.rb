class WeeklyPaidAmountReport < Dossier::Report
  def sql
    <<-SQL
with sales_view AS (
    SELECT DISTINCT
      purchase_id,
      date_purchased,
      total_paid_for_book,
      total_book_royalty,
      package_name
    FROM sales_infos
),
    weekly_sales_count AS (
      SELECT
        date_trunc('week', date_purchased) AS "Week",
        sum(total_paid_for_book)                           AS total_paid_for_book,
        sum(total_book_royalty) AS total_book_royalty
      FROM sales_view
      WHERE date_purchased > now() - INTERVAL '3 years'
      GROUP BY 1
  )
SELECT
  to_char("Week", 'YYYY-MM-DD') AS "Week",
  total_paid_for_book,
  round(cast(total_paid_for_book as dec) / 7, 2) AS total_paid_avg_per_day,
  sum(total_paid_for_book) over (order by "Week") AS cum_total_paid,

  total_book_royalty,
  round(cast(total_book_royalty as dec) / 7, 2) AS total_royalty_avg_per_day,
  sum(total_book_royalty) over (order by "Week") AS cum_total_royalty
FROM weekly_sales_count
UNION ALL
SELECT
  'Total count',
  sum(total_paid_for_book),
  null,
  null,
  sum(total_book_royalty),
  null,
  null
FROM
  weekly_sales_count
ORDER BY "Week" DESC
    SQL
  end
end
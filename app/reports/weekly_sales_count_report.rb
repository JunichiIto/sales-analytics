class WeeklySalesCountReport < Dossier::Report
  class << self
    def chart_method
      "line_chart"
    end

    def chart_data(results)
      results.map{|row| [row[0], row[2]]}
    end
  end

  def sql
    <<-SQL
with sales_view AS (
    SELECT DISTINCT
      purchase_id,
      date_purchased,
      total_paid_for_book,
      package_name
    FROM sales_infos
),
    weekly_sales_count AS (
      SELECT
        date_trunc('week', date_purchased) AS "Week",
        count(*)                           AS sales_count
      FROM sales_view
      WHERE date_purchased > now() - INTERVAL '3 years'
      GROUP BY 1
  )
SELECT
  to_char("Week", 'YYYY-MM-DD') AS "Week",
  sales_count,
  round(cast(sales_count as dec) / 7, 2) AS sales_avg_per_day,
  sum(sales_count) over (order by "Week") AS cum_total
FROM weekly_sales_count
ORDER BY "Week" DESC
    SQL
  end
end
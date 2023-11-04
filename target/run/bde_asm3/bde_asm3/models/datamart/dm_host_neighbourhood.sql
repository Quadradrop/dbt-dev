
  create view "postgres"."datamart"."dm_host_neighbourhood__dbt_tmp"
    
    
  as (
    WITH transformed_hosts AS (
    SELECT
        CASE
            WHEN LOWER(host_neighbourhood) IN (SELECT DISTINCT suburb_name FROM "postgres"."staging"."lga_suburb_stg")
            THEN suburb_name  -- Use suburb_name when host_neighbourhood matches a distinct suburb_name
            ELSE LOWER(host_neighbourhood)
        END AS host_neighbourhood_lga,
        TO_CHAR(scraped_date, 'YYYY-MM') AS month_year,
        host_id,
        price * (30 - availability_30) AS estimated_revenue
    FROM "postgres"."warehouse"."facts_airbnb"
)

SELECT
    host_neighbourhood_lga,
    month_year,
    COUNT(DISTINCT host_id) AS distinct_hosts,
    SUM(estimated_revenue) AS estimated_revenue,
    SUM(estimated_revenue) / NULLIF(COUNT(DISTINCT host_id), 0) AS estimated_revenue_per_host
FROM transformed_hosts
GROUP BY host_neighbourhood_lga, month_year
ORDER BY host_neighbourhood_lga, month_year
  );
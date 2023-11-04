SELECT
    property_type,
    room_type,
    accommodates,
    TO_CHAR(scraped_date, 'YYYY-MM') AS month_year,
    (COUNT(CASE WHEN has_availability = 't' THEN 1 ELSE NULL END) / NULLIF(COUNT(*), 0)) * 100 AS active_listings_rate,
    MIN(CASE WHEN has_availability = 't' THEN price ELSE NULL END) AS min_price_active_listings,
    MAX(CASE WHEN has_availability = 't' THEN price ELSE NULL END) AS max_price_active_listings,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CASE WHEN has_availability = 't' THEN price ELSE NULL END) AS median_price_active_listings,
    AVG(CASE WHEN has_availability = 't' THEN price ELSE NULL END) AS avg_price_active_listings,
    COUNT(DISTINCT CASE WHEN has_availability = 't' THEN host_id ELSE NULL END) AS distinct_hosts,
    (COUNT(CASE WHEN has_availability = 't' AND host_is_superhost = 't' THEN 1 ELSE NULL END) /
    NULLIF(COUNT(CASE WHEN has_availability = 't' THEN 1 ELSE NULL END), 0)) * 100 AS superhost_rate,
    AVG(CASE WHEN has_availability = 't' THEN review_scores_rating ELSE NULL END) AS avg_review_scores_rating,
    SUM(CASE WHEN has_availability = 't' THEN 30 - availability_30 ELSE 0 END) AS total_stays,
    (SUM(CASE WHEN has_availability = 't' THEN (30 - availability_30) * price ELSE 0 END) /
    NULLIF(COUNT(DISTINCT CASE WHEN has_availability = 't' THEN host_id ELSE NULL END), 0)) AS avg_estimated_revenue_per_active_listing
FROM {{ ref('facts_airbnb') }}
GROUP BY property_type, room_type, accommodates, month_year
ORDER BY property_type, room_type, accommodates, month_year

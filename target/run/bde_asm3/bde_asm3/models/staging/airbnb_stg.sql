
  create view "postgres"."staging"."airbnb_stg__dbt_tmp"
    
    
  as (
    -- Define your unique key for snapshotting


-- Create your source CTE, which selects data from the raw data
with

source  as (

    select * from "postgres"."raw"."listings"

),

-- Rename columns as needed
renamed as (
    select
        listing_id,
        to_date(scraped_date, 'YYYY/MM/DD') as scraped_date,
        scrape_id,
        listing_neighbourhood,
        host_id,
        has_availability,
        price,
        availability_30,
        number_of_reviews,
        review_scores_rating,
        review_scores_accuracy,
        review_scores_cleanliness,
        review_scores_checkin,
        review_scores_communication,
        review_scores_value
    from source
)

-- Select the final output
select * from renamed
  );
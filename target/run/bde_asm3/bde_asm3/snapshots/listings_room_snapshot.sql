
      
  
    

  create  table "postgres"."raw"."listings_room_snapshot"
  
  
    as
  
  (
    

    select *,
        md5(coalesce(cast(listing_id as varchar ), '')
         || '|' || coalesce(cast(scraped_date as varchar ), '')
        ) as dbt_scd_id,
        scraped_date as dbt_updated_at,
        scraped_date as dbt_valid_from,
        nullif(scraped_date, scraped_date) as dbt_valid_to
    from (
        


select
  listing_id,
  scraped_date,
  room_type,
  accommodates,
  price

from "postgres"."raw"."listings"

    ) sbq



  );
  
  
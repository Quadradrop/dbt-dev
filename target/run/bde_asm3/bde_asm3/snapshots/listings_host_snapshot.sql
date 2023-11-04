
      
  
    

  create  table "postgres"."raw"."listings_host_snapshot"
  
  
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
  host_id,
  host_name,
  host_since,
  host_is_superhost,
  host_neighbourhood

from "postgres"."raw"."listings"

    ) sbq



  );
  
  
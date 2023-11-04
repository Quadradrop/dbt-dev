
  
    

  create  table "postgres"."warehouse"."dim_listings_property__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."staging"."listings_property_stg"
  );
  
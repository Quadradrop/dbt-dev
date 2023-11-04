
  
    

  create  table "postgres"."warehouse"."dim_listings_host__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."staging"."listings_host_stg"
  );
  
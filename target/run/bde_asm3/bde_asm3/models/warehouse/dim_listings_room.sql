
  
    

  create  table "postgres"."warehouse"."dim_listings_room__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."staging"."listings_room_stg"
  );
  
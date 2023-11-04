
  
    

  create  table "postgres"."warehouse"."dim_lga_suburb__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."staging"."lga_suburb_stg"
  );
  
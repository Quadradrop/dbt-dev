
  
    

  create  table "postgres"."warehouse"."dim_g01__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."staging"."g01_stg"
  );
  
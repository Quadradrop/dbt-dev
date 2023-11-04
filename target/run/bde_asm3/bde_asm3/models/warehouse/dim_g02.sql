
  
    

  create  table "postgres"."warehouse"."dim_g02__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."staging"."g02_stg"
  );
  
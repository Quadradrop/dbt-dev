
  
    

  create  table "postgres"."warehouse"."dim_lga_code__dbt_tmp"
  
  
    as
  
  (
    

select * from "postgres"."staging"."lga_code_stg"
  );
  

  create view "postgres"."staging"."lga_code_stg__dbt_tmp"
    
    
  as (
    

with

source  as (

    select * from "postgres"."raw"."lga_code"

)

select * from source
  );
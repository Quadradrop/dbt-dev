
  create view "postgres"."staging"."lga_suburb_stg__dbt_tmp"
    
    
  as (
    

with

source  as (

    select * from "postgres"."raw"."lga_suburb"

)

select * from source
  );
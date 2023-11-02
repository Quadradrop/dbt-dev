{{
    config(
        unique_key='lga_code'
    )
}}

with

source  as (

    select * from "postgres"."raw"."lga_code"

)

select * from source

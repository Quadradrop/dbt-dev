{{
    config(
        unique_key='lga_name'
    )
}}

with

source  as (

    select * from "postgres"."raw"."lga_suburb"

)

select * from source

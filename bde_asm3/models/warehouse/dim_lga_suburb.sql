{{
    config(
        unique_key='lga_name'
    )
}}

select * from {{ ref('lga_suburb_stg') }}
{{
    config(
        unique_key='listing_id'
    )
}}

select * from {{ ref('listings_host_stg') }}
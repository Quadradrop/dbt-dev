{{
    config(
        unique_key='listing_id'
    )
}}

select * from {{ ref('listings_property_stg') }}
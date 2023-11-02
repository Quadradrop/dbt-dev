{{
    config(
        unique_key='listing_id'
    )
}}

select * from {{ ref('listings_room_stg') }}
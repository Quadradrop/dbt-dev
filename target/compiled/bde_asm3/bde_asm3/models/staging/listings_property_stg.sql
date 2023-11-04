

with

source  as (

    select * from "postgres"."raw"."listings_property_snapshot"

),

renamed as (
    select
        listing_id,
        to_date(scraped_date, 'YYYY/MM/DD') as scraped_date,
        listing_neighbourhood,
        property_type,
        case
            when to_timestamp(dbt_valid_from, 'YYYY-MM-DD') = (select min(to_timestamp(dbt_valid_from, 'YYYY-MM-DD')) from source) then '1900-01-01'::timestamp
            else to_timestamp(dbt_valid_from, 'YYYY-MM-DD')
        end as dbt_valid_from,
        to_timestamp(dbt_valid_to, 'YYYY-MM-DD') as dbt_valid_to
    from source
),

unknown as (
    select
        0 as listing_id,
        '1900-01-01'::timestamp as scraped_date,
        'unknown' as listing_neighbourhood,
        'unknown' as property_type,
        '1900-01-01'::timestamp as dbt_valid_from,
        '1900-01-01'::timestamp as dbt_valid_to
)

select * from unknown
union all
select * from renamed
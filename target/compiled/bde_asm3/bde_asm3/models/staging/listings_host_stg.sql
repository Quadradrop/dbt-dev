

with

source  as (

    select * from "postgres"."raw"."listings_host_snapshot"

),

renamed as (
    select
        listing_id,
        to_date(scraped_date, 'YYYY-MM-DD') as scraped_date,
        host_id,
        host_name,
        host_since,
        host_is_superhost,
        host_neighbourhood,
        CASE
            WHEN to_timestamp(dbt_valid_from, 'YYYY-MM-DD') = (select min(to_timestamp(dbt_valid_from, 'YYYY-MM-DD')) from source) THEN '1900-01-01'::timestamp
            ELSE to_timestamp(dbt_valid_from, 'YYYY-MM-DD')
        END as dbt_valid_from,
        to_timestamp(dbt_valid_to, 'YYYY-MM-DD') as dbt_valid_to
    from source
),

unknown as (
    select
        0 as listing_id,
        '1900-01-01'::date as scraped_date,
        0 as host_id,
        'unknown' as host_name,
        'unknown' as host_since,
        'unknown' as host_is_superhost,
        'unknown' as host_neighbourhood,
        '1900-01-01'::timestamp as dbt_valid_from,
        '1900-01-01'::timestamp as dbt_valid_to
    )

select * from unknown
union all
select * from renamed
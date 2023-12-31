{% endsnapshot %}

{% snapshot listings_property_snapshot %}
{{
  config(
    target_schema='raw',
    strategy='timestamp',
    unique_key='listing_id',
    updated_at='scraped_date',
  )
}}

select
  listing_id,
  scraped_date,
  listing_neighbourhood,
  property_type

from {{ source('raw', 'listings') }}

{% endsnapshot %}
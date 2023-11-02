{{
    config(
        unique_key='lga_code'
    )
}}

select * from {{ ref('lga_code_stg') }}
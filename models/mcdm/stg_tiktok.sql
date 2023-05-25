with fb as (
    select * from  {{ source('mcdm_dbt', 'src_ads_tiktok_ads_all_data' ) }}
)

select * from fb
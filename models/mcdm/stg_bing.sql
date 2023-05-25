with bing as (
    select * from  {{ source('mcdm_dbt', 'src_ads_bing_all_data' ) }}
)

select * from bing
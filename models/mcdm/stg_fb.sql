with fb as (
    select * from  {{ source('mcdm_dbt', 'src_ads_creative_facebook_all_data' ) }}
)

select * from fb
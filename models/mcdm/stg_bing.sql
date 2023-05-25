with bing as (
    select ad_id,
        adset_id,
        campaign_id,
        channel,
        clicks,
        date,
        imps,
        revenue,
        spend,
        conv,
        round(((clicks + conv) / imps), 2) as engagement, 
    from mcdmdbt.mcdm_dbt.src_ads_bing_all_data
)

select * from bing
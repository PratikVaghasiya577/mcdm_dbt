{{ config (
    materialized="table"
)}}


with bi as (select * from {{ ref("stg_bing") }} ),

tktk as (select * from {{ ref("stg_tiktok") }} ),

fbk as (select * from {{ ref("stg_fb") }} ),

twtr as (select * from {{ ref("stg_twt") }} ),

final as (
select bi.ad_id, 0 as add_to_cart, bi.adset_id, bi.campaign_id, bi.channel, bi.clicks, 0 as comments, 0 as creative_id, bi.date, 0 as engagements, bi.imps as impressions, 0 as installs, 0 as likes, 0 as link_clicks, 0 as placement_id, 0 as post_click_conversion, 0 as post_view_conversion, 0 as posts, 0 as purchase, 0 as registrations, bi.revenue, 0 as shares, bi.spend, bi.conv as total_conversions, 0 as video_views
from bi
union all
select fbk.ad_id, fbk.add_to_cart, fbk.adset_id, fbk.campaign_id, fbk.channel, fbk.clicks, fbk.comments, fbk.creative_id, fbk.date, fbk.comments + fbk.shares + fbk.views + fbk.mobile_app_install + fbk.inline_link_clicks as engagements, fbk.impressions as impressions, fbk.mobile_app_install as installs, fbk.likes as likes, fbk.inline_link_clicks as link_clicks, 0 as placement_id, 0 as post_click_conversion, 0 as post_view_conversion, 0 as posts, fbk.purchase, 0 as registrations, 0 as revenue, fbk.shares, fbk.spend, fbk.purchase as total_conversions, fbk.views as video_views
from fbk
union all
select tktk.ad_id, tktk.add_to_cart, tktk.adgroup_id as adset_id, tktk.campaign_id, tktk.channel, tktk.clicks, 0 as comments, 0 as creative_id, tktk.date, 0 as engagements, tktk.impressions as impressions, tktk.rt_installs as installs, 0 as likes, 0 as link_clicks, 0 as placement_id, 0 as post_click_conversion, 0 as post_view_conversion, 0 as posts, 0 as purchase, tktk.registrations, 0 as revenue, 0 as shares, tktk.spend, tktk.conversions as total_conversions, tktk.video_views as video_views
from tktk
union all 
select 0 as ad_id, 0 as add_to_cart, 0 as adset_id, twtr.campaign_id, twtr.channel, twtr.clicks as clicks, twtr.comments as comments, 0 as creative_id, twtr.date, twtr.engagements, twtr.impressions as impressions, 0 as installs, twtr.likes, twtr.clicks as link_clicks, 0 as placement_id, 0 as post_click_conversion, 0 as post_view_conversion, 0 as posts, 0 as purchase, 0 as registrations, 0 as revenue, twtr.retweets as shares, twtr.spend, 0 as total_conversions, twtr.video_total_views as video_views
from twtr
)

select * from final


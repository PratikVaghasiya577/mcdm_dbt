with twt as (
    select * from  {{ source('mcdm_dbt', 'src_promoted_tweets_twitter_all_data' ) }}
)

select * from twt
with bi as (select * from {{ ref("stg_bing") }} )

tktk as (select * from {{ ref("stg_tiktok") }} )

fbk as (select * from {{ ref("stg_fb") }} )

twtr as (select * from {{ ref("stg_twt") }} )

-- final as (
-- select bi.ad_id from bi
-- union all
-- select fbk.ad_id from fbk
-- )

-- select * from final
select *
from fbk

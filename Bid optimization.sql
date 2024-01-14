/* Bid optimization is done weed out the failing strategy and double down on the winning strategies
 Use cases - ascertaining cost of customer acquisition using conversion rate and revenue per click
 understanding the performance of product and website by further drilling down on other aspects like - customer demography, device used, deflection channel, festivities etc. 
 impact analysis after bid changes to the strategy - volume spent, sales volume, website visits etc. 
*/

-- Traffic source trend analysis for gsearch nonbrand source after the marketing team bid down this source

select
    -- week(created_at) as week,
    min(date(created_at)) as week_start_date,
    count(distinct website_session_id) as sessions
from website_sessions
where website_sessions.created_at < '2012-05-10'
		and website_sessions.utm_source='gsearch'
        and website_sessions.utm_campaign='nonbrand'
group by  week(created_at);
-- Trend analysis after bid down shows that the traffic has reduced week on week 
-- we dive into the site visit to order conversion rate by device type 
use mavenfuzzyfactory;
select 
		website_sessions.device_type,
       count(distinct website_sessions.website_session_id) as sessions,
       count(distinct orders.order_id) as orders,
       count(distinct orders.order_id)/count(distinct website_sessions.website_session_id) as conversion_rate
from website_sessions
left join orders
	on website_sessions.website_session_id=orders.website_session_id
    
where website_sessions.created_at < '2012-05-11'
		 and website_sessions.utm_source='gsearch'
        and website_sessions.utm_campaign='nonbrand'
group by 1; 
-- after analysing the conversion rate for the major source of traffic it appears less than the break even point of 4%
-- Although there is a stark difference in the conversion for mobile and desktop with desktop returning 4 times better than mobile
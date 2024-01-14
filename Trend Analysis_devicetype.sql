-- device type trend analysis after bidding up gsearch nonbrand desktop campaigns on 2012-05-19
select
    week(created_at) as week,
    min(date(created_at)) as week_start_date,
	count(distinct case when device_type='desktop' then website_session_id else null end) as desktop_sessions,
	count(distinct case when device_type='mobile' then website_session_id else null end) as mobile_sessions,
    count(distinct website_session_id) as total_sessions
from website_sessions
where website_sessions.created_at < '2012-06-9'
		and website_sessions.utm_source='gsearch'
        and website_sessions.utm_campaign='nonbrand'
group by  week(created_at);
-- Trend analysis after bid up shows that the traffic has reduced week on week for mobile and increased for desktop
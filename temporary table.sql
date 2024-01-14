/*  Analyzing top website content - Identifying most visited pages, most common entry pages to the website for understanding
business demand and alignment with business objectives */
-- creating temporary tables with new manipulated columns
-- created temporary table first_pageview to get the column session_id containing unique sessions
/* create temporary table first_pageview
		select 
				website_session_id,
                min(website_pageview_id) as first_pv
		from website_pageviews
        group by website_session_id;
*/
select 
        website_pageviews.pageview_url as landing_page,
        count(distinct first_pageview.website_session_id) as sessions
from first_pageview
left join website_pageviews
	on first_pageview.website_pageview_id=website_pageviews.website_pageview_id
    where website_pageviews.created_at<'2012-06-12'
group by landing_page
order by sessions desc





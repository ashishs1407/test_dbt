
  create or replace  view My_db.my_schema.src_raw_listings
  
   as (
    with raw_listings as (
    select * from airbnb.raw.raw_listings
)
select 
Id  as listing_id,
name as listing_name,
listing_url ,
room_type ,
minimum_nights,
host_id,
price as price_str,
created_at,
updated_at
from raw_listings
  );

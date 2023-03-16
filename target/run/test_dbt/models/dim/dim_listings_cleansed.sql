

      create or replace transient table My_db.my_schema.dim_listings_cleansed  as
      (

WITH  __dbt__cte__src_raw_listings as (


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
),src_listings AS (
  SELECT
    *
  FROM
    __dbt__cte__src_raw_listings
)
SELECT
  listing_id,
  listing_name,
  case when room_type = 'Entire home/apt' then 'Entire home'
  else room_type
  end as room_type,
  CASE
    WHEN minimum_nights = 0 THEN 1
    ELSE minimum_nights
  END AS minimum_nights,
  host_id,
  REPLACE(
    price_str,
    '$'
  ) :: NUMBER(
    10,
    2
  ) AS price,
  created_at,
  updated_at
FROM
  src_listings
      );
    
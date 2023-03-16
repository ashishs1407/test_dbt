{{config(materialized='table')}}

WITH src_listings AS (
  SELECT
    *
  FROM
    {{ ref('src_raw_listings') }}
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

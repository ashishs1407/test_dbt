
  create or replace  view My_db.my_schema.dim_hosts_cleansed
  
   as (
    

WITH  __dbt__cte__src_raw_hosts as (


with raw_hosts as (
    select * from airbnb.raw.raw_hosts
)
select 
id as host_id ,
name as host_name,
IS_SUPERHOST,
CREATED_AT,
UPDATED_AT
from raw_hosts
),src_hosts AS (
    SELECT
        *
    FROM
        __dbt__cte__src_raw_hosts
)
SELECT
    host_id,
    NVL(
        host_name,
        'Anonymous'
    ) AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts
  );

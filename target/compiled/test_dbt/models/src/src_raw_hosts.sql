

with raw_hosts as (
    select * from My_db.raw.raw_hosts
)
select 
id as host_id ,
name as host_name,
IS_SUPERHOST,
CREATED_AT,
UPDATED_AT
from raw_hosts
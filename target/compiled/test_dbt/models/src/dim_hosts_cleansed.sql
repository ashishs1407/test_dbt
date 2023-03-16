with dim_host as (
    select * from My_db.my_schema.src_raw_hosts   
)
select 
host_id ,
host_name,
IS_SUPERHOST,
CREATED_AT,
UPDATED_AT
from dim_host
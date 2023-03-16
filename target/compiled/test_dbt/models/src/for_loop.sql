

with avg_price as (
    select * from my_db.my_schema.dim_listings_cleansed
)
select
    
    avg(case when room_type = 'Entire home' then price else 0 end) as Entire_home_avg_price,
    avg(case when room_type = 'Private room' then price else 0 end) as Private_room_avg_price,
    avg(case when room_type = 'Shared room' then price else 0 end) as Shared_room_avg_price,
    avg(case when room_type = 'Hotel room' then price else 0 end) as Hotel_room_avg_price,
    
   
from avg_price
group by room_type
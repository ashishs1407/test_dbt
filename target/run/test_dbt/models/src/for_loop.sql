
  create or replace  view My_db.my_schema.for_loop
  
   as (
    

with avg_price as (
    select * from my_db.my_schema.dim_listings_cleansed
)
select
    
    
     avg(case when room_type = 'Entire home' then price) end as Entire home_avg_price
    
     avg(case when room_type = 'Private room' then price) end as Private room_avg_price
    
     avg(case when room_type = 'Shared room' then price) end as Shared room_avg_price
    
     avg(case when room_type = 'Hotel room' then price) end as Hotel room_avg_price
    
   
from avg_price
group by room_type
  );

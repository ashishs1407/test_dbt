
{% set rt = ['Entire home', 'Private room','Shared room','Hotel room'] %}

with avg_price as (
    select * from my_db.my_schema.dim_listings_cleansed
)
select
    
    {% for i in rt %}
     avg(case when room_type = '{{i}}' then price  end) as {{i|replace(' ','_')}}_avg_price,
    {% endfor %}
   
from avg_price
group by room_type
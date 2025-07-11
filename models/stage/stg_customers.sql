
with customers as (
    select * 
    from {{ source('super_store','customers')}}
)

select 
      cust_id as customer_id,
      name as customer_name,
      segment,
      region,
      country,
      state,
      city,
      postal_code
from customers

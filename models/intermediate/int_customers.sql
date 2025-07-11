
with customers as (
    select *
    from {{ ref('stg_customers')}}
)

select 
      customer_id,
      split_part(customer_name,' ',1) as first_name,
      split_part(customer_name,' ',2) as last_name,
      segment,
      region,
      (case when country='United States' then 'US' else 'Other than US' end) as country,
      state,
      city,
      postal_code 
from customers
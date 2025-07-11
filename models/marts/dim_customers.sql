with customers as (
    select *
    from {{ ref('int_customer_order_summary')}}
)

select 
      customer_id,
      first_name,
      last_name,
      segment,
      region,
      country,
      state,
      city,
      postal_code,
      date(min(order_date)) as oldest_order,
      date(max(order_date)) as latest_order,
      sum(amount) as total_amount,
      sum(quantity) as total_quantity,
      sum(discount) as total_discount
from customers
group by customer_id,
        first_name,
        last_name,
        segment,
        region,
        country,
        state,
        city,
        postal_code
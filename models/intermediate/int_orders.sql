
with orders as (
    select *
    from {{ ref('stg_orders')}}
)

select  
      -- IDs
      order_id,
      customer_id,
      product_id,

      order_date,
      year(order_date) as order_year,
      month(order_date) as order_month,
      date(ship_date) as ship_date,
      ship_mode,
      round(amount, 2) as amount,
      quantity,
      round(discount, 3) as discount,
      round(profit, 2) as profit

from orders

with customers as (
    select *
    from {{ ref('int_customers') }}
),

orders as (
    select *
    from {{ ref('int_orders') }}
)

select 
      orders.order_id,

      customers.customer_id,
      customers.first_name,
      customers.last_name,
      customers.segment,
      customers.region,
      customers.country,
      customers.state,
      customers.city,
      customers.postal_code,

      orders.order_date,
      orders.order_year,
      orders.order_month,
      orders.ship_date,
      orders.ship_mode,
      orders.amount,
      orders.quantity,
      orders.discount,
      orders.profit

from customers
inner join orders on orders.customer_id=customers.customer_id

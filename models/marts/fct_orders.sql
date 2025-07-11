with customers as (
    select *
    from {{ ref('int_customers') }}
),
 
 products as (
    select *
    from {{ ref('stg_products') }}
 ),

 orders as (
    select *
    from {{ ref('int_orders')}}
 )

 select 
       orders.order_id,
       customers.customer_id,
       products.product_id,
       date(orders.order_date) as order_date,
       orders.order_year,
       orders.order_month,
       orders.ship_date,
       orders.ship_mode,
       orders.amount,
       orders.quantity,
       orders.discount,
       orders.profit
from orders
left join customers on customers.customer_id=orders.customer_id
left join products on products.product_id=orders.product_id      
    
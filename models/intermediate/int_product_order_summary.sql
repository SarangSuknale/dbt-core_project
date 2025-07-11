
with products as (
    select *
    from {{ ref('stg_products') }}
),

orders as (
    select *
    from {{ ref('int_orders') }}
)

select 
      orders.order_id,

      products.product_id,
      products.category,
      products.sub_category,
      products.product_name,

      orders.order_date,
      orders.order_year,
      orders.order_month,
      orders.ship_date,
      orders.ship_mode,
      orders.amount,
      orders.quantity,
      orders.discount,
      orders.profit

from products
inner join orders on orders.product_id=products.product_id
with products as (
    select *
    from {{ ref('int_product_order_summary') }}
)

select 
      product_id,
      category,
      sub_category,
      product_name,
      date(min(order_date)) as oldest_order,
      date(max(order_date)) as latest_order,
      sum(amount) as total_amount,
      sum(quantity) as total_quantity,
      sum(discount) as total_discount
from products
group by 
        category,
        sub_category,
        product_id,
        product_name
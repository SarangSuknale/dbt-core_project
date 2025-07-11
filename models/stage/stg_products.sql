with products as (
    select * 
    from {{ source('super_store','products') }}
)

select 
      prod_id as product_id,
      category,
      sub_category,
      name as product_name
from products
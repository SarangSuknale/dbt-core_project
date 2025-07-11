{% snapshot product_data %}

{{
    config(
        target_schema='dbt_snapshot',
        unique_key='product_id',
        strategy='timestamp',
        updated_at='latest_order'
    )
}}

select 
      product_id,
      category,
      sub_category,
      product_name,
      latest_order
from {{ ref('dim_products') }}



{% endsnapshot %}
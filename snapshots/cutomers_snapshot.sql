{% snapshot customer_data %}

{{
    config(
        target_schema= 'dbt_snapshot',
        unique_key= 'customer_id',
        strategy= 'check',
        check_cols= ['first_name','last_name','segment','region','country','state','city','postal_code',
                       'latest_order']
    )
}}

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
      latest_order
from {{ ref('dim_customers') }}

{% endsnapshot %}
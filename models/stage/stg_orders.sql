with orders as (
    select * 
    from {{ source('super_store','orders') }}
)

select * from orders
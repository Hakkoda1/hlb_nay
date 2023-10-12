with 
source as (
    
    select

        id as order_id,
        user_id as customer_id,
        order_date,
        status
    
    from {{ source('demo_data', 'orders') }}
)

select * from source
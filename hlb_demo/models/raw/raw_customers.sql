with 
source as (

    select 
        
        id as customer_id,
        first_name,
        last_name
    
    from {{ source('demo_data', 'customers') }}
)

select * from source
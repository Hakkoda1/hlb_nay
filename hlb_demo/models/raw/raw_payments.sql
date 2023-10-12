with 
source as (
    
    select * from {{ source('demo_data', 'payments') }}
),

final as (

    select

        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status as payment_status,
        amount / 100 as amount,
        created as payment_date

    from source

)

select * from source
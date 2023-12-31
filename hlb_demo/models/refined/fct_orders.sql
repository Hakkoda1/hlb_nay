with orders as (

    select * from {{ ref('raw_orders') }}

),

payments as (

    select * from {{ ref('raw_payments') }}

),

order_payments as (
    select
        orderid,
        sum(case when status = 'success' then amount end) as amount

    from payments
    group by 1
)

--select * from order_payments



,final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount

    from orders
    left join order_payments
    on orders.order_id = order_payments.orderid
)

select * from final
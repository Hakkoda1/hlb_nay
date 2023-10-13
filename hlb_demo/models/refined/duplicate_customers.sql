with
customers as (
    select 

        *,
        concat(first_name, ' ', last_name) as full_name

    from {{ ref('raw_customers') }}
)

select full_name, count(full_name) as fn_count
from customers
group by 1
having fn_count > 1
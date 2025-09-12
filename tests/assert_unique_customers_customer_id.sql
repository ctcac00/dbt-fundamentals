with
    customers as (
        select customer_id, count(customer_id) as duplicates
        from {{ ref("dim_customers") }}
        group by 1
    )

select customer_id
from customers
where duplicates > 1

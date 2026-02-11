with

    orders as (select * from {{ ref("stg_tpch_orders") }}),

    line_items as (select * from {{ ref("stg_tpch_line_items") }}),
    final as (
        select orders.*, line_items.*
        from orders
        join line_items on l_orderkey = o_orderkey
    )

select *
from final

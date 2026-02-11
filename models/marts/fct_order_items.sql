with

    order_items as (select * from {{ ref("order_items") }}),
    part_suppliers as (select * from {{ ref("part_suppliers") }}),
    final as (
        select order_items.*, part_suppliers.*
        from order_items
        join part_suppliers on l_partkey = ps_partkey
    )

select *
from final

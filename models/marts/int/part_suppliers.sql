with

    suppliers as (select * from {{ ref("stg_tpch_suppliers") }}),

    parts as (select * from {{ ref("stg_tpch_parts") }}),

    part_suppliers as (select * from {{ ref("stg_tpch_part_suppliers") }}),

    final as (
        select part_suppliers.*, parts.*, suppliers.*
        from part_suppliers
        join suppliers on s_suppkey = ps_suppkey
        join parts on p_partkey = ps_partkey
    )

select *
from final

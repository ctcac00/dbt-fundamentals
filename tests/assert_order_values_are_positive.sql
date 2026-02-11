-- Ensure values in stg_tpch_orders are positive
select o_totalprice
from {{ ref('stg_tpch_orders') }}
having o_totalprice < 0

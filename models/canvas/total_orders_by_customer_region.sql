WITH stg_jaffle_shop__customers AS (
  SELECT
    *
  FROM {{ ref('stg_jaffle_shop__customers') }}
), o AS (
  SELECT
    *
  FROM {{ ref('fct_orders') }}
), rename_1 AS (
  SELECT
    CUSTOMER_ID AS CR_CUSTOMER_ID,
    REGION
  FROM stg_jaffle_shop__customers
), rename_2 AS (
  SELECT
    *
    RENAME (CUSTOMER_ID AS O_CUSTOMER_ID)
  FROM o
), join_1 AS (
  SELECT
    *
  FROM rename_2
  JOIN rename_1
    ON rename_2.O_CUSTOMER_ID = rename_1.CR_CUSTOMER_ID
), rename_3 AS (
  SELECT
    ORDER_ID,
    O_CUSTOMER_ID AS CUSTOMER_ID,
    REGION
  FROM join_1
), aggregate_1 AS (
  SELECT
    REGION,
    COUNT(ORDER_ID) AS TOTAL_ORDERS
  FROM rename_3
  GROUP BY
    REGION
), order_1 AS (
  SELECT
    *
  FROM aggregate_1
  ORDER BY
    TOTAL_ORDERS DESC
), total_orders_by_customer_region_sql AS (
  SELECT
    REGION,
    TOTAL_ORDERS
  FROM order_1
)
SELECT
  *
FROM total_orders_by_customer_region_sql
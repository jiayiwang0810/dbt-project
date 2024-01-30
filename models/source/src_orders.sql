WITH orders_raw AS (
    SELECT
        *
    FROM {{ source('dbt', 'orders_raw') }}
)

SELECT
    o_orderkey AS orderkey,
    o_totalprice AS total_price, 
    {{ clean_date('o_orderdate') }} AS order_date,
    o_orderpriority AS order_priority
FROM orders_raw
WHERE YEAR(o_orderdate) IN {{ var('year_range') }}
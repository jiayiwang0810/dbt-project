WITH lineitem_raw AS (
    SELECT
        *
    FROM {{ source('dbt', 'lineitem_raw') }}
)

SELECT 
    l_orderkey AS orderkey,
    l_partkey AS partkey,
    l_linenumber AS linenumber,
    l_linestatus AS status,
    l_shipmode AS shipmode,
    l_quantity as quantity,
    l_extendedprice AS total_price,
    l_discount AS discount,
    l_tax AS tax,
    {{ clean_date('l_shipdate') }} AS ship_date,
    {{ clean_date('l_commitdate') }} AS commit_date,
    {{ clean_date('l_receiptdate') }} AS receipt_date
FROM lineitem_raw 
WHERE YEAR(l_commitdate) IN {{ var('year_range') }}
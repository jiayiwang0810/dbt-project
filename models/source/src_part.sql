WITH part_raw AS (
    SELECT
        *
    FROM {{ source('dbt', 'part_raw') }}
)

SELECT 
    p_partkey AS partkey,
    p_brand AS brand,
    p_mfgr AS manufacturer,
    p_retailprice AS retail_price ,
    p_container AS container  
FROM part_raw

select
       shipmode,
       {{ get_size('container') }} AS container_size,
       sum(quantity) as sum_qty,
       sum(total_price) as sum_total_price,
       sum(total_price * (1-discount)) as sum_disc_price,
       sum(total_price * (1-discount) * (1+tax)) as sum_charge,
       avg(quantity) as avg_qty,
       avg(total_price) as avg_price,
       avg(discount) as avg_disc,
       count(*) as count_order
 from
       {{ ref('src_lineitem') }} li 
left join {{ ref('src_part') }} p on li.partkey = p.partkey 
 group by
       shipmode,
        {{ get_size('container') }}
 order by
        3 desc

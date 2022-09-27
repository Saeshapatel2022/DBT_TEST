select 
{{ dbt_utils.surrogate_key(['o.orderid', 'c.customerid', 'p.productid']) }} as surrogatekey,
o.orderId,
o.orderdate,
o.shipdate,
o.shipmode,
d.delivery_team,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordersellingprice,
o.ordercostprice,
c.customerid,
c.customername,
c.segment,
c.country,
p.productid,
{{markup('o.ordersellingprice', 'o.ordercostprice')}} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c on 
o.customerid = c.customerid
left join {{ ref('raw_product') }} as p on
o.productid = p.productid
left join {{ ref('delivery_team') }} as d on
d.shipmode = o.shipmode
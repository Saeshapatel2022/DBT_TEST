select 
    productid,
    productname,
    catagory,
    subcatagory,
    sum(orderprofit) as profit
 from   
    {{ ref('stg_orders') }}
group by 
   productid,
   productname,
   catagory,
   subcatagory
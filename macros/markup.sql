{% macro markup(sellingprice, actualprice) %} 
({{sellingprice}}-{{actualprice}})/{{actualprice}} 
{% endmacro %}
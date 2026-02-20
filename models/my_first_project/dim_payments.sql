{% set payment_modes=dbt_utils.get_column_values(source("sharans source files1",'DIM_PAYMENTS'),'PAYMENT_MODE') %} 
SELECT
{% for i in payment_modes %}
SUM(CASE WHEN PAYMENT_MODE='{{i}}' THEN SALES END) AS {{i}}_sales,
{% endfor %}
SUM(sales) as total_amount
FROM {{source("sharans source files1",'DIM_PAYMENTS')}}
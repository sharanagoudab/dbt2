select * from
{{ source("sharans source files1", "EMPLOYEE_DETAILS") }}


{% set payment_methods = dbt_utils.get_column_values(source("sharans source files1","EMPLOYEE_DETAILS"), column='FULLNAME') %}
{% for i in payment_methods %}
{{-i}}
{% endfor %}

{{payment_methods}}


{% set columns = adapter.get_columns_in_relation(source("sharans source files1","EMPLOYEE_DETAILS")) %}
{% for i in columns %}
{{i}}
{% endfor %}

select
ORDER_ID,
sum(case when payment_method = 'CASH' then sales end) as cash_amount,
sum(case when payment_method = 'UPI' then sales end) as upi_amount,
sum(case when payment_method = 'CC' then sales end) as cc_amount,
sum(sales) as total_amount
from {{source("sharans source files1","DIM_PAYMENTS")}}
group by ORDER_ID






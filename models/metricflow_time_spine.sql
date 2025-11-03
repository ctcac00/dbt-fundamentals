{{
    config(
        materialized='table',
        static_analysis='unsafe'
    )
}}

with spine as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2020-01-01' as date)",
        end_date="dateadd(year, 3, current_date())"
    ) }}
)

select 
    date_day
from spine


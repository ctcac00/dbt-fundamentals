-- Using your new knowledge of analyses, create an analysis file in the analysis folder 
-- called total_revenue.sql that uses the stg_payments model and sums the amount of successful payments.
-- (Remember to use Jinja in this rather than the raw table name)
with 
payments as (
  select *
  from {{ ref('stg_stripe__payments') }}
  where status = 'success'
),
final as (
  select sum(amount) as total_revenue
  from payments
)
select * from final

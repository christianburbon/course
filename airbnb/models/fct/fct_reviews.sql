
-- This is the Jinja configuration block for the dbt model.
--It specifies that the model should be materialized as an incremental table
--  and that any schema changes should result in a failure (which could be caused by schema changes in the source table)
{{
    config(
    materialized='incremental',
    on_schema_change='fail'
    )
}}

-- Table Materialization
WITH scr_reviews AS (
    SELECT * FROM {{ref('src_reviews')}}
    )
SELECT * FROM src_reviews
WHERE review_text IS NOT NULL

{% if is_incremental() %}
    AND review_date > (SELECT MAX(review_date) FROM {{ this }})
{% endif %}
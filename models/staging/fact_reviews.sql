{{
 config(
 materialized = 'incremental',
 on_schema_change='fail'
 )
}}
SELECT * FROM {{ ref('src_reviews') }}
WHERE review_text is not null
{% if is_incremental() %}
 AND review_date > (select max(review_date) from {{ this }})
{% endif %}
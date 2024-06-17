{{
    config(

        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}


WITH src_reviews as(

    SELECT * FROM {{ref('src_reviews')}}
)

SELECT * from src_reviews
where review_text IS NOT NULL
{% if is_incremental() %}
    AND review_date>(SELECT max(review_date) from {{ this }})
{% endif %}
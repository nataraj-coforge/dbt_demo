WITH raw_reviews AS ( SELECT
*
FROM AIRBNB.RAW.RAW_REVIEWS
)
SELECT
RAW.AIRBNB.RAW_REVIEWS
listing_id,
date AS review_date, 
reviewer_name,
comments AS review_text, 
sentiment AS review_sentiment
FROM
raw_reviews
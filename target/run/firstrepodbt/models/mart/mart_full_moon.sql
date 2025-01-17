
  
    

        create or replace transient table airbnb.raw.mart_full_moon
         as
        (

WITH fct_reviews AS (
    SELECT * FROM airbnb.raw.fact_reviews_cleaned
),
full_moon_dates AS (
    SELECT * FROM airbnb.raw.seed_full_moon_dates
)

SELECT
  r.*,
  CASE
    WHEN fm.full_moon_date IS NULL THEN 'not full moon'
    ELSE 'full moon'
  END AS is_full_moon
FROM
  fct_reviews
  r
  LEFT JOIN full_moon_dates
  fm
  ON (TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date))
        );
      
  
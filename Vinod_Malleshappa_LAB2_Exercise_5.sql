
SELECT
  DISTINCT us.id AS id_user,
  COUNT(pa.score) OVER(PARTITION BY PA.owner_user_id ORDER BY pa.owner_user_id) AS count
FROM
  `bigquery-public-data.stackoverflow.posts_answers` pa
INNER JOIN
  `bigquery-public-data.stackoverflow.users` us
ON
  pa.owner_user_id = us.id
  AND extract(year from pa.creation_date) = 2010
ORDER BY
  count DESC
LIMIT
  10


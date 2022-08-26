SELECT
  DISTINCT us.id AS id_user,
  COUNT(sfp.accepted_answer_id) AS count # OVER(PARTITION BY us.id ORDER BY us.id)
FROM
  `bigquery-public-data.stackoverflow.posts_answers` pa
INNER JOIN
  `bigquery-public-data.stackoverflow.users` us
ON
  pa.owner_user_id = us.id
INNER JOIN
  `bigquery-public-data.stackoverflow.stackoverflow_posts` sfp
ON
  sfp.accepted_answer_id = pa.id
  AND EXTRACT (YEAR
  FROM
    pa.creation_date)= 2010
GROUP BY
  id_user
ORDER BY
  count DESC
LIMIT
  10
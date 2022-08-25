# Simple Method used to find the Find the most popular programming language

SELECT
  LANGUAGE.name AS language_name,
  COUNT(LANGUAGE.name) AS count
FROM
  `bigquery-public-data.github_repos.languages`,
  UNNEST(LANGUAGE) AS
  LANGUAGE
GROUP BY
  LANGUAGE.name
ORDER BY
  count DESC
LIMIT
  1
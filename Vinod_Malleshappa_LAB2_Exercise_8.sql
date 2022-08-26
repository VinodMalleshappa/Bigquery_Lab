SELECT
  DISTINCT cmt.committer.name AS name,
  COUNT( LANGUAGE.name ) AS count
FROM
  `bigquery-public-data.github_repos.languages` lng,
  UNNEST(LANGUAGE) AS
  LANGUAGE
INNER JOIN
  `bigquery-public-data.github_repos.sample_commits` cmt
ON
  lng.repo_name = cmt.repo_name
WHERE
  EXTRACT(year
  FROM
    cmt.committer.date) =2016
  AND LANGUAGE.name = 'Java'
GROUP BY
  name
ORDER BY
  count DESC
LIMIT
  10
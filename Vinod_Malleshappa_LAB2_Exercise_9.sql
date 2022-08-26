SELECT
  DISTINCT repo_name,
  df.new_path AS file,
  committer.date AS date,
  LAG(
  COMMIT
    ) OVER (PARTITION BY df.new_path ORDER BY committer.date ASC) AS previous_commit,
COMMIT
  ,
  LEAD(
  COMMIT
    ) OVER (PARTITION BY df.new_path ORDER BY committer.date ASC) AS next_commit
FROM
  `bigquery-public-data.github_repos.sample_commits` AS cmt,
  UNNEST(difference) df
WHERE
  df.new_path = 'kernel/acct.c'
ORDER BY
  date
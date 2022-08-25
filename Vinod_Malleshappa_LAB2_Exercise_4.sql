SELECT
  PARSE_DATE('%Y%m%d',date) date,
  h.page.pagePath pagePath,
  COUNT(h.page.pagePath) counter
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,
  UNNEST(hits) AS h
GROUP BY
  date,
  pagePath
ORDER BY
  date,
  counter DESC
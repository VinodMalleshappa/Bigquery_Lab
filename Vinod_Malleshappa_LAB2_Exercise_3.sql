SELECT
  visitId,
  visitStartTime,
  h.page.pageTitle AS pageTitle,
  h.page.pagePath AS pagePath
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`,
  UNNEST(hits) AS h
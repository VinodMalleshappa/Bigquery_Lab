# There are various type to collect data, i think need to pair the OS and Browser columns, to get more accuracy indata

WITH
  country_rank AS (
  SELECT
    DISTINCT geoNetwork.country AS country,
    device.operatingSystem AS operatingSystem,
    device.browser AS browser,
    RANK() OVER(PARTITION BY geoNetwork.country ORDER BY device.browser ) rank
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`
  WHERE
    device.isMobile = TRUE
    AND geoNetwork.country != '(not set)'
    AND device.operatingSystem != '(not set)'
    AND device.browser != '(not set)'
  GROUP BY
    country,
    device.operatingSystem,
    device.browser )
SELECT
  country,
  ARRAY_AGG(STRUCT(operatingSystem,
      browser,
      rank)) country_rank
FROM
  country_rank
WHERE
  rank <4
GROUP BY
  country,
  rank
ORDER BY
  country
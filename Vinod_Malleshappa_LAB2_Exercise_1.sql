WITH
  Movie_Ranking AS (
  SELECT
    Release_Date,
    Movie_Title,
    Production_Budget,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM Release_Date)
    ORDER BY
      Production_Budget DESC) AS rank
  FROM
       `nttdata-c4e-bde.uc1_2.Movie`
  WHERE
    Release_Date BETWEEN '2016-01-01'
    AND '2020-12-31' )
SELECT
  EXTRACT(YEAR
  FROM
    Release_Date) AS year,
  Movie_Title,
  Production_Budget,
  rank
FROM
  Movie_Ranking
WHERE
  rank <=10
ORDER BY
  year DESC
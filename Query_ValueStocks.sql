-- This sql file to display the companies that have given dividend for atleast 3 consecutive years

WITH cte_fiscal AS
( 
	SELECT
		company,
		fiscal_year,
		fiscal_year/10000 AS first_fiscal_start,
		(LEAD(fiscal_year,1) OVER( PARTITION BY company ORDER BY fiscal_year))/10000 AS second_fiscal_start,
		(LEAD(fiscal_year,2) OVER( PARTITION BY company ORDER BY fiscal_year))/10000 AS third_fiscal_start               
    FROM dividend
	ORDER BY company
)

SELECT 
	array_agg(company) AS valuestocks
-- 	json_agg(company) AS valuestocks
FROM
 	cte_fiscal
WHERE 
	first_fiscal_start = second_fiscal_start - 1 AND
	first_fiscal_start = third_fiscal_start - 2;

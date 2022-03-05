--This sql file to create the table for the sql query 

DROP TABLE IF EXISTS dividend;
CREATE TABLE dividend(
	company CHARACTER VARYING(12),
	fiscal_year INTEGER
);

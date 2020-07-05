CREATE TABLE crime_with_beats AS
SELECT
	pb.beat_num,
	crime.*
FROM crime
LEFT JOIN police_beats as pb
ON ST_Within(crime.geom, pb.geom)
WHERE crime."Year" >= 2009. AND crime."Year" <= 2019.0;

ALTER TABLE crime_with_beats ADD COLUMN crime_type character(50);
UPDATE crime_with_beats SET crime_type = 
	(CASE WHEN left("FBI Code",2) = '01'
	 	OR left("FBI Code",2) = '02'
		OR left("FBI Code",2) = '03'
		OR left("FBI Code",2) = '04' THEN 'violent'
	 ELSE 'non-violent'
	END)
	
SELECT "FBI Code", "Primary Type", "Description", crime_type 
FROM public.crime_with_beats LIMIT 100

CREATE TABLE crime_sums AS
SELECT
	beat_num,
	COUNT(*) AS total_crimes
FROM public.crime_with_beats
GROUP BY beat_num;

ALTER TABLE crime_sums ADD COLUMN no_violent_crimes bigint;
WITH cr AS (
	SELECT 
		beat_num,
		COUNT(*)
	FROM public.crime_with_beats
	WHERE crime_type = 'non-violent'
	GROUP BY beat_num)
UPDATE crime_sums AS cs
SET no_violent_crimes = cr.count
FROM cr
WHERE cs.beat_num = cr.beat_num;

select * from crime_sums

ALTER TABLE police_beats
	ADD COLUMN total_crime bigint,
	ADD COLUMN violent_crimes bigint,
	ADD COLUMN non_violent_crimes bigint;
	
UPDATE police_beats AS pb SET
	total_crime = crime.total_crimes,
	violent_crimes = crime.violent_crimes,
	non_violent_crimes = crime.no_violent_crimes
FROM crime_sums AS crime
WHERE pb.beat_num = crime.beat_num ;

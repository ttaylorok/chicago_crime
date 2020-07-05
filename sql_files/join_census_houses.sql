ALTER TABLE police_beats
	ADD COLUMN num_houses_rented bigint, --S1101_C01_020E
	ADD COLUMN num_houses_owned bigint, --S1101_C01_019E
	ADD COLUMN num_households bigint, --S1101_C05_009E
	ADD COLUMN num_male_householder_no_wife bigint, --S1101_C03_009E
	ADD COLUMN num_female_householder_no_husband bigint, --S1101_C04_009E
	ADD COLUMN avg_family_size double precision; --S1101_C01_004E
	
	
WITH pbv AS
	(
	SELECT 
	beat_num,
	SUM("S1101_C01_020E" * perc_tract_area) AS "S1101_C01_020E",
	SUM("S1101_C01_019E" * perc_tract_area) AS "S1101_C01_019E",
	SUM("S1101_C05_009E" * perc_tract_area) AS "S1101_C05_009E",
	SUM("S1101_C03_009E" * perc_tract_area) AS "S1101_C03_009E",
	SUM("S1101_C04_009E" * perc_tract_area) AS "S1101_C04_009E",
	SUM("S1101_C01_004E" * percent_area) AS "S1101_C01_004E"
	FROM public.beats_with_census
	GROUP BY beat_num
	)
UPDATE police_beats
SET 
	num_houses_rented = pbv."S1101_C01_020E",
	num_houses_owned = pbv."S1101_C01_019E",
	num_households = pbv."S1101_C05_009E",
	num_male_householder_no_wife = pbv."S1101_C03_009E",
	num_female_householder_no_husband = pbv."S1101_C04_009E",
	avg_family_size = pbv."S1101_C01_004E"
FROM pbv
WHERE police_beats.beat_num = pbv.beat_num;  
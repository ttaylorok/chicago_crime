ALTER TABLE police_beats
 ADD COLUMN perc_below_poverty double precision, --S1701_C03_001E
 ADD COLUMN house_median_income double precision, --S1901_C01_012E
 ADD COLUMN house_mean_income double precision, --S1901_C01_013E
 ADD COLUMN unemp_rate_20_to_64 double precision; --S2301_C04_021E

WITH pbv AS
	(
	SELECT 
	beat_num,
	SUM("S1701_C03_001E" * percent_area) AS "S1701_C03_001E",
	SUM("S1901_C01_012E" * percent_area) AS "S1901_C01_012E",
	SUM("S1901_C01_013E" * percent_area) AS "S1901_C01_013E",
	SUM("S2301_C04_021E" * percent_area) AS "S2301_C04_021E"
	FROM public.beats_with_census
	GROUP BY beat_num
	)
	
UPDATE police_beats
SET 
	perc_below_poverty=pbv."S1701_C03_001E",
	house_median_income=pbv."S1901_C01_012E",
	house_mean_income=pbv."S1901_C01_013E",
	unemp_rate_20_to_64=pbv."S2301_C04_021E"
FROM pbv
WHERE police_beats.beat_num = pbv.beat_num;
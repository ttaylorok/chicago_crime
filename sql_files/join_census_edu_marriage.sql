ALTER TABLE police_beats
 ADD COLUMN commute_time double precision, --S0802_C01_100E
 ADD COLUMN perc_pop_abv_62 double precision, --DP05_0023PE
 ADD COLUMN perc_male double precision, --DP05_0002PE
 ADD COLUMN perc_female double precision, --DP05_0003PE
 ADD COLUMN pop_abv_25 double precision , --S1501_C01_006E
 ADD COLUMN pop_abv_25_less_9th_grade double precision , --S1501_C01_007E
 ADD COLUMN pop_abv_25_9_to_12th_grade double precision , --S1501_C01_008E
 ADD COLUMN pop_abv_25_high_shool_grad double precision , --S1501_C01_009E
 ADD COLUMN pop_abv_25_some_college double precision , --S1501_C01_010E
 ADD COLUMN pop_abv_25_assoc_degree double precision , --S1501_C01_011E
 ADD COLUMN pop_abv_25_bach_degree double precision , --S1501_C01_012E
 ADD COLUMN pop_abv_25_grad_degree double precision , --S1501_C01_013E
 ADD COLUMN pop_abv_25_hs_or_higher double precision , --S1501_C01_014E
 ADD COLUMN pop_abv_25_bs_or_higher double precision , --S1501_C01_015E
 ADD COLUMN pop_abv_15 double precision, --S1201_C01_016E
 ADD COLUMN pop_abv_15_never_married double precision, --S1201_C06_016E
 ADD COLUMN pop_abv_15_seperated double precision, --S1201_C05_016E
 ADD COLUMN pop_abv_15_divorced double precision, --S1201_C04_016E
 ADD COLUMN pop_abv_15_now_married double precision; --S1201_C02_016E

WITH pbv AS
	(
	SELECT 
	beat_num,
	SUM("S0802_C01_100E" * percent_area) AS "S0802_C01_100E",
	SUM("DP05_0023PE" * percent_area) AS "DP05_0023PE",
	SUM("DP05_0002PE" * percent_area) AS "DP05_0002PE",
	SUM("DP05_0003PE" * percent_area) AS "DP05_0003PE",
	SUM("S1501_C01_006E" * perc_tract_area) AS "S1501_C01_006E",
	SUM("S1501_C01_007E" * perc_tract_area) AS "S1501_C01_007E",
	SUM("S1501_C01_008E" * perc_tract_area) AS "S1501_C01_008E",
	SUM("S1501_C01_009E" * perc_tract_area) AS "S1501_C01_009E",
	SUM("S1501_C01_010E" * perc_tract_area) AS "S1501_C01_010E",
	SUM("S1501_C01_011E" * perc_tract_area) AS "S1501_C01_011E",
	SUM("S1501_C01_012E" * perc_tract_area) AS "S1501_C01_012E",
	SUM("S1501_C01_013E" * perc_tract_area) AS "S1501_C01_013E",
	SUM("S1501_C01_014E" * perc_tract_area) AS "S1501_C01_014E",
	SUM("S1501_C01_015E" * perc_tract_area) AS "S1501_C01_015E",
	SUM("S1201_C01_016E" * perc_tract_area) AS "S1201_C01_016E",
	SUM("S1201_C06_016E" * perc_tract_area) AS "S1201_C06_016E",
	SUM("S1201_C05_016E" * perc_tract_area) AS "S1201_C05_016E",
	SUM("S1201_C04_016E" * perc_tract_area) AS "S1201_C04_016E",
	SUM("S1201_C02_016E" * perc_tract_area) AS "S1201_C02_016E"
	FROM public.beats_with_census
	GROUP BY beat_num
	)
UPDATE police_beats
SET 
	commute_time=pbv."S0802_C01_100E",
	perc_pop_abv_62=pbv."DP05_0023PE",
	perc_male=pbv."DP05_0002PE",
	perc_female=pbv."DP05_0003PE",
	pop_abv_25=pbv."S1501_C01_006E",
	pop_abv_25_less_9th_grade=pbv."S1501_C01_007E",
	pop_abv_25_9_to_12th_grade=pbv."S1501_C01_008E",
	pop_abv_25_high_shool_grad=pbv."S1501_C01_009E",
	pop_abv_25_some_college=pbv."S1501_C01_010E",
	pop_abv_25_assoc_degree=pbv."S1501_C01_011E",
	pop_abv_25_bach_degree=pbv."S1501_C01_012E",
	pop_abv_25_grad_degree=pbv."S1501_C01_013E",
	pop_abv_25_hs_or_higher=pbv."S1501_C01_014E",
	pop_abv_25_bs_or_higher=pbv."S1501_C01_015E",
	pop_abv_15=pbv."S1201_C01_016E",
	pop_abv_15_never_married=pbv."S1201_C06_016E",
	pop_abv_15_seperated=pbv."S1201_C05_016E",
	pop_abv_15_divorced=pbv."S1201_C04_016E",
	pop_abv_15_now_married=pbv."S1201_C02_016E"
FROM pbv
WHERE police_beats.beat_num = pbv.beat_num;  
ALTER TABLE police_beats
	ADD COLUMN life_expectancy double precision,
	ADD COLUMN teen_birth_rate double precision,
	ADD COLUMN birth_rate double precision;
	
WITH pbv AS
	(
	SELECT 
	beat_num,
	SUM("2010 Life Expectancy" * percent_area) AS le,
	SUM("Teen Birth Rate" * percent_area) AS tbr,
	SUM("Birth Rate" * percent_area) AS br
	FROM public.beats_with_cah
	GROUP BY beat_num
	)
UPDATE police_beats
SET 
	life_expectancy = pbv.le,
	teen_birth_rate = pbv.tbr,
	birth_rate = pbv.br
FROM pbv
WHERE police_beats.beat_num = pbv.beat_num;  
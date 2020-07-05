--ALTER TABLE public.beats_with_hsp ADD COLUMN total_intersect_area double precision;
--UPDATE public.beats_with_hsp SET total_intersect_area = 
--(SUM(intersect_area) OVER (PARTITION BY school_id))

WITH ia AS
(
	SELECT
		beat_num,
		SUM(intersect_area) AS area
	FROM public.beats_with_hsp
	GROUP BY beat_num
) 
UPDATE public.beats_with_hsp 
SET total_intersect_area = ia.area
FROM ia
WHERE beats_with_hsp.beat_num = ia.beat_num;  
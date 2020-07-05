ALTER TABLE public.beats_with_cah ADD COLUMN total_intersect_area double precision;

WITH ia AS
(
	SELECT
		beat_num,
		SUM(intersect_area) AS area
	FROM public.beats_with_cah
	GROUP BY beat_num
) 
UPDATE public.beats_with_cah
SET total_intersect_area = ia.area
FROM ia
WHERE beats_with_cah.beat_num = ia.beat_num; 

ALTER TABLE public.beats_with_cah ADD COLUMN percent_area double precision;
UPDATE public.beats_with_cah SET percent_area = intersect_area / total_intersect_area

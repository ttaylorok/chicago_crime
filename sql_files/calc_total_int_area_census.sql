ALTER TABLE public.beats_with_census ADD COLUMN total_intersect_area double precision;

WITH ia AS
(
	SELECT
		beat_num,
		SUM(intersect_area) AS area
	FROM public.beats_with_census
	GROUP BY beat_num
) 
UPDATE public.beats_with_census
SET total_intersect_area = ia.area
FROM ia
WHERE beats_with_census.beat_num = ia.beat_num; 

ALTER TABLE public.beats_with_census ADD COLUMN percent_area double precision;
UPDATE public.beats_with_census SET percent_area = intersect_area / total_intersect_area
ALTER TABLE police_beats ADD COLUMN num_liqour int;

WITH pbv AS
(
SELECT
	beat_num,
	COUNT(NOT ST_IsEmpty(geom)) AS nliq
FROM public.beats_with_liq
GROUP BY beat_num
)
UPDATE police_beats AS pb
SET num_liqour = pbv.nliq
FROM pbv
WHERE pb.beat_num = pbv.beat_num
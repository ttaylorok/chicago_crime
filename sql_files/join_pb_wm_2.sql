ALTER TABLE police_beats ADD COLUMN num_walmarts int;

WITH pbv AS
(
SELECT
	beat_num,
	COUNT(NOT ST_IsEmpty(geom)) AS nw
FROM public.beats_with_wm
GROUP BY beat_num
)
UPDATE police_beats AS pb
SET num_walmarts = pbv.nw
FROM pbv
WHERE pb.beat_num = pbv.beat_num
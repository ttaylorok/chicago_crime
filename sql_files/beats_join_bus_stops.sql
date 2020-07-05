ALTER TABLE police_beats ADD COLUMN num_bus_stops int;

WITH pbv AS
(
SELECT
	beat_num,
	COUNT(NOT ST_IsEmpty(geom)) AS bus
	FROM public.beats_with_buses
	GROUP BY beat_num
)
UPDATE police_beats AS pb
SET num_bus_stops = pbv.bus
FROM pbv
WHERE pb.beat_num = pbv.beat_num
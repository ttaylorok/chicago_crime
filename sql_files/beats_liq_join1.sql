CREATE TABLE beats_with_liq AS
SELECT
	pb.beat_num,
	liq.*
FROM public.police_beats AS pb
LEFT JOIN public.liqour_stores AS liq
ON ST_Within(liq.geom, pb.geom)
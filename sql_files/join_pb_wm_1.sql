CREATE TABLE beats_with_wm AS
SELECT
	pb.beat_num,
	wm.*
FROM public.police_beats AS pb
LEFT JOIN public.walmart AS wm
ON ST_Within(wm.geom, pb.geom)
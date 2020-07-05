CREATE TABLE beats_with_hsp AS
SELECT 
	pb.geom AS geom_pb,
	pb.beat, pb.beat_num,
	hsp.*
FROM police_beats AS pb
LEFT JOIN public.high_school_boundaries_performance AS hsp
ON ST_Intersects(pb.geom, hsp.geom)
--WHERE pb.beat_num = '0912'
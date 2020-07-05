CREATE TABLE beats_with_cah AS
SELECT 
	pb.geom AS geom_pb,
	pb.beat_num,
	cah.*
FROM police_beats AS pb
LEFT JOIN public.community_areas_health AS cah
ON ST_Intersects(pb.geom, cah.geom)
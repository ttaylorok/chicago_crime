CREATE TABLE beats_with_lu AS
SELECT 
	pb.geom AS geom_pb,
	pb.beat_num,
	lu.*
FROM police_beats AS pb
LEFT JOIN public.land_use_2013 AS lu
ON ST_Intersects(pb.geom, lu.geom)
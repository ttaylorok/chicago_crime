CREATE TABLE beats_with_census AS
SELECT 
	pb.geom AS geom_pb,
	pb.beat_num,
	cen.*
FROM police_beats AS pb
LEFT JOIN public.census_merged as cen
ON ST_Intersects(pb.geom, cen.geom)
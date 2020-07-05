CREATE TABLE raster_value_counts_v2 AS
SELECT 
	pb.beat_num,
	(ST_ValueCount(ST_Clip(ST_Union(lu.rast), pb.geom))).*
FROM police_beats AS pb
LEFT JOIN public.land_cover_full_epsg4326_1000_indb AS lu
ON ST_Intersects(lu.rast, pb.geom)
--WHERE pb.beat_num = '1614'
GROUP BY pb.beat_num
	
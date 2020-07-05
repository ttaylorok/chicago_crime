--CREATE TABLE raster_value_counts AS
WITH pb AS
(
SELECT beat_num, geom
FROM public.police_beats
	LIMIT 3
)
SELECT 
	pb.beat_num,
	(ST_ValueCount(ST_Union(ST_Clip(rast, pb.geom)))).*
FROM public.land_cover_full_epsg4326_1000_indb, pb
WHERE ST_Intersects(rast, pb.geom)
GROUP BY beat_num
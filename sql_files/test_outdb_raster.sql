CREATE TABLE raster_clipped4 AS
WITH t2 AS
(
SELECT beat_num, geom
FROM public.police_beats
LIMIT 1
)
SELECT ST_Clip(rast, t2.geom)
FROM public.land_cover_full_epsg4326_1000_indb, t2
WHERE ST_Intersects(rast, t2.geom)
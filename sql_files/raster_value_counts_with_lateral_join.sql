CREATE TABLE raster_value_counts_v3 AS
SELECT
  pb.beat_num,
  (ST_ValueCount(ST_Clip(raster.combined, pb.geom))).*
FROM
  police_beats AS pb
CROSS JOIN LATERAL
	(SELECT ST_Union(rast) AS combined
	 FROM public.land_cover_full_epsg4326_1000_indb
	 WHERE ST_Intersects(rast, pb.geom)) AS raster
--WHERE pb.beat_num = '1614'


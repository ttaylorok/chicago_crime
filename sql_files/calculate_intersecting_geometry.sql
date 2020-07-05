--ALTER TABLE beats_with_hsp DROP COLUMN geom_intersect;
ALTER TABLE  beats_with_hsp ADD COLUMN geom_intersect geometry(MultiPolygon, 4326);
UPDATE beats_with_hsp SET geom_intersect=ST_Multi(ST_Intersection(geom, geom_pb));
--SELECT ST_Intersection(geom, geom_pb) FROM beats_with_hsp

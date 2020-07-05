ALTER TABLE  beats_with_cah ADD COLUMN geom_intersect geometry(MultiPolygon, 4326);
UPDATE beats_with_cah SET geom_intersect=ST_Multi(ST_Intersection(geom, geom_pb));

ALTER TABLE  beats_with_cah ADD COLUMN intersect_area double precision;
UPDATE beats_with_cah SET intersect_area=ST_Area(ST_Intersection(geom, geom_pb));

ALTER TABLE  beats_with_cah ADD COLUMN area_pb double precision;
UPDATE beats_with_cah SET area_pb=ST_Area(geom_pb);

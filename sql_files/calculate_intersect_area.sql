--ALTER TABLE beats_with_hsp DROP COLUMN geom_intersect;
ALTER TABLE  beats_with_hsp ADD COLUMN intersect_area double precision;
UPDATE beats_with_hsp SET intersect_area=ST_Area(ST_Intersection(geom, geom_pb));
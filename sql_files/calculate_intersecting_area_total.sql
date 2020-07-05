ALTER TABLE  beats_with_hsp ADD COLUMN geom_intersect geometry(MultiPolygon, 4326);
UPDATE beats_with_hsp SET geom_intersect=ST_Multi(ST_Intersection(geom, geom_pb));

ALTER TABLE  beats_with_hsp ADD COLUMN intersect_area double precision;
UPDATE beats_with_hsp SET intersect_area=ST_Area(ST_Intersection(geom, geom_pb));

ALTER TABLE  beats_with_hsp ADD COLUMN area_hsb double precision;
UPDATE beats_with_hsp SET area_hsb=ST_Area(geom);

ALTER TABLE  beats_with_hsp ADD COLUMN area_pb double precision;
UPDATE beats_with_hsp SET area_pb=ST_Area(geom_pb);

ALTER TABLE  beats_with_hsp ADD COLUMN percent_area double precision;
UPDATE beats_with_hsp SET percent_area=(intersect_area/area_pb);

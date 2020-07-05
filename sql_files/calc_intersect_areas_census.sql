ALTER TABLE  beats_with_census ADD COLUMN geom_intersect geometry(MultiPolygon, 4326);
UPDATE beats_with_census SET geom_intersect=ST_Multi(ST_Intersection(geom, geom_pb));

ALTER TABLE  beats_with_census ADD COLUMN intersect_area double precision;
UPDATE beats_with_census SET intersect_area=ST_Area(ST_Intersection(geom, geom_pb));

ALTER TABLE  beats_with_census ADD COLUMN area_pb double precision;
UPDATE beats_with_census SET area_pb=ST_Area(geom_pb);

ALTER TABLE  beats_with_census ADD COLUMN area_tract double precision;
UPDATE beats_with_census SET area_tract=ST_Area(geom);

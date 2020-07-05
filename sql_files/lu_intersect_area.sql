ALTER TABLE  beats_with_lu ADD COLUMN geom_intersect geometry(MultiPolygon, 4326);
UPDATE beats_with_lu SET geom_intersect=ST_Multi(ST_Intersection(ST_MakeValid(geom), geom_pb));

ALTER TABLE  beats_with_lu ADD COLUMN intersect_area double precision;
UPDATE beats_with_lu SET intersect_area=ST_Area(geom_intersect);

--ALTER TABLE  beats_with_lu ADD COLUMN area_pb double precision;
--UPDATE beats_with_lu SET area_pb=ST_Area(geom_pb);

--ALTER TABLE  beats_with_lu ADD COLUMN area_lu double precision;
--UPDATE beats_with_lu SET area_lu=ST_Area(geom);
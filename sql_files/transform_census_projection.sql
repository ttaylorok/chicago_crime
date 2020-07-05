ALTER TABLE census_merged
ALTER COLUMN geom 
TYPE geometry(MultiPolygon,4326)
USING ST_Transform(geom, 4326);
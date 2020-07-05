ALTER TABLE public.land_use_2013
ALTER COLUMN geom 
TYPE geometry(MultiPolygon,4326)
USING ST_Transform(geom, 4326);
CREATE TABLE crime_dist_to_park AS
SELECT
	  crime."ID",
	  parks.gid AS nearest_park_gid,
	  ST_Distance(geography(parks.geom), geography(crime.geom)) AS distance_to_park
FROM
	  crime
CROSS JOIN LATERAL
	  (SELECT gid, geom
	   FROM park_boundaries AS pb
	   ORDER BY crime.geom <-> pb.geom
	   LIMIT 1) AS parks
WHERE 
	crime.geom IS NOT NULL
	AND crime."Year" >= 2009.0
	
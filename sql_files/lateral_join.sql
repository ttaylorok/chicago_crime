SELECT
  cs.*,
  parks.gid
  --ST_Distance(geography(hydrants.the_geom), geography(parcels.the_geom)) AS distance
FROM
  crime_small as cs
CROSS JOIN LATERAL
  (SELECT gid, geom
   FROM park_boundaries AS pb
   ORDER BY
     cs.geom <-> pb.geom
   LIMIT 1) AS parks
	
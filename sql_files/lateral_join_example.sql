SELECT
  parcels.*,
  hydrants.cartodb_id as hydrant_cartodb_id,
  ST_Distance(geography(hydrants.the_geom), geography(parcels.the_geom)) AS distance
FROM
  parcelsshp AS parcels
CROSS JOIN LATERAL
  (SELECT cartodb_id, the_geom
   FROM hydrantsshp
   ORDER BY
     parcels.the_geom_webmercator <-> the_geom_webmercator
   LIMIT 1) AS hydrants
CREATE TABLE beats_to_streets AS
SELECT
  pb.*,
  streets.gid AS street_id,
  ST_Distance(geography(streets.geom), geography(pb.geom)) AS distance
FROM
  police_beats AS pb
CROSS JOIN LATERAL
  (SELECT "class", geom, gid
   FROM public.street_center_lines
   WHERE "class" = '1'
   ORDER BY
     pb.geom <-> geom
   LIMIT 1) AS streets
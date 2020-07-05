SELECT
	gid,
	acres
FROM
	park_boundaries AS pb
ORDER BY
	pb.geom <->
	(SELECT geom FROM crime WHERE "ID" = '11034701')
LIMIT 10;
	
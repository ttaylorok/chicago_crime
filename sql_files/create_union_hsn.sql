CREATE TABLE high_school_boundaries_union AS
SELECT
	school_id,
	ST_Union(geom) AS geom
FROM
	public."high_school_boundaries_2018-2019"
GROUP BY
	school_id
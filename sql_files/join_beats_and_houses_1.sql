CREATE TABLE beats_with_houses AS
SELECT
	pb.beat_num,
	houses.*
FROM public.police_beats AS pb
LEFT JOIN public.home_sales AS houses
ON ST_Within(houses.geom, pb.geom)
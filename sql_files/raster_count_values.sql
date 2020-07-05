--SELECT ST_SummaryStats(st_union) AS ss
--FROM public.raster_clipped5
--ORDER BY ss

SELECT (vals).*, FROM
	(SELECT ST_ValueCount(st_union) AS vals
	FROM public.raster_clipped5) AS recs
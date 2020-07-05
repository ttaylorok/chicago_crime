CREATE TABLE raster_value_sums AS
SELECT
	beat_num,
	SUM("count") AS total_pixels
FROM public.raster_value_counts_v3
GROUP BY beat_num;

ALTER TABLE raster_value_sums ADD COLUMN green_pixels bigint;
WITH gp AS (
	SELECT 
		beat_num,
		SUM("count") AS green_pix
	FROM public.raster_value_counts_v3
	WHERE "value" = 1 OR "value" = 2
	GROUP BY beat_num)
UPDATE raster_value_sums AS rvs
SET green_pixels = gp.green_pix
FROM gp
WHERE rvs.beat_num = gp.beat_num;

ALTER TABLE raster_value_sums ADD COLUMN perc_green double precision;
UPDATE raster_value_sums SET perc_green = (green_pixels::decimal)/(total_pixels::decimal);

ALTER TABLE police_beats ADD COLUMN perc_green double precision;
UPDATE police_beats SET perc_green=rvs.perc_green
FROM raster_value_sums AS rvs
WHERE police_beats.beat_num = rvs.beat_num;
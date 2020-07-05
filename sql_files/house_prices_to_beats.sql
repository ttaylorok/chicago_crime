ALTER TABLE police_beats ADD COLUMN mean_house_values_sqft int;

WITH pbv AS
(
SELECT
	beat_num,
	AVG(price_sq_ft) AS price_sq_ft
	FROM public.beats_with_houses
	WHERE ("Sale Year" > 2014. AND "Sale Year" < 2020.)
	GROUP BY beat_num
)
UPDATE police_beats AS pb
SET mean_house_values_sqft = pbv.price_sq_ft
FROM pbv
WHERE pb.beat_num = pbv.beat_num
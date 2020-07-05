ALTER TABLE police_beats
	ADD COLUMN lu_total double precision;
		
WITH pbv AS
	(
	SELECT 
	beat_num,
	SUM(intersect_area) AS res
	FROM public.beats_with_lu
	--WHERE land_use_2 = 'open_space'
	GROUP BY beat_num
	)
UPDATE police_beats
SET 
	lu_total = pbv.res
FROM pbv
WHERE police_beats.beat_num = pbv.beat_num;
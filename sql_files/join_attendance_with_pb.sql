WITH pbv AS
	(
	SELECT 
	beat_num,
	SUM("Average Daily Attendance Rate" * percent_area) AS attendance
	FROM public.beats_with_hsp
	GROUP BY beat_num
	)
UPDATE police_beats
SET attendance = pbv.attendance
FROM pbv
WHERE police_beats.beat_num = pbv.beat_num;  

ALTER TABLE police_beats
	ADD COLUMN attendance_rate double precision,
	ADD COLUMN graduation_rate double precision,
	ADD COLUMN college_enrollment_rate double precision,
	ADD COLUMN budget_per_student double precision,
	ADD COLUMN sat_score double precision,
	ADD COLUMN suspensions double precision;
	
WITH pbv AS
	(
	SELECT 
	beat_num,
	SUM("Average Daily Attendance Rate" * percent_area) AS attendance,
	SUM("College Enrollment Rate" * percent_area) AS college,
	SUM("4-Year Cohort Graduation Rate" * percent_area) AS grad,
	SUM("budget_per_student" * percent_area) AS budget,
	SUM("SAT_Grade_11_Score_School_Avg" * percent_area) AS sat,
	SUM("Suspensions_Per_100_Students_Year_1_Pct" * percent_area) AS sus
	FROM public.beats_with_hsp
	GROUP BY beat_num
	)
UPDATE police_beats
SET 
	attendance_rate = pbv.attendance,
	graduation_rate = pbv.grad,
	college_enrollment_rate = pbv.college,
	budget_per_student = pbv.budget,
	sat_score = pbv.sat,
	suspensions = pbv.sus
FROM pbv
WHERE police_beats.beat_num = pbv.beat_num;  

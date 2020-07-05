CREATE TABLE high_school_boundaries_performance AS
SELECT
	hsb.*,
	src.*,
	sat."Enrollment",
	sb."FY 2018 Ending Budget ", sb."FY 2019 Ending Budget ",
	sac.*
FROM public.high_school_boundaries_union AS hsb
LEFT JOIN public."school_report_card_2018-2019" AS src
ON hsb."school_id" = src."School_ID"
LEFT JOIN public."school_attendance_2018-2019" AS sat
ON  hsb."school_id" = sat."School ID"
LEFT JOIN public."school_accountability_2018-2019" AS sac
ON  hsb."school_id" = sac."School ID"
LEFT JOIN public.school_budgets_with_id as sb
ON hsb."school_id" = sb."School_ID"
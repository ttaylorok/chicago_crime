CREATE TABLE school_budgets_with_id AS
SELECT
	sb.*,
	src."School_ID"
FROM public."school_report_card_2018-2019" AS src
JOIN public.school_budgets AS sb
ON src."Long_Name" = sb."Corrected Name"
--WHERE src."Primary_Category" = 'HS'
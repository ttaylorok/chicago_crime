SELECT
	school_id,
	SUM (percent_area)
FROM
	public.beats_with_hsp
GROUP BY
	school_id
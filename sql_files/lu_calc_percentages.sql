ALTER TABLE police_beats
	ADD COLUMN lu_residential_perc double precision,
	ADD COLUMN lu_commercial_perc double precision,
	ADD COLUMN lu_industrial_perc double precision,
	ADD COLUMN lu_open_space_perc double precision;
	
UPDATE police_beats
SET 
	lu_residential_perc =
		CASE WHEN lu_residential IS NULL THEN 0. ELSE (lu_residential / lu_total) END,
	lu_commercial_perc =
		CASE WHEN lu_commercial IS NULL THEN 0. ELSE (lu_commercial / lu_total) END,
	lu_industrial_perc =
		CASE WHEN lu_industrial IS NULL THEN 0. ELSE (lu_industrial / lu_total) END,
	lu_open_space_perc = 
		CASE WHEN lu_open_space IS NULL THEN 0. ELSE (lu_open_space / lu_total) END;
	
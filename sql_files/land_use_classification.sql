ALTER TABLE public.land_use_2013 ADD COLUMN land_use_2 character varying;

UPDATE public.land_use_2013 SET land_use_2=
(
	CASE WHEN left(landuse,2) = '11' THEN 'residential'
		 WHEN left(landuse,2) = '12' THEN 'commercial'
		 WHEN left(landuse,2) = '14' THEN 'industrial'
		 WHEN left(landuse,1) = '3' THEN 'open_space'
		 WHEN left(landuse,2) = '41' THEN 'vacant'
		 ELSE 'other'
	END
)
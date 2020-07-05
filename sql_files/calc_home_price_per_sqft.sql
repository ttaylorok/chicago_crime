ALTER TABLE public.home_sales ADD COLUMN price_sq_ft double precision;
UPDATE public.home_sales SET price_sq_ft = (
	CASE
	WHEN "Building Square Feet" IS NOT null  AND
		"Building Square Feet" > 0.0 
		THEN ("Sale Price" / "Building Square Feet")
	ELSE null
	END
	)
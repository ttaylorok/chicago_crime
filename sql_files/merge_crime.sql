CREATE TABLE crime_merged3 AS
SELECT
	crime."ID", crime."Year",
	crime."Date", crime."Primary Type",
	crime."Description", crime."Beat",
	crime."District", crime."Ward",
	crime."Community Area", crime."FBI Code",
	crime.geom AS geom_crime,
	census.*,
	cdb.distance_to_bus_stop,
	cdp.distance_to_park,
	cdw.distance_to_walmart
FROM crime
LEFT JOIN census_merged AS census
ON ST_Within(crime.geom, census.geom)
LEFT JOIN crime_dist_bus_stop AS cdb
ON crime."ID" = cdb."ID"
LEFT JOIN crime_dist_to_park AS cdp
ON crime."ID" = cdp."ID"
LEFT JOIN crime_dist_walmart AS cdw
ON crime."ID" = cdw."ID"
WHERE crime."Year" >= 2009.
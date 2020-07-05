CREATE TABLE community_areas_health AS
SELECT
	ca.*,
	le."2010 Life Expectancy",
	hs."Teen Birth Rate",
	hs."Birth Rate"
FROM community_areas AS ca
LEFT JOIN life_expectancy AS le
ON le."Community Area Number" = ca.area_num_1
LEFT JOIN health_stats as hs
ON hs."Community Area" = ca.area_num_1
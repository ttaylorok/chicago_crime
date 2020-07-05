CREATE TABLE scratch AS
SELECT
	-- geometry
	cg."geom", cg."geoid",
	
	-- housing
	ch."S1101_C01_009E",ch."S1101_C01_003E",ch."S1101_C01_004E",ch."S1101_C05_009E",
	ch."S1101_C02_001E",ch."S1101_C01_019E",ch."S1101_C01_020E",ch."S1101_C03_009E",
	ch."S1101_C04_009E",
	
	-- transportation
	ct."S0802_C01_100E",ct."S0802_C04_001E",ct."S0802_C01_042E",ct."S0802_C01_001E",
	
	-- demographics
	cd."DP05_0023PE",cd."DP05_0037PE",cd."DP05_0038PE",cd."DP05_0039PE",
	cd."DP05_0044PE",cd."DP05_0070PE",cd."DP05_0002PE",cd."DP05_0003PE",
	
	-- education
	ce."S1501_C01_006E",ce."S1501_C01_007E",ce."S1501_C01_008E",ce."S1501_C01_009E",
	ce."S1501_C01_010E",ce."S1501_C01_011E",ce."S1501_C01_012E",ce."S1501_C01_013E",
	ce."S1501_C01_014E",ce."S1501_C01_015E",
	
	-- marriage
	cms."S1201_C01_016E",cms."S1201_C06_016E",cms."S1201_C05_016E",cms."S1201_C04_016E",
	cms."S1201_C02_016E",

	-- poverty
	cp."S1701_C02_001E",cp."S1701_C03_001E",
	
	-- income
	ci."S1901_C01_012E",ci."S1901_C01_013E",ci."S1901_C01_001E",ci."S1901_C01_002E",
	ci."S1901_C01_003E",ci."S1901_C01_004E",ci."S1901_C01_005E",ci."S1901_C01_006E",
	ci."S1901_C01_007E",ci."S1901_C01_008E",ci."S1901_C01_009E",ci."S1901_C01_010E",
	ci."S1901_C01_011E",
	
	-- employment
	cem."S2301_C04_001E",cem."S2301_C04_021E"
FROM census_tracts AS cg
JOIN census_housing AS ch
ON cg.geoid = ch."GEO_ID_11"
JOIN census_transportation AS ct
ON cg.geoid = ct."GEO_ID_11"
JOIN census_demographics AS cd
ON cg.geoid = cd."GEO_ID_11"
JOIN census_educational_attainment AS ce
ON cg.geoid = ce."GEO_ID_11"
JOIN census_marital_status AS cms
ON cg.geoid = cms."GEO_ID_11"
JOIN census_poverty AS cp
ON cg.geoid = cp."GEO_ID_11"
JOIN census_income AS ci
ON cg.geoid = ci."GEO_ID_11"
JOIN census_employment AS cem
ON cg.geoid = cem."GEO_ID_11";
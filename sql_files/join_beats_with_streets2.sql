ALTER TABLE police_beats ADD COLUMN distance_to_highway double precision;

WITH dist AS (SELECT * FROM beats_to_streets)
UPDATE police_beats SET distance_to_highway=dist.distance
FROM dist
WHERE police_beats.beat_num = dist.beat_num

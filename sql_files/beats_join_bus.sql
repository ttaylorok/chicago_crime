CREATE TABLE beats_with_buses AS
SELECT
	pb.beat_num,
	bus.*
FROM public.police_beats AS pb
LEFT JOIN public.bus_stops AS bus
ON ST_Within(bus.geom, pb.geom)
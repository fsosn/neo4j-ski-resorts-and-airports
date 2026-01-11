MATCH (r:Resort)
WHERE r.name = "Tatranska? Lomnica"

WITH r, r.location.latitude AS lat, r.location.longitude AS lon
CALL apoc.load.json(
  "https://api.open-meteo.com/v1/forecast?latitude=" + lat + 
  "&longitude=" + lon + 
  "&current=temperature_2m,snowfall,snow_depth"
) YIELD value

RETURN value
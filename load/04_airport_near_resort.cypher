MATCH (r:Resort)
MATCH (a:Airport)
WHERE point.distance(r.location, a.location) <= 120000
MERGE (r)-[rel:NEAR_AIRPORT]-(a)
SET rel.distanceKm = round(point.distance(r.location, a.location) / 1000, 2)
MATCH (r:Resort)
WHERE point.distance(r.location, point({latitude: 48.20849, longitude: 16.37208})) <= 100000
RETURN 
    r.name AS Name, 
    "Resort" AS Category, 
    round(point.distance(r.location, point({latitude: 48.20849, longitude: 16.37208})) / 1000, 2) AS Distance_KM
UNION
MATCH (a:Airport)
WHERE point.distance(a.location, point({latitude: 48.20849, longitude: 16.37208})) <= 50000
RETURN 
    a.name AS Name, 
    "Airport" AS Category, 
    round(point.distance(a.location, point({latitude: 48.20849, longitude: 16.37208})) / 1000, 2) AS Distance_KM

ORDER BY Distance_KM ASC;
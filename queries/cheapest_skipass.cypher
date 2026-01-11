MATCH (c:Country)<-[:LOCATED_IN]-(r:Resort)
WHERE r.skipass_price > 0
WITH r, c
ORDER BY r.skipass_price ASC
LIMIT 5

MATCH (r)-[rel:NEAR_AIRPORT]->(a:Airport)
WITH r, c, a, rel
ORDER BY rel.distanceKm ASC
WITH r, c, collect({name: a.name, iata: a.iata_code, dist: rel.distanceKm})[0] AS nearest_airport
RETURN 
    r.name AS Resort, 
    c.name AS Country, 
    r.skipass_price AS Skipass, 
    nearest_airport.name AS Nearest_Airport, 
    nearest_airport.iata AS IATA, 
    nearest_airport.dist AS Distance_KM
ORDER BY Skipass ASC;
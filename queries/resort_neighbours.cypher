MATCH (c:Country {name: "Norway"})
MATCH (c)<-[:LOCATED_IN]-(r1:Resort)-[:NEAR_TO]-(r2:Resort)-[:LOCATED_IN]->(c)
WHERE elementId(r1) < elementId(r2)
MATCH (r1)-[:NEAR_AIRPORT]->(a:Airport)<-[:NEAR_AIRPORT]-(r2)
WITH r1, r2, collect(a.iata_code) AS Airports, point.distance(r1.location, r2.location) AS dist
RETURN 
    r1.name AS Resort_A,
    r2.name AS Resort_B,
    round(dist/1000, 2) AS Distance_between_resorts_KM,
    Airports
ORDER BY Distance_between_resorts_KM ASC
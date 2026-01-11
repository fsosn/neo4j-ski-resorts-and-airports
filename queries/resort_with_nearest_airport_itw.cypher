MATCH (c:Country)<-[:LOCATED_IN]-(r:Resort)-[rel:NEAR_AIRPORT]->(a:Airport)
RETURN 
    r.name AS Resort, 
    c.name AS Country,
    a.name AS Airport,
    a.iata_code AS IATA,
    rel.distanceKm AS Distance_KM
ORDER BY rel.distanceKm ASC
LIMIT 1;
MATCH (con:Continent {name: 'Europe'})<-[:PART_OF]-(c:Country)<-[:LOCATED_IN]-(r:Resort)-[rel:NEAR_AIRPORT]->(a:Airport)
WHERE r.highest_point >= 2000
RETURN 
    r.name AS Resort, 
    c.name AS Country,
    r.skipass_price AS Skipass,
    a.name AS Airport,
    a.iata_code AS IATA,
    rel.distanceKm AS Distance_KM
ORDER BY rel.distanceKm ASC
LIMIT 5;
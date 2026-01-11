MATCH (con:Continent {name: 'Europe'})<-[:PART_OF]-(c:Country)<-[:LOCATED_IN]-(r:Resort)
MATCH (r)-[:OPEN_IN]->(m:Month)
WHERE m.name IN ['June', 'July', 'August']
MATCH (r)-[:NEAR_AIRPORT]->(:Airport)
RETURN DISTINCT
    r.name AS Resort, 
    c.name AS Country
ORDER BY r.name ASC;
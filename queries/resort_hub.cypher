MERGE (hub:ResortHub {name: "Ski Arlberg"})
WITH hub
MATCH (r:Resort)
WHERE r.name CONTAINS "(Ski Arlberg)"
MERGE (r)-[:PART_OF_HUB]->(hub)
RETURN hub.name, collect(r.name) AS ConnectedResorts
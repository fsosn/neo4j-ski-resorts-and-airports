MATCH (a:Airport)
MATCH (c:Country)
WHERE a.iso_country = c.code
MERGE (a)-[:LOCATED_IN]->(c);
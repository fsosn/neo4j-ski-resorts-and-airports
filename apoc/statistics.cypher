MATCH (r:Resort)-[:LOCATED_IN]->(c:Country)
WHERE c.name = 'Italy' AND r.skipass_price > 0
RETURN apoc.agg.statistics(r.skipass_price) AS stats
MATCH (r:Resort)-[:LOCATED_IN]->(c:Country)
WHERE c.name = 'Austria' AND r.skipass_price > 0
RETURN apoc.agg.median(r.skipass_price) as SkipassMedian
CALL gds.wcc.stream('skiGraph')
YIELD nodeId, componentId
RETURN componentId, collect(gds.util.asNode(nodeId).name) AS nodes
ORDER BY componentId
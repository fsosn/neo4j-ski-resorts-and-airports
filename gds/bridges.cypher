CALL gds.bridges.stream('skiGraph')
YIELD from, to
WITH gds.util.asNode(from) AS startNode, gds.util.asNode(to) AS endNode
WHERE startNode:Resort OR endNode:Resort
RETURN startNode.name AS Start, endNode.name AS End
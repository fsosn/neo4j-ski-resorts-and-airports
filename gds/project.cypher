CALL gds.graph.project(
  'skiGraph',
  ['Resort', 'Airport', 'Country', 'Continent', 'ResortHub', 'Feature', 'Infrastructure', 'LiftType', 'Month'],
  {
    LOCATED_IN: {orientation: 'UNDIRECTED'},
    PART_OF: {orientation: 'UNDIRECTED'},
    NEAR_AIRPORT: {orientation: 'UNDIRECTED'},
    NEAR_TO: {orientation: 'UNDIRECTED'},
    PART_OF_HUB: {orientation: 'UNDIRECTED'},
    OFFERS_FEATURE: {orientation: 'UNDIRECTED'},
    HAS_INFRASTRUCTURE: {orientation: 'UNDIRECTED'},
    HAS_LIFT: {orientation: 'UNDIRECTED'},
    OPEN_IN: {orientation: 'UNDIRECTED'}
  }
);
CALL gds.graph.drop('RaumGraph') YIELD graphName;

// a
// Wie lange benötigt Hr. Eck von seinem Büro zum Büro von Hr. Eiermann?
CALL gds.graph.project(
'RaumGraph',
'Raum',
'WEG',
{
  relationshipProperties: ['dauer', 'barrierefrei']
}
)
YIELD
graphName AS graph,
relationshipProjection AS knowsProjection,
nodeCount AS nodes,
relationshipCount AS rels

MATCH (ec:Buero {personen: ['Eck']})
MATCH (ei:Buero {personen: ['Eiermann']})
CALL gds.shortestPath.dijkstra.stream('RaumGraph', {
  sourceNode:                 ec,
  targetNodes:                ei,
  relationshipWeightProperty: 'dauer'
})
YIELD path, totalCost
RETURN path, totalCost

// b
// Welcher Weg ist der kürzeste Weg vom Eingang auf der Südseite zu einem Poolraum in
// der ersten Etage mit mind. 30 Sitzplätze?
MATCH (START:Eingang {etage: 0, id: 'O-089'})
MATCH (ziel:Poolraum {etage: 1})
  WHERE ziel.anzahlSitze >= 30
CALL gds.shortestPath.dijkstra.stream('RaumGraph', {
  sourceNode:                 START,
  targetNodes:                ziel,
  relationshipWeightProperty: 'dauer'
})
YIELD path, totalCost
RETURN path, totalCost

// c
// Wie lange benötigt man auf dem kürzesten Weg von O107 zur nächsten Herrentoilette?
MATCH (START:Raum {id: 'O-107'})
MATCH (ziel:Toilette {typ: 'Herren'})
CALL gds.shortestPath.dijkstra.stream('RaumGraph', {
  sourceNode:                 START,
  targetNodes:                ziel,
  relationshipWeightProperty: 'dauer'
})
YIELD path, totalCost
RETURN path, totalCost

// d
// Finden Sie den kürzesten Weg für einen Rollstuhlfahrer vom Eingang Ost zum Raum O102.
CALL gds.graph.drop('RaumGraphBarrierefrei') YIELD graphName;

MATCH (start:Eingang {id: 'O-088'}), (ziel:Raum {id: 'O-102'})
CALL gds.graph.filter(
'RaumGraphBarrierefrei',
'RaumGraph',
'*',
'r.barrierefrei >= 1.0'
)
YIELD graphName
CALL gds.shortestPath.dijkstra.stream(graphName, {
  sourceNode:                 start,
  targetNodes:                ziel,
  relationshipWeightProperty: 'dauer'
})
YIELD path, totalCost
RETURN path, totalCost

// a
// Wie lange benötigt Hr. Eck von seinem Büro zum Büro von Hr. Eiermann?
MATCH path = shortestPath((:Buero {personen: ['Eck']})-[p:WEG*]->(:Buero {personen: ['Eiermann']}))
WITH path, reduce(acc = 0, step IN p | acc + step.dauer) AS time
  ORDER BY time ASC
  LIMIT 1
RETURN path, time

// b
// Welcher Weg ist der kürzeste Weg vom Eingang auf der Südseite zu einem Poolraum in
// der ersten Etage mit mind. 30 Sitzplätze?
MATCH path = shortestPath((:Eingang {etage: 0, id: 'O-089'})-[p:WEG*]->(ziel:Hoersaal {etage: 1}))
  WHERE ziel.anzahlSitze >= 30
WITH path, reduce(acc = 0, step IN p | acc + step.dauer) AS time
  ORDER BY time ASC
  LIMIT 1
RETURN path, time

// c
// Wie lange benötigt man auf dem kürzesten Weg von O107 zur nächsten Herrentoilette?
MATCH path = shortestPath((:Raum {id: 'O-107'})-[p:WEG*]->(:Toilette {typ: 'Herren'}))
WITH path, reduce(acc = 0, step IN p | acc + step.dauer) AS time
  ORDER BY time ASC
  LIMIT 1
RETURN path, time

// d
// Finden Sie den kürzesten Weg für einen Rollstuhlfahrer vom Eingang Ost zum Raum O102.
MATCH path = shortestPath((:Eingang {id: 'O-088'})-[p:WEG*1..5]->(:Raum {id: 'O-102'}))
  WHERE ALL(r IN p
    WHERE r.barrierefrei = true)
WITH path, reduce(acc = 0, step IN p | acc + step.dauer) AS time
  ORDER BY time ASC
  LIMIT 1
RETURN path, time

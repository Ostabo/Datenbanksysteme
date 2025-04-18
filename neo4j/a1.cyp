// a
// Welches sind die drei häufigsten Directors, mit denen Tom Hanks zusammen gedreht hat?
// Geben Sie die Director-Namen und die Anzahl gemeinsamer Filme aus.
MATCH (tom:Person {name: 'Tom Hanks'})-[:ACTED_IN]->(f:Movie)<-[r:DIRECTED]-(d:Person)
WITH d, count(r) AS anz
  ORDER BY anz DESC
  LIMIT 3
RETURN d.name AS Director, anz AS Anzahl

// b
// Fügen Sie eine KNOWS-Beziehung zwischen allen Akteuren (Regisseuren und
// Schauspielern) ein, die zusammen einen Film gedreht habe. Die Relation soll zwischen allen
// Akteueren, auch z.B. zwischen Schauspielern untereinander angelegt werden. Stellen Sie
// aber sicher, dass eine Person sich nicht selbst kennt. Zählen Sie anschliessend die Anzahl
// eingefügter Relationen.
MATCH (a:Person)-[:ACTED_IN|DIRECTED|WROTE|PRODUCED]->(:Movie)<-[:ACTED_IN|DIRECTED|WROTE|PRODUCED]-(d:Person)
  WHERE a <> d
WITH DISTINCT a, d
MERGE (a)-[k1:KNOWS]->(d)
MERGE (a)<-[k2:KNOWS]-(d)
RETURN count(k1) + count(k2) AS Eingefuegt

// c
// Geben Sie Empfehlungen für mögliche Filmpartner von Keanu Reeves an. Diese sollen
// Keanu Reeves nicht direkt kennen, aber Bekannte sollen sie kennen.
MATCH (k:Person {name: 'Keanu Reeves'})<-[:KNOWS]-(a:Person)<-[:KNOWS]-(potentialPartner:Person)
  WHERE NOT (potentialPartner)-[:KNOWS]->(k) AND k <> potentialPartner
WITH DISTINCT potentialPartner
RETURN potentialPartner.name

// d
// Die Bacon-Zahl ist die Länge der kürzesten Kette von Schauspielern, die gemeinsam in
// einem Film spielen, zu Kevin Bacon. Berechnen Sie die Bacon-Zahl zwischen Kevin Bacon
// und Keanu Reeves.
MATCH baconPath = shortestPath((k:Person {name: 'Keanu Reeves'})-[:ACTED_IN*]-(kb:Person {name: 'Kevin Bacon'}))
RETURN baconPath, length(baconPath) AS BaconNumber

// e
// Welche Schauspieler haben bereits in mindestens drei Filmen zusammen gespielt?
MATCH (a:Person)-[:ACTED_IN]->(m:Movie)<-[:ACTED_IN]-(b:Person)
  WHERE id(a) > id(b)
WITH a, b, count(m) AS AnzahlFilme
  WHERE AnzahlFilme >= 3
RETURN a.name, b.name, AnzahlFilme


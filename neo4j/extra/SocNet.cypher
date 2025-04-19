CREATE (neuer:Mitglied   { name: "Neuer"})
CREATE (kimmich:Mitglied { name: "Kimmich"})
CREATE (boateng:Mitglied { name: "Boateng"})

CREATE (b1:Beitrag { inhalt: "Dies ist ein Beitrag"})
CREATE (b2:Beitrag { inhalt: "Dies ist ein weiterer Beitrag"})
CREATE (b3:Beitrag { inhalt: "Dies ist noch ein  Beitrag"})

CREATE (neuer)-[:SCHREIBT]->(b1)
CREATE (neuer)-[:SCHREIBT]->(b2)
CREATE (kimmich)-[:SCHREIBT]->(b3)

CREATE (neuer)-[:LIKES]->(b3)
CREATE (boateng)-[:LIKES]->(b2)
CREATE (kimmich)-[:LIKES]->(b3)


// Wie viele Beiträge haben die Mitglieder geschrieben? Die Ausgabe soll
// in folgendem Format erfolgen:
// Neuer     2
// Kimmich 1
MATCH (m1:Mitglied )–[:SCHREIBT]->(b1:Beitrag)
RETURN m1.name as Name, count(*) as Anzahl

//Variante mit Boateng (Mitglied ohne Beiträge)
MATCH (m1:Mitglied)
OPTIONAL MATCH (m1)–[:SCHREIBT]->(b1:Beitrag)
RETURN m1.name as name, count(b1) as anzahl

// Welche Mitglieder haben mind. eine LIKES-Beziehung zu einem eigenen Beitrag?
MATCH (m1:Mitglied)–[:SCHREIBT]->(b1:Beitrag)
WHERE (m1)–[:LIKES]->(b1)
RETURN m1

// besser
MATCH (m1:Mitglied)–[:SCHREIBT]->(b1:Beitrag)<-[:LIKES]-(m1)
RETURN m1

// schlechter
MATCH (m1:Mitglied)
MATCH (b1:Beitrag)
  WHERE (m1)–[:SCHREIBT]->(b1)
AND (m1)-[:LIKES]->(b1)
RETURN m1

// Welches Mitglied hat am meisten LIKES auf all seine Beiträge gesammelt?
MATCH (m1:Mitglied)–[:SCHREIBT]->(b1:Beitrag)<-[:LIKES]-(m2:Mitglied)
WITH m1, count(m2) as anz
  ORDER BY anz DESC
  LIMIT 1
RETURN m1

// distinct in count, falls jede Person im like nur einmal gezählt werden soll
// Tipp: Beim Erzeugen einer Relation sollte eher MERGE verwendet werden

//Welche Mitglieder haben keine Beiträge?
MATCH (m1:Mitglied)
  where not (m1)-[:SCHREIBT]->(:Beitrag)
return m1

// Wie viele Mitglieder haben überhaupt keine Likes auf ihre Beiträge?
MATCH (m1:Mitglied)–[:SCHREIBT]->(b1:Beitrag)
WHERE NOT (b1)<-[:LIKES]-(:Mitglied)
RETURN count(m1)

// Welche Mitglieder haben durchschnittlich mehr als 10 Likes pro Beitrag
MATCH (m1:Mitglied)–[:SCHREIBT]->(b1:Beitrag)<-[:LIKES]-(m2:Mitglied)
WITH m1, count(b1) as b, count(m2) as l
  WHERE l/b>10
RETURN m1.name

// ALLE Beiträge mitzählen:
MATCH (m1:Mitglied)–[:SCHREIBT]->(b1:Beitrag)
OPTIONAL MATCH (b1)<-[:LIKES]-(m2:Mitglied)
WITH m1, count(b1) as b, count(m2) as l
  WHERE l/b<10
RETURN m1.name, l, b

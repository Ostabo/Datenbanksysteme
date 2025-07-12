MATCH (n)
DETACH DELETE n;

MATCH (n)
RETURN n;

// Die folgenden Befehle in Neo4j definieren einen kleinen Ausschnitt aus einem Modell für
// einen Onlineshop. In der Relationship „kauf“ beschreibt das Property „sterne“ die
// Bewertung (es gibt 1-5 Sterne).
// Für diesen Shop soll ein Empfehlungssystem entwickelt werden, das einem Käufer Artikel
// vorschlägt, die für ihn interessant sein könnten. Es wird in Teilaufgabe c) folgendes
// Verfahren angewendet: Wenn zwei Kunden K1 und K2 einen Artikel A1 gekauft und
// beide mit 5 Sterne bewertet haben, dann werden alle weitere gekaufte und mit mind. 5
// Sternen bewerteten Artikel des Kunden K2 dem Kunden K1 vorgeschlagen. Es darf
// einem Kunden kein Artikel vorgeschlagen werden, den er bereits gekauft hat.
CREATE (sane:Kunde {name: 'Sané'})
CREATE (lewandowsky:Kunde {name: 'Lewandowsky'})
CREATE (goretzka:Kunde {name: 'Goretzka'})

CREATE (a1:Artikel {artikelnr: 'A223344'})
CREATE (a2:Artikel {artikelnr: 'A556677'})
CREATE (a3:Artikel {artikelnr: 'A998877'})

CREATE (goretzka)-[:kauf {sterne: 5}]->(a1)
CREATE (goretzka)-[:kauf {sterne: 5}]->(a2)
CREATE (sane)-[:kauf {sterne: 5}]->(a3)
CREATE (sane)-[:kauf {sterne: 5}]->(a2);
//

// a
// Welche Artikel wurden noch nie mit 5 Punkten bewertet?
MATCH (a:Artikel)
  WHERE NOT (a)<-[:kauf {sterne: 5}]-(:Kunde)
RETURN a AS Artikel;

// b
// Welche zwei Personen haben den gleichen Artikel gekauft und jeweils mit 5 Sternen
// bewertet? Beachten Sie, dass die zwei Personen verschieden sein sollten.
MATCH (k1:Kunde)-[:kauf {sterne: 5}]->(a1:Artikel)<-[:kauf {sterne: 5}]-(k2:Kunde)
  WHERE k1 <> k2
RETURN k1, k2

// c
// Welche Artikel werden Hr. Sané vorgeschlagen?
MATCH (k1:Kunde {name: 'Sané'})-[:kauf {sterne: 5}]->(a1:Artikel)<-[:kauf {sterne: 5}]-(k2:Kunde),
      (k2:Kunde)-[:kauf {sterne: 5}]->(a2:Artikel)
  WHERE k1 <> k2
  AND a1 <> a2
  AND NOT (k1)-[:kauf]->(a2)
RETURN DISTINCT a2

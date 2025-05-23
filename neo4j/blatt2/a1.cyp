MATCH (n)
DETACH DELETE n;

////////////////////////////////////////////////////////
//// EBENE 0
////////////////////////////////////////////////////////
CREATE (O089:Raum:Eingang {id: 'O-089', etage: 0})
CREATE (O088:Raum:Eingang {id: 'O-088', etage: 0})
CREATE (O087:Raum:Zwischenraum {id: 'O-087', etage: 0})
CREATE (O006:Raum:Buero {id: 'O-006', etage: 0, personen: []})
CREATE (O005:Raum {id: 'O-005', etage: 0})
CREATE (O004:Raum:Buero {id: 'O-004', etage: 0, personen: ['Eigelsperger']})
CREATE (O003:Raum:Buero {id: 'O-003', etage: 0, personen: ['Eiermann']})
CREATE (O002:Raum:Hoersaal {id: 'O-002', etage: 0, anzahlSitze: 42, ausstattung: ['Beamer', 'Wuerfel']})
CREATE (O086:Raum {id: 'O-086', etage: 0})
CREATE (O085:Raum:Zwischenraum {id: 'O-085', etage: 0})
CREATE (O001:Raum:Poolraum {id: 'O-001', etage: 0, anzahlSitze: 14})
CREATE (O008:Raum:Hoersaal {id: 'O-008', etage: 0, anzahlSitze: 36, ausstattung: ['Beamer']})
CREATE (O007:Raum:Poolraum {id: 'O-007', etage: 0, anzahlSitze: 18, ausstattung: ['Beamer']})
CREATE (O083:Raum:Zwischenraum {id: 'O-083', etage: 0})
CREATE (O091:Raum:Toilette {id: 'O-091', etage: 0, typ: 'Herren'})
CREATE (O009:Raum {id: 'O-009', etage: 0})
CREATE (O010:Raum {id: 'O-010', etage: 0})
CREATE (O092:Raum {id: 'O-092', etage: 0})

////////////////////////////////////////////////////////
//// RUNDGANG START
////////////////////////////////////////////////////////
CREATE
  (O089)-[:WEG {dauer: 2, barrierefrei: 0}]->(O001),
  (O089)-[:WEG {dauer: 2, barrierefrei: 0}]->(O085),
  (O089)-[:WEG {dauer: 3, barrierefrei: 0}]->(O086),
  (O089)-[:WEG {dauer: 4, barrierefrei: 0}]->(O002),
  (O089)-[:WEG {dauer: 6, barrierefrei: 0}]->(O003),
  (O089)-[:WEG {dauer: 6, barrierefrei: 0}]->(O004),
  (O089)-[:WEG {dauer: 6, barrierefrei: 0}]->(O088),
  (O089)-[:WEG {dauer: 5, barrierefrei: 0}]->(O007),
  (O089)-[:WEG {dauer: 6, barrierefrei: 0}]->(O092),
  (O089)-[:WEG {dauer: 6, barrierefrei: 0}]->(O091),
  (O089)-[:WEG {dauer: 5, barrierefrei: 0}]->(O010),
  (O089)-[:WEG {dauer: 4, barrierefrei: 0}]->(O009),
  (O089)-[:WEG {dauer: 2, barrierefrei: 0}]->(O008),
  (O089)-[:WEG {dauer: 8, barrierefrei: 0}]->(O083) // Warten auf Aufzug
CREATE
  (O089)<-[:WEG {dauer: 2, barrierefrei: 0}]-(O001),
  (O089)<-[:WEG {dauer: 2, barrierefrei: 0}]-(O085),
  (O089)<-[:WEG {dauer: 3, barrierefrei: 0}]-(O086),
  (O089)<-[:WEG {dauer: 4, barrierefrei: 0}]-(O002),
  (O089)<-[:WEG {dauer: 6, barrierefrei: 0}]-(O003),
  (O089)<-[:WEG {dauer: 6, barrierefrei: 0}]-(O004),
  (O089)<-[:WEG {dauer: 6, barrierefrei: 0}]-(O088),
  (O089)<-[:WEG {dauer: 5, barrierefrei: 0}]-(O007),
  (O089)<-[:WEG {dauer: 6, barrierefrei: 0}]-(O092),
  (O089)<-[:WEG {dauer: 6, barrierefrei: 0}]-(O091),
  (O089)<-[:WEG {dauer: 5, barrierefrei: 0}]-(O010),
  (O089)<-[:WEG {dauer: 4, barrierefrei: 0}]-(O009),
  (O089)<-[:WEG {dauer: 2, barrierefrei: 0}]-(O008),
  (O089)<-[:WEG {dauer: 8, barrierefrei: 0}]-(O083) // Warten auf Aufzug

CREATE
  (O001)-[:WEG {dauer: 2, barrierefrei: 1}]->(O085),
  (O001)-[:WEG {dauer: 3, barrierefrei: 1}]->(O086),
  (O001)-[:WEG {dauer: 4, barrierefrei: 1}]->(O002),
  (O001)-[:WEG {dauer: 6, barrierefrei: 1}]->(O003),
  (O001)-[:WEG {dauer: 6, barrierefrei: 1}]->(O004),
  (O001)-[:WEG {dauer: 6, barrierefrei: 1}]->(O088),
  (O001)-[:WEG {dauer: 5, barrierefrei: 1}]->(O007),
  (O001)-[:WEG {dauer: 6, barrierefrei: 1}]->(O092),
  (O001)-[:WEG {dauer: 6, barrierefrei: 1}]->(O091),
  (O001)-[:WEG {dauer: 5, barrierefrei: 1}]->(O010),
  (O001)-[:WEG {dauer: 4, barrierefrei: 1}]->(O009),
  (O001)-[:WEG {dauer: 2, barrierefrei: 1}]->(O008),
  (O001)-[:WEG {dauer: 7, barrierefrei: 1}]->(O083) // Warten auf Aufzug
CREATE
  (O001)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O085),
  (O001)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O086),
  (O001)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O002),
  (O001)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O003),
  (O001)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O004),
  (O001)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O088),
  (O001)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O007),
  (O001)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O092),
  (O001)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O091),
  (O001)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O010),
  (O001)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O009),
  (O001)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O008),
  (O001)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O083) // Warten auf Aufzug

CREATE
  (O085)-[:WEG {dauer: 2, barrierefrei: 1}]->(O086),
  (O085)-[:WEG {dauer: 3, barrierefrei: 1}]->(O002),
  (O085)-[:WEG {dauer: 5, barrierefrei: 1}]->(O003),
  (O085)-[:WEG {dauer: 5, barrierefrei: 1}]->(O004),
  (O085)-[:WEG {dauer: 5, barrierefrei: 1}]->(O088),
  (O085)-[:WEG {dauer: 7, barrierefrei: 1}]->(O007),
  (O085)-[:WEG {dauer: 3, barrierefrei: 1}]->(O092),
  (O085)-[:WEG {dauer: 7, barrierefrei: 1}]->(O091),
  (O085)-[:WEG {dauer: 7, barrierefrei: 1}]->(O010),
  (O085)-[:WEG {dauer: 6, barrierefrei: 1}]->(O009),
  (O085)-[:WEG {dauer: 3, barrierefrei: 1}]->(O008),
  (O085)-[:WEG {dauer: 5, barrierefrei: 1}]->(O083) // Warten auf Aufzug
CREATE
  (O085)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O086),
  (O085)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O002),
  (O085)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O003),
  (O085)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O004),
  (O085)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O088),
  (O085)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O007),
  (O085)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O092),
  (O085)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O091),
  (O085)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O010),
  (O085)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O009),
  (O085)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O008),
  (O085)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O083) // Warten auf Aufzug

CREATE
  (O002)-[:WEG {dauer: 2, barrierefrei: 1}]->(O086),
  (O002)-[:WEG {dauer: 2, barrierefrei: 1}]->(O003),
  (O002)-[:WEG {dauer: 4, barrierefrei: 1}]->(O004),
  (O002)-[:WEG {dauer: 4, barrierefrei: 1}]->(O088),
  (O002)-[:WEG {dauer: 5, barrierefrei: 1}]->(O007),
  (O002)-[:WEG {dauer: 2, barrierefrei: 1}]->(O092),
  (O002)-[:WEG {dauer: 5, barrierefrei: 1}]->(O091),
  (O002)-[:WEG {dauer: 6, barrierefrei: 1}]->(O010),
  (O002)-[:WEG {dauer: 6, barrierefrei: 1}]->(O009),
  (O002)-[:WEG {dauer: 6, barrierefrei: 1}]->(O008),
  (O002)-[:WEG {dauer: 5, barrierefrei: 1}]->(O083) // Warten auf Aufzug
CREATE
  (O002)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O086),
  (O002)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O003),
  (O002)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O004),
  (O002)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O088),
  (O002)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O007),
  (O002)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O092),
  (O002)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O091),
  (O002)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O010),
  (O002)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O009),
  (O002)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O008),
  (O002)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O083) // Warten auf Aufzug

CREATE
  (O003)-[:WEG {dauer: 4, barrierefrei: 1}]->(O086),
  (O003)-[:WEG {dauer: 2, barrierefrei: 1}]->(O004),
  (O003)-[:WEG {dauer: 2, barrierefrei: 1}]->(O088),
  (O003)-[:WEG {dauer: 4, barrierefrei: 1}]->(O007),
  (O003)-[:WEG {dauer: 2, barrierefrei: 1}]->(O092),
  (O003)-[:WEG {dauer: 4, barrierefrei: 1}]->(O091),
  (O003)-[:WEG {dauer: 5, barrierefrei: 1}]->(O010),
  (O003)-[:WEG {dauer: 6, barrierefrei: 1}]->(O009),
  (O003)-[:WEG {dauer: 7, barrierefrei: 1}]->(O008),
  (O003)-[:WEG {dauer: 10, barrierefrei: 1}]->(O083) // Warten auf Aufzug
CREATE
  (O003)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O086),
  (O003)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O004),
  (O003)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O088),
  (O003)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O007),
  (O003)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O092),
  (O003)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O091),
  (O003)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O010),
  (O003)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O009),
  (O003)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O008),
  (O003)<-[:WEG {dauer: 10, barrierefrei: 1}]-(O083) // Warten auf Aufzug

CREATE
  (O004)-[:WEG {dauer: 6, barrierefrei: 1}]->(O086),
  (O004)-[:WEG {dauer: 1, barrierefrei: 1}]->(O088),
  (O004)-[:WEG {dauer: 3, barrierefrei: 1}]->(O007),
  (O004)-[:WEG {dauer: 3, barrierefrei: 1}]->(O092),
  (O004)-[:WEG {dauer: 3, barrierefrei: 1}]->(O091),
  (O004)-[:WEG {dauer: 4, barrierefrei: 1}]->(O010),
  (O004)-[:WEG {dauer: 5, barrierefrei: 1}]->(O009),
  (O004)-[:WEG {dauer: 7, barrierefrei: 1}]->(O008),
  (O004)-[:WEG {dauer: 12, barrierefrei: 1}]->(O083) // Warten auf Aufzug
CREATE
  (O004)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O086),
  (O004)<-[:WEG {dauer: 1, barrierefrei: 1}]-(O088),
  (O004)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O007),
  (O004)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O092),
  (O004)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O091),
  (O004)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O010),
  (O004)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O009),
  (O004)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O008),
  (O004)<-[:WEG {dauer: 12, barrierefrei: 1}]-(O083) // Warten auf Aufzug

CREATE
  (O088)-[:WEG {dauer: 6, barrierefrei: 1}]->(O086),
  (O088)-[:WEG {dauer: 3, barrierefrei: 1}]->(O007),
  (O088)-[:WEG {dauer: 3, barrierefrei: 1}]->(O092),
  (O088)-[:WEG {dauer: 3, barrierefrei: 1}]->(O091),
  (O088)-[:WEG {dauer: 4, barrierefrei: 1}]->(O010),
  (O088)-[:WEG {dauer: 5, barrierefrei: 1}]->(O009),
  (O088)-[:WEG {dauer: 7, barrierefrei: 1}]->(O008),
  (O088)-[:WEG {dauer: 12, barrierefrei: 1}]->(O083) // Warten auf Aufzug
CREATE
  (O088)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O086),
  (O088)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O007),
  (O088)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O092),
  (O088)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O091),
  (O088)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O010),
  (O088)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O009),
  (O088)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O008),
  (O088)<-[:WEG {dauer: 12, barrierefrei: 1}]-(O083) // Warten auf Aufzug

CREATE
  (O007)-[:WEG {dauer: 8, barrierefrei: 1}]->(O086),
  (O007)-[:WEG {dauer: 6, barrierefrei: 1}]->(O092),
  (O007)-[:WEG {dauer: 2, barrierefrei: 1}]->(O091),
  (O007)-[:WEG {dauer: 3, barrierefrei: 1}]->(O010),
  (O007)-[:WEG {dauer: 3, barrierefrei: 1}]->(O009),
  (O007)-[:WEG {dauer: 5, barrierefrei: 1}]->(O008),
  (O007)-[:WEG {dauer: 10, barrierefrei: 1}]->(O083) // Warten auf Aufzug
CREATE
  (O007)<-[:WEG {dauer: 8, barrierefrei: 1}]-(O086),
  (O007)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O092),
  (O007)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O091),
  (O007)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O010),
  (O007)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O009),
  (O007)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O008),
  (O007)<-[:WEG {dauer: 10, barrierefrei: 1}]-(O083) // Warten auf Aufzug

CREATE
  (O008)-[:WEG {dauer: 4, barrierefrei: 1}]->(O086),
  (O008)-[:WEG {dauer: 7, barrierefrei: 1}]->(O092),
  (O008)-[:WEG {dauer: 5, barrierefrei: 1}]->(O091),
  (O008)-[:WEG {dauer: 3, barrierefrei: 1}]->(O010),
  (O008)-[:WEG {dauer: 4, barrierefrei: 1}]->(O009),
  (O008)-[:WEG {dauer: 7, barrierefrei: 1}]->(O083) // Warten auf Aufzug
CREATE
  (O008)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O086),
  (O008)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O092),
  (O008)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O091),
  (O008)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O010),
  (O008)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O009),
  (O008)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O083) // Warten auf Aufzug

CREATE
  (O083)-[:WEG {dauer: 2, barrierefrei: 1}]->(O086),
  (O083)-[:WEG {dauer: 5, barrierefrei: 1}]->(O092),
  (O083)-[:WEG {dauer: 8, barrierefrei: 1}]->(O091),
  (O083)-[:WEG {dauer: 8, barrierefrei: 1}]->(O010),
  (O083)-[:WEG {dauer: 7, barrierefrei: 1}]->(O009)
CREATE
  (O083)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O086),
  (O083)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O092),
  (O083)<-[:WEG {dauer: 8, barrierefrei: 1}]-(O091),
  (O083)<-[:WEG {dauer: 8, barrierefrei: 1}]-(O010),
  (O083)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O009)

CREATE
  (O009)-[:WEG {dauer: 6, barrierefrei: 1}]->(O086),
  (O009)-[:WEG {dauer: 7, barrierefrei: 1}]->(O092),
  (O009)-[:WEG {dauer: 3, barrierefrei: 1}]->(O091),
  (O009)-[:WEG {dauer: 2, barrierefrei: 1}]->(O010)
CREATE
  (O009)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O086),
  (O009)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O092),
  (O009)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O091),
  (O009)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O010)

CREATE
  (O010)-[:WEG {dauer: 7, barrierefrei: 1}]->(O086),
  (O010)-[:WEG {dauer: 6, barrierefrei: 1}]->(O092),
  (O010)-[:WEG {dauer: 2, barrierefrei: 1}]->(O091)
CREATE
  (O010)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O086),
  (O010)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O092),
  (O010)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O091)

CREATE
  (O091)-[:WEG {dauer: 8, barrierefrei: 1}]->(O086),
  (O091)-[:WEG {dauer: 5, barrierefrei: 1}]->(O092)
CREATE
  (O091)<-[:WEG {dauer: 8, barrierefrei: 1}]-(O086),
  (O091)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O092)

CREATE
  (O092)-[:WEG {dauer: 4, barrierefrei: 1}]->(O086)
CREATE
  (O092)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O086)

////////////////////////////////////////////////////////
//// RUNDGANG ENDE
////////////////////////////////////////////////////////

CREATE
  (O088)-[:WEG {dauer: 1, barrierefrei: 1}]->(O006),
  (O088)-[:WEG {dauer: 2, barrierefrei: 1}]->(O005),
  (O088)-[:WEG {dauer: 2, barrierefrei: 1}]->(O087),
  (O088)<-[:WEG {dauer: 1, barrierefrei: 1}]-(O006),
  (O088)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O005),
  (O088)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O087)

////////////////////////////////////////////////////////
//// EBENE 1
////////////////////////////////////////////////////////
CREATE (Luftraum:Raum:Eingang {id: 'Luftraum', etage: 1})
CREATE (O188:Raum {id: 'O-188', etage: 1})
CREATE (O187:Raum:Zwischenraum {id: 'O-187', etage: 1})
CREATE (O106:Raum:Buero {id: 'O-106', etage: 1, personen: ['Eck']})
CREATE (O105:Raum {id: 'O-105', etage: 1})
CREATE (O104:Raum:Buero {id: 'O-104', etage: 1, personen: ['Staehle', 'Schmidt']})
CREATE (O103:Raum:Hoersaal {id: 'O-103', etage: 1, anzahlSitze: 50, ausstattung: ['Beamer', 'Wuerfel']})
CREATE (O102:Raum:Hoersaal {id: 'O-102', etage: 1, anzahlSitze: 50, ausstattung: ['Beamer', 'Wuerfel']})
CREATE (O185:Raum:Zwischenraum {id: 'O-185', etage: 1})
CREATE (O101:Raum:Poolraum {id: 'O-101', etage: 1, anzahlSitze: 12})
CREATE (O108:Raum:Poolraum {id: 'O-108', etage: 1, anzahlSitze: 36, ausstattung: ['Beamer']})
CREATE (O107:Raum:Hoersaal {id: 'O-107', etage: 1, anzahlSitze: 18, ausstattung: ['Beamer']})
CREATE (O183:Raum:Zwischenraum {id: 'O-183', etage: 1})
CREATE (O191:Raum:Toilette {id: 'O-191', etage: 1, typ: 'Frauen'})
CREATE (O109:Raum {id: 'O-109', etage: 1})
CREATE (O110:Raum {id: 'O-110', etage: 1})
CREATE (O111:Raum {id: 'O-111', etage: 1})
CREATE (O112:Raum {id: 'O-112', etage: 1})

////////////////////////////////////////////////////////
//// RUNDGANG START
////////////////////////////////////////////////////////
CREATE
  (Luftraum)-[:WEG {dauer: 2, barrierefrei: 1}]->(O101),
  (Luftraum)-[:WEG {dauer: 2, barrierefrei: 1}]->(O185),
  (Luftraum)-[:WEG {dauer: 4, barrierefrei: 1}]->(O103),
  (Luftraum)-[:WEG {dauer: 3, barrierefrei: 1}]->(O102),
  (Luftraum)-[:WEG {dauer: 6, barrierefrei: 1}]->(O105),
  (Luftraum)-[:WEG {dauer: 6, barrierefrei: 1}]->(O104),
  (Luftraum)-[:WEG {dauer: 6, barrierefrei: 1}]->(O188),
  (Luftraum)-[:WEG {dauer: 5, barrierefrei: 1}]->(O107),
  (Luftraum)-[:WEG {dauer: 6, barrierefrei: 1}]->(O111),
  (Luftraum)-[:WEG {dauer: 6, barrierefrei: 1}]->(O191),
  (Luftraum)-[:WEG {dauer: 6, barrierefrei: 1}]->(O112),
  (Luftraum)-[:WEG {dauer: 5, barrierefrei: 1}]->(O110),
  (Luftraum)-[:WEG {dauer: 4, barrierefrei: 1}]->(O109),
  (Luftraum)-[:WEG {dauer: 2, barrierefrei: 1}]->(O108),
  (Luftraum)-[:WEG {dauer: 8, barrierefrei: 1}]->(O183) // Warten auf Aufzug
CREATE
  (Luftraum)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O101),
  (Luftraum)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O185),
  (Luftraum)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O103),
  (Luftraum)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O102),
  (Luftraum)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O105),
  (Luftraum)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O104),
  (Luftraum)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O188),
  (Luftraum)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O107),
  (Luftraum)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O111),
  (Luftraum)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O191),
  (Luftraum)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O112),
  (Luftraum)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O110),
  (Luftraum)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O109),
  (Luftraum)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O108),
  (Luftraum)<-[:WEG {dauer: 8, barrierefrei: 1}]-(O183) // Warten auf Aufzug

CREATE
  (O101)-[:WEG {dauer: 2, barrierefrei: 1}]->(O185),
  (O101)-[:WEG {dauer: 4, barrierefrei: 1}]->(O103),
  (O101)-[:WEG {dauer: 3, barrierefrei: 1}]->(O102),
  (O101)-[:WEG {dauer: 6, barrierefrei: 1}]->(O105),
  (O101)-[:WEG {dauer: 6, barrierefrei: 1}]->(O104),
  (O101)-[:WEG {dauer: 6, barrierefrei: 1}]->(O188),
  (O101)-[:WEG {dauer: 5, barrierefrei: 1}]->(O107),
  (O101)-[:WEG {dauer: 6, barrierefrei: 1}]->(O111),
  (O101)-[:WEG {dauer: 6, barrierefrei: 1}]->(O191),
  (O101)-[:WEG {dauer: 6, barrierefrei: 1}]->(O112),
  (O101)-[:WEG {dauer: 5, barrierefrei: 1}]->(O110),
  (O101)-[:WEG {dauer: 4, barrierefrei: 1}]->(O109),
  (O101)-[:WEG {dauer: 2, barrierefrei: 1}]->(O108),
  (O101)-[:WEG {dauer: 7, barrierefrei: 1}]->(O183) // Warten auf Aufzug
CREATE
  (O101)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O185),
  (O101)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O103),
  (O101)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O102),
  (O101)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O105),
  (O101)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O104),
  (O101)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O188),
  (O101)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O107),
  (O101)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O111),
  (O101)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O191),
  (O101)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O112),
  (O101)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O110),
  (O101)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O109),
  (O101)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O108),
  (O101)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O183) // Warten auf Aufzug

CREATE
  (O185)-[:WEG {dauer: 3, barrierefrei: 1}]->(O103),
  (O185)-[:WEG {dauer: 3, barrierefrei: 1}]->(O102),
  (O185)-[:WEG {dauer: 5, barrierefrei: 1}]->(O105),
  (O185)-[:WEG {dauer: 5, barrierefrei: 1}]->(O104),
  (O185)-[:WEG {dauer: 5, barrierefrei: 1}]->(O188),
  (O185)-[:WEG {dauer: 7, barrierefrei: 1}]->(O107),
  (O185)-[:WEG {dauer: 3, barrierefrei: 1}]->(O111),
  (O185)-[:WEG {dauer: 7, barrierefrei: 1}]->(O191),
  (O185)-[:WEG {dauer: 7, barrierefrei: 1}]->(O112),
  (O185)-[:WEG {dauer: 7, barrierefrei: 1}]->(O110),
  (O185)-[:WEG {dauer: 6, barrierefrei: 1}]->(O109),
  (O185)-[:WEG {dauer: 3, barrierefrei: 1}]->(O108),
  (O185)-[:WEG {dauer: 5, barrierefrei: 1}]->(O183) // Warten auf Aufzug
CREATE
  (O185)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O103),
  (O185)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O102),
  (O185)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O105),
  (O185)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O104),
  (O185)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O188),
  (O185)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O107),
  (O185)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O111),
  (O185)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O191),
  (O185)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O112),
  (O185)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O110),
  (O185)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O109),
  (O185)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O108),
  (O185)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O183) // Warten auf Aufzug

CREATE
  (O103)-[:WEG {dauer: 2, barrierefrei: 1}]->(O105),
  (O103)-[:WEG {dauer: 4, barrierefrei: 1}]->(O104),
  (O103)-[:WEG {dauer: 4, barrierefrei: 1}]->(O188),
  (O103)-[:WEG {dauer: 5, barrierefrei: 1}]->(O107),
  (O103)-[:WEG {dauer: 2, barrierefrei: 1}]->(O111),
  (O103)-[:WEG {dauer: 5, barrierefrei: 1}]->(O191),
  (O103)-[:WEG {dauer: 5, barrierefrei: 1}]->(O112),
  (O103)-[:WEG {dauer: 6, barrierefrei: 1}]->(O110),
  (O103)-[:WEG {dauer: 6, barrierefrei: 1}]->(O109),
  (O103)-[:WEG {dauer: 6, barrierefrei: 1}]->(O108),
  (O103)-[:WEG {dauer: 5, barrierefrei: 1}]->(O183) // Warten auf Aufzug
CREATE
  (O103)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O105),
  (O103)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O104),
  (O103)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O188),
  (O103)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O107),
  (O103)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O111),
  (O103)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O191),
  (O103)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O112),
  (O103)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O110),
  (O103)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O109),
  (O103)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O108),
  (O103)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O183) // Warten auf Aufzug

CREATE
  (O102)-[:WEG {dauer: 2, barrierefrei: 1}]->(O103),
  (O102)-[:WEG {dauer: 2, barrierefrei: 1}]->(O105),
  (O102)-[:WEG {dauer: 4, barrierefrei: 1}]->(O104),
  (O102)-[:WEG {dauer: 4, barrierefrei: 1}]->(O188),
  (O102)-[:WEG {dauer: 5, barrierefrei: 1}]->(O107),
  (O102)-[:WEG {dauer: 2, barrierefrei: 1}]->(O111),
  (O102)-[:WEG {dauer: 5, barrierefrei: 1}]->(O191),
  (O102)-[:WEG {dauer: 5, barrierefrei: 1}]->(O112),
  (O102)-[:WEG {dauer: 6, barrierefrei: 1}]->(O110),
  (O102)-[:WEG {dauer: 6, barrierefrei: 1}]->(O109),
  (O102)-[:WEG {dauer: 6, barrierefrei: 1}]->(O108),
  (O102)-[:WEG {dauer: 5, barrierefrei: 1}]->(O183) // Warten auf Aufzug
CREATE
  (O102)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O103),
  (O102)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O105),
  (O102)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O104),
  (O102)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O188),
  (O102)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O107),
  (O102)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O111),
  (O102)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O191),
  (O102)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O112),
  (O102)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O110),
  (O102)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O109),
  (O102)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O108),
  (O102)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O183) // Warten auf Aufzug

CREATE
  (O105)-[:WEG {dauer: 2, barrierefrei: 1}]->(O104),
  (O105)-[:WEG {dauer: 2, barrierefrei: 1}]->(O188),
  (O105)-[:WEG {dauer: 4, barrierefrei: 1}]->(O107),
  (O105)-[:WEG {dauer: 2, barrierefrei: 1}]->(O111),
  (O105)-[:WEG {dauer: 4, barrierefrei: 1}]->(O191),
  (O105)-[:WEG {dauer: 4, barrierefrei: 1}]->(O112),
  (O105)-[:WEG {dauer: 5, barrierefrei: 1}]->(O110),
  (O105)-[:WEG {dauer: 6, barrierefrei: 1}]->(O109),
  (O105)-[:WEG {dauer: 7, barrierefrei: 1}]->(O108),
  (O105)-[:WEG {dauer: 10, barrierefrei: 1}]->(O183) // Warten auf Aufzug
CREATE
  (O105)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O104),
  (O105)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O188),
  (O105)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O107),
  (O105)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O111),
  (O105)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O191),
  (O105)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O112),
  (O105)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O110),
  (O105)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O109),
  (O105)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O108),
  (O105)<-[:WEG {dauer: 10, barrierefrei: 1}]-(O183) // Warten auf Aufzug

CREATE
  (O104)-[:WEG {dauer: 1, barrierefrei: 1}]->(O188),
  (O104)-[:WEG {dauer: 3, barrierefrei: 1}]->(O107),
  (O104)-[:WEG {dauer: 3, barrierefrei: 1}]->(O111),
  (O104)-[:WEG {dauer: 3, barrierefrei: 1}]->(O191),
  (O104)-[:WEG {dauer: 3, barrierefrei: 1}]->(O112),
  (O104)-[:WEG {dauer: 4, barrierefrei: 1}]->(O110),
  (O104)-[:WEG {dauer: 5, barrierefrei: 1}]->(O109),
  (O104)-[:WEG {dauer: 7, barrierefrei: 1}]->(O108),
  (O104)-[:WEG {dauer: 12, barrierefrei: 1}]->(O183) // Warten auf Aufzug
CREATE
  (O104)<-[:WEG {dauer: 1, barrierefrei: 1}]-(O188),
  (O104)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O107),
  (O104)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O111),
  (O104)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O191),
  (O104)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O112),
  (O104)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O110),
  (O104)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O109),
  (O104)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O108),
  (O104)<-[:WEG {dauer: 12, barrierefrei: 1}]-(O183) // Warten auf Aufzug

CREATE
  (O188)-[:WEG {dauer: 3, barrierefrei: 1}]->(O107),
  (O188)-[:WEG {dauer: 3, barrierefrei: 1}]->(O111),
  (O188)-[:WEG {dauer: 3, barrierefrei: 1}]->(O191),
  (O188)-[:WEG {dauer: 3, barrierefrei: 1}]->(O112),
  (O188)-[:WEG {dauer: 4, barrierefrei: 1}]->(O110),
  (O188)-[:WEG {dauer: 5, barrierefrei: 1}]->(O109),
  (O188)-[:WEG {dauer: 7, barrierefrei: 1}]->(O108),
  (O188)-[:WEG {dauer: 12, barrierefrei: 1}]->(O183) // Warten auf Aufzug
CREATE
  (O188)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O107),
  (O188)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O111),
  (O188)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O191),
  (O188)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O112),
  (O188)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O110),
  (O188)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O109),
  (O188)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O108),
  (O188)<-[:WEG {dauer: 12, barrierefrei: 1}]-(O183) // Warten auf Aufzug

CREATE
  (O107)-[:WEG {dauer: 6, barrierefrei: 1}]->(O111),
  (O107)-[:WEG {dauer: 2, barrierefrei: 1}]->(O191),
  (O107)-[:WEG {dauer: 2, barrierefrei: 1}]->(O112),
  (O107)-[:WEG {dauer: 3, barrierefrei: 1}]->(O110),
  (O107)-[:WEG {dauer: 3, barrierefrei: 1}]->(O109),
  (O107)-[:WEG {dauer: 5, barrierefrei: 1}]->(O108),
  (O107)-[:WEG {dauer: 10, barrierefrei: 1}]->(O183) // Warten auf Aufzug
CREATE
  (O107)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O111),
  (O107)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O191),
  (O107)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O112),
  (O107)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O110),
  (O107)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O109),
  (O107)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O108),
  (O107)<-[:WEG {dauer: 10, barrierefrei: 1}]-(O183) // Warten auf Aufzug

CREATE
  (O108)-[:WEG {dauer: 7, barrierefrei: 1}]->(O111),
  (O108)-[:WEG {dauer: 5, barrierefrei: 1}]->(O191),
  (O108)-[:WEG {dauer: 5, barrierefrei: 1}]->(O112),
  (O108)-[:WEG {dauer: 3, barrierefrei: 1}]->(O110),
  (O108)-[:WEG {dauer: 4, barrierefrei: 1}]->(O109),
  (O108)-[:WEG {dauer: 7, barrierefrei: 1}]->(O183) // Warten auf Aufzug
CREATE
  (O108)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O111),
  (O108)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O191),
  (O108)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O112),
  (O108)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O110),
  (O108)<-[:WEG {dauer: 4, barrierefrei: 1}]-(O109),
  (O108)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O183) // Warten auf Aufzug

CREATE
  (O183)-[:WEG {dauer: 5, barrierefrei: 1}]->(O111),
  (O183)-[:WEG {dauer: 8, barrierefrei: 1}]->(O191),
  (O183)-[:WEG {dauer: 8, barrierefrei: 1}]->(O112),
  (O183)-[:WEG {dauer: 8, barrierefrei: 1}]->(O110),
  (O183)-[:WEG {dauer: 7, barrierefrei: 1}]->(O109)
CREATE
  (O183)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O111),
  (O183)<-[:WEG {dauer: 8, barrierefrei: 1}]-(O191),
  (O183)<-[:WEG {dauer: 8, barrierefrei: 1}]-(O112),
  (O183)<-[:WEG {dauer: 8, barrierefrei: 1}]-(O110),
  (O183)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O109)

CREATE
  (O109)-[:WEG {dauer: 7, barrierefrei: 1}]->(O111),
  (O109)-[:WEG {dauer: 3, barrierefrei: 1}]->(O191),
  (O109)-[:WEG {dauer: 3, barrierefrei: 1}]->(O112),
  (O109)-[:WEG {dauer: 2, barrierefrei: 1}]->(O110)
CREATE
  (O109)<-[:WEG {dauer: 7, barrierefrei: 1}]-(O111),
  (O109)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O191),
  (O109)<-[:WEG {dauer: 3, barrierefrei: 1}]-(O112),
  (O109)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O110)

CREATE
  (O110)-[:WEG {dauer: 6, barrierefrei: 1}]->(O111),
  (O110)-[:WEG {dauer: 2, barrierefrei: 1}]->(O191),
  (O110)-[:WEG {dauer: 2, barrierefrei: 1}]->(O112)
CREATE
  (O110)<-[:WEG {dauer: 6, barrierefrei: 1}]-(O111),
  (O110)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O191),
  (O110)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O112)

CREATE
  (O191)-[:WEG {dauer: 5, barrierefrei: 1}]->(O111),
  (O191)-[:WEG {dauer: 2, barrierefrei: 1}]->(O112)
CREATE
  (O191)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O111),
  (O191)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O112)

CREATE
  (O111)-[:WEG {dauer: 5, barrierefrei: 1}]->(O112)
CREATE
  (O111)<-[:WEG {dauer: 5, barrierefrei: 1}]-(O112)


////////////////////////////////////////////////////////
//// RUNDGANG ENDE
////////////////////////////////////////////////////////

CREATE
  (O188)-[:WEG {dauer: 1, barrierefrei: 1}]->(O106),
  (O188)-[:WEG {dauer: 2, barrierefrei: 1}]->(O187),
  (O188)<-[:WEG {dauer: 1, barrierefrei: 1}]-(O106),
  (O188)<-[:WEG {dauer: 2, barrierefrei: 1}]-(O187)


////////////////////////////////////////////////////////
//// TREPPEN / AUFZUG
////////////////////////////////////////////////////////
CREATE
  (O087)-[:WEG {dauer: 10, barrierefrei: 0}]->(O187),
  (O087)<-[:WEG {dauer: 8, barrierefrei: 0}]-(O187),
  (O085)-[:WEG {dauer: 10, barrierefrei: 0}]->(O185),
  (O085)<-[:WEG {dauer: 8, barrierefrei: 0}]-(O185),
  (O083)-[:WEG {dauer: 15, barrierefrei: 1}]->(O183),
  (O083)<-[:WEG {dauer: 15, barrierefrei: 1}]-(O183)

/*
Bei einem IT-Dienstleister wird durch MongoDB gespeichert, welche Kunden welche
Aufträge beauftragt haben. Die Collections kunde und auftrag enthalten zahlreiche
Dokumente der folgenden Form. Die Kosten eines Auftrags werden hybrid sowohl im
Auftrag, als auch eingebettet beim Kunden redundant gespeichert.
 */
db.createCollection("auftrag")
db.createCollection("kunde")
m1 = {
    "auftragsnummer": 1234,
    "kosten": 5000,
    "beschreibung": "Entwicklung Onlineshop",
    "jahr": 2019
}
m2 = {
    "auftragsnummer": 1217,
    "kosten": 300,
    "beschreibung": "Installation Server",
    "jahr": 2020
}
db.auftrag.insertOne(m1)
db.auftrag.insertOne(m2)
k1 = {
    "name": "Schmidt",
    "adresse": "Bodanstrasse 10 78462 Konstanz",
    "auftraege":
        [{
            "kosten": 5000,
            "details": new DBRef("auftrag", db.auftrag.findOne(m1)._id)
        },
            {
                "kosten": 300,
                "details": new DBRef("auftrag", db.auftrag.findOne(m2)._id)
            }]
}
db.kunde.insertOne(k1)

// a) Wie viele Kosten haben die einzelnen Kunden insgesamt beauftragt?
db.kunde.aggregate([
    {$unwind: "$auftraege"},
    {$group: {_id: "$name", gesamtkosten: {$sum: "$auftraege.kosten"}}},
])
// b) Welcher Kunde hat den Auftrag mit Auftragsnummer 1217 beauftragt?
db.kunde.find({
    "auftraege.details": new DBRef("auftrag", db.auftrag.findOne({"auftragsnummer": 1217})._id)
})
// c) In welchem Jahr hat die Firma an Entwicklung von Onlineshops am meisten Geld eingenommen?
db.auftrag.aggregate([
    {$project: {"_id": 0, "jahr": 1, /*"beschreibung": 1, "kosten": 1*/}},
    {$sort: {"kosten": -1}},
])
// d) An welchen Arbeiten hat die Firma im Jahr 2019 wie viel Geld eingenommen? Die
// Arbeiten sind in „beschreibung“ gespeichert. Lösen Sie diese Aufgabe durch eine
// Map Reduce-Query. Die Ausgabe soll beispielhaft wie folgt aussehen:
//      Entwicklung Onlineshop 61000
//      Installation Server 40000
db.auftrag.aggregate([
    {$match: {jahr: 2019}},
    {$group: {_id: "$beschreibung", gesamtumsatz: {$sum: "$kosten"}}},
])

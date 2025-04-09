db.abt.insertMany([{"anr": "K51", "name": "Entwicklung", "ort": "Erlangen"},
    {"anr": "K53", "name": "Buchhaltung", "ort": "Nürnberg"},
    {"anr": "K54", "name": "Hochschule", "ort": "Konstanz"},
    {"anr": "K55", "name": "Personal", "ort": "Nürnberg"}])
db.pers.insertOne({
    "pnr": 123, "name": "Mueller", "jahrg": 1980,
    "eindat": new Date("2000-09-01"), "gehalt": 88000, "beruf": "Kaufmann",
    "abteilung": new DBRef("abt", db.abt.findOne({"name": "Entwicklung"})._id)
})
db.pers.insertOne({
    "pnr": 406, "name": "Coy", "jahrg": 1972,
    "eindat": new Date("2006-09-01"), "gehalt": 100000, "beruf": "Programmierer",
    "vorgesetzter": new DBRef("pers", db.pers.findOne({"name": "Mueller"})._id),
    "abteilung": new DBRef("abt", db.abt.findOne({"name": "Personal"})._id)
})
db.pers.insertOne({
    "pnr": 829, "name": "Schmidt", "jahrg": 1982,
    "eindat": new Date("2010-06-01"), "gehalt": 94000, "beruf": "Kaufmann",
    "vorgesetzter": new DBRef("pers", db.pers.findOne({"name": "Mueller"})._id),
    "abteilung": new DBRef("abt", db.abt.findOne({"name": "Buchhaltung"})._id)
})
db.pers.insertOne({
    "pnr": 874, "name": "Abel",
    "eindat": new Date("2014-05-01"), "gehalt": 82000, "beruf": "Softw.Entwickler",
    "vorgesetzter": new DBRef("pers", db.pers.findOne({"name": "Schmidt"})._id),
    "abteilung": new DBRef("abt", db.abt.findOne({"name": "Personal"})._id)
})
db.pers.insertOne({
    "pnr": 503, "name": "Junghans", "jahrg": 1997,
    "gehalt": 80000, "beruf": "Programmierer",
    "vorgesetzter": new DBRef("pers", db.pers.findOne({"name": "Mueller"})._id),
    "abteilung": new DBRef("abt", db.abt.findOne({"name": "Entwicklung"})._id)
})
/////////////////

// a
// Welche Abteilungen haben keine Mitarbeiter?
db.abt.aggregate([
    {
        $lookup: {
            from: "pers",
            localField: "_id",
            foreignField: "abteilung.$id",
            as: "personal"
        }
    },
    {
        $unwind: {
            path: "$personal",
            preserveNullAndEmptyArrays: true
        },
    },
    {
        $match: {
            "personal": null
        }
    }
])

// b
// Wer hat einen Chef der jünger ist als er selbst? Vergleichen Sie die Anfrage mit
// einem äquivalenten SQL-Befehl.
db.pers.aggregate([
    {
        $project: {
            "_id": 0,
            "name": 1,
            "jahrg": 1,
            "vorgesetzter": 1
        }
    },
    {
        $lookup: {
            from: "pers",
            localField: "vorgesetzter.$id",
            foreignField: "_id",
            as: "vorgesetzter"
        }
    },
    {
        $unwind: "$vorgesetzter"
    },
    {
        $project: {
            "_id": 0,
            "name": 1,
            "jahrg": 1,
            "vorgesetzter-name": "$vorgesetzter.name",
            "vorgesetzter-jahrg": "$vorgesetzter.jahrg",
        }
    },
    {
        $match: {
            $and: [
                {"vorgesetzter-jahrg": {$ne: null}},
                {"jahrg": {$ne: null}},
                {
                    $expr: {
                        $gt: [
                            "$vorgesetzter-jahrg",
                            "$jahrg",
                        ]
                    }
                }
            ]
        }
    }
])

// c
// Welche Abteilung hat durchschnittlich die jüngsten Mitarbeiter? Es sollen nur die
// Abteilungsnummer und der Abteilungsname ausgegeben werden.

db.abt.aggregate([
    {
        $lookup: {
            from: "pers",
            localField: "_id",
            foreignField: "abteilung.$id",
            as: "mitarbeiter"
        }
    },
    {
        $unwind: {
            path: "$mitarbeiter",
            preserveNullAndEmptyArrays: true
        }
    },
    {
        $group: {
            _id: "$_id",
            "name": {"$first": "$name"},
            "durchschnitt": {"$avg": "$mitarbeiter.jahrg"}
        }
    },
    {
        $sort: {"durchschnitt": -1}
    },
    {$limit: 1},
    {
        $project: {
            "_id": 0,
            "abteilungsnummer": "$_id",
            "abteilungsname": "$name",
            //"durchschnitt": 1
        }
    }
])

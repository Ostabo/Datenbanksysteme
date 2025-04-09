// a
// Welche Studiengänge haben einen Bachelor als Abschluss? Es sollen nur die
// Studiengangskürzel ausgegeben werden.
db.studiengaenge.aggregate([
    {"$match": {"type": "Bachelor"}},
    {"$project": {"_id": 0, "id": 1}},
])

// b
// Ermitteln Sie, welche AIN-Vorlesungen weniger als 5 SWS besitzen. Es sollen nur
// die Vorlesungsnamen alphabetisch sortiert ausgegeben werden.
db.vorlesung.aggregate([
    {
        "$match":
            {
                "$and": [
                    {"sws": {"$lt": 5}},
                    {
                        "studiengang.$id": db.studiengaenge.findOne({
                            "id": "AIN"
                        })._id
                    }
                ]
            }
    },
    {"$project": {"_id": 0, "name": 1, "sws": 1, "studiengang.$id": 1}},
    {"$sort": {"name": 1}}
])

// c
// Bei welchen Vorlesungen ist SWS größer als ECTS?
db.vorlesung.aggregate([
    {
        "$match":
            {
                "$expr":
                    {"$gt": ["$sws", "$ects"]}
            }
    },
    {"$project": {"_id": 0, "name": 1, "sws": 1, "ects": 1}},
])

// d
// Wie viele AIN-Vorlesungen halten die einzelnen Professoren? Es soll nur der
// Professorname und die SWS-Summe ausgegeben werden.
db.vorlesung.aggregate(
    [
        {
            $group: {
                "_id": "$dozent",
                //"anzahl" : {"$sum" : 1},
                "sws-summe": {"$sum": "$sws"},
            }
        }
    ]
)

// e
// Welcher Professor hält am meisten SWS in AIN-Vorlesungen?

// Einfache Aggregation + Sort
db.vorlesung.aggregate(
    [
        {
            "$match":
                {
                    "studiengang.$id": db.studiengaenge.findOne({
                        "id": "AIN"
                    })._id
                }
        },
        {
            "$group": {
                "_id": "$dozent",
                "sws-summe": {"$sum": "$sws"}
            }
        },
        {
            "$sort": {"sws-summe": -1}
        },
        {
            "$limit": 1
        }
    ]
)
// Schwere Aggregation (enthält ALLE Dozenten mit max. SWS)
db.vorlesung.aggregate([
    {
        $match: {
            "studiengang.$id": db.studiengaenge.findOne({
                "id": "AIN"
            })._id
        }
    },
    {
        $group: {
            _id: "$dozent",
            swsSumme: {$sum: "$sws"}
        }
    },
    {
        $group: {
            _id: null,
            maxSws: {$max: "$swsSumme"},
            all: {$push: {dozent: "$_id", sws: "$swsSumme"}}
        }
    },
    {
        $project: {
            _id: 0,
            dozentenMitMaxSws: {
                $filter: {
                    input: "$all",
                    as: "entry",
                    cond: {$eq: ["$$entry.sws", "$maxSws"]}
                }
            }
        }
    },
    {$unwind: "$dozentenMitMaxSws"},
    {
        $replaceRoot: {newRoot: "$dozentenMitMaxSws"}
    }
])

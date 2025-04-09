db.studiengaenge.drop();
db.vorlesung.drop();

db.createCollection("studiengaenge", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: [ "id", "name", "type" ],
            properties: {
                id: {
                    bsonType: "string",
                    minLength: 3,
                    maxLength: 3,
                    description: "must be a string and is required"
                },
                name: {
                    bsonType: "string",
                    description: "must be a string and is required"
                },
                type: {
                    enum: [ "Bachelor", "Master", "PhD" ],
                    description: "required and must be one of the enum values",
                },
            }
        }
    }
});

db.createCollection("vorlesung", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: [ "name", "dozent", "semester", "studiengang", "sws", "ects" ],
            properties: {
                name: {
                    bsonType: "string",
                    description: "must be a string and is required"
                },
                dozent: {
                    bsonType: "string",
                    description: "must be a string and is required"
                },
                semester: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                studiengang: {
                    bsonType: "object",
                },
                sws: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                ects: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
            }
        }
    }
});

const studiengaenge = [
    {
        id: "AIN",
        name: "Angewandte Informatik",
        type: "Bachelor"
    },
    {
        id: "WIN",
        name: "Wirtschaftsinformatik",
        type: "Bachelor"
    },
    {
        id: "GIB",
        name: "Gesunheitsinformatik",
        type: "Bachelor"
    },
    {
        id: "MSI",
        name: "Master Software Engineering",
        type: "Master"
    }
]
db.studiengaenge.insertMany(studiengaenge)

const ain = db.studiengaenge.findOne({ id: "AIN" });
const win = db.studiengaenge.findOne({ id: "WIN" });
const gib = db.studiengaenge.findOne({ id: "GIB" });
const richtungen = [ain, win, gib];
const vorlesungen = richtungen.flatMap(r => [
    {
        name: "Datenbanken",
        dozent: "Prof. Dr. Eck",
        semester: 2,
        studiengang: new DBRef("studiengaenge", r._id),
        sws: 4,
        ects: 4
    },
    {
        name: "Datenbanken II",
        dozent: "Prof. Dr. Eck",
        semester: 4,
        studiengang: new DBRef("studiengaenge", r._id),
        sws: 4,
        ects: 5
    },
    {
        name: "Betriebswirtschaftslehre",
        dozent: "Prof. Dr. Müller",
        semester: 3,
        studiengang: new DBRef("studiengaenge", r._id),
        sws: 2,
        ects: 2
    },
    {
        name: "Mathematik I",
        dozent: "Prof. Dr. Schmidt",
        semester: 1,
        studiengang: new DBRef("studiengaenge", r._id),
        sws: 4,
        ects: 5
    },
    {
        name: "Mathematik II",
        dozent: "Prof. Dr. Schmidt",
        semester: 2,
        studiengang: new DBRef("studiengaenge", r._id),
        sws: 4,
        ects: 5
    },
    {
        name: "Programmierung I",
        dozent: "Prof. Dr. Meyer",
        semester: 1,
        studiengang: new DBRef("studiengaenge", r._id),
        sws: 3,
        ects: 6
    },
    {
        name: "Programmierung II",
        dozent: "Prof. Dr. Meyer",
        semester: 2,
        studiengang: new DBRef("studiengaenge", r._id),
        sws: 3,
        ects: 6
    }
]);
db.vorlesung.insertMany(vorlesungen)


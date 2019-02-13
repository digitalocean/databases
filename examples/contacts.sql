-- Table Definition
CREATE SEQUENCE IF NOT EXISTS contacts_id_seq;
CREATE TABLE "contacts" (
    "id" int4 NOT NULL DEFAULT nextval('contacts_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "phone" varchar(255) NOT NULL,
    "address" varchar(255) NOT NULL,
    "favorites" jsonb NOT NULL DEFAULT '{}'::jsonb,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

-- Fake contact data
INSERT INTO "contacts" ("name", "phone", "address", "favorites", "created_at", "updated_at") VALUES ('Mrs. Hettie Bergstrom I', '+5009890369775', '52434 Arturo Trace Suite 414
West Thea, NV 96425-7487', '{"colors": ["Chartreuse", "PeachPuff", "DeepPink"]}', '2018-11-12 19:40:41', '2018-11-12 19:40:41'),
('Mrs. Catherine Emard II', '+1002168309791', '74477 Mohamed Divide
Meredithchester, NC 26546-4810', '{"colors": ["Tan", "DarkCyan", "ForestGreen"]}', '2018-11-12 19:40:42', '2018-11-12 19:40:42'),
('Lupe Gulgowski PhD', '+7434139825742', '73361 Mante View Suite 646
Lake Mireilleville, TN 64034', '{"colors": ["LightCoral", "Aqua", "PaleVioletRed"]}', '2018-11-12 19:40:42', '2018-11-12 19:40:42'),
('Deon Klocko', '+4555245458004', '80105 Torphy Fields Apt. 615
Klockoshire, NV 51628-2316', '{"colors": ["PaleGreen", "WhiteSmoke", "DarkGray"]}', '2018-11-12 19:40:42', '2018-11-12 19:40:42'),
('Dr. Harley Barrows III', '+9227847297432', '977 Clifford Meadow Suite 799
Christianabury, KS 94699-6827', '{"colors": ["Teal", "Yellow", "Tomato"]}', '2018-11-12 19:40:42', '2018-11-12 19:40:42'),
('Dr. Reid Jones II', '+2415291490689', '435 Lemke Trail
Mistyview, VT 57063-9013', '{"colors": ["Darkorange", "Blue", "Wheat"]}', '2018-11-12 19:40:43', '2018-11-12 19:40:43'),
('Daniela Rodriguez', '+8121358988599', '84195 Ward Coves Apt. 636
Matteoside, WI 81403-0803', '{"colors": ["MediumTurquoise", "LightGoldenRodYellow", "AntiqueWhite"]}', '2018-11-12 19:40:43', '2018-11-12 19:40:43'),
('Dr. Rhea Bernhard', '+9376880669838', '7423 Porter Gateway
Croninbury, ME 53238', '{"colors": ["DarkSlateGray", "BlanchedAlmond", "DarkGreen"]}', '2018-11-12 19:40:44', '2018-11-12 19:40:44'),
('Mr. Chance Wilkinson I', '+1860087624014', '731 Alfonzo Pass Suite 199
Lake Gabe, FL 26770', '{"colors": ["Cornsilk", "SaddleBrown", "Blue"]}', '2018-11-12 19:40:44', '2018-11-12 19:40:44'),
('Janelle Hickle I', '+3726168597315', '6595 Craig Keys Suite 695
Moshefurt, OR 11056', '{"colors": ["MistyRose", "MediumOrchid", "DarkCyan"]}', '2018-11-12 19:40:44', '2018-11-12 19:40:44');

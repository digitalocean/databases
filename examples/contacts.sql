--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner:
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    favorites jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner:
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner:
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner:
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner:
--

COPY public.contacts (id, name, phone, address, favorites, created_at, updated_at) FROM stdin;
2	Mrs. Catherine Emard II	+1002168309791	74477 Mohamed Divide\nMeredithchester, NC 26546-4810	{"colors": ["Tan", "DarkCyan", "ForestGreen"]}	2018-11-12 19:40:42	2018-11-12 19:40:42
3	Lupe Gulgowski PhD	+7434139825742	73361 Mante View Suite 646\nLake Mireilleville, TN 64034	{"colors": ["LightCoral", "Aqua", "PaleVioletRed"]}	2018-11-12 19:40:42	2018-11-12 19:40:42
4	Deon Klocko	+4555245458004	80105 Torphy Fields Apt. 615\nKlockoshire, NV 51628-2316	{"colors": ["PaleGreen", "WhiteSmoke", "DarkGray"]}	2018-11-12 19:40:42	2018-11-12 19:40:42
5	Dr. Harley Barrows III	+9227847297432	977 Clifford Meadow Suite 799\nChristianabury, KS 94699-6827	{"colors": ["Teal", "Yellow", "Tomato"]}	2018-11-12 19:40:42	2018-11-12 19:40:42
6	Dr. Reid Jones II	+2415291490689	435 Lemke Trail\nMistyview, VT 57063-9013	{"colors": ["Darkorange", "Blue", "Wheat"]}	2018-11-12 19:40:43	2018-11-12 19:40:43
7	Daniela Rodriguez	+8121358988599	84195 Ward Coves Apt. 636\nMatteoside, WI 81403-0803	{"colors": ["MediumTurquoise", "LightGoldenRodYellow", "AntiqueWhite"]}	2018-11-12 19:40:43	2018-11-12 19:40:43
8	Dr. Rhea Bernhard	+9376880669838	7423 Porter Gateway\nCroninbury, ME 53238	{"colors": ["DarkSlateGray", "BlanchedAlmond", "DarkGreen"]}	2018-11-12 19:40:44	2018-11-12 19:40:44
9	Mr. Chance Wilkinson I	+1860087624014	731 Alfonzo Pass Suite 199\nLake Gabe, FL 26770	{"colors": ["Cornsilk", "SaddleBrown", "Blue"]}	2018-11-12 19:40:44	2018-11-12 19:40:44
10	Janelle Hickle I	+3726168597315	6595 Craig Keys Suite 695\nMoshefurt, OR 11056	{"colors": ["MistyRose", "MediumOrchid", "DarkCyan"]}	2018-11-12 19:40:44	2018-11-12 19:40:44
1	Mrs. Hettie Bergstrom I	+5009890369775	52434 Arturo Trace Suite 414\nWest Thea, NV 96425-7487	{"colors": ["Chartreuse", "PeachPuff", "DeepPink"]}	2018-11-12 19:40:41	2018-11-12 19:40:41
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner:
--

SELECT pg_catalog.setval('public.contacts_id_seq', 10, true);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner:
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


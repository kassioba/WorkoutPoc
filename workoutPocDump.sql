--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: exercises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercises (
    id integer NOT NULL,
    name text NOT NULL,
    sets integer NOT NULL,
    reps integer NOT NULL,
    rest integer NOT NULL,
    identification text NOT NULL
);


ALTER TABLE public.exercises OWNER TO postgres;

--
-- Name: exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercises_id_seq OWNER TO postgres;

--
-- Name: exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercises_id_seq OWNED BY public.exercises.id;


--
-- Name: muscleGroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."muscleGroup" (
    id integer NOT NULL,
    "muscleGroup" text NOT NULL,
    "exercisesIdentification" text NOT NULL
);


ALTER TABLE public."muscleGroup" OWNER TO postgres;

--
-- Name: muscleGroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."muscleGroup_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."muscleGroup_id_seq" OWNER TO postgres;

--
-- Name: muscleGroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."muscleGroup_id_seq" OWNED BY public."muscleGroup".id;


--
-- Name: workouts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workouts (
    id integer NOT NULL,
    "muscleGroup" text NOT NULL,
    exercises character varying[] NOT NULL
);


ALTER TABLE public.workouts OWNER TO postgres;

--
-- Name: workouts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.workouts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workouts_id_seq OWNER TO postgres;

--
-- Name: workouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.workouts_id_seq OWNED BY public.workouts.id;


--
-- Name: exercises id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises ALTER COLUMN id SET DEFAULT nextval('public.exercises_id_seq'::regclass);


--
-- Name: muscleGroup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."muscleGroup" ALTER COLUMN id SET DEFAULT nextval('public."muscleGroup_id_seq"'::regclass);


--
-- Name: workouts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workouts ALTER COLUMN id SET DEFAULT nextval('public.workouts_id_seq'::regclass);


--
-- Data for Name: exercises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercises (id, name, sets, reps, rest, identification) FROM stdin;
1	Rosca Direta	4	10	60	12d32787-2a4d-4438-baeb-878addbd5ab7
2	Rosca Spider	4	10	60	12d32787-2a4d-4438-baeb-878addbd5ab7
3	Supino Reto	3	10	90	c5f0310e-1da3-4e3d-ac84-da9e6d1dd3f7
4	Supino Inclinado	3	10	90	c5f0310e-1da3-4e3d-ac84-da9e6d1dd3f7
5	Supino Declinado	3	10	90	6f1e1c41-2b89-4129-8d41-f9422f491198
6	Crucifixo Máquina	3	10	90	6f1e1c41-2b89-4129-8d41-f9422f491198
7	Marinheiro	10	15	90	87e2de15-d4be-45bb-864a-3f236d424a0d
8	Puxada Alta	3	10	90	b6924395-dfc3-4897-b9d6-d2edef67bfb5
9	Remada Curvada	3	10	90	b6924395-dfc3-4897-b9d6-d2edef67bfb5
10	Pulldown	3	10	90	b6924395-dfc3-4897-b9d6-d2edef67bfb5
11	Tríceps Corda Polia	3	10	90	b1655e45-4643-4097-b110-2ea5df8d396e
12	Paralela	3	10	90	b1655e45-4643-4097-b110-2ea5df8d396e
13	Tríceps Barra Polia	3	10	90	2d6c0cfe-0d1b-4780-ac12-b3ee34ba7202
14	Tríceps Fracês Unilateral	3	10	90	2d6c0cfe-0d1b-4780-ac12-b3ee34ba7202
\.


--
-- Data for Name: muscleGroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."muscleGroup" (id, "muscleGroup", "exercisesIdentification") FROM stdin;
5	Bíceps	12d32787-2a4d-4438-baeb-878addbd5ab7
6	Peito	c5f0310e-1da3-4e3d-ac84-da9e6d1dd3f7
7	Peito	6f1e1c41-2b89-4129-8d41-f9422f491198
8	Peito	87e2de15-d4be-45bb-864a-3f236d424a0d
9	Costas	b6924395-dfc3-4897-b9d6-d2edef67bfb5
10	Tríceps	b1655e45-4643-4097-b110-2ea5df8d396e
11	Tríceps	2d6c0cfe-0d1b-4780-ac12-b3ee34ba7202
\.


--
-- Data for Name: workouts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workouts (id, "muscleGroup", exercises) FROM stdin;
\.


--
-- Name: exercises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercises_id_seq', 14, true);


--
-- Name: muscleGroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."muscleGroup_id_seq"', 11, true);


--
-- Name: workouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.workouts_id_seq', 1, false);


--
-- Name: exercises exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);


--
-- Name: muscleGroup muscleGroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."muscleGroup"
    ADD CONSTRAINT "muscleGroup_pkey" PRIMARY KEY (id);


--
-- Name: workouts workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


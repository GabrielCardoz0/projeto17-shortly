--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "userId" integer NOT NULL,
    acesses integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password character varying(100) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tokens VALUES (7, 'bc986018-749a-4f52-a2b9-6c5c5d1c826d', 7, '2022-12-22 11:28:58.73814');
INSERT INTO public.tokens VALUES (8, '5267319e-452a-4eb6-8fcf-1ca70b0a314b', 6, '2022-12-22 11:30:15.142134');
INSERT INTO public.tokens VALUES (9, 'c3d45cf7-857b-4752-b25a-b1c6ec558d56', 6, '2022-12-22 11:31:36.037963');
INSERT INTO public.tokens VALUES (10, '746aba7c-5e07-42b2-a72b-a2c61dfa1797', 5, '2022-12-22 11:32:27.084183');
INSERT INTO public.tokens VALUES (11, '3c8906ec-b5c5-41e0-88fa-bd523512ce37', 8, '2022-12-22 11:39:21.77034');
INSERT INTO public.tokens VALUES (12, 'b2fe5bcc-d910-4d87-baa7-89b332df9199', 5, '2022-12-22 11:46:00.944812');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (10, 'https://amazon.com', 'INn_4kGg', 5, 2, '2022-12-22 11:32:42.732428');
INSERT INTO public.urls VALUES (11, 'https://facebook.com', 'mkjp9_4K', 5, 0, '2022-12-22 11:33:54.1744');
INSERT INTO public.urls VALUES (12, 'https://facebook.com', '1fBm7S2o', 8, 8, '2022-12-22 11:40:03.020883');
INSERT INTO public.urls VALUES (7, 'https://google.com', 'DG705VxH', 7, 4, '2022-12-22 11:29:28.523138');
INSERT INTO public.urls VALUES (8, 'https://youtube.com', '03o5C-BO', 7, 3, '2022-12-22 11:30:40.125722');
INSERT INTO public.urls VALUES (9, 'https://youtube.com', 'smzcmsis', 6, 2, '2022-12-22 11:31:54.200962');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (5, 'gabriel1', 'gabriel1@email.com', '$2b$10$IQrj8zR1MntYJVSGCiH26.UNt9gSaUc9XQWLcrKoSKbBaima.FDpu', '2022-12-22 11:28:09.730369');
INSERT INTO public.users VALUES (6, 'gabriel2', 'gabriel2@email.com', '$2b$10$kj151ySPesKTl206QuRHX.g1ESzxTUm55YxKV6YyTCz60gqENBi0O', '2022-12-22 11:28:25.91357');
INSERT INTO public.users VALUES (7, 'gabriel3', 'gabriel3@email.com', '$2b$10$TFmeFvAgog39IQHDz333Xu4/QeGYHKkj64euH/BKM5dLPiHIAOTpi', '2022-12-22 11:28:31.979529');
INSERT INTO public.users VALUES (8, 'gabriel4', 'gabriel4@email.com', '$2b$10$W6PA57HbzylIG/WIco2UI.OH1OqU6ge/8te3XXb7WWDToyW.ERAD.', '2022-12-22 11:39:06.938243');


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tokens_id_seq', 12, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: tokens tokens_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pk PRIMARY KEY (id);


--
-- Name: tokens tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_token_key UNIQUE (token);


--
-- Name: urls urls_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pk PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


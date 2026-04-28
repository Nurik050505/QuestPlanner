x--
-- PostgreSQL database dump
--

\restrict zWdK2IWTPwNxhpEHKnGQawtGaRqNGtYKJGRCoBC5xQ9e2xy8Oe05jVRswprM5BC

-- Dumped from database version 15.17 (Debian 15.17-1.pgdg13+1)
-- Dumped by pg_dump version 15.17 (Debian 15.17-1.pgdg13+1)

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
-- Name: users; Type: TABLE; Schema: public; Owner: quest_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password_hash character varying(255),
    level integer DEFAULT 1,
    xp integer DEFAULT 0,
    coins integer DEFAULT 0,
    streak integer DEFAULT 0,
    avatar_url text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO quest_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: quest_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO quest_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: quest_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: quest_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: quest_user
--

COPY public.users (id, username, email, password_hash, level, xp, coins, streak, avatar_url, created_at) FROM stdin;
1	Nurislam	nurislam@example.com	demo_hash_1	5	420	150	7	lion	2026-04-28 16:22:26.679431
2	Aza	aza@example.com	demo_hash_2	3	250	80	4	wolf	2026-04-28 16:22:26.679431
3	Kuanysh	kuanysh@example.com	demo_hash_3	2	120	40	2	eagle	2026-04-28 16:22:26.679431
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: quest_user
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: quest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: quest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict zWdK2IWTPwNxhpEHKnGQawtGaRqNGtYKJGRCoBC5xQ9e2xy8Oe05jVRswprM5BC


--
-- PostgreSQL database dump
--

\restrict uOpmq05IF7Hvbr86YOvzW3c7dlWmSV8bKXMFQcQwNscUn4WULraF1LedyP4eBtE

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2026-10-23 21:15:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 219 (class 1259 OID 17251)
-- Name: angels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.angels (
    angel_id integer NOT NULL,
    firstname character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    date_of_birth date,
    nationality character varying(50),
    height_cm integer,
    active_from_year integer,
    active_to_year integer,
    status character varying(10) NOT NULL,
    hair_color character varying(30),
    eye_color character varying(30),
    agency character varying(100),
    CONSTRAINT angels_status_check CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying])::text[])))
);


ALTER TABLE public.angels OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17277)
-- Name: angelshows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.angelshows (
    angel_id integer NOT NULL,
    show_id integer NOT NULL
);


ALTER TABLE public.angelshows OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17268)
-- Name: performers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.performers (
    performer_id integer NOT NULL,
    performer_name character varying(100) NOT NULL,
    performer_fullname character varying(150),
    music_genre character varying(50),
    gender character varying(20)
);


ALTER TABLE public.performers OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17294)
-- Name: showperformers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.showperformers (
    show_id integer NOT NULL,
    performer_id integer NOT NULL
);


ALTER TABLE public.showperformers OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17261)
-- Name: shows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shows (
    show_id integer NOT NULL,
    year integer NOT NULL,
    show_date date,
    city character varying(50),
    venue character varying(100)
);


ALTER TABLE public.shows OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 17251)
-- Dependencies: 219
-- Data for Name: angels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.angels (angel_id, firstname, surname, date_of_birth, nationality, height_cm, active_from_year, active_to_year, status, hair_color, eye_color, agency) FROM stdin;
1	Adriana	Lima	1981-06-12	Brazilian	178	2000	2018	inactive	Brown	Blue/Green	Elite Model Management
2	Alessandra	Ambrosio	1981-04-11	Brazilian	177	2004	2017	inactive	Brown	Brown	Priscilla's Model Management
3	Behati	Prinsloo	1988-05-16	Namibian	180	2009	2021	inactive	Light Brown	Hazel	Storm Model Management
4	Candice	Swanepoel	1988-10-20	South African	177	2010	2021	inactive	Blonde	Blue	The Lions
5	Lily	Aldridge	1985-11-15	American	175	2010	2018	inactive	Brown	Brown	IMG Models
6	Doutzen	Kroes	1985-01-23	Dutch	178	2008	2014	inactive	Blonde	Blue	DNA Models
7	Elsa	Hosk	1988-11-07	Swedish	177	2015	2021	inactive	Blonde	Blue	IMG Models
8	Jasmine	Tookes	1991-02-01	American	175	2015	2021	inactive	Brown	Brown	IMG Models
9	Taylor	Hill	1996-03-05	American	176	2015	2021	inactive	Brown	Green	IMG Models
10	Sara	Sampaio	1991-07-21	Portuguese	173	2015	2021	inactive	Brown	Green	\t\nThe Lions
\.


--
-- TOC entry 4991 (class 0 OID 17277)
-- Dependencies: 222
-- Data for Name: angelshows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.angelshows (angel_id, show_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
1	2
2	2
3	2
4	2
5	2
7	2
8	2
9	2
10	2
1	3
3	3
4	3
7	3
8	3
9	3
10	3
\.


--
-- TOC entry 4990 (class 0 OID 17268)
-- Dependencies: 221
-- Data for Name: performers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.performers (performer_id, performer_name, performer_fullname, music_genre, gender) FROM stdin;
1	Taylor Swift	Taylor Alison Swift	Pop	female
2	Ed Sheeran	Edward Christopher Sheeran	Pop	male
3	Ariana Grande	Ariana Grande-Butera	Pop	female
4	Hozier	Andrew John Hozier-Byrne	Soul/Rock	male
5	Selena Gomez	Selena Marie Gomez	Pop	female
6	Ellie Goulding	Elena Jane Goulding	Pop	female
7	The Weeknd	Abel Makkonen Tesfaye	R&B	male
8	Shawn Mendes	Shawn Peter Raul Mendes	Pop	male
9	Rita Ora	Rita Sahatçiu Ora	Pop	female
10	The Chainsmokers	Andrew Taggart and Alex Pall	EDM/Pop	group
11	Bebe Rexha	Bleta Rexha	Pop	female
12	Halsey	Ashley Nicolette Frangipane	Pop	female
13	Leela James	Leela James	R&B/Soul	female
14	Kelsea Ballerini	Kelsea Nicole Ballerini	Country/Pop	female
15	The Struts	The Struts	Rock	group
\.


--
-- TOC entry 4992 (class 0 OID 17294)
-- Dependencies: 223
-- Data for Name: showperformers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.showperformers (show_id, performer_id) FROM stdin;
1	1
1	2
1	3
1	4
2	5
2	6
2	7
3	8
3	9
3	10
3	11
3	12
3	13
3	14
3	15
\.


--
-- TOC entry 4989 (class 0 OID 17261)
-- Dependencies: 220
-- Data for Name: shows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shows (show_id, year, show_date, city, venue) FROM stdin;
1	2014	2014-12-02	London	Earls Court
2	2015	2015-11-10	New York	Lexington Avenue Armory
3	2018	2018-11-08	New York	Pier 94
\.


--
-- TOC entry 4826 (class 2606 OID 17260)
-- Name: angels angels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.angels
    ADD CONSTRAINT angels_pkey PRIMARY KEY (angel_id);


--
-- TOC entry 4834 (class 2606 OID 17283)
-- Name: angelshows angelshows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.angelshows
    ADD CONSTRAINT angelshows_pkey PRIMARY KEY (angel_id, show_id);


--
-- TOC entry 4830 (class 2606 OID 17276)
-- Name: performers performers_performer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performers
    ADD CONSTRAINT performers_performer_name_key UNIQUE (performer_name);


--
-- TOC entry 4832 (class 2606 OID 17274)
-- Name: performers performers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.performers
    ADD CONSTRAINT performers_pkey PRIMARY KEY (performer_id);


--
-- TOC entry 4836 (class 2606 OID 17300)
-- Name: showperformers showperformers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.showperformers
    ADD CONSTRAINT showperformers_pkey PRIMARY KEY (show_id, performer_id);


--
-- TOC entry 4828 (class 2606 OID 17267)
-- Name: shows shows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shows
    ADD CONSTRAINT shows_pkey PRIMARY KEY (show_id);


--
-- TOC entry 4837 (class 2606 OID 17284)
-- Name: angelshows angelshows_angel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.angelshows
    ADD CONSTRAINT angelshows_angel_id_fkey FOREIGN KEY (angel_id) REFERENCES public.angels(angel_id);


--
-- TOC entry 4838 (class 2606 OID 17289)
-- Name: angelshows angelshows_show_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.angelshows
    ADD CONSTRAINT angelshows_show_id_fkey FOREIGN KEY (show_id) REFERENCES public.shows(show_id);


--
-- TOC entry 4839 (class 2606 OID 17306)
-- Name: showperformers showperformers_performer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.showperformers
    ADD CONSTRAINT showperformers_performer_id_fkey FOREIGN KEY (performer_id) REFERENCES public.performers(performer_id);


--
-- TOC entry 4840 (class 2606 OID 17301)
-- Name: showperformers showperformers_show_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.showperformers
    ADD CONSTRAINT showperformers_show_id_fkey FOREIGN KEY (show_id) REFERENCES public.shows(show_id);


-- Completed on 2026-10-23 21:15:32

--
-- PostgreSQL database dump complete
--

\unrestrict uOpmq05IF7Hvbr86YOvzW3c7dlWmSV8bKXMFQcQwNscUn4WULraF1LedyP4eBtE


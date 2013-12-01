--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE appointments (
    id integer NOT NULL,
    doctor_id integer,
    medical_shop_id integer,
    tab_user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    admin_id integer,
    status character varying(255) DEFAULT 'pending'::character varying,
    in_time timestamp without time zone,
    out_time timestamp without time zone
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO postgres;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE appointments_id_seq OWNED BY appointments.id;


--
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE doctors (
    id integer NOT NULL,
    name character varying(255),
    address text,
    degree character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE doctors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctors_id_seq OWNER TO postgres;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE doctors_id_seq OWNED BY doctors.id;


--
-- Name: medical_shops; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE medical_shops (
    id integer NOT NULL,
    shop_name character varying(255),
    shop_address text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.medical_shops OWNER TO postgres;

--
-- Name: medical_shops_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medical_shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medical_shops_id_seq OWNER TO postgres;

--
-- Name: medical_shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medical_shops_id_seq OWNED BY medical_shops.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reports (
    id integer NOT NULL,
    tab_user_id integer,
    doctor_id integer,
    medical_shop_id integer,
    product_shown boolean,
    sample_given boolean,
    product_copy integer,
    doctor_have_stock boolean,
    product_offer boolean,
    offer_name character varying(255),
    offer_detail text,
    browsher_shown boolean,
    doctors_comment text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    appointment_id integer
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reports_id_seq OWNED BY reports.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: tab_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tab_users (
    id integer NOT NULL,
    name character varying(255),
    address text,
    employee_uid character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    password_digest character varying(255),
    admin boolean DEFAULT false
);


ALTER TABLE public.tab_users OWNER TO postgres;

--
-- Name: tab_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tab_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tab_users_id_seq OWNER TO postgres;

--
-- Name: tab_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tab_users_id_seq OWNED BY tab_users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointments ALTER COLUMN id SET DEFAULT nextval('appointments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY doctors ALTER COLUMN id SET DEFAULT nextval('doctors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medical_shops ALTER COLUMN id SET DEFAULT nextval('medical_shops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports ALTER COLUMN id SET DEFAULT nextval('reports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tab_users ALTER COLUMN id SET DEFAULT nextval('tab_users_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY appointments (id, doctor_id, medical_shop_id, tab_user_id, created_at, updated_at, admin_id, status, in_time, out_time) FROM stdin;
2	81	\N	2	2013-11-10 12:40:28.836228	2013-11-10 12:40:28.836228	1	Pending	\N	\N
4	96	\N	2	2013-11-10 12:40:28.876804	2013-11-10 12:40:28.876804	1	Pending	\N	\N
5	73	\N	2	2013-11-10 12:40:28.89706	2013-11-10 12:40:28.89706	1	Pending	\N	\N
6	17	\N	2	2013-11-10 12:40:28.917418	2013-11-10 12:40:28.917418	1	Pending	\N	\N
8	93	\N	2	2013-11-10 12:40:28.959271	2013-11-10 12:40:28.959271	1	Pending	\N	\N
9	82	\N	2	2013-11-10 12:40:28.980974	2013-11-10 12:40:28.980974	1	Pending	\N	\N
10	18	\N	2	2013-11-10 12:40:29.000997	2013-11-10 12:40:29.000997	1	Pending	\N	\N
12	39	\N	2	2013-11-10 12:40:29.042498	2013-11-10 12:40:29.042498	1	Pending	\N	\N
13	70	\N	2	2013-11-10 12:40:29.063049	2013-11-10 12:40:29.063049	1	Pending	\N	\N
15	3	\N	2	2013-11-10 12:40:29.104524	2013-11-10 12:40:29.104524	1	Pending	\N	\N
18	33	\N	2	2013-11-10 12:40:29.167834	2013-11-10 12:40:29.167834	1	Pending	\N	\N
19	57	\N	2	2013-11-10 12:40:29.188356	2013-11-10 12:40:29.188356	1	Pending	\N	\N
20	49	\N	2	2013-11-10 12:40:29.208459	2013-11-10 12:40:29.208459	1	Pending	\N	\N
21	55	\N	2	2013-11-10 12:40:29.230047	2013-11-10 12:40:29.230047	1	Pending	\N	\N
22	30	\N	2	2013-11-10 12:40:29.250145	2013-11-10 12:40:29.250145	1	Pending	\N	\N
23	47	\N	2	2013-11-10 12:40:29.27167	2013-11-10 12:40:29.27167	1	Pending	\N	\N
24	67	\N	2	2013-11-10 12:40:29.291858	2013-11-10 12:40:29.291858	1	Pending	\N	\N
25	43	\N	2	2013-11-10 12:40:29.313506	2013-11-10 12:40:29.313506	1	Pending	\N	\N
26	92	\N	2	2013-11-10 12:40:29.33365	2013-11-10 12:40:29.33365	1	Pending	\N	\N
27	5	\N	2	2013-11-10 12:40:29.355384	2013-11-10 12:40:29.355384	1	Pending	\N	\N
28	17	\N	2	2013-11-10 12:40:29.375659	2013-11-10 12:40:29.375659	1	Pending	\N	\N
30	59	\N	2	2013-11-10 12:40:29.417574	2013-11-10 12:40:29.417574	1	Pending	\N	\N
31	\N	1	2	2013-11-10 12:41:10.876469	2013-11-10 12:41:10.876469	1	Pending	\N	\N
32	\N	11	2	2013-11-10 12:41:10.991615	2013-11-10 12:41:10.991615	1	Pending	\N	\N
33	\N	4	2	2013-11-10 12:41:11.011589	2013-11-10 12:41:11.011589	1	Pending	\N	\N
34	\N	5	2	2013-11-10 12:41:11.033341	2013-11-10 12:41:11.033341	1	Pending	\N	\N
35	\N	17	2	2013-11-10 12:41:11.053544	2013-11-10 12:41:11.053544	1	Pending	\N	\N
37	\N	12	2	2013-11-10 12:41:11.096454	2013-11-10 12:41:11.096454	1	Pending	\N	\N
38	\N	19	2	2013-11-10 12:41:11.117865	2013-11-10 12:41:11.117865	1	Pending	\N	\N
39	\N	4	2	2013-11-10 12:41:11.137636	2013-11-10 12:41:11.137636	1	Pending	\N	\N
40	\N	17	2	2013-11-10 12:41:11.158938	2013-11-10 12:41:11.158938	1	Pending	\N	\N
41	\N	3	2	2013-11-10 12:41:11.18044	2013-11-10 12:41:11.18044	1	Pending	\N	\N
42	\N	17	2	2013-11-10 12:41:11.200845	2013-11-10 12:41:11.200845	1	Pending	\N	\N
43	\N	14	2	2013-11-10 12:41:11.222457	2013-11-10 12:41:11.222457	1	Pending	\N	\N
44	\N	7	2	2013-11-10 12:41:11.251096	2013-11-10 12:41:11.251096	1	Pending	\N	\N
45	\N	4	2	2013-11-10 12:41:11.273357	2013-11-10 12:41:11.273357	1	Pending	\N	\N
46	\N	15	2	2013-11-10 12:41:11.297262	2013-11-10 12:41:11.297262	1	Pending	\N	\N
47	\N	9	2	2013-11-10 12:41:11.32311	2013-11-10 12:41:11.32311	1	Pending	\N	\N
48	\N	4	2	2013-11-10 12:41:11.344439	2013-11-10 12:41:11.344439	1	Pending	\N	\N
49	\N	11	2	2013-11-10 12:41:11.377041	2013-11-10 12:41:11.377041	1	Pending	\N	\N
50	\N	14	2	2013-11-10 12:41:11.394619	2013-11-10 12:41:11.394619	1	Pending	\N	\N
29	71	\N	2	2013-11-10 12:40:29.395768	2013-11-10 13:30:31.660902	1	Completed	2013-11-10 13:30:13.426273	2013-11-10 13:30:31.66001
1	47	\N	2	2013-11-10 12:40:28.711469	2013-11-10 13:59:18.460049	1	Completed	2013-11-10 13:58:56.472185	2013-11-10 13:59:18.458219
17	91	\N	3	2013-11-10 12:40:29.146293	2013-11-10 12:40:29.146293	1	Pending	\N	\N
14	47	\N	3	2013-11-10 12:40:29.084967	2013-11-10 12:40:29.084967	1	Pending	\N	\N
16	90	\N	3	2013-11-10 12:40:29.126122	2013-11-10 12:40:29.126122	1	Pending	\N	\N
11	54	\N	3	2013-11-10 12:40:29.022414	2013-11-10 12:40:29.022414	1	Pending	\N	\N
36	\N	5	3	2013-11-10 12:41:11.075115	2013-11-10 12:41:11.075115	1	Pending	\N	\N
3	14	\N	3	2013-11-10 12:40:28.85525	2013-11-10 12:40:28.85525	1	Pending	\N	\N
7	14	\N	3	2013-11-10 12:40:28.938855	2013-11-10 13:46:54.792055	1	Completed	2013-11-10 13:43:28.517572	2013-11-10 13:46:54.790233
\.


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('appointments_id_seq', 50, true);


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY doctors (id, name, address, degree, created_at, updated_at) FROM stdin;
1	Arvilla MacGyver	79837 Lesch Course	BAMS	2013-11-10 04:53:10.226437	2013-11-10 04:53:10.226437
2	Erna Ryan	6209 Hayden Neck	BDS	2013-11-10 04:53:10.393122	2013-11-10 04:53:10.393122
3	Amos Stracke DDS	5437 Pacocha Points	MDS	2013-11-10 04:53:10.410739	2013-11-10 04:53:10.410739
4	Mrs. Toni Kemmer	2354 Kulas Freeway	BAMS	2013-11-10 04:53:10.432157	2013-11-10 04:53:10.432157
5	Pablo D'Amore	288 Bertrand Flats	Physiatrist	2013-11-10 04:53:10.451888	2013-11-10 04:53:10.451888
6	Ladarius Thiel	117 Hamill Trail	BAMS	2013-11-10 04:53:10.473091	2013-11-10 04:53:10.473091
7	Margaret Pacocha	175 Aiyana Hollow	MBBS	2013-11-10 04:53:10.526609	2013-11-10 04:53:10.526609
8	Laury Kohler	579 Tad Throughway	Physiatrist	2013-11-10 04:53:10.546592	2013-11-10 04:53:10.546592
9	Maye Von Jr.	19926 Marianne Dam	MDS	2013-11-10 04:53:10.567751	2013-11-10 04:53:10.567751
10	Mrs. Winnifred Schultz	52947 Waelchi Vista	BHMS	2013-11-10 04:53:10.588292	2013-11-10 04:53:10.588292
11	Judge Hoeger	7409 Darren Run	BHMS	2013-11-10 04:53:10.608849	2013-11-10 04:53:10.608849
12	Kenya Legros	60166 Ronaldo Trail	BAMS	2013-11-10 04:53:10.628788	2013-11-10 04:53:10.628788
13	Miss Wilson Barrows	401 Little Divide	MD	2013-11-10 04:53:10.648959	2013-11-10 04:53:10.648959
14	Dr. Violet Fadel	166 Hermann Circles	MBBS	2013-11-10 04:53:10.671116	2013-11-10 04:53:10.671116
15	Elsie O'Hara Jr.	3853 Chauncey Prairie	Physiatrist	2013-11-10 04:53:10.690385	2013-11-10 04:53:10.690385
16	Mr. Madisen Hansen	17399 Tristin Alley	BDS	2013-11-10 04:53:10.712841	2013-11-10 04:53:10.712841
17	Janis Morissette DVM	9347 Kaela Dale	Physiatrist	2013-11-10 04:53:10.732766	2013-11-10 04:53:10.732766
18	Mrs. Precious Simonis	6074 Tillman Locks	BAMS	2013-11-10 04:53:10.752814	2013-11-10 04:53:10.752814
19	Kristina Tromp	33889 Fadel Tunnel	BAMS	2013-11-10 04:53:10.773842	2013-11-10 04:53:10.773842
20	Andres Von	400 Griffin Shore	MBBS	2013-11-10 04:53:10.793636	2013-11-10 04:53:10.793636
21	Lori Smitham	75216 Keeling Roads	MD	2013-11-10 04:53:10.814988	2013-11-10 04:53:10.814988
22	Joe Nikolaus	87577 Harris Plains	Physiatrist	2013-11-10 04:53:10.835076	2013-11-10 04:53:10.835076
23	Mr. Tyree Hermiston	115 Wuckert Tunnel	BAMS	2013-11-10 04:53:10.855743	2013-11-10 04:53:10.855743
24	Augustine Senger DDS	80435 Padberg Ports	BHMS	2013-11-10 04:53:10.876221	2013-11-10 04:53:10.876221
25	Ms. Otis Hauck	4792 Broderick Squares	BDS	2013-11-10 04:53:10.896158	2013-11-10 04:53:10.896158
26	Chasity White	39310 Wisoky Trafficway	BHMS	2013-11-10 04:53:10.917798	2013-11-10 04:53:10.917798
27	Ms. Jeramie Hoeger	36094 Russel Plains	BHMS	2013-11-10 04:53:10.937452	2013-11-10 04:53:10.937452
28	Princess Crist PhD	57423 Matt Pine	MBBS	2013-11-10 04:53:10.957924	2013-11-10 04:53:10.957924
29	Thora Kemmer	506 Doris Ports	Physiatrist	2013-11-10 04:53:10.978724	2013-11-10 04:53:10.978724
30	Tristin Dietrich	85296 Bradley Park	BHMS	2013-11-10 04:53:10.998768	2013-11-10 04:53:10.998768
31	Tad Zboncak	680 Delbert Drives	BHMS	2013-11-10 04:53:11.06633	2013-11-10 04:53:11.06633
32	Erich Prosacco	22994 Bechtelar Station	MBBS	2013-11-10 04:53:11.098046	2013-11-10 04:53:11.098046
33	Mathias Mayert	3461 Bergstrom Pine	BHMS	2013-11-10 04:53:11.117808	2013-11-10 04:53:11.117808
34	Clara Willms	614 Krajcik Cape	BHMS	2013-11-10 04:53:11.139362	2013-11-10 04:53:11.139362
35	Cordell Johnston DDS	2263 Walsh Radial	BHMS	2013-11-10 04:53:11.15918	2013-11-10 04:53:11.15918
36	Justen Pfeffer	81306 Prohaska Keys	BAMS	2013-11-10 04:53:11.179023	2013-11-10 04:53:11.179023
37	Edwina Kreiger V	298 Walsh Heights	BHMS	2013-11-10 04:53:11.200167	2013-11-10 04:53:11.200167
38	Conor Breitenberg	1989 Retha Isle	MBBS	2013-11-10 04:53:11.220302	2013-11-10 04:53:11.220302
39	Jace Murphy	4686 Hermiston Fort	Physiatrist	2013-11-10 04:53:11.243478	2013-11-10 04:53:11.243478
40	Ms. Herbert Spinka	199 Marvin Mill	MD	2013-11-10 04:53:11.266631	2013-11-10 04:53:11.266631
41	Kathryne Walker	6203 Kling Divide	MD	2013-11-10 04:53:11.333384	2013-11-10 04:53:11.333384
42	Queenie Littel	185 Bill Divide	MDS	2013-11-10 04:53:11.396387	2013-11-10 04:53:11.396387
43	Alycia Kuhic IV	1352 Modesto Expressway	BAMS	2013-11-10 04:53:11.416175	2013-11-10 04:53:11.416175
44	Misty Kreiger	2123 Alvis Unions	BAMS	2013-11-10 04:53:11.437437	2013-11-10 04:53:11.437437
45	Dr. General Luettgen	88893 Kenneth Forest	BDS	2013-11-10 04:53:11.45783	2013-11-10 04:53:11.45783
46	Miss Luella Wisoky	475 Bauch Light	MD	2013-11-10 04:53:11.477878	2013-11-10 04:53:11.477878
47	Seth Klein	56109 Wilfrid Drive	Physiatrist	2013-11-10 04:53:11.498838	2013-11-10 04:53:11.498838
48	Mr. Rosina Russel	25468 Daugherty Viaduct	Physiatrist	2013-11-10 04:53:11.552246	2013-11-10 04:53:11.552246
49	Mrs. Brown Grady	3251 Pietro Lights	MDS	2013-11-10 04:53:11.615026	2013-11-10 04:53:11.615026
50	Rhoda Upton	2306 Ferry Prairie	MD	2013-11-10 04:53:11.668139	2013-11-10 04:53:11.668139
51	Max Wisoky	22820 Johns Stravenue	MD	2013-11-10 04:53:11.722104	2013-11-10 04:53:11.722104
52	Mrs. Juliana Hahn	360 Esmeralda Summit	BDS	2013-11-10 04:53:11.776433	2013-11-10 04:53:11.776433
53	Ms. Ally O'Keefe	3921 Marquardt Port	MDS	2013-11-10 04:53:11.796223	2013-11-10 04:53:11.796223
54	Mariam Wuckert	8315 Anissa Dam	BDS	2013-11-10 04:53:11.816639	2013-11-10 04:53:11.816639
55	Tatum Schuster	3203 Gonzalo Stravenue	MD	2013-11-10 04:53:11.837363	2013-11-10 04:53:11.837363
56	Vernon Baumbach	3626 Lowe Motorway	BDS	2013-11-10 04:53:11.898195	2013-11-10 04:53:11.898195
57	Margret Cruickshank	463 Hamill Roads	BHMS	2013-11-10 04:53:11.922679	2013-11-10 04:53:11.922679
58	Cedrick Mante	8524 Roob Orchard	BAMS	2013-11-10 04:53:11.947177	2013-11-10 04:53:11.947177
59	Oren Marvin	4658 Grimes Green	BDS	2013-11-10 04:53:11.97296	2013-11-10 04:53:11.97296
60	Ms. Korey Kub	8146 Sheila Haven	MBBS	2013-11-10 04:53:12.005119	2013-11-10 04:53:12.005119
61	Fletcher Walsh	739 Hudson Fords	BDS	2013-11-10 04:53:12.102808	2013-11-10 04:53:12.102808
62	Graham Koepp	38477 Brad Island	BAMS	2013-11-10 04:53:12.173852	2013-11-10 04:53:12.173852
63	Maida Fadel	401 Bahringer Plain	BDS	2013-11-10 04:53:12.193568	2013-11-10 04:53:12.193568
64	Miss Lesly Doyle	818 Padberg Creek	BHMS	2013-11-10 04:53:12.213934	2013-11-10 04:53:12.213934
65	Mr. Rashad Kessler	96942 Jazmin Plain	MD	2013-11-10 04:53:12.234882	2013-11-10 04:53:12.234882
66	Alberta Schuppe	648 Weston Tunnel	MDS	2013-11-10 04:53:12.288176	2013-11-10 04:53:12.288176
67	Kaitlin Prohaska	2977 Isac Falls	MDS	2013-11-10 04:53:12.310385	2013-11-10 04:53:12.310385
68	Adela Gibson	418 Antonia Underpass	BDS	2013-11-10 04:53:12.330125	2013-11-10 04:53:12.330125
69	Jay Dicki	35532 Ruth Views	BAMS	2013-11-10 04:53:12.349902	2013-11-10 04:53:12.349902
70	Annabel Denesik	86232 Lebsack Vista	BDS	2013-11-10 04:53:12.37125	2013-11-10 04:53:12.37125
71	Jarvis Predovic	4396 Collins Well	BDS	2013-11-10 04:53:12.391351	2013-11-10 04:53:12.391351
72	Miss Sylvia Reynolds	67138 Jesus Highway	MD	2013-11-10 04:53:12.412736	2013-11-10 04:53:12.412736
73	Rosalia Mitchell	56178 Legros Freeway	Physiatrist	2013-11-10 04:53:12.433098	2013-11-10 04:53:12.433098
74	Dr. Hank Kautzer	79139 Williamson Greens	BAMS	2013-11-10 04:53:12.461364	2013-11-10 04:53:12.461364
75	Vena Renner	1889 Ralph Port	Physiatrist	2013-11-10 04:53:12.482668	2013-11-10 04:53:12.482668
76	Jada Cole	8697 Summer Overpass	MDS	2013-11-10 04:53:12.502297	2013-11-10 04:53:12.502297
77	Mrs. Anita Wisoky	1703 Francis Creek	MDS	2013-11-10 04:53:12.525086	2013-11-10 04:53:12.525086
78	Arden Kassulke	563 Anne Shoal	BAMS	2013-11-10 04:53:12.543797	2013-11-10 04:53:12.543797
79	Titus Bednar	192 Simeon Burg	Physiatrist	2013-11-10 04:53:12.563892	2013-11-10 04:53:12.563892
80	Aglae Strosin DDS	68831 Avis Landing	BAMS	2013-11-10 04:53:12.585388	2013-11-10 04:53:12.585388
81	Isobel Moen	77179 Darren Trail	BAMS	2013-11-10 04:53:12.605003	2013-11-10 04:53:12.605003
82	Ms. Marjory Schumm	544 Treva Lodge	MBBS	2013-11-10 04:53:12.626493	2013-11-10 04:53:12.626493
83	Deion Wisozk	16825 Merle Field	BDS	2013-11-10 04:53:12.646405	2013-11-10 04:53:12.646405
84	Mrs. Caterina Durgan	33224 Waters Plaza	MDS	2013-11-10 04:53:12.666865	2013-11-10 04:53:12.666865
85	Berta Hilpert	439 Elva Lane	BHMS	2013-11-10 04:53:12.68738	2013-11-10 04:53:12.68738
86	Ramon Muller	896 Rasheed Wall	BAMS	2013-11-10 04:53:12.707876	2013-11-10 04:53:12.707876
87	Isadore Wiegand	718 Fritsch Fork	Physiatrist	2013-11-10 04:53:12.728866	2013-11-10 04:53:12.728866
88	Gwen Hauck	467 Bethany Shoals	MDS	2013-11-10 04:53:12.748825	2013-11-10 04:53:12.748825
89	Judson Schuster	617 Jessyca Prairie	Physiatrist	2013-11-10 04:53:12.768924	2013-11-10 04:53:12.768924
90	Monica Haag	234 Jakubowski Extension	MBBS	2013-11-10 04:53:12.789884	2013-11-10 04:53:12.789884
91	Ali Braun Sr.	74063 Krystal Mountains	BDS	2013-11-10 04:53:12.810545	2013-11-10 04:53:12.810545
92	Miss Bettie Abbott	7731 Salvatore Street	MD	2013-11-10 04:53:12.831563	2013-11-10 04:53:12.831563
93	Delia Kassulke	966 Erdman River	BHMS	2013-11-10 04:53:12.851462	2013-11-10 04:53:12.851462
94	Hardy Considine	10812 Klocko Path	MD	2013-11-10 04:53:12.872422	2013-11-10 04:53:12.872422
95	Roslyn Muller	395 Camila Bridge	MD	2013-11-10 04:53:12.892922	2013-11-10 04:53:12.892922
96	Annamae Kertzmann	34900 Hartmann Cliff	MDS	2013-11-10 04:53:12.912912	2013-11-10 04:53:12.912912
97	Cleve Pfeffer	2629 Koepp Branch	MDS	2013-11-10 04:53:12.93424	2013-11-10 04:53:12.93424
98	Jailyn Hand	51923 Savannah Crossroad	Physiatrist	2013-11-10 04:53:12.954216	2013-11-10 04:53:12.954216
99	Aletha Bins	9707 Luettgen Dam	MDS	2013-11-10 04:53:12.973795	2013-11-10 04:53:12.973795
100	Chauncey Schiller	91517 Jacobson Fall	MD	2013-11-10 04:53:12.994875	2013-11-10 04:53:12.994875
\.


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('doctors_id_seq', 100, true);


--
-- Data for Name: medical_shops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medical_shops (id, shop_name, shop_address, created_at, updated_at) FROM stdin;
1	ajit medical store	121 Winnifred Causeway	2013-11-10 05:34:54.671478	2013-11-10 05:34:54.671478
2	noor medical store	966 Leann Squares	2013-11-10 05:34:54.79878	2013-11-10 05:34:54.79878
3	shanti medical store	23346 Ernie Mission	2013-11-10 05:34:54.819532	2013-11-10 05:34:54.819532
4	intex medical store	79069 Mills Camp	2013-11-10 05:34:54.839902	2013-11-10 05:34:54.839902
5	shumma medical store	99368 Shields Greens	2013-11-10 05:34:54.866499	2013-11-10 05:34:54.866499
6	ridhhi medical store	5002 Carleton Parkway	2013-11-10 05:34:54.890483	2013-11-10 05:34:54.890483
7	royal medical store	767 Obie Curve	2013-11-10 05:34:54.91061	2013-11-10 05:34:54.91061
8	new medical store	46692 Anastacio Turnpike	2013-11-10 05:34:54.932119	2013-11-10 05:34:54.932119
9	gateway medical store	414 Zboncak Center	2013-11-10 05:34:54.952212	2013-11-10 05:34:54.952212
10	Gajini medical store	118 Kale Underpass	2013-11-10 05:34:54.973658	2013-11-10 05:34:54.973658
11	Gajanan medical store	9266 Blaise Green	2013-11-10 05:34:54.993851	2013-11-10 05:34:54.993851
12	sakuntala medical store	27439 Josue Glens	2013-11-10 05:34:55.013967	2013-11-10 05:34:55.013967
13	kgn medical store	95896 Walter Greens	2013-11-10 05:34:55.03546	2013-11-10 05:34:55.03546
14	flex medical store	85880 Nikolaus Burg	2013-11-10 05:34:55.055547	2013-11-10 05:34:55.055547
15	rajtilak medical store	54017 Spinka Road	2013-11-10 05:34:55.077035	2013-11-10 05:34:55.077035
16	mahalakshmi medical store	348 Taya Corners	2013-11-10 05:34:55.097213	2013-11-10 05:34:55.097213
17	thos medical store	8595 Stone Freeway	2013-11-10 05:34:55.117291	2013-11-10 05:34:55.117291
18	slok medical store	922 Richmond Knolls	2013-11-10 05:34:55.138803	2013-11-10 05:34:55.138803
19	sonal medical store	109 Anya Springs	2013-11-10 05:34:55.158924	2013-11-10 05:34:55.158924
20	shiva medical store	70725 Breitenberg Island	2013-11-10 05:34:55.180421	2013-11-10 05:34:55.180421
\.


--
-- Name: medical_shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medical_shops_id_seq', 20, true);


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports (id, tab_user_id, doctor_id, medical_shop_id, product_shown, sample_given, product_copy, doctor_have_stock, product_offer, offer_name, offer_detail, browsher_shown, doctors_comment, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, appointment_id) FROM stdin;
1	\N	\N	\N	f	t	\N	t	f	\N	\N	\N	ergergregerwg	2013-11-10 13:27:28.274629	2013-11-10 13:27:28.274629	IMG_3149.JPG	image/jpeg	1632669	2013-11-10 13:27:25.53406	\N
2	\N	\N	\N	f	t	\N	f	t	\N	\N	\N	dfhdfhdfhdfhdf	2013-11-10 13:28:35.660442	2013-11-10 13:28:35.660442	IMG_3149.JPG	image/jpeg	1632669	2013-11-10 13:28:33.829555	\N
3	\N	\N	\N	t	t	34	t	f	\N	\N	\N	regergerge	2013-11-10 13:30:31.525493	2013-11-10 13:30:31.525493	IMG_3149.JPG	image/jpeg	1632669	2013-11-10 13:30:29.778621	29
4	\N	\N	\N	f	f	\N	f	f	\N	\N	\N	** if any offer following text box will appear else be hidden( including offer detail)\r\n** if any offer following text box will appear else be hidden( including offer detail)\r\n** if any offer following text box will appear else be hidden( including offer detail)\r\n** if any offer following text box will appear else be hidden( including offer detail)\r\n** if any offer following text box will appear else be hidden( including offer detail)\r\n	2013-11-10 13:46:54.72911	2013-11-10 13:46:54.72911	IMG_2706.JPG	image/jpeg	1939342	2013-11-10 13:46:52.622017	7
5	\N	\N	\N	t	t	3564	f	t	\N	\N	\N	rgrgerg	2013-11-10 13:59:18.277618	2013-11-10 13:59:18.277618	IMG_2831.JPG	image/jpeg	2056325	2013-11-10 13:59:15.679189	1
\.


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_id_seq', 5, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20131102054418
20131102054811
20131102151747
20131103093457
20131103100025
20131104175228
20131105102909
20131105175354
20131105180455
20131106133209
20131106133220
20131106175546
\.


--
-- Data for Name: tab_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tab_users (id, name, address, employee_uid, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, password_digest, admin) FROM stdin;
1	sudhir	\N	\N	2013-11-10 04:08:35.250029	2013-11-10 04:08:35.250029	\N	\N	\N	\N	$2a$10$FH5JWHlvrYC3HPNvJXBe9.WFqLIG06SQZ66hayXdHBZJFy07klRwu	t
2	shumma	\N	\N	2013-11-10 12:34:40.413752	2013-11-10 12:34:40.413752	\N	\N	\N	\N	$2a$10$6WhMJDHdQN2Ff3.2WhacTeAQv8rgoI7QDGwHBo/.TFw32ni1i1m0q	f
3	yogesh	\N	\N	2013-12-01 05:51:38.162614	2013-12-01 05:51:38.162614	\N	\N	\N	\N	$2a$10$47ZL/P1eyyNFpN25EDtxMuquiEp9CPFgmVDYcgHTzbTuG3z2mLOuS	f
\.


--
-- Name: tab_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tab_users_id_seq', 3, true);


--
-- Name: appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: medical_shops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medical_shops
    ADD CONSTRAINT medical_shops_pkey PRIMARY KEY (id);


--
-- Name: reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: tab_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tab_users
    ADD CONSTRAINT tab_users_pkey PRIMARY KEY (id);


--
-- Name: index_appointments_on_doctor_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_appointments_on_doctor_id ON appointments USING btree (doctor_id);


--
-- Name: index_appointments_on_medical_shop_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_appointments_on_medical_shop_id ON appointments USING btree (medical_shop_id);


--
-- Name: index_appointments_on_tab_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_appointments_on_tab_user_id ON appointments USING btree (tab_user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


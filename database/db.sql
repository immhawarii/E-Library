--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7
-- Dumped by pg_dump version 10.7

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: book_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_list (
    id integer NOT NULL,
    book_title character varying,
    published character varying,
    author character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.book_list OWNER TO postgres;

--
-- Name: book_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_list_id_seq OWNER TO postgres;

--
-- Name: book_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_list_id_seq OWNED BY public.book_list.id;


--
-- Name: borrower; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.borrower (
    id integer NOT NULL,
    bor_name character varying,
    title character varying,
    borrow_date character varying,
    return_date character varying,
    book_id integer
);


ALTER TABLE public.borrower OWNER TO postgres;

--
-- Name: borrower_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.borrower_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.borrower_id_seq OWNER TO postgres;

--
-- Name: borrower_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.borrower_id_seq OWNED BY public.borrower.id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(300) NOT NULL,
    create_on timestamp without time zone NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    name character varying(200) NOT NULL,
    phone_number character varying(100) NOT NULL,
    project character varying(500)
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employee_id_seq OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    name character varying(100) NOT NULL,
    phone_number bigint NOT NULL,
    project character varying(100),
    created_on timestamp without time zone
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_employee_id_seq OWNER TO postgres;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;


--
-- Name: hobby; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hobby (
    hobby_id integer NOT NULL,
    employee_id integer NOT NULL,
    hobby_name character varying(100),
    "cost_in_$" integer
);


ALTER TABLE public.hobby OWNER TO postgres;

--
-- Name: hobby_hobby_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hobby_hobby_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hobby_hobby_id_seq OWNER TO postgres;

--
-- Name: hobby_hobby_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hobby_hobby_id_seq OWNED BY public.hobby.hobby_id;


--
-- Name: join_the_table; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.join_the_table AS
 SELECT e.employee_id,
    e.name,
    e.project,
    h.hobby_name
   FROM (public.employee e
     JOIN public.hobby h ON ((e.employee_id = h.employee_id)));


ALTER TABLE public.join_the_table OWNER TO postgres;

--
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.member OWNER TO postgres;

--
-- Name: member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_id_seq OWNER TO postgres;

--
-- Name: member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.member_id_seq OWNED BY public.member.id;


--
-- Name: select_the_column; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.select_the_column AS
 SELECT employee.employee_id,
    employee.name,
    employee.project
   FROM public.employee;


ALTER TABLE public.select_the_column OWNER TO postgres;

--
-- Name: book_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_list ALTER COLUMN id SET DEFAULT nextval('public.book_list_id_seq'::regclass);


--
-- Name: borrower id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrower ALTER COLUMN id SET DEFAULT nextval('public.borrower_id_seq'::regclass);


--
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Name: employee employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- Name: employees employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);


--
-- Name: hobby hobby_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hobby ALTER COLUMN hobby_id SET DEFAULT nextval('public.hobby_hobby_id_seq'::regclass);


--
-- Name: member id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member ALTER COLUMN id SET DEFAULT nextval('public.member_id_seq'::regclass);


--
-- Data for Name: book_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_list (id, book_title, published, author, created_at) FROM stdin;
1	Dragon Ball	1984	Akira Toriyama	2019-04-10 15:08:58.131319
3	Naruto Uzumaki	1997	Masashi Kishimoto	2019-04-10 15:09:30.78661
4	Sherlock Holmes	1887	Sir Arthur Conan Doyle	2019-04-10 15:10:45.430699
5	Harry Potter	1997	 J. K. Rowling	2019-04-10 15:12:32.895638
6	The Lord of the Rings	1937 	J. R. R. Tolkien	2019-04-10 15:13:23.74221
\.


--
-- Data for Name: borrower; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.borrower (id, bor_name, title, borrow_date, return_date, book_id) FROM stdin;
4	Ahmad	Naruto Uzumaki	Teusday, 10 April 2019	Thursday, 12 April 2019	3
5	Ahmad	Dragon Ball	Teusday, 10 April 2019	Thursday, 12 April 2019	1
6	Ahmad	Harry Potter	Teusday, 10 April 2019	Thursday, 12 April 2019	5
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, username, password, email, create_on) FROM stdin;
8	wadwa	wdwa123	wdasdw@gmail.com	2019-03-08 15:33:16.267099
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, name, phone_number, project) FROM stdin;
1	agus	0896028965424	simple calender
3	dedi	082425967283	easy sound recorder
4	naufal	086425927483	movie guide
2	bani	087828967283	file manager for android
5	faisal	027473285726	simple calculator
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, name, phone_number, project, created_on) FROM stdin;
3	bani	81837489234	movie guide	\N
2	syukur	81727374828	digital calender	\N
\.


--
-- Data for Name: hobby; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hobby (hobby_id, employee_id, hobby_name, "cost_in_$") FROM stdin;
2	1	playing moba	500
3	2	playing moba	500
4	3	fight in battle royal	1500
5	4	eat, sleep, code, repeat	2000
1	1	traveling	10000
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.member (id, name, email, password, created_at) FROM stdin;
1	Ipon Sarif	iponsarif@gmail.com	123	2019-04-10 14:51:00.990672
2	Deri Adrian	deri@gmail.com	321	2019-04-10 14:51:23.27831
\.


--
-- Name: book_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_list_id_seq', 6, true);


--
-- Name: borrower_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.borrower_id_seq', 6, true);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 8, true);


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 1, true);


--
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_employee_id_seq', 3, true);


--
-- Name: hobby_hobby_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hobby_hobby_id_seq', 6, true);


--
-- Name: member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.member_id_seq', 2, true);


--
-- Name: book_list book_list_book_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_list
    ADD CONSTRAINT book_list_book_title_key UNIQUE (book_title);


--
-- Name: book_list book_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_list
    ADD CONSTRAINT book_list_pkey PRIMARY KEY (id);


--
-- Name: borrower borrower_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrower
    ADD CONSTRAINT borrower_pkey PRIMARY KEY (id);


--
-- Name: customer customer_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_email_key UNIQUE (email);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: customer customer_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_username_key UNIQUE (username);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- Name: employees employees_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_phone_number_key UNIQUE (phone_number);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: employees employees_prject_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_prject_key UNIQUE (project);


--
-- Name: hobby hobby_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hobby
    ADD CONSTRAINT hobby_pkey PRIMARY KEY (hobby_id);


--
-- Name: member member_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_email_key UNIQUE (email);


--
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);


--
-- Name: borrower borrower_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrower
    ADD CONSTRAINT borrower_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.book_list(id);


--
-- Name: hobby hobby_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hobby
    ADD CONSTRAINT hobby_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- PostgreSQL database dump complete
--


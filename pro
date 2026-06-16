--
-- PostgreSQL database dump
--

\restrict ujWWfXXrbpUrGi0xkwiFh1c0qW7G6C1h8Bcbe7zZq188rgqmDXgZCTuLiH0Wh5C

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-06-16 19:09:43

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 238 (class 1259 OID 16618)
-- Name: academic_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academic_event (
    event_id integer NOT NULL,
    event_name character varying(100),
    event_date date,
    location character varying(100)
);


ALTER TABLE public.academic_event OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16617)
-- Name: academic_event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academic_event_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.academic_event_event_id_seq OWNER TO postgres;

--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 237
-- Name: academic_event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academic_event_event_id_seq OWNED BY public.academic_event.event_id;


--
-- TOC entry 240 (class 1259 OID 16626)
-- Name: attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance (
    attendance_id integer NOT NULL,
    student_id integer,
    course_id integer,
    attendance_date date NOT NULL,
    status character varying(20),
    CONSTRAINT attendance_status_check CHECK (((status)::text = ANY ((ARRAY['Present'::character varying, 'Absent'::character varying, 'Late'::character varying])::text[])))
);


ALTER TABLE public.attendance OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16625)
-- Name: attendance_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attendance_attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attendance_attendance_id_seq OWNER TO postgres;

--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 239
-- Name: attendance_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attendance_attendance_id_seq OWNED BY public.attendance.attendance_id;


--
-- TOC entry 232 (class 1259 OID 16589)
-- Name: classroom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classroom (
    classroom_id integer NOT NULL,
    room_name character varying(50),
    capacity integer
);


ALTER TABLE public.classroom OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16588)
-- Name: classroom_classroom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classroom_classroom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classroom_classroom_id_seq OWNER TO postgres;

--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 231
-- Name: classroom_classroom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classroom_classroom_id_seq OWNED BY public.classroom.classroom_id;


--
-- TOC entry 228 (class 1259 OID 16558)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_id integer NOT NULL,
    course_name character varying(100),
    credits integer,
    department_id integer
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16557)
-- Name: course_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_course_id_seq OWNER TO postgres;

--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 227
-- Name: course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_course_id_seq OWNED BY public.course.course_id;


--
-- TOC entry 222 (class 1259 OID 16518)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    department_id integer NOT NULL,
    department_name character varying(100) NOT NULL,
    faculty_id integer
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16517)
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.department_department_id_seq OWNER TO postgres;

--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 221
-- Name: department_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_department_id_seq OWNED BY public.department.department_id;


--
-- TOC entry 230 (class 1259 OID 16571)
-- Name: enrollment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollment (
    enrollment_id integer NOT NULL,
    student_id integer,
    course_id integer,
    enrollment_date date
);


ALTER TABLE public.enrollment OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16570)
-- Name: enrollment_enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enrollment_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enrollment_enrollment_id_seq OWNER TO postgres;

--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 229
-- Name: enrollment_enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enrollment_enrollment_id_seq OWNED BY public.enrollment.enrollment_id;


--
-- TOC entry 220 (class 1259 OID 16508)
-- Name: faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculty (
    faculty_id integer NOT NULL,
    faculty_name character varying(100) NOT NULL
);


ALTER TABLE public.faculty OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16507)
-- Name: faculty_faculty_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faculty_faculty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.faculty_faculty_id_seq OWNER TO postgres;

--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 219
-- Name: faculty_faculty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faculty_faculty_id_seq OWNED BY public.faculty.faculty_id;


--
-- TOC entry 234 (class 1259 OID 16597)
-- Name: laboratory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laboratory (
    lab_id integer NOT NULL,
    lab_name character varying(100),
    capacity integer
);


ALTER TABLE public.laboratory OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16596)
-- Name: laboratory_lab_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.laboratory_lab_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.laboratory_lab_id_seq OWNER TO postgres;

--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 233
-- Name: laboratory_lab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.laboratory_lab_id_seq OWNED BY public.laboratory.lab_id;


--
-- TOC entry 226 (class 1259 OID 16545)
-- Name: lecturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lecturer (
    lecturer_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    specialization character varying(100),
    email character varying(100),
    department_id integer
);


ALTER TABLE public.lecturer OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16544)
-- Name: lecturer_lecturer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lecturer_lecturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lecturer_lecturer_id_seq OWNER TO postgres;

--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 225
-- Name: lecturer_lecturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lecturer_lecturer_id_seq OWNED BY public.lecturer.lecturer_id;


--
-- TOC entry 236 (class 1259 OID 16605)
-- Name: research_project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.research_project (
    project_id integer NOT NULL,
    project_title character varying(200),
    lecturer_id integer,
    start_date date
);


ALTER TABLE public.research_project OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16604)
-- Name: research_project_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.research_project_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.research_project_project_id_seq OWNER TO postgres;

--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 235
-- Name: research_project_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.research_project_project_id_seq OWNED BY public.research_project.project_id;


--
-- TOC entry 224 (class 1259 OID 16532)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    student_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    gender character varying(10),
    email character varying(100),
    phone character varying(20),
    department_id integer
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16531)
-- Name: student_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_student_id_seq OWNER TO postgres;

--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 223
-- Name: student_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_student_id_seq OWNED BY public.student.student_id;


--
-- TOC entry 4915 (class 2604 OID 16621)
-- Name: academic_event event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_event ALTER COLUMN event_id SET DEFAULT nextval('public.academic_event_event_id_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 16629)
-- Name: attendance attendance_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance ALTER COLUMN attendance_id SET DEFAULT nextval('public.attendance_attendance_id_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 16592)
-- Name: classroom classroom_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom ALTER COLUMN classroom_id SET DEFAULT nextval('public.classroom_classroom_id_seq'::regclass);


--
-- TOC entry 4910 (class 2604 OID 16561)
-- Name: course course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN course_id SET DEFAULT nextval('public.course_course_id_seq'::regclass);


--
-- TOC entry 4907 (class 2604 OID 16521)
-- Name: department department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN department_id SET DEFAULT nextval('public.department_department_id_seq'::regclass);


--
-- TOC entry 4911 (class 2604 OID 16574)
-- Name: enrollment enrollment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment ALTER COLUMN enrollment_id SET DEFAULT nextval('public.enrollment_enrollment_id_seq'::regclass);


--
-- TOC entry 4906 (class 2604 OID 16511)
-- Name: faculty faculty_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty ALTER COLUMN faculty_id SET DEFAULT nextval('public.faculty_faculty_id_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 16600)
-- Name: laboratory lab_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory ALTER COLUMN lab_id SET DEFAULT nextval('public.laboratory_lab_id_seq'::regclass);


--
-- TOC entry 4909 (class 2604 OID 16548)
-- Name: lecturer lecturer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lecturer ALTER COLUMN lecturer_id SET DEFAULT nextval('public.lecturer_lecturer_id_seq'::regclass);


--
-- TOC entry 4914 (class 2604 OID 16608)
-- Name: research_project project_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.research_project ALTER COLUMN project_id SET DEFAULT nextval('public.research_project_project_id_seq'::regclass);


--
-- TOC entry 4908 (class 2604 OID 16535)
-- Name: student student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN student_id SET DEFAULT nextval('public.student_student_id_seq'::regclass);


--
-- TOC entry 5115 (class 0 OID 16618)
-- Dependencies: 238
-- Data for Name: academic_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academic_event (event_id, event_name, event_date, location) FROM stdin;
1	Database Workshop	2026-06-20	Main Hall
2	Research Conference	2026-07-15	Conference Room
3	Innovation Day	2026-08-10	ULK Campus
4	Technology Exhibition	2026-09-05	Auditorium
5	Career Fair	2026-10-12	Sports Ground
\.


--
-- TOC entry 5117 (class 0 OID 16626)
-- Dependencies: 240
-- Data for Name: attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attendance (attendance_id, student_id, course_id, attendance_date, status) FROM stdin;
1	1	1	2026-06-16	Present
2	2	2	2026-06-15	Present
3	3	3	2026-06-14	Absent
4	4	4	2026-06-13	Present
5	5	5	2026-06-12	Late
6	6	6	2026-06-11	Absent
7	7	7	2026-06-10	Present
8	8	8	2026-06-09	Present
9	9	9	2026-06-08	Absent
10	10	10	2026-06-07	Late
11	11	11	2026-06-06	Present
12	12	12	2026-06-05	Absent
13	13	13	2026-06-04	Present
14	14	14	2026-06-03	Present
15	15	15	2026-06-02	Absent
16	16	16	2026-06-01	Present
17	17	17	2026-05-31	Present
18	18	18	2026-05-30	Absent
19	19	19	2026-05-29	Present
20	20	20	2026-05-28	Late
21	21	21	2026-05-27	Absent
22	22	22	2026-05-26	Present
23	23	23	2026-05-25	Present
24	24	24	2026-05-24	Absent
25	25	25	2026-05-23	Late
26	26	26	2026-05-22	Present
27	27	27	2026-05-21	Absent
28	28	28	2026-05-20	Present
29	29	29	2026-05-19	Present
30	30	30	2026-05-18	Absent
31	31	1	2026-06-16	Present
32	32	2	2026-06-15	Present
33	33	3	2026-06-14	Absent
34	34	4	2026-06-13	Present
35	35	5	2026-06-12	Late
36	36	6	2026-06-11	Absent
37	37	7	2026-06-10	Present
38	38	8	2026-06-09	Present
39	39	9	2026-06-08	Absent
40	40	10	2026-06-07	Late
41	41	11	2026-06-06	Present
42	42	12	2026-06-05	Absent
43	43	13	2026-06-04	Present
44	44	14	2026-06-03	Present
45	45	15	2026-06-02	Absent
46	46	16	2026-06-01	Present
47	47	17	2026-05-31	Present
48	48	18	2026-05-30	Absent
49	49	19	2026-05-29	Present
50	50	20	2026-05-28	Late
51	51	21	2026-05-27	Absent
52	52	22	2026-05-26	Present
53	53	23	2026-05-25	Present
54	54	24	2026-05-24	Absent
55	55	25	2026-05-23	Late
56	56	26	2026-05-22	Present
57	57	27	2026-05-21	Absent
58	58	28	2026-05-20	Present
59	59	29	2026-05-19	Present
60	60	30	2026-05-18	Absent
61	61	1	2026-06-16	Present
62	62	2	2026-06-15	Present
63	63	3	2026-06-14	Absent
64	64	4	2026-06-13	Present
65	65	5	2026-06-12	Late
66	66	6	2026-06-11	Absent
67	67	7	2026-06-10	Present
68	68	8	2026-06-09	Present
69	69	9	2026-06-08	Absent
70	70	10	2026-06-07	Late
71	71	11	2026-06-06	Present
72	72	12	2026-06-05	Absent
73	73	13	2026-06-04	Present
74	74	14	2026-06-03	Present
75	75	15	2026-06-02	Absent
76	76	16	2026-06-01	Present
77	77	17	2026-05-31	Present
78	78	18	2026-05-30	Absent
79	79	19	2026-05-29	Present
80	80	20	2026-05-28	Late
81	81	21	2026-05-27	Absent
82	82	22	2026-05-26	Present
83	83	23	2026-05-25	Present
84	84	24	2026-05-24	Absent
85	85	25	2026-05-23	Late
86	86	26	2026-05-22	Present
87	87	27	2026-05-21	Absent
88	88	28	2026-05-20	Present
89	89	29	2026-05-19	Present
90	90	30	2026-05-18	Absent
91	91	1	2026-06-16	Present
92	92	2	2026-06-15	Present
93	93	3	2026-06-14	Absent
94	94	4	2026-06-13	Present
95	95	5	2026-06-12	Late
96	96	6	2026-06-11	Absent
97	97	7	2026-06-10	Present
98	98	8	2026-06-09	Present
99	99	9	2026-06-08	Absent
100	100	10	2026-06-07	Late
\.


--
-- TOC entry 5109 (class 0 OID 16589)
-- Dependencies: 232
-- Data for Name: classroom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classroom (classroom_id, room_name, capacity) FROM stdin;
1	A101	50
2	A102	60
3	A103	40
4	B201	70
5	B202	80
\.


--
-- TOC entry 5105 (class 0 OID 16558)
-- Dependencies: 228
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (course_id, course_name, credits, department_id) FROM stdin;
1	Advanced Database Management	4	1
2	Database Administration	3	1
3	Web Development	3	1
4	Mobile Application Development	4	1
5	Software Engineering	4	1
6	Artificial Intelligence	4	1
7	Machine Learning	4	1
8	Data Science	3	1
9	Cloud Computing	3	1
10	Cyber Security	4	1
11	Computer Networks	4	2
12	Network Security	3	2
13	Wireless Communication	3	2
14	Internet Technologies	3	2
15	Operating Systems	4	2
16	Financial Accounting	4	3
17	Cost Accounting	3	3
18	Auditing	3	3
19	Taxation	3	3
20	Financial Management	4	3
21	Business Management	4	4
22	Human Resource Management	3	4
23	Marketing Management	3	4
24	Entrepreneurship	3	4
25	Strategic Management	4	4
26	Calculus	4	5
27	Linear Algebra	3	5
28	Statistics	4	5
29	Research Methodology	3	5
30	Discrete Mathematics	4	5
\.


--
-- TOC entry 5099 (class 0 OID 16518)
-- Dependencies: 222
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (department_id, department_name, faculty_id) FROM stdin;
1	Information Technology	1
2	Computer Science	1
3	Accounting	2
4	Management	2
5	Mathematics Education	3
\.


--
-- TOC entry 5107 (class 0 OID 16571)
-- Dependencies: 230
-- Data for Name: enrollment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollment (enrollment_id, student_id, course_id, enrollment_date) FROM stdin;
1	1	1	2026-06-16
2	2	2	2026-06-16
3	3	3	2026-06-16
4	4	4	2026-06-16
5	5	5	2026-06-16
6	6	6	2026-06-16
7	7	7	2026-06-16
8	8	8	2026-06-16
9	9	9	2026-06-16
10	10	10	2026-06-16
11	11	11	2026-06-16
12	12	12	2026-06-16
13	13	13	2026-06-16
14	14	14	2026-06-16
15	15	15	2026-06-16
16	16	16	2026-06-16
17	17	17	2026-06-16
18	18	18	2026-06-16
19	19	19	2026-06-16
20	20	20	2026-06-16
21	21	21	2026-06-16
22	22	22	2026-06-16
23	23	23	2026-06-16
24	24	24	2026-06-16
25	25	25	2026-06-16
26	26	26	2026-06-16
27	27	27	2026-06-16
28	28	28	2026-06-16
29	29	29	2026-06-16
30	30	30	2026-06-16
31	31	1	2026-06-16
32	32	2	2026-06-16
33	33	3	2026-06-16
34	34	4	2026-06-16
35	35	5	2026-06-16
36	36	6	2026-06-16
37	37	7	2026-06-16
38	38	8	2026-06-16
39	39	9	2026-06-16
40	40	10	2026-06-16
41	41	11	2026-06-16
42	42	12	2026-06-16
43	43	13	2026-06-16
44	44	14	2026-06-16
45	45	15	2026-06-16
46	46	16	2026-06-16
47	47	17	2026-06-16
48	48	18	2026-06-16
49	49	19	2026-06-16
50	50	20	2026-06-16
51	51	21	2026-06-16
52	52	22	2026-06-16
53	53	23	2026-06-16
54	54	24	2026-06-16
55	55	25	2026-06-16
56	56	26	2026-06-16
57	57	27	2026-06-16
58	58	28	2026-06-16
59	59	29	2026-06-16
60	60	30	2026-06-16
61	61	1	2026-06-16
62	62	2	2026-06-16
63	63	3	2026-06-16
64	64	4	2026-06-16
65	65	5	2026-06-16
66	66	6	2026-06-16
67	67	7	2026-06-16
68	68	8	2026-06-16
69	69	9	2026-06-16
70	70	10	2026-06-16
71	71	11	2026-06-16
72	72	12	2026-06-16
73	73	13	2026-06-16
74	74	14	2026-06-16
75	75	15	2026-06-16
76	76	16	2026-06-16
77	77	17	2026-06-16
78	78	18	2026-06-16
79	79	19	2026-06-16
80	80	20	2026-06-16
81	81	21	2026-06-16
82	82	22	2026-06-16
83	83	23	2026-06-16
84	84	24	2026-06-16
85	85	25	2026-06-16
86	86	26	2026-06-16
87	87	27	2026-06-16
88	88	28	2026-06-16
89	89	29	2026-06-16
90	90	30	2026-06-16
91	91	1	2026-06-16
92	92	2	2026-06-16
93	93	3	2026-06-16
94	94	4	2026-06-16
95	95	5	2026-06-16
96	96	6	2026-06-16
97	97	7	2026-06-16
98	98	8	2026-06-16
99	99	9	2026-06-16
100	100	10	2026-06-16
101	1	11	2026-06-16
102	2	12	2026-06-16
103	3	13	2026-06-16
104	4	14	2026-06-16
105	5	15	2026-06-16
106	6	16	2026-06-16
107	7	17	2026-06-16
108	8	18	2026-06-16
109	9	19	2026-06-16
110	10	20	2026-06-16
111	11	21	2026-06-16
112	12	22	2026-06-16
113	13	23	2026-06-16
114	14	24	2026-06-16
115	15	25	2026-06-16
116	16	26	2026-06-16
117	17	27	2026-06-16
118	18	28	2026-06-16
119	19	29	2026-06-16
120	20	30	2026-06-16
121	21	1	2026-06-16
122	22	2	2026-06-16
123	23	3	2026-06-16
124	24	4	2026-06-16
125	25	5	2026-06-16
126	26	6	2026-06-16
127	27	7	2026-06-16
128	28	8	2026-06-16
129	29	9	2026-06-16
130	30	10	2026-06-16
131	31	11	2026-06-16
132	32	12	2026-06-16
133	33	13	2026-06-16
134	34	14	2026-06-16
135	35	15	2026-06-16
136	36	16	2026-06-16
137	37	17	2026-06-16
138	38	18	2026-06-16
139	39	19	2026-06-16
140	40	20	2026-06-16
141	41	21	2026-06-16
142	42	22	2026-06-16
143	43	23	2026-06-16
144	44	24	2026-06-16
145	45	25	2026-06-16
146	46	26	2026-06-16
147	47	27	2026-06-16
148	48	28	2026-06-16
149	49	29	2026-06-16
150	50	30	2026-06-16
\.


--
-- TOC entry 5097 (class 0 OID 16508)
-- Dependencies: 220
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculty (faculty_id, faculty_name) FROM stdin;
1	Faculty of Computing
2	Faculty of Business
3	Faculty of Education
\.


--
-- TOC entry 5111 (class 0 OID 16597)
-- Dependencies: 234
-- Data for Name: laboratory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laboratory (lab_id, lab_name, capacity) FROM stdin;
1	Programming Lab	40
2	Networking Lab	35
3	Database Lab	30
4	AI Lab	25
5	Cyber Security Lab	20
\.


--
-- TOC entry 5103 (class 0 OID 16545)
-- Dependencies: 226
-- Data for Name: lecturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lecturer (lecturer_id, first_name, last_name, specialization, email, department_id) FROM stdin;
1	Timothee	Kamate	Database Systems	timothee@ulk.ac.rw	1
2	Jean	Mugabo	Networking	jean.mugabo@ulk.ac.rw	2
3	Alice	Mukamana	Software Engineering	alice.mukamana@ulk.ac.rw	1
4	Patrick	Habimana	Cyber Security	patrick.habimana@ulk.ac.rw	2
5	Grace	Uwera	Accounting	grace.uwera@ulk.ac.rw	3
6	David	Niyonzima	Management	david.niyonzima@ulk.ac.rw	4
7	Eric	Bizimana	Artificial Intelligence	eric.bizimana@ulk.ac.rw	1
8	Diane	Ingabire	Data Science	diane.ingabire@ulk.ac.rw	1
9	Samuel	Ndayisaba	Computer Networks	samuel.ndayisaba@ulk.ac.rw	2
10	Olive	Mukeshimana	Web Development	olive.mukeshimana@ulk.ac.rw	1
11	Claude	Rukundo	Machine Learning	claude.rukundo@ulk.ac.rw	1
12	Carine	Uwase	Finance	carine.uwase@ulk.ac.rw	3
13	Gilbert	Nkurunziza	Economics	gilbert.nkurunziza@ulk.ac.rw	3
14	Yvette	Mukantwari	Marketing	yvette.mukantwari@ulk.ac.rw	4
15	Thierry	Munyaneza	Human Resource	thierry.munyaneza@ulk.ac.rw	4
16	Belinda	Nyirahabimana	Mathematics	belinda.nyirahabimana@ulk.ac.rw	5
17	Joseph	Hakizimana	Statistics	joseph.hakizimana@ulk.ac.rw	5
18	Sandra	Murekatete	Research Methods	sandra.murekatete@ulk.ac.rw	5
19	Chris	Mutabazi	Cloud Computing	chris.mutabazi@ulk.ac.rw	1
20	Ariane	Uwamahoro	Mobile Development	ariane.uwamahoro@ulk.ac.rw	1
\.


--
-- TOC entry 5113 (class 0 OID 16605)
-- Dependencies: 236
-- Data for Name: research_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.research_project (project_id, project_title, lecturer_id, start_date) FROM stdin;
1	AI in Education	1	2026-01-10
2	Cloud Computing Research	2	2026-02-15
3	Database Optimization	3	2026-03-20
4	Cyber Security Framework	4	2026-04-10
5	Smart Campus System	5	2026-05-05
\.


--
-- TOC entry 5101 (class 0 OID 16532)
-- Dependencies: 224
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (student_id, first_name, last_name, gender, email, phone, department_id) FROM stdin;
1	Student1	Lastname1	Male	student1@ulk.ac.rw	0788000001	1
2	Student2	Lastname2	Female	student2@ulk.ac.rw	0788000002	2
3	Student3	Lastname3	Male	student3@ulk.ac.rw	0788000003	3
4	Student4	Lastname4	Female	student4@ulk.ac.rw	0788000004	4
5	Student5	Lastname5	Male	student5@ulk.ac.rw	0788000005	5
6	Student6	Lastname6	Female	student6@ulk.ac.rw	0788000006	1
7	Student7	Lastname7	Male	student7@ulk.ac.rw	0788000007	2
8	Student8	Lastname8	Female	student8@ulk.ac.rw	0788000008	3
9	Student9	Lastname9	Male	student9@ulk.ac.rw	0788000009	4
10	Student10	Lastname10	Female	student10@ulk.ac.rw	0788000010	5
11	Student11	Lastname11	Male	student11@ulk.ac.rw	0788000011	1
12	Student12	Lastname12	Female	student12@ulk.ac.rw	0788000012	2
13	Student13	Lastname13	Male	student13@ulk.ac.rw	0788000013	3
14	Student14	Lastname14	Female	student14@ulk.ac.rw	0788000014	4
15	Student15	Lastname15	Male	student15@ulk.ac.rw	0788000015	5
16	Student16	Lastname16	Female	student16@ulk.ac.rw	0788000016	1
17	Student17	Lastname17	Male	student17@ulk.ac.rw	0788000017	2
18	Student18	Lastname18	Female	student18@ulk.ac.rw	0788000018	3
19	Student19	Lastname19	Male	student19@ulk.ac.rw	0788000019	4
20	Student20	Lastname20	Female	student20@ulk.ac.rw	0788000020	5
21	Student21	Lastname21	Male	student21@ulk.ac.rw	0788000021	1
22	Student22	Lastname22	Female	student22@ulk.ac.rw	0788000022	2
23	Student23	Lastname23	Male	student23@ulk.ac.rw	0788000023	3
24	Student24	Lastname24	Female	student24@ulk.ac.rw	0788000024	4
25	Student25	Lastname25	Male	student25@ulk.ac.rw	0788000025	5
26	Student26	Lastname26	Female	student26@ulk.ac.rw	0788000026	1
27	Student27	Lastname27	Male	student27@ulk.ac.rw	0788000027	2
28	Student28	Lastname28	Female	student28@ulk.ac.rw	0788000028	3
29	Student29	Lastname29	Male	student29@ulk.ac.rw	0788000029	4
30	Student30	Lastname30	Female	student30@ulk.ac.rw	0788000030	5
31	Student31	Lastname31	Male	student31@ulk.ac.rw	0788000031	1
32	Student32	Lastname32	Female	student32@ulk.ac.rw	0788000032	2
33	Student33	Lastname33	Male	student33@ulk.ac.rw	0788000033	3
34	Student34	Lastname34	Female	student34@ulk.ac.rw	0788000034	4
35	Student35	Lastname35	Male	student35@ulk.ac.rw	0788000035	5
36	Student36	Lastname36	Female	student36@ulk.ac.rw	0788000036	1
37	Student37	Lastname37	Male	student37@ulk.ac.rw	0788000037	2
38	Student38	Lastname38	Female	student38@ulk.ac.rw	0788000038	3
39	Student39	Lastname39	Male	student39@ulk.ac.rw	0788000039	4
40	Student40	Lastname40	Female	student40@ulk.ac.rw	0788000040	5
41	Student41	Lastname41	Male	student41@ulk.ac.rw	0788000041	1
42	Student42	Lastname42	Female	student42@ulk.ac.rw	0788000042	2
43	Student43	Lastname43	Male	student43@ulk.ac.rw	0788000043	3
44	Student44	Lastname44	Female	student44@ulk.ac.rw	0788000044	4
45	Student45	Lastname45	Male	student45@ulk.ac.rw	0788000045	5
46	Student46	Lastname46	Female	student46@ulk.ac.rw	0788000046	1
47	Student47	Lastname47	Male	student47@ulk.ac.rw	0788000047	2
48	Student48	Lastname48	Female	student48@ulk.ac.rw	0788000048	3
49	Student49	Lastname49	Male	student49@ulk.ac.rw	0788000049	4
50	Student50	Lastname50	Female	student50@ulk.ac.rw	0788000050	5
51	Student51	Lastname51	Male	student51@ulk.ac.rw	0788000051	1
52	Student52	Lastname52	Female	student52@ulk.ac.rw	0788000052	2
53	Student53	Lastname53	Male	student53@ulk.ac.rw	0788000053	3
54	Student54	Lastname54	Female	student54@ulk.ac.rw	0788000054	4
55	Student55	Lastname55	Male	student55@ulk.ac.rw	0788000055	5
56	Student56	Lastname56	Female	student56@ulk.ac.rw	0788000056	1
57	Student57	Lastname57	Male	student57@ulk.ac.rw	0788000057	2
58	Student58	Lastname58	Female	student58@ulk.ac.rw	0788000058	3
59	Student59	Lastname59	Male	student59@ulk.ac.rw	0788000059	4
60	Student60	Lastname60	Female	student60@ulk.ac.rw	0788000060	5
61	Student61	Lastname61	Male	student61@ulk.ac.rw	0788000061	1
62	Student62	Lastname62	Female	student62@ulk.ac.rw	0788000062	2
63	Student63	Lastname63	Male	student63@ulk.ac.rw	0788000063	3
64	Student64	Lastname64	Female	student64@ulk.ac.rw	0788000064	4
65	Student65	Lastname65	Male	student65@ulk.ac.rw	0788000065	5
66	Student66	Lastname66	Female	student66@ulk.ac.rw	0788000066	1
67	Student67	Lastname67	Male	student67@ulk.ac.rw	0788000067	2
68	Student68	Lastname68	Female	student68@ulk.ac.rw	0788000068	3
69	Student69	Lastname69	Male	student69@ulk.ac.rw	0788000069	4
70	Student70	Lastname70	Female	student70@ulk.ac.rw	0788000070	5
71	Student71	Lastname71	Male	student71@ulk.ac.rw	0788000071	1
72	Student72	Lastname72	Female	student72@ulk.ac.rw	0788000072	2
73	Student73	Lastname73	Male	student73@ulk.ac.rw	0788000073	3
74	Student74	Lastname74	Female	student74@ulk.ac.rw	0788000074	4
75	Student75	Lastname75	Male	student75@ulk.ac.rw	0788000075	5
76	Student76	Lastname76	Female	student76@ulk.ac.rw	0788000076	1
77	Student77	Lastname77	Male	student77@ulk.ac.rw	0788000077	2
78	Student78	Lastname78	Female	student78@ulk.ac.rw	0788000078	3
79	Student79	Lastname79	Male	student79@ulk.ac.rw	0788000079	4
80	Student80	Lastname80	Female	student80@ulk.ac.rw	0788000080	5
81	Student81	Lastname81	Male	student81@ulk.ac.rw	0788000081	1
82	Student82	Lastname82	Female	student82@ulk.ac.rw	0788000082	2
83	Student83	Lastname83	Male	student83@ulk.ac.rw	0788000083	3
84	Student84	Lastname84	Female	student84@ulk.ac.rw	0788000084	4
85	Student85	Lastname85	Male	student85@ulk.ac.rw	0788000085	5
86	Student86	Lastname86	Female	student86@ulk.ac.rw	0788000086	1
87	Student87	Lastname87	Male	student87@ulk.ac.rw	0788000087	2
88	Student88	Lastname88	Female	student88@ulk.ac.rw	0788000088	3
89	Student89	Lastname89	Male	student89@ulk.ac.rw	0788000089	4
90	Student90	Lastname90	Female	student90@ulk.ac.rw	0788000090	5
91	Student91	Lastname91	Male	student91@ulk.ac.rw	0788000091	1
92	Student92	Lastname92	Female	student92@ulk.ac.rw	0788000092	2
93	Student93	Lastname93	Male	student93@ulk.ac.rw	0788000093	3
94	Student94	Lastname94	Female	student94@ulk.ac.rw	0788000094	4
95	Student95	Lastname95	Male	student95@ulk.ac.rw	0788000095	5
96	Student96	Lastname96	Female	student96@ulk.ac.rw	0788000096	1
97	Student97	Lastname97	Male	student97@ulk.ac.rw	0788000097	2
98	Student98	Lastname98	Female	student98@ulk.ac.rw	0788000098	3
99	Student99	Lastname99	Male	student99@ulk.ac.rw	0788000099	4
100	Student100	Lastname100	Female	student100@ulk.ac.rw	0788000100	5
\.


--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 237
-- Name: academic_event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academic_event_event_id_seq', 5, true);


--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 239
-- Name: attendance_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attendance_attendance_id_seq', 100, true);


--
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 231
-- Name: classroom_classroom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classroom_classroom_id_seq', 5, true);


--
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 227
-- Name: course_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_course_id_seq', 30, true);


--
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 221
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_department_id_seq', 5, true);


--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 229
-- Name: enrollment_enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enrollment_enrollment_id_seq', 150, true);


--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 219
-- Name: faculty_faculty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faculty_faculty_id_seq', 3, true);


--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 233
-- Name: laboratory_lab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.laboratory_lab_id_seq', 5, true);


--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 225
-- Name: lecturer_lecturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lecturer_lecturer_id_seq', 20, true);


--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 235
-- Name: research_project_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.research_project_project_id_seq', 5, true);


--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 223
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_student_id_seq', 100, true);


--
-- TOC entry 4937 (class 2606 OID 16624)
-- Name: academic_event academic_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_event
    ADD CONSTRAINT academic_event_pkey PRIMARY KEY (event_id);


--
-- TOC entry 4939 (class 2606 OID 16634)
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (attendance_id);


--
-- TOC entry 4931 (class 2606 OID 16595)
-- Name: classroom classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (classroom_id);


--
-- TOC entry 4927 (class 2606 OID 16564)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- TOC entry 4921 (class 2606 OID 16525)
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);


--
-- TOC entry 4929 (class 2606 OID 16577)
-- Name: enrollment enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (enrollment_id);


--
-- TOC entry 4919 (class 2606 OID 16515)
-- Name: faculty faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY (faculty_id);


--
-- TOC entry 4933 (class 2606 OID 16603)
-- Name: laboratory laboratory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory
    ADD CONSTRAINT laboratory_pkey PRIMARY KEY (lab_id);


--
-- TOC entry 4925 (class 2606 OID 16551)
-- Name: lecturer lecturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lecturer
    ADD CONSTRAINT lecturer_pkey PRIMARY KEY (lecturer_id);


--
-- TOC entry 4935 (class 2606 OID 16611)
-- Name: research_project research_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.research_project
    ADD CONSTRAINT research_project_pkey PRIMARY KEY (project_id);


--
-- TOC entry 4923 (class 2606 OID 16538)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4947 (class 2606 OID 16640)
-- Name: attendance attendance_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 4948 (class 2606 OID 16635)
-- Name: attendance attendance_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id);


--
-- TOC entry 4943 (class 2606 OID 16565)
-- Name: course course_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(department_id);


--
-- TOC entry 4940 (class 2606 OID 16526)
-- Name: department department_faculty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES public.faculty(faculty_id);


--
-- TOC entry 4944 (class 2606 OID 16583)
-- Name: enrollment enrollment_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 4945 (class 2606 OID 16578)
-- Name: enrollment enrollment_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(student_id);


--
-- TOC entry 4942 (class 2606 OID 16552)
-- Name: lecturer lecturer_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lecturer
    ADD CONSTRAINT lecturer_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(department_id);


--
-- TOC entry 4946 (class 2606 OID 16612)
-- Name: research_project research_project_lecturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.research_project
    ADD CONSTRAINT research_project_lecturer_id_fkey FOREIGN KEY (lecturer_id) REFERENCES public.lecturer(lecturer_id);


--
-- TOC entry 4941 (class 2606 OID 16539)
-- Name: student student_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(department_id);


-- Completed on 2026-06-16 19:09:43

--
-- PostgreSQL database dump complete
--

\unrestrict ujWWfXXrbpUrGi0xkwiFh1c0qW7G6C1h8Bcbe7zZq188rgqmDXgZCTuLiH0Wh5C


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    enabled boolean NOT NULL
);


--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customer ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employee (
    id bigint NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255) NOT NULL,
    start_date date NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    firebase_uid character varying(255),
    role character varying(255) NOT NULL
);


--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.employee ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


--
-- Name: project; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    employee_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    start_date date NOT NULL,
    end_date date,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    status character varying(255) NOT NULL
);


--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.project ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: task; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    billable boolean NOT NULL,
    status character varying(255) NOT NULL
);


--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.task ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: time_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.time_category (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


--
-- Name: time_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.time_category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.time_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: timesheet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.timesheet (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    employee_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    allocation integer NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    status character varying(255) NOT NULL,
    rate numeric DEFAULT 0 NOT NULL
);


--
-- Name: timesheet_entry; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.timesheet_entry (
    id bigint NOT NULL,
    timesheet_id bigint NOT NULL,
    task_id bigint NOT NULL,
    time_category_id bigint NOT NULL,
    quantity numeric NOT NULL,
    date date NOT NULL,
    description character varying(255),
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


--
-- Name: timesheet_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.timesheet_entry ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.timesheet_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: timesheet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.timesheet ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.timesheet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer (id, name, description, created, updated, enabled) FROM stdin;
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.employee (id, first_name, last_name, email, start_date, created, updated, firebase_uid, role) FROM stdin;
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	Create DB	SQL	V1__Create_DB.sql	2099822983	user	2022-08-12 09:10:23.516151	68	t
2	2	Add Timesheet rate	SQL	V2__Add_Timesheet_rate.sql	-625244344	user	2022-08-12 09:10:23.594074	2	t
3	3	Add roles	SQL	V3__Add_roles.sql	1993308928	user	2022-08-12 12:17:21.835036	8	t
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.project (id, customer_id, employee_id, name, description, start_date, end_date, created, updated, status) FROM stdin;
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.task (id, project_id, name, description, created, updated, billable, status) FROM stdin;
\.


--
-- Data for Name: time_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.time_category (id, name, description, created, updated) FROM stdin;
\.


--
-- Data for Name: timesheet; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.timesheet (id, project_id, employee_id, name, description, allocation, created, updated, status, rate) FROM stdin;
\.


--
-- Data for Name: timesheet_entry; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.timesheet_entry (id, timesheet_id, task_id, time_category_id, quantity, date, description, created, updated) FROM stdin;
\.


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, false);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.employee_id_seq', 9, true);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.project_id_seq', 1, false);


--
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.task_id_seq', 1, false);


--
-- Name: time_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.time_category_id_seq', 1, false);


--
-- Name: timesheet_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.timesheet_entry_id_seq', 1, false);


--
-- Name: timesheet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.timesheet_id_seq', 1, false);


--
-- Name: employee firebase_uid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT firebase_uid_unique UNIQUE (firebase_uid);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: customer pk_customer; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT pk_customer PRIMARY KEY (id);


--
-- Name: employee pk_employee; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT pk_employee PRIMARY KEY (id);


--
-- Name: project pk_project; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT pk_project PRIMARY KEY (id);


--
-- Name: task pk_task; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT pk_task PRIMARY KEY (id);


--
-- Name: time_category pk_timecategory; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_category
    ADD CONSTRAINT pk_timecategory PRIMARY KEY (id);


--
-- Name: timesheet pk_timesheet; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timesheet
    ADD CONSTRAINT pk_timesheet PRIMARY KEY (id);


--
-- Name: timesheet_entry pk_timesheetentry; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timesheet_entry
    ADD CONSTRAINT pk_timesheetentry PRIMARY KEY (id);


--
-- Name: timesheet uc_91f52f1090db07993be2657d9; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timesheet
    ADD CONSTRAINT uc_91f52f1090db07993be2657d9 UNIQUE (project_id, employee_id);


--
-- Name: customer uc_customer_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT uc_customer_name UNIQUE (name);


--
-- Name: employee uc_employee_email; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT uc_employee_email UNIQUE (email);


--
-- Name: time_category uc_timecategory_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_category
    ADD CONSTRAINT uc_timecategory_name UNIQUE (name);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: project fk_project_on_customer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT fk_project_on_customer FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: project fk_project_on_employee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT fk_project_on_employee FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- Name: task fk_task_on_project; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT fk_task_on_project FOREIGN KEY (project_id) REFERENCES public.project(id);


--
-- Name: timesheet fk_timesheet_on_employee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timesheet
    ADD CONSTRAINT fk_timesheet_on_employee FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- Name: timesheet fk_timesheet_on_project; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timesheet
    ADD CONSTRAINT fk_timesheet_on_project FOREIGN KEY (project_id) REFERENCES public.project(id);


--
-- Name: timesheet_entry fk_timesheetentry_on_task; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timesheet_entry
    ADD CONSTRAINT fk_timesheetentry_on_task FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- Name: timesheet_entry fk_timesheetentry_on_time_category; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timesheet_entry
    ADD CONSTRAINT fk_timesheetentry_on_time_category FOREIGN KEY (time_category_id) REFERENCES public.time_category(id);


--
-- Name: timesheet_entry fk_timesheetentry_on_timesheet; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.timesheet_entry
    ADD CONSTRAINT fk_timesheetentry_on_timesheet FOREIGN KEY (timesheet_id) REFERENCES public.timesheet(id);


--
-- PostgreSQL database dump complete
--


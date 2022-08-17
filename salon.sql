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

DROP DATABASE salon;

CREATE DATABASE salon WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE salon OWNER TO freecodecamp;

\connect salon

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

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    customer_id integer NOT NULL,
    service_id integer NOT NULL,
    "time" character varying(10)
);

ALTER TABLE public.appointments OWNER TO freecodecamp;

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.appointments_appointment_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    phone character varying(20) NOT NULL,
    name character varying(30)
);

ALTER TABLE public.customers OWNER TO freecodecamp;

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.customers_customer_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;

CREATE TABLE public.services (
    service_id integer NOT NULL,
    name character varying(30)
);

ALTER TABLE public.services OWNER TO freecodecamp;

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.services_service_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);

INSERT INTO public.appointments VALUES (71, 62, 1, '10:30');
INSERT INTO public.appointments VALUES (72, 62, 2, '11:00');
INSERT INTO public.appointments VALUES (73, 63, 3, '5:20');
INSERT INTO public.appointments VALUES (116, 63, 4, '15:22');

INSERT INTO public.customers VALUES (62, '555-555-5555', 'Fabio');
INSERT INTO public.customers VALUES (63, '36366439', 'Eslam');

INSERT INTO public.services VALUES (1, 'Hair cut');
INSERT INTO public.services VALUES (2, 'Beard service');
INSERT INTO public.services VALUES (3, 'Face wax');
INSERT INTO public.services VALUES (4, 'Facial  treatment');

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 116, true);

SELECT pg_catalog.setval('public.customers_customer_id_seq', 98, true);

SELECT pg_catalog.setval('public.services_service_id_seq', 4, true);

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(service_id);

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    distance_from_earth numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moons (
    name character varying(20) NOT NULL,
    description text,
    id integer,
    id_planet integer NOT NULL,
    id_moon integer NOT NULL,
    planet_moons_id integer NOT NULL
);


ALTER TABLE public.planet_moons OWNER TO freecodecamp;

--
-- Name: planet_moons_planet_moons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moons_planet_moons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moons_planet_moons_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moons_planet_moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moons_planet_moons_id_seq OWNED BY public.planet_moons.planet_moons_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moons planet_moons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons ALTER COLUMN planet_moons_id SET DEFAULT nextval('public.planet_moons_planet_moons_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy 1', 12000, NULL, true, false);
INSERT INTO public.galaxy VALUES (2, 'galaxy 2', 12000, NULL, true, false);
INSERT INTO public.galaxy VALUES (3, 'galaxy 3', 12000, NULL, true, false);
INSERT INTO public.galaxy VALUES (4, 'galaxy 4', 12000, NULL, true, false);
INSERT INTO public.galaxy VALUES (5, 'galaxy 5', 12000, NULL, true, false);
INSERT INTO public.galaxy VALUES (6, 'galaxy 6', 12000, NULL, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon 1', 5000, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'moon 2', 5000, NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, 'moon 3', 5000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (4, 'moon 4', 5000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (5, 'moon 5', 5000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (6, 'moon 6', 5000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (7, 'moon 7', 5000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (8, 'moon 8', 5000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (9, 'moon 9', 5000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (10, 'moon 10', 5000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (11, 'moon 11', 5000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (12, 'moon 12', 5000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (13, 'moon 13', 5000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (14, 'moon 14', 5000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (15, 'moon 15', 5000, NULL, NULL, 4);
INSERT INTO public.moon VALUES (16, 'moon 16', 5000, NULL, NULL, 5);
INSERT INTO public.moon VALUES (17, 'moon 17', 5000, NULL, NULL, 6);
INSERT INTO public.moon VALUES (18, 'moon18', 5000, NULL, NULL, 7);
INSERT INTO public.moon VALUES (19, 'moon19', 5000, NULL, NULL, 8);
INSERT INTO public.moon VALUES (20, 'moon20', 5000, NULL, NULL, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet 1', 12000, NULL, 1);
INSERT INTO public.planet VALUES (2, 'planet 2', 13000, NULL, 1);
INSERT INTO public.planet VALUES (3, 'planet 3', 13000, NULL, 1);
INSERT INTO public.planet VALUES (4, 'planet 4', 13000, NULL, 1);
INSERT INTO public.planet VALUES (5, 'planet 5', 13000, NULL, 1);
INSERT INTO public.planet VALUES (6, 'planet 6', 13000, NULL, 1);
INSERT INTO public.planet VALUES (7, 'planet 7', 13000, NULL, 2);
INSERT INTO public.planet VALUES (8, 'planet 8', 13000, NULL, 3);
INSERT INTO public.planet VALUES (9, 'planet 9', 13000, NULL, 3);
INSERT INTO public.planet VALUES (10, 'planet 10', 13000, NULL, 4);
INSERT INTO public.planet VALUES (11, 'planet 11', 13000, NULL, 5);
INSERT INTO public.planet VALUES (12, 'planet 12', 13000, NULL, 6);


--
-- Data for Name: planet_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moons VALUES ('tesst 1', NULL, 1, 2, 3, 1);
INSERT INTO public.planet_moons VALUES ('tesst 2', NULL, 2, 4, 5, 4);
INSERT INTO public.planet_moons VALUES ('tesst 3', NULL, 4, 3, 6, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star 1', 12000, NULL, 1);
INSERT INTO public.star VALUES (2, 'star 2', 12000, NULL, 2);
INSERT INTO public.star VALUES (3, 'star 3', 12000, NULL, 3);
INSERT INTO public.star VALUES (4, 'star 4', 12000, NULL, 4);
INSERT INTO public.star VALUES (5, 'star 5', 12000, NULL, 5);
INSERT INTO public.star VALUES (6, 'star 6', 12000, NULL, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moons_planet_moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moons_planet_moons_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_moons planet_moons_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_id_key UNIQUE (id);


--
-- Name: planet_moons planet_moons_id_moon_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_id_moon_key UNIQUE (id_moon);


--
-- Name: planet_moons planet_moons_id_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_id_planet_key UNIQUE (id_planet);


--
-- Name: planet_moons planet_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_pkey PRIMARY KEY (planet_moons_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


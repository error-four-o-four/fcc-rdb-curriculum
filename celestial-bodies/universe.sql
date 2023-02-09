--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    description_id integer NOT NULL,
    text text,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_description_id_seq OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(20),
    mass_solar character varying(10),
    size_ly integer,
    stars_amount character varying(10)
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
    radius_km integer,
    planet_id integer,
    mass numeric
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
    radius_earth numeric,
    mass_earth numeric,
    star_id integer,
    has_moons boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    distance_ly integer,
    mass_solar numeric,
    radius_solar numeric,
    has_planets boolean,
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
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_description_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES (1, 'The Sun is the star at the center of the Solar System.', NULL, 1, NULL, 'Sun');
INSERT INTO public.description VALUES (2, 'Earth is the third planet from the Sun and home to all known life. While large volumes of water can be found throughout the Solar System, only Earth sustains liquid surface water.', NULL, NULL, 3, 'Earth');
INSERT INTO public.description VALUES (3, 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, only being larger than Mercury.', NULL, NULL, 4, 'Mars');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sb Sbc SB(rs)bc', '1.15e12', 87400, '1-4e11');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'SA(s)b', '1.5e12', 152300, '1e12');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'SA(s)cd', '5e10', 61120, '4e10');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'SB(s)m', '1e10', 32200, '2e10');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'SB(s)m pec', NULL, 18900, '3e9');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'S0 pec', NULL, 60200, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Deimos', NULL, 4, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 4, NULL);
INSERT INTO public.moon VALUES (3, 'Amalthea', 170, 5, NULL);
INSERT INTO public.moon VALUES (4, 'Thebe', 100, 5, NULL);
INSERT INTO public.moon VALUES (5, 'Io', NULL, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Europa', NULL, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Ganymede', 5260, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Callisto', 4800, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Himalia', 185, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Enceladus', NULL, 6, NULL);
INSERT INTO public.moon VALUES (11, 'Titan', 5149, 6, NULL);
INSERT INTO public.moon VALUES (12, 'Mimas', 396, 6, NULL);
INSERT INTO public.moon VALUES (13, 'Tethys', 1062, 6, NULL);
INSERT INTO public.moon VALUES (14, 'Dione', 1123, 6, NULL);
INSERT INTO public.moon VALUES (15, 'Rhea', 1527, 6, NULL);
INSERT INTO public.moon VALUES (16, 'Iapetus', 1470, 6, NULL);
INSERT INTO public.moon VALUES (17, 'Ariel', NULL, 7, NULL);
INSERT INTO public.moon VALUES (18, 'Oberon', NULL, 7, NULL);
INSERT INTO public.moon VALUES (19, 'Puck', NULL, 7, NULL);
INSERT INTO public.moon VALUES (20, 'Galatea', 176, 8, NULL);
INSERT INTO public.moon VALUES (21, 'Larissa', 194, 8, NULL);
INSERT INTO public.moon VALUES (22, 'Proteus', 420, 8, NULL);
INSERT INTO public.moon VALUES (23, 'Triton', 2705, 8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', NULL, 1.27, 6, NULL);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', NULL, 7, 6, NULL);
INSERT INTO public.planet VALUES (12, 'Lalande 21185 b', NULL, 2.69, 7, NULL);
INSERT INTO public.planet VALUES (13, 'Lalande 21185 c', NULL, 13.6, 7, NULL);
INSERT INTO public.planet VALUES (14, 'Epsilon Eridani b', NULL, 248, 8, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, 1, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, 1, true);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, 1, true);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, 1, true);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1.0, 1.0, true, 1);
INSERT INTO public.star VALUES (2, 'Barnard`s Star', 5963, 0.160, 0.194, false, 1);
INSERT INTO public.star VALUES (3, 'Wolf 359', 7856, 0.110, 0.144, false, 1);
INSERT INTO public.star VALUES (4, 'Alpha Canis Majoris A', 8583, 1.714, 2.063, false, 1);
INSERT INTO public.star VALUES (5, 'Alpha Canis Majoris B', 8583, 0.0081, 1.018, false, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 4246, 0.122, 0.154, true, 1);
INSERT INTO public.star VALUES (7, 'Lalande 21185', 8304, 0.389, 0.392, true, 1);
INSERT INTO public.star VALUES (8, 'Epsilon Eridani', 10480, 0.847, 0.702, true, 1);
INSERT INTO public.star VALUES (9, 'Delta Andromedae', NULL, 1.3, 13.6, false, 2);
INSERT INTO public.star VALUES (10, 'Epsilon Andromedae', NULL, 1.01, 9.04, false, 2);


--
-- Name: description_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_description_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: description description_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_name_key UNIQUE (name);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


--
-- Name: description description_text_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_text_key UNIQUE (text);


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
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: description fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: description fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: description fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


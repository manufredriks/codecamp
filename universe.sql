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
    name character varying(30),
    galaxy_type text DEFAULT 0 NOT NULL,
    distance_to_earth_years numeric(10,3) DEFAULT 0 NOT NULL,
    discovered_year integer
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
-- Name: life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life (
    planet_id integer NOT NULL,
    has_life boolean NOT NULL,
    name character varying(30) NOT NULL,
    life_id integer NOT NULL,
    known_by_human boolean
);


ALTER TABLE public.life OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_life_id_seq OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_life_id_seq OWNED BY public.life.life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_orbit character varying(30),
    diameter integer DEFAULT 0 NOT NULL,
    discovered_year integer,
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
-- Name: moon_reorder; Type: VIEW; Schema: public; Owner: freecodecamp
--

CREATE VIEW public.moon_reorder AS
 SELECT set.moon_id,
    set.name,
    set.planet_orbit,
    set.diameter,
    set.discovered_year,
    set.planet_id
   FROM public.moon set
  ORDER BY set.moon_id;


ALTER TABLE public.moon_reorder OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30),
    star_orbit character varying(30),
    age_million_years numeric NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    star_id integer
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
-- Name: planet_reorder; Type: VIEW; Schema: public; Owner: freecodecamp
--

CREATE VIEW public.planet_reorder AS
 SELECT set.planet_id,
    set.name,
    set.age_million_years,
    set.is_spherical,
    set.star_orbit,
    set.star_id
   FROM public.planet set
  ORDER BY set.planet_id;


ALTER TABLE public.planet_reorder OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy character varying(100) NOT NULL,
    solar_luminosity numeric(10,2) NOT NULL,
    constellation character varying(100) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

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
-- Name: life life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life ALTER COLUMN life_id SET DEFAULT nextval('public.life_life_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Espiral barrada', 0.000, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.537, 964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Espiral', 2.730, 1654);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Irregular', 0.200, 1519);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irregular', 0.163, 964);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53.500, 1781);


--
-- Data for Name: life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life VALUES (2, false, 'Mercurio', 3, false);
INSERT INTO public.life VALUES (3, false, 'Marte', 4, false);
INSERT INTO public.life VALUES (4, false, 'Venus', 5, false);
INSERT INTO public.life VALUES (5, false, 'Júpiter', 6, false);
INSERT INTO public.life VALUES (6, false, 'Saturno', 7, false);
INSERT INTO public.life VALUES (9, false, 'Neptuno', 8, false);
INSERT INTO public.life VALUES (8, false, 'Urano', 9, false);
INSERT INTO public.life VALUES (11, false, '55 Cancri e', 10, false);
INSERT INTO public.life VALUES (7, false, 'Proxima Centauri b', 11, false);
INSERT INTO public.life VALUES (12, false, 'Proxima b', 12, false);
INSERT INTO public.life VALUES (10, false, '55 Cancri b', 13, false);
INSERT INTO public.life VALUES (1, true, 'Earth', 2, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Fobos', 'Marte', 22, 1877, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Marte', 12, 1877, 3);
INSERT INTO public.moon VALUES (4, 'Ío', 'Júpiter', 3643, 1610, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Júpiter', 3122, 1610, 5);
INSERT INTO public.moon VALUES (6, 'Ganimedes', 'Júpiter', 5268, 1610, 5);
INSERT INTO public.moon VALUES (7, 'Calisto', 'Júpiter', 4821, 1610, 5);
INSERT INTO public.moon VALUES (8, 'Titán', 'Saturno', 5150, 1655, 6);
INSERT INTO public.moon VALUES (9, 'Encélado', 'Saturno', 504, 1789, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Saturno', 396, 1789, 6);
INSERT INTO public.moon VALUES (11, 'Rea', 'Saturno', 1528, 1672, 6);
INSERT INTO public.moon VALUES (12, 'Miranda', 'Urano', 471, 1948, 8);
INSERT INTO public.moon VALUES (13, 'Triton', 'Neptuno', 2706, 1846, 9);
INSERT INTO public.moon VALUES (14, 'Nereida', 'Neptuno', 340, 1949, 9);
INSERT INTO public.moon VALUES (15, 'Titania', 'Urano', 1578, 1787, 8);
INSERT INTO public.moon VALUES (16, 'Oberón', 'Urano', 1522, 1787, 8);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Urano', 1158, 1851, 8);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Urano', 1169, 1851, 8);
INSERT INTO public.moon VALUES (19, 'Proteo', 'Neptuno', 420, 1989, 9);
INSERT INTO public.moon VALUES (20, 'Himalia', 'Júpiter', 170, 1904, 5);
INSERT INTO public.moon VALUES (21, 'Elara', 'Júpiter', 86, 1905, 5);
INSERT INTO public.moon VALUES (1, 'Luna', 'Earth', 3474, 0, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 'Sol', 4.6, 1, true, 1);
INSERT INTO public.planet VALUES ('Mercurio', 'Sol', 4.5, 2, false, 1);
INSERT INTO public.planet VALUES ('Marte', 'Sol', 4.6, 3, false, 1);
INSERT INTO public.planet VALUES ('Venus', 'Sol', 4.5, 4, true, 1);
INSERT INTO public.planet VALUES ('Júpiter', 'Sol', 4.6, 5, false, 1);
INSERT INTO public.planet VALUES ('Saturno', 'Sol', 4.6, 6, false, 1);
INSERT INTO public.planet VALUES ('Neptuno', 'Sol', 6000, 9, false, 1);
INSERT INTO public.planet VALUES ('Urano', 'Sol', 2.9, 8, false, 1);
INSERT INTO public.planet VALUES ('55 Cancri e', '55 Cancri', 8000, 11, false, 3);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 'Proxima Centauri', 4.8, 7, true, 2);
INSERT INTO public.planet VALUES ('Proxima b', 'Proxima Centauri', 4850, 12, true, 2);
INSERT INTO public.planet VALUES ('55 Cancri b', '55 Cancri ', 4000, 10, true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Milky Way', 1.00, 'Sol', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Milky Way', 0.00, 'Centaurus', 1);
INSERT INTO public.star VALUES (3, '55 Cancri', 'Milky Way', 0.53, 'Cancer', 1);
INSERT INTO public.star VALUES (4, 'Sirius A', 'Milky Way', 25.40, 'Canis Major', 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Milky Way', 126000.00, 'Orion', 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'Milky Way', 120000.00, 'Orion', 1);
INSERT INTO public.star VALUES (7, 'Canopus', 'Milky Way', 10700.00, 'Carina', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: life_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_life_id_seq', 14, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 2, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: life life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_pkey PRIMARY KEY (life_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: life unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: life life_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--


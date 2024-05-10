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
    name character varying(60) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_types_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(60) NOT NULL,
    color text NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(60) NOT NULL,
    moon_id integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    star_id integer,
    planet_types_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(60) NOT NULL,
    color text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (0, 'Milky Way', 'The Milky Way galaxy is a collection of stars, planets, gas, and dust spanning around 100 000 light-years from the galactic centre.', true, false, 13610000, 0);
INSERT INTO public.galaxy VALUES (1, 'Whirlpool', 'The Whirlpool Galaxy, also known as M51 or NGC 5194, is a stunning spiral galaxy located about 23 million light-years away in the constellations Canes Venatici. Its distinctive  spiral arms are adorned with young, bright stars and pinkish clouds od glowing Hydrogen gas.', false, false, 400300, 2);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'In the vast cosmic canvas, Andromed glides, a celestial ballerina draped in veils of stardust.', false, false, 2537000, 0);
INSERT INTO public.galaxy VALUES (3, 'The Triangulum Galaxy', 'The Triangulum galaxy, also known as  Messier 33, is a spherical galaxy located approximately 3 million light-years from Earth in the constellation Triangulum.', false, false, 860000, 3);
INSERT INTO public.galaxy VALUES (4, 'The Sombrero Galaxy', 'The Sombrero galaxy, also known as Messier 104, captivates with its striking appearance-a luminous spiral disk capped by a dust lane resembling a broad-brimmed hat.', false, false, 90000, 4);
INSERT INTO public.galaxy VALUES (5, 'The Large Magellanic Cloud', 'The Large Magellanic Cloud(LMC), a satellite galaxy of the Milky Way, enchants with its ethereal glow in the Southern skies.', false, false, 13000000, 5);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (0, 'Milky Way', 'Bright Blue');
INSERT INTO public.galaxy_types VALUES (1, 'Andromeda', 'Yellow');
INSERT INTO public.galaxy_types VALUES (2, 'Whirlpool', 'Blue-Red');
INSERT INTO public.galaxy_types VALUES (3, 'The Triangulum Galaxy', 'pink');
INSERT INTO public.galaxy_types VALUES (4, 'The Sombrero', 'white');
INSERT INTO public.galaxy_types VALUES (5, 'The Large Magellanic Cloud', 'purple');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 0, 'Majestic, barren, cratered,luminous.', false, true, 4500, 3844.00, 0);
INSERT INTO public.moon VALUES ('Phoebe', 1, 'Titan, moon, Greek mythology.', false, true, 1000, 200.00, 0);
INSERT INTO public.moon VALUES ('Fonik', 2, 'Phonetic, spelling, sound, language.', false, true, 2400, 700.00, 0);
INSERT INTO public.moon VALUES ('Phobos', 3, 'Moon of Mars, irregular, smaller,cratered.', false, true, 2000, 225.00, 1);
INSERT INTO public.moon VALUES ('Deimos', 4, 'Moon of Mars, irregular, small, cratered.', false, true, 2000, 226.00, 1);
INSERT INTO public.moon VALUES ('Nickson', 5, 'Unique, personal, surname, potential.', false, true, 2000, 227.00, 1);
INSERT INTO public.moon VALUES ('Roboto', 6, 'Mechanical, humanoid, artificial.', false, true, 1100, 410.00, 2);
INSERT INTO public.moon VALUES ('Picasso', 7, 'Arty, colourful, bright.', false, true, 700, 411.00, 2);
INSERT INTO public.moon VALUES ('Gomez', 8, 'Bright.', false, true, 700, 412.00, 2);
INSERT INTO public.moon VALUES ('Ruby', 9, 'Bright.', false, true, 7000, 422.00, 2);
INSERT INTO public.moon VALUES ('Andre', 10, 'Cratered, irregular, captivating.', false, true, 2180, 480.00, 3);
INSERT INTO public.moon VALUES ('Chockits', 11, 'Cold.', false, true, 2115, 202.00, 3);
INSERT INTO public.moon VALUES ('Kop', 12, 'Cold.', false, true, 2107, 4007.00, 3);
INSERT INTO public.moon VALUES ('Corona', 13, 'Smaller, irregular.', false, true, 180, 900.00, 4);
INSERT INTO public.moon VALUES ('Blackish', 14, 'Irregulary.', false, true, 900, 251.00, 4);
INSERT INTO public.moon VALUES ('Titan', 15, 'Cold, transparent,Cloudy.', false, true, 800, 300.00, 4);
INSERT INTO public.moon VALUES ('Bogus', 16, '', false, true, 900, 130.00, 5);
INSERT INTO public.moon VALUES ('Loco Munch', 17, '', false, true, 500, 600.00, 5);
INSERT INTO public.moon VALUES ('Freezer', 18, '', false, true, 2001, 701.00, 5);
INSERT INTO public.moon VALUES ('Kimberley', 19, '', false, true, 301, 141.00, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mars', 1, 'Red, barren, dusty, cold, rocky, thin atmosphere, potential for colonization.', false, true, 4600, 225.00, 0, 0);
INSERT INTO public.planet VALUES ('Venus', 2, 'Hot, acidic, thick atmosphere, volcanic, rocky, dense, hostile to life.', false, true, 450, 4100.00, 0, 0);
INSERT INTO public.planet VALUES ('Mercury', 3, 'Small, rocky, cratered, hot, closest to the Sun,, sparse atmosphere.', false, true, 4500, 290.00, 0, 1);
INSERT INTO public.planet VALUES ('Uranus', 4, 'Cold, icy, blue-green, tilted-axis, gas giant, rings, distant.', false, true, 4500, 4500.00, 1, 1);
INSERT INTO public.planet VALUES ('Neptune', 5, 'Blue, icy, stormy,gas giant,distant, rings, mysterious,windy, cold.', false, true, 45000, 450.00, 1, 1);
INSERT INTO public.planet VALUES ('Saturn', 6, 'Ringed, gas giant, yellowish-brown,v hexagonal-storm, icy moons, majestic rings.', false, true, 45000, 1400.00, 2, 2);
INSERT INTO public.planet VALUES ('Jupiter', 7, 'Giant, gas planet, striped, stormy, red spot, many moons, massive.', false, true, 400, 778.00, 2, 2);
INSERT INTO public.planet VALUES ('Hot Jane', 8, 'Gas giant exoplanet, close to its star, hot, massive,intriguing.', false, true, 1361, 7780.00, 2, 2);
INSERT INTO public.planet VALUES ('Lousy Horse', 9, 'Brown, dense, toxic, hot, full of character.', false, true, 440, 500.00, 3, 2);
INSERT INTO public.planet VALUES ('Pet', 10, 'Yellow, volcanic, hot, gas giant.', false, true, 900, 650.00, 4, 2);
INSERT INTO public.planet VALUES ('Horris', 11, 'Enchanting, warm, can almost carry life. ', false, true, 1300, 55.67, 5, 1);
INSERT INTO public.planet VALUES ('Earth', 0, 'Earth, cradle of life, adorned in sapphire seas and emarald Forests, a jewel in the velvet expanse of space.', true, false, 4530, 0.00, 0, 0);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (0, 'Terrestial Planets', 'Red');
INSERT INTO public.planet_types VALUES (1, 'Ice Giants', 'Red');
INSERT INTO public.planet_types VALUES (2, 'Gas Giants', 'Brown');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (0, 'Aquila', 'It is a constellation on the celestial equator. It is Latin for "eagle".', false, true, 17, 100.00, 0);
INSERT INTO public.star VALUES (1, 'Alkaid', 'In the tapestry of cosmic hues, Alkaid, a celestial whisper, dances gracefully within the spiralling arms of the Whirlpool galaxy.', false, true, 10, 1.00, 2);
INSERT INTO public.star VALUES (2, 'Alpheratz', 'Alpheratz, the jewel of Andromeda, a solitary sentinel ablaze in the velvet tapestry of space.', false, true, 10010000, 2.00, 1);
INSERT INTO public.star VALUES (3, 'Triangulum Galaxy1', 'Triangulum Galaxy1, a stellar beacon nestled within the spiral arms of its galactic host, burns with a steady brilliance. Its spectral signature reveals a sun-like composition , with Hydrogen fueling its nuclear furnace deep within.', false, true, 77000000, 3000000.00, 3);
INSERT INTO public.star VALUES (4, 'Sirius', 'Sirius, the brightest star in the night sky, captivates with its luminous blue-white brilliance.', false, true, 300000000, 8600000.00, 0);
INSERT INTO public.star VALUES (5, 'Procyon', 'Procyon, the "Little Dog" star, graces the night sky as the eighth-brightest star, nestled in the Constellation Canis Minor, comprising a main sequence star, Procyon A and a faint white dwarf companion Procyon B.', false, true, 17000, 11460.00, 0);


--
-- Name: galaxy galaxy_age_in_millions_of_years_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_age_in_millions_of_years_key UNIQUE (age_in_millions_of_years);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_distance_from_earth_key UNIQUE (distance_from_earth);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_distance_from_earth_key UNIQUE (distance_from_earth);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_distance_from_earth_key UNIQUE (distance_from_earth);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_types_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


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


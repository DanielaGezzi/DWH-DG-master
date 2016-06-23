--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2016-06-21 23:25:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16659)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16660)
-- Name: Anno Accademico; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Anno Accademico" (
    "KAnnoAccademico" integer NOT NULL,
    "NomeAnnoX" integer,
    "NomeAnnoX-1" integer,
    "NomeAnnoX-1/X" character varying
);


ALTER TABLE "Anno Accademico" OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16666)
-- Name: Corso; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Corso" (
    "KCorso" integer NOT NULL,
    "Nome" text,
    "NumeroCFU" numeric,
    "SSD" text,
    "CodiceCorso" text
);


ALTER TABLE "Corso" OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16672)
-- Name: CorsoDiStudi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "CorsoDiStudi" (
    "KCorsoDiStudio" integer NOT NULL,
    "NomeCds" text,
    "TipoCds" text,
    "NomeDipartimento" text,
    "CodiceAteneo" text,
    "CodiceDipartimento" character varying,
    "CodiceCds" character varying,
    "AnnoValidita" character varying
);


ALTER TABLE "CorsoDiStudi" OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16678)
-- Name: Esami; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Esami" (
    "KStudente" integer NOT NULL,
    "KAnnoAccademico" integer NOT NULL,
    "KTempo" integer NOT NULL,
    "KCorsoDiStudio" integer NOT NULL,
    "KCorso" integer NOT NULL,
    "VotoEsame" integer,
    "CFUEsame" integer
);


ALTER TABLE "Esami" OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16681)
-- Name: Ingressi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Ingressi" (
    "KStudente" integer NOT NULL,
    "KAnnoAccademico" integer NOT NULL,
    "KCorsoDiStudio" integer NOT NULL,
    "KTempo" integer NOT NULL,
    "KTipoImmatricolazione" integer NOT NULL,
    "PunteggioTestAmmissione" text,
    "Immatricolato" integer,
    "Evento" character(2) NOT NULL
);


ALTER TABLE "Ingressi" OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16693)
-- Name: Lauree; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Lauree" (
    "KStudente" integer NOT NULL,
    "KCorsoDiStudio" integer NOT NULL,
    "KAnnoAccademico" integer NOT NULL,
    "KTempo" integer NOT NULL,
    "VotoLaurea" character varying
);


ALTER TABLE "Lauree" OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16699)
-- Name: Studente; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Studente" (
    "KStudente" integer NOT NULL,
    "TitoloDiStudio" text,
    "RegioneResidenza" text,
    "ProvinciaResidenza" text,
    "ComuneResidenza" text,
    "Sesso" text,
    "Cittadinanza" text,
    "StatoResidenza" text,
    "VotoScuolaMediaSuperiore" text,
    "NazioneDiploma" text,
    "TipoScuolaMediaSuperiore" text,
    "DataDiNascita" character varying,
    "Coorte" integer,
    "AnnoDiploma" integer,
    "CF" text
);


ALTER TABLE "Studente" OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16705)
-- Name: Tempo; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Tempo" (
    "KTempo" integer NOT NULL,
    "Anno" integer,
    "Mese" integer,
    "Giorno" integer
);


ALTER TABLE "Tempo" OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16708)
-- Name: Tipo Immatricolazione; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE "Tipo Immatricolazione" (
    "KTipoImmatricolazione" integer NOT NULL,
    "TipoImmatricolazione" text,
    "CodiceTipoImmatricolazione" character(1)
);


ALTER TABLE "Tipo Immatricolazione" OWNER TO postgres;

--
-- TOC entry 2019 (class 2606 OID 16716)
-- Name: Anno Accademico_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Anno Accademico"
    ADD CONSTRAINT "Anno Accademico_pkey" PRIMARY KEY ("KAnnoAccademico");


--
-- TOC entry 2023 (class 2606 OID 16720)
-- Name: CorsoDiStudi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "CorsoDiStudi"
    ADD CONSTRAINT "CorsoDiStudi_pkey" PRIMARY KEY ("KCorsoDiStudio");


--
-- TOC entry 2021 (class 2606 OID 16718)
-- Name: Corso_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Corso"
    ADD CONSTRAINT "Corso_pkey" PRIMARY KEY ("KCorso");


--
-- TOC entry 2025 (class 2606 OID 16722)
-- Name: Esami_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Esami"
    ADD CONSTRAINT "Esami_pkey" PRIMARY KEY ("KStudente", "KAnnoAccademico", "KTempo", "KCorsoDiStudio", "KCorso");


--
-- TOC entry 2027 (class 2606 OID 16724)
-- Name: Ingressi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Ingressi"
    ADD CONSTRAINT "Ingressi_pkey" PRIMARY KEY ("KStudente", "KAnnoAccademico", "KCorsoDiStudio", "KTempo", "KTipoImmatricolazione");


--
-- TOC entry 2029 (class 2606 OID 16726)
-- Name: Lauree_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Lauree"
    ADD CONSTRAINT "Lauree_pkey" PRIMARY KEY ("KStudente", "KCorsoDiStudio", "KAnnoAccademico", "KTempo");


--
-- TOC entry 2031 (class 2606 OID 16728)
-- Name: Studente_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Studente"
    ADD CONSTRAINT "Studente_pkey" PRIMARY KEY ("KStudente");


--
-- TOC entry 2033 (class 2606 OID 16730)
-- Name: Tempo_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Tempo"
    ADD CONSTRAINT "Tempo_pkey" PRIMARY KEY ("KTempo");


--
-- TOC entry 2035 (class 2606 OID 16732)
-- Name: Tipo Immatricolazione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY "Tipo Immatricolazione"
    ADD CONSTRAINT "Tipo Immatricolazione_pkey" PRIMARY KEY ("KTipoImmatricolazione");


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 7
-- Name: AVA; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA "AVA" FROM PUBLIC;
REVOKE ALL ON SCHEMA "AVA" FROM postgres;
GRANT ALL ON SCHEMA "AVA" TO postgres;


-- Completed on 2016-06-21 23:25:35

--
-- PostgreSQL database dump complete
--


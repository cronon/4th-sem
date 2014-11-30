--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(255)
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: clubs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE clubs (
    id integer NOT NULL,
    name character varying(255),
    description text,
    address character varying(255),
    photo character varying(255),
    city character varying(255),
    web_site character varying(255),
    metro character varying(255),
    email character varying(255),
    user_id integer,
    category_id integer
);


--
-- Name: clubs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE clubs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clubs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE clubs_id_seq OWNED BY clubs.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    content text,
    created_at timestamp without time zone,
    user_id integer,
    club_id integer
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE news (
    id integer NOT NULL,
    title character varying(255),
    content text,
    created_at timestamp without time zone,
    club_id integer
);


--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE news_id_seq OWNED BY news.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    "time" time without time zone,
    confirmation character varying(255),
    comment text,
    user_id integer,
    table_id integer
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: rates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rates (
    id integer NOT NULL,
    stars integer,
    club_id integer,
    rating_type_id integer,
    user_id integer
);


--
-- Name: rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rates_id_seq OWNED BY rates.id;


--
-- Name: rating_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rating_types (
    id integer NOT NULL
);


--
-- Name: rating_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rating_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rating_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rating_types_id_seq OWNED BY rating_types.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: subscribes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE subscribes (
    id integer NOT NULL,
    club_id integer,
    user_id integer
);


--
-- Name: subscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subscribes_id_seq OWNED BY subscribes.id;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tables (
    id integer NOT NULL,
    seats integer,
    club_id integer
);


--
-- Name: tables_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tables_id_seq OWNED BY tables.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    password character varying(255)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY clubs ALTER COLUMN id SET DEFAULT nextval('clubs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rates ALTER COLUMN id SET DEFAULT nextval('rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rating_types ALTER COLUMN id SET DEFAULT nextval('rating_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscribes ALTER COLUMN id SET DEFAULT nextval('subscribes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tables ALTER COLUMN id SET DEFAULT nextval('tables_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: clubs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY clubs
    ADD CONSTRAINT clubs_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: news_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rates
    ADD CONSTRAINT rates_pkey PRIMARY KEY (id);


--
-- Name: rating_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rating_types
    ADD CONSTRAINT rating_types_pkey PRIMARY KEY (id);


--
-- Name: subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY subscribes
    ADD CONSTRAINT subscribes_pkey PRIMARY KEY (id);


--
-- Name: tables_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_clubs_on_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_clubs_on_category_id ON clubs USING btree (category_id);


--
-- Name: index_comments_on_club_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_club_id ON comments USING btree (club_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_news_on_club_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_news_on_club_id ON news USING btree (club_id);


--
-- Name: index_orders_on_table_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_orders_on_table_id ON orders USING btree (table_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_orders_on_user_id ON orders USING btree (user_id);


--
-- Name: index_rates_on_club_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rates_on_club_id ON rates USING btree (club_id);


--
-- Name: index_rates_on_rating_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rates_on_rating_type_id ON rates USING btree (rating_type_id);


--
-- Name: index_rates_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rates_on_user_id ON rates USING btree (user_id);


--
-- Name: index_subscribes_on_club_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscribes_on_club_id ON subscribes USING btree (club_id);


--
-- Name: index_subscribes_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscribes_on_user_id ON subscribes USING btree (user_id);


--
-- Name: index_tables_on_club_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_tables_on_club_id ON tables USING btree (club_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20141130093040');

INSERT INTO schema_migrations (version) VALUES ('20141130100432');

INSERT INTO schema_migrations (version) VALUES ('20141130101308');

INSERT INTO schema_migrations (version) VALUES ('20141130101517');

INSERT INTO schema_migrations (version) VALUES ('20141130101908');

INSERT INTO schema_migrations (version) VALUES ('20141130102043');

INSERT INTO schema_migrations (version) VALUES ('20141130102222');

INSERT INTO schema_migrations (version) VALUES ('20141130102614');

INSERT INTO schema_migrations (version) VALUES ('20141130102742');

INSERT INTO schema_migrations (version) VALUES ('20141130102931');

INSERT INTO schema_migrations (version) VALUES ('20141130163906');

INSERT INTO schema_migrations (version) VALUES ('20141130165612');


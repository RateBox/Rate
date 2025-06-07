--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: JOY
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO "JOY";

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: JOY
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_permissions OWNER TO "JOY";

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_id_seq OWNER TO "JOY";

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.admin_permissions_role_lnk OWNER TO "JOY";

--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNER TO "JOY";

--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_roles OWNER TO "JOY";

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_roles_id_seq OWNER TO "JOY";

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_users OWNER TO "JOY";

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_id_seq OWNER TO "JOY";

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);


ALTER TABLE public.admin_users_roles_lnk OWNER TO "JOY";

--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNER TO "JOY";

--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    slug character varying(255),
    description jsonb,
    is_active boolean
);


ALTER TABLE public.categories OWNER TO "JOY";

--
-- Name: categories_directory_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.categories_directory_lnk (
    id integer NOT NULL,
    category_id integer,
    directory_id integer,
    category_ord double precision
);


ALTER TABLE public.categories_directory_lnk OWNER TO "JOY";

--
-- Name: categories_directory_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.categories_directory_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_directory_lnk_id_seq OWNER TO "JOY";

--
-- Name: categories_directory_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.categories_directory_lnk_id_seq OWNED BY public.categories_directory_lnk.id;


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO "JOY";

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: categories_listing_type_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.categories_listing_type_lnk (
    id integer NOT NULL,
    category_id integer,
    listing_type_id integer,
    category_ord double precision
);


ALTER TABLE public.categories_listing_type_lnk OWNER TO "JOY";

--
-- Name: categories_listing_type_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.categories_listing_type_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_listing_type_lnk_id_seq OWNER TO "JOY";

--
-- Name: categories_listing_type_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.categories_listing_type_lnk_id_seq OWNED BY public.categories_listing_type_lnk.id;


--
-- Name: categories_parent_category_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.categories_parent_category_lnk (
    id integer NOT NULL,
    category_id integer,
    inv_category_id integer,
    category_ord double precision
);


ALTER TABLE public.categories_parent_category_lnk OWNER TO "JOY";

--
-- Name: categories_parent_category_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.categories_parent_category_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_parent_category_lnk_id_seq OWNER TO "JOY";

--
-- Name: categories_parent_category_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.categories_parent_category_lnk_id_seq OWNED BY public.categories_parent_category_lnk.id;


--
-- Name: components_contact_basics; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_contact_basics (
    id integer NOT NULL,
    email character varying(255),
    phone character varying(255),
    website character varying(255)
);


ALTER TABLE public.components_contact_basics OWNER TO "JOY";

--
-- Name: components_contact_basics_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_contact_basics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_contact_basics_id_seq OWNER TO "JOY";

--
-- Name: components_contact_basics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_contact_basics_id_seq OWNED BY public.components_contact_basics.id;


--
-- Name: components_contact_locations; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_contact_locations (
    id integer NOT NULL,
    address character varying(255)
);


ALTER TABLE public.components_contact_locations OWNER TO "JOY";

--
-- Name: components_contact_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_contact_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_contact_locations_id_seq OWNER TO "JOY";

--
-- Name: components_contact_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_contact_locations_id_seq OWNED BY public.components_contact_locations.id;


--
-- Name: components_contact_social_medias; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_contact_social_medias (
    id integer NOT NULL,
    facebook character varying(255),
    instagram character varying(255),
    you_tube character varying(255),
    tik_tok character varying(255),
    linked_in character varying(255),
    discord character varying(255),
    telegram character varying(255)
);


ALTER TABLE public.components_contact_social_medias OWNER TO "JOY";

--
-- Name: components_contact_social_medias_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_contact_social_medias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_contact_social_medias_id_seq OWNER TO "JOY";

--
-- Name: components_contact_social_medias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_contact_social_medias_id_seq OWNED BY public.components_contact_social_medias.id;


--
-- Name: components_elements_footer_items; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_elements_footer_items (
    id integer NOT NULL,
    title character varying(255)
);


ALTER TABLE public.components_elements_footer_items OWNER TO "JOY";

--
-- Name: components_elements_footer_items_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_elements_footer_items_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_elements_footer_items_cmps OWNER TO "JOY";

--
-- Name: components_elements_footer_items_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_elements_footer_items_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_elements_footer_items_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_elements_footer_items_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_elements_footer_items_cmps_id_seq OWNED BY public.components_elements_footer_items_cmps.id;


--
-- Name: components_elements_footer_items_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_elements_footer_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_elements_footer_items_id_seq OWNER TO "JOY";

--
-- Name: components_elements_footer_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_elements_footer_items_id_seq OWNED BY public.components_elements_footer_items.id;


--
-- Name: components_forms_contact_forms; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_forms_contact_forms (
    id integer NOT NULL,
    title character varying(255),
    description text
);


ALTER TABLE public.components_forms_contact_forms OWNER TO "JOY";

--
-- Name: components_forms_contact_forms_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_forms_contact_forms_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_forms_contact_forms_cmps OWNER TO "JOY";

--
-- Name: components_forms_contact_forms_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_forms_contact_forms_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_forms_contact_forms_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_forms_contact_forms_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_forms_contact_forms_cmps_id_seq OWNED BY public.components_forms_contact_forms_cmps.id;


--
-- Name: components_forms_contact_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_forms_contact_forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_forms_contact_forms_id_seq OWNER TO "JOY";

--
-- Name: components_forms_contact_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_forms_contact_forms_id_seq OWNED BY public.components_forms_contact_forms.id;


--
-- Name: components_forms_newsletter_forms; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_forms_newsletter_forms (
    id integer NOT NULL,
    title character varying(255),
    description text
);


ALTER TABLE public.components_forms_newsletter_forms OWNER TO "JOY";

--
-- Name: components_forms_newsletter_forms_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_forms_newsletter_forms_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_forms_newsletter_forms_cmps OWNER TO "JOY";

--
-- Name: components_forms_newsletter_forms_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_forms_newsletter_forms_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_forms_newsletter_forms_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_forms_newsletter_forms_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_forms_newsletter_forms_cmps_id_seq OWNED BY public.components_forms_newsletter_forms_cmps.id;


--
-- Name: components_forms_newsletter_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_forms_newsletter_forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_forms_newsletter_forms_id_seq OWNER TO "JOY";

--
-- Name: components_forms_newsletter_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_forms_newsletter_forms_id_seq OWNED BY public.components_forms_newsletter_forms.id;


--
-- Name: components_info_bank_infos; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_info_bank_infos (
    id integer NOT NULL,
    name character varying(255),
    swift_bic character varying(255)
);


ALTER TABLE public.components_info_bank_infos OWNER TO "JOY";

--
-- Name: components_info_bank_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_info_bank_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_info_bank_infos_id_seq OWNER TO "JOY";

--
-- Name: components_info_bank_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_info_bank_infos_id_seq OWNED BY public.components_info_bank_infos.id;


--
-- Name: components_media_photos; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_media_photos (
    id integer NOT NULL
);


ALTER TABLE public.components_media_photos OWNER TO "JOY";

--
-- Name: components_media_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_media_photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_media_photos_id_seq OWNER TO "JOY";

--
-- Name: components_media_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_media_photos_id_seq OWNED BY public.components_media_photos.id;


--
-- Name: components_media_videos; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_media_videos (
    id integer NOT NULL,
    you_tube character varying(255)
);


ALTER TABLE public.components_media_videos OWNER TO "JOY";

--
-- Name: components_media_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_media_videos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_media_videos_id_seq OWNER TO "JOY";

--
-- Name: components_media_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_media_videos_id_seq OWNED BY public.components_media_videos.id;


--
-- Name: components_rating_criteria; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_rating_criteria (
    id integer NOT NULL,
    name character varying(255),
    weight numeric(10,2),
    tooltip character varying(255),
    is_required boolean,
    "order" integer,
    icon character varying(255)
);


ALTER TABLE public.components_rating_criteria OWNER TO "JOY";

--
-- Name: components_rating_criteria_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_rating_criteria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_rating_criteria_id_seq OWNER TO "JOY";

--
-- Name: components_rating_criteria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_rating_criteria_id_seq OWNED BY public.components_rating_criteria.id;


--
-- Name: components_review_pro_items; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_review_pro_items (
    id integer NOT NULL,
    item character varying(255)
);


ALTER TABLE public.components_review_pro_items OWNER TO "JOY";

--
-- Name: components_review_pro_items_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_review_pro_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_review_pro_items_id_seq OWNER TO "JOY";

--
-- Name: components_review_pro_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_review_pro_items_id_seq OWNED BY public.components_review_pro_items.id;


--
-- Name: components_review_pros_cons; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_review_pros_cons (
    id integer NOT NULL
);


ALTER TABLE public.components_review_pros_cons OWNER TO "JOY";

--
-- Name: components_review_pros_cons_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_review_pros_cons_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_review_pros_cons_cmps OWNER TO "JOY";

--
-- Name: components_review_pros_cons_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_review_pros_cons_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_review_pros_cons_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_review_pros_cons_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_review_pros_cons_cmps_id_seq OWNED BY public.components_review_pros_cons_cmps.id;


--
-- Name: components_review_pros_cons_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_review_pros_cons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_review_pros_cons_id_seq OWNER TO "JOY";

--
-- Name: components_review_pros_cons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_review_pros_cons_id_seq OWNED BY public.components_review_pros_cons.id;


--
-- Name: components_sections_animated_logo_rows; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_animated_logo_rows (
    id integer NOT NULL,
    text character varying(255)
);


ALTER TABLE public.components_sections_animated_logo_rows OWNER TO "JOY";

--
-- Name: components_sections_animated_logo_rows_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_animated_logo_rows_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_sections_animated_logo_rows_cmps OWNER TO "JOY";

--
-- Name: components_sections_animated_logo_rows_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_animated_logo_rows_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_animated_logo_rows_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_sections_animated_logo_rows_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_animated_logo_rows_cmps_id_seq OWNED BY public.components_sections_animated_logo_rows_cmps.id;


--
-- Name: components_sections_animated_logo_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_animated_logo_rows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_animated_logo_rows_id_seq OWNER TO "JOY";

--
-- Name: components_sections_animated_logo_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_animated_logo_rows_id_seq OWNED BY public.components_sections_animated_logo_rows.id;


--
-- Name: components_sections_carousels; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_carousels (
    id integer NOT NULL,
    radius character varying(255)
);


ALTER TABLE public.components_sections_carousels OWNER TO "JOY";

--
-- Name: components_sections_carousels_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_carousels_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_sections_carousels_cmps OWNER TO "JOY";

--
-- Name: components_sections_carousels_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_carousels_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_carousels_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_sections_carousels_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_carousels_cmps_id_seq OWNED BY public.components_sections_carousels_cmps.id;


--
-- Name: components_sections_carousels_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_carousels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_carousels_id_seq OWNER TO "JOY";

--
-- Name: components_sections_carousels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_carousels_id_seq OWNED BY public.components_sections_carousels.id;


--
-- Name: components_sections_faqs; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_faqs (
    id integer NOT NULL,
    title character varying(255),
    sub_title character varying(255)
);


ALTER TABLE public.components_sections_faqs OWNER TO "JOY";

--
-- Name: components_sections_faqs_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_faqs_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_sections_faqs_cmps OWNER TO "JOY";

--
-- Name: components_sections_faqs_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_faqs_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_faqs_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_sections_faqs_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_faqs_cmps_id_seq OWNED BY public.components_sections_faqs_cmps.id;


--
-- Name: components_sections_faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_faqs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_faqs_id_seq OWNER TO "JOY";

--
-- Name: components_sections_faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_faqs_id_seq OWNED BY public.components_sections_faqs.id;


--
-- Name: components_sections_heading_with_cta_buttons; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_heading_with_cta_buttons (
    id integer NOT NULL,
    title character varying(255),
    sub_text character varying(255)
);


ALTER TABLE public.components_sections_heading_with_cta_buttons OWNER TO "JOY";

--
-- Name: components_sections_heading_with_cta_buttons_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_heading_with_cta_buttons_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_sections_heading_with_cta_buttons_cmps OWNER TO "JOY";

--
-- Name: components_sections_heading_with_cta_buttons_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_heading_with_cta_buttons_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_heading_with_cta_buttons_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_sections_heading_with_cta_buttons_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_heading_with_cta_buttons_cmps_id_seq OWNED BY public.components_sections_heading_with_cta_buttons_cmps.id;


--
-- Name: components_sections_heading_with_cta_buttons_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_heading_with_cta_buttons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_heading_with_cta_buttons_id_seq OWNER TO "JOY";

--
-- Name: components_sections_heading_with_cta_buttons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_heading_with_cta_buttons_id_seq OWNED BY public.components_sections_heading_with_cta_buttons.id;


--
-- Name: components_sections_heroes; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_heroes (
    id integer NOT NULL,
    title character varying(255),
    sub_title character varying(255),
    bg_color character varying(255)
);


ALTER TABLE public.components_sections_heroes OWNER TO "JOY";

--
-- Name: components_sections_heroes_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_heroes_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_sections_heroes_cmps OWNER TO "JOY";

--
-- Name: components_sections_heroes_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_heroes_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_heroes_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_sections_heroes_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_heroes_cmps_id_seq OWNED BY public.components_sections_heroes_cmps.id;


--
-- Name: components_sections_heroes_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_heroes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_heroes_id_seq OWNER TO "JOY";

--
-- Name: components_sections_heroes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_heroes_id_seq OWNED BY public.components_sections_heroes.id;


--
-- Name: components_sections_horizontal_images; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_horizontal_images (
    id integer NOT NULL,
    title character varying(255),
    spacing integer,
    image_radius character varying(255),
    fixed_image_height integer,
    fixed_image_width integer
);


ALTER TABLE public.components_sections_horizontal_images OWNER TO "JOY";

--
-- Name: components_sections_horizontal_images_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_horizontal_images_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_sections_horizontal_images_cmps OWNER TO "JOY";

--
-- Name: components_sections_horizontal_images_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_horizontal_images_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_horizontal_images_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_sections_horizontal_images_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_horizontal_images_cmps_id_seq OWNED BY public.components_sections_horizontal_images_cmps.id;


--
-- Name: components_sections_horizontal_images_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_horizontal_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_horizontal_images_id_seq OWNER TO "JOY";

--
-- Name: components_sections_horizontal_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_horizontal_images_id_seq OWNED BY public.components_sections_horizontal_images.id;


--
-- Name: components_sections_image_with_cta_buttons; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_image_with_cta_buttons (
    id integer NOT NULL,
    title character varying(255),
    sub_text character varying(255)
);


ALTER TABLE public.components_sections_image_with_cta_buttons OWNER TO "JOY";

--
-- Name: components_sections_image_with_cta_buttons_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_sections_image_with_cta_buttons_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_sections_image_with_cta_buttons_cmps OWNER TO "JOY";

--
-- Name: components_sections_image_with_cta_buttons_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_image_with_cta_buttons_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_image_with_cta_buttons_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_sections_image_with_cta_buttons_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_image_with_cta_buttons_cmps_id_seq OWNED BY public.components_sections_image_with_cta_buttons_cmps.id;


--
-- Name: components_sections_image_with_cta_buttons_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_sections_image_with_cta_buttons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_sections_image_with_cta_buttons_id_seq OWNER TO "JOY";

--
-- Name: components_sections_image_with_cta_buttons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_sections_image_with_cta_buttons_id_seq OWNED BY public.components_sections_image_with_cta_buttons.id;


--
-- Name: components_seo_utilities_meta_socials; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_seo_utilities_meta_socials (
    id integer NOT NULL,
    social_network character varying(255),
    title character varying(255),
    description character varying(255)
);


ALTER TABLE public.components_seo_utilities_meta_socials OWNER TO "JOY";

--
-- Name: components_seo_utilities_meta_socials_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_seo_utilities_meta_socials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_seo_utilities_meta_socials_id_seq OWNER TO "JOY";

--
-- Name: components_seo_utilities_meta_socials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_seo_utilities_meta_socials_id_seq OWNED BY public.components_seo_utilities_meta_socials.id;


--
-- Name: components_seo_utilities_seo_ogs; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_seo_utilities_seo_ogs (
    id integer NOT NULL,
    title character varying(255),
    description character varying(255),
    url character varying(255),
    type character varying(255)
);


ALTER TABLE public.components_seo_utilities_seo_ogs OWNER TO "JOY";

--
-- Name: components_seo_utilities_seo_ogs_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_seo_utilities_seo_ogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_seo_utilities_seo_ogs_id_seq OWNER TO "JOY";

--
-- Name: components_seo_utilities_seo_ogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_seo_utilities_seo_ogs_id_seq OWNED BY public.components_seo_utilities_seo_ogs.id;


--
-- Name: components_seo_utilities_seo_twitters; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_seo_utilities_seo_twitters (
    id integer NOT NULL,
    card character varying(255),
    title character varying(255),
    description character varying(255),
    site_id character varying(255),
    creator character varying(255),
    creator_id character varying(255)
);


ALTER TABLE public.components_seo_utilities_seo_twitters OWNER TO "JOY";

--
-- Name: components_seo_utilities_seo_twitters_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_seo_utilities_seo_twitters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_seo_utilities_seo_twitters_id_seq OWNER TO "JOY";

--
-- Name: components_seo_utilities_seo_twitters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_seo_utilities_seo_twitters_id_seq OWNED BY public.components_seo_utilities_seo_twitters.id;


--
-- Name: components_seo_utilities_seos; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_seo_utilities_seos (
    id integer NOT NULL,
    meta_title character varying(255),
    meta_description character varying(255),
    keywords text,
    application_name character varying(255),
    site_name character varying(255),
    email character varying(255),
    canonical_url character varying(255),
    meta_robots character varying(255),
    structured_data jsonb
);


ALTER TABLE public.components_seo_utilities_seos OWNER TO "JOY";

--
-- Name: components_seo_utilities_seos_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_seo_utilities_seos_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_seo_utilities_seos_cmps OWNER TO "JOY";

--
-- Name: components_seo_utilities_seos_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_seo_utilities_seos_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_seo_utilities_seos_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_seo_utilities_seos_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_seo_utilities_seos_cmps_id_seq OWNED BY public.components_seo_utilities_seos_cmps.id;


--
-- Name: components_seo_utilities_seos_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_seo_utilities_seos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_seo_utilities_seos_id_seq OWNER TO "JOY";

--
-- Name: components_seo_utilities_seos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_seo_utilities_seos_id_seq OWNED BY public.components_seo_utilities_seos.id;


--
-- Name: components_seo_utilities_social_icons; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_seo_utilities_social_icons (
    id integer NOT NULL,
    title character varying(255)
);


ALTER TABLE public.components_seo_utilities_social_icons OWNER TO "JOY";

--
-- Name: components_seo_utilities_social_icons_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_seo_utilities_social_icons_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_seo_utilities_social_icons_cmps OWNER TO "JOY";

--
-- Name: components_seo_utilities_social_icons_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_seo_utilities_social_icons_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_seo_utilities_social_icons_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_seo_utilities_social_icons_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_seo_utilities_social_icons_cmps_id_seq OWNED BY public.components_seo_utilities_social_icons_cmps.id;


--
-- Name: components_seo_utilities_social_icons_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_seo_utilities_social_icons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_seo_utilities_social_icons_id_seq OWNER TO "JOY";

--
-- Name: components_seo_utilities_social_icons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_seo_utilities_social_icons_id_seq OWNED BY public.components_seo_utilities_social_icons.id;


--
-- Name: components_shared_meta_socials; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_shared_meta_socials (
    id integer NOT NULL,
    social_network character varying(255),
    title character varying(255),
    description character varying(255)
);


ALTER TABLE public.components_shared_meta_socials OWNER TO "JOY";

--
-- Name: components_shared_meta_socials_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_shared_meta_socials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_shared_meta_socials_id_seq OWNER TO "JOY";

--
-- Name: components_shared_meta_socials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_shared_meta_socials_id_seq OWNED BY public.components_shared_meta_socials.id;


--
-- Name: components_shared_seos; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_shared_seos (
    id integer NOT NULL,
    meta_title character varying(255),
    meta_description character varying(255),
    keywords text,
    meta_robots character varying(255),
    structured_data jsonb,
    meta_viewport character varying(255),
    canonical_url character varying(255)
);


ALTER TABLE public.components_shared_seos OWNER TO "JOY";

--
-- Name: components_shared_seos_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_shared_seos_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_shared_seos_cmps OWNER TO "JOY";

--
-- Name: components_shared_seos_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_shared_seos_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_shared_seos_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_shared_seos_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_shared_seos_cmps_id_seq OWNED BY public.components_shared_seos_cmps.id;


--
-- Name: components_shared_seos_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_shared_seos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_shared_seos_id_seq OWNER TO "JOY";

--
-- Name: components_shared_seos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_shared_seos_id_seq OWNED BY public.components_shared_seos.id;


--
-- Name: components_utilities_accordions; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_utilities_accordions (
    id integer NOT NULL,
    question character varying(255),
    answer text
);


ALTER TABLE public.components_utilities_accordions OWNER TO "JOY";

--
-- Name: components_utilities_accordions_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_utilities_accordions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utilities_accordions_id_seq OWNER TO "JOY";

--
-- Name: components_utilities_accordions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_utilities_accordions_id_seq OWNED BY public.components_utilities_accordions.id;


--
-- Name: components_utilities_basic_images; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_utilities_basic_images (
    id integer NOT NULL,
    alt character varying(255),
    width integer,
    height integer,
    fallback_src character varying(255)
);


ALTER TABLE public.components_utilities_basic_images OWNER TO "JOY";

--
-- Name: components_utilities_basic_images_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_utilities_basic_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utilities_basic_images_id_seq OWNER TO "JOY";

--
-- Name: components_utilities_basic_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_utilities_basic_images_id_seq OWNED BY public.components_utilities_basic_images.id;


--
-- Name: components_utilities_ck_editor_contents; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_utilities_ck_editor_contents (
    id integer NOT NULL,
    content text
);


ALTER TABLE public.components_utilities_ck_editor_contents OWNER TO "JOY";

--
-- Name: components_utilities_ck_editor_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_utilities_ck_editor_contents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utilities_ck_editor_contents_id_seq OWNER TO "JOY";

--
-- Name: components_utilities_ck_editor_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_utilities_ck_editor_contents_id_seq OWNED BY public.components_utilities_ck_editor_contents.id;


--
-- Name: components_utilities_image_with_links; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_utilities_image_with_links (
    id integer NOT NULL
);


ALTER TABLE public.components_utilities_image_with_links OWNER TO "JOY";

--
-- Name: components_utilities_image_with_links_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_utilities_image_with_links_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_utilities_image_with_links_cmps OWNER TO "JOY";

--
-- Name: components_utilities_image_with_links_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_utilities_image_with_links_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utilities_image_with_links_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_utilities_image_with_links_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_utilities_image_with_links_cmps_id_seq OWNED BY public.components_utilities_image_with_links_cmps.id;


--
-- Name: components_utilities_image_with_links_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_utilities_image_with_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utilities_image_with_links_id_seq OWNER TO "JOY";

--
-- Name: components_utilities_image_with_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_utilities_image_with_links_id_seq OWNED BY public.components_utilities_image_with_links.id;


--
-- Name: components_utilities_links; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_utilities_links (
    id integer NOT NULL,
    label character varying(255),
    href character varying(255),
    new_tab boolean
);


ALTER TABLE public.components_utilities_links OWNER TO "JOY";

--
-- Name: components_utilities_links_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_utilities_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utilities_links_id_seq OWNER TO "JOY";

--
-- Name: components_utilities_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_utilities_links_id_seq OWNED BY public.components_utilities_links.id;


--
-- Name: components_utilities_links_with_titles; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_utilities_links_with_titles (
    id integer NOT NULL,
    title character varying(255)
);


ALTER TABLE public.components_utilities_links_with_titles OWNER TO "JOY";

--
-- Name: components_utilities_links_with_titles_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_utilities_links_with_titles_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.components_utilities_links_with_titles_cmps OWNER TO "JOY";

--
-- Name: components_utilities_links_with_titles_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_utilities_links_with_titles_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utilities_links_with_titles_cmps_id_seq OWNER TO "JOY";

--
-- Name: components_utilities_links_with_titles_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_utilities_links_with_titles_cmps_id_seq OWNED BY public.components_utilities_links_with_titles_cmps.id;


--
-- Name: components_utilities_links_with_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_utilities_links_with_titles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utilities_links_with_titles_id_seq OWNER TO "JOY";

--
-- Name: components_utilities_links_with_titles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_utilities_links_with_titles_id_seq OWNED BY public.components_utilities_links_with_titles.id;


--
-- Name: components_utilities_texts; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_utilities_texts (
    id integer NOT NULL,
    text character varying(255)
);


ALTER TABLE public.components_utilities_texts OWNER TO "JOY";

--
-- Name: components_utilities_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_utilities_texts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_utilities_texts_id_seq OWNER TO "JOY";

--
-- Name: components_utilities_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_utilities_texts_id_seq OWNED BY public.components_utilities_texts.id;


--
-- Name: components_violation_details; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_violation_details (
    id integer NOT NULL,
    type character varying(255),
    severity character varying(255),
    method character varying(255),
    impact character varying(255),
    amount numeric(10,2),
    platform character varying(255)
);


ALTER TABLE public.components_violation_details OWNER TO "JOY";

--
-- Name: components_violation_details_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_violation_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_violation_details_id_seq OWNER TO "JOY";

--
-- Name: components_violation_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_violation_details_id_seq OWNED BY public.components_violation_details.id;


--
-- Name: components_violation_evidences; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_violation_evidences (
    id integer NOT NULL,
    verification_date timestamp(6) without time zone,
    note character varying(255),
    verification_status character varying(255)
);


ALTER TABLE public.components_violation_evidences OWNER TO "JOY";

--
-- Name: components_violation_evidences_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_violation_evidences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_violation_evidences_id_seq OWNER TO "JOY";

--
-- Name: components_violation_evidences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_violation_evidences_id_seq OWNED BY public.components_violation_evidences.id;


--
-- Name: components_violation_evidences_report_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.components_violation_evidences_report_lnk (
    id integer NOT NULL,
    evidence_id integer,
    report_id integer
);


ALTER TABLE public.components_violation_evidences_report_lnk OWNER TO "JOY";

--
-- Name: components_violation_evidences_report_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.components_violation_evidences_report_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_violation_evidences_report_lnk_id_seq OWNER TO "JOY";

--
-- Name: components_violation_evidences_report_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.components_violation_evidences_report_lnk_id_seq OWNED BY public.components_violation_evidences_report_lnk.id;


--
-- Name: directories; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.directories (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    slug character varying(255),
    description jsonb,
    is_active boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.directories OWNER TO "JOY";

--
-- Name: directories_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.directories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directories_id_seq OWNER TO "JOY";

--
-- Name: directories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.directories_id_seq OWNED BY public.directories.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.files OWNER TO "JOY";

--
-- Name: files_folder_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);


ALTER TABLE public.files_folder_lnk OWNER TO "JOY";

--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_folder_lnk_id_seq OWNER TO "JOY";

--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_id_seq OWNER TO "JOY";

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_mph; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_mph OWNER TO "JOY";

--
-- Name: files_related_mph_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_related_mph_id_seq OWNER TO "JOY";

--
-- Name: files_related_mph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;


--
-- Name: footers; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.footers (
    id integer NOT NULL,
    document_id character varying(255),
    copy_right character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.footers OWNER TO "JOY";

--
-- Name: footers_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.footers_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.footers_cmps OWNER TO "JOY";

--
-- Name: footers_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.footers_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.footers_cmps_id_seq OWNER TO "JOY";

--
-- Name: footers_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.footers_cmps_id_seq OWNED BY public.footers_cmps.id;


--
-- Name: footers_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.footers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.footers_id_seq OWNER TO "JOY";

--
-- Name: footers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.footers_id_seq OWNED BY public.footers.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.i18n_locale OWNER TO "JOY";

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i18n_locale_id_seq OWNER TO "JOY";

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: identities; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.identities (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    type character varying(255),
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    bio jsonb
);


ALTER TABLE public.identities OWNER TO "JOY";

--
-- Name: identities_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.identities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.identities_id_seq OWNER TO "JOY";

--
-- Name: identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.identities_id_seq OWNED BY public.identities.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.items (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    slug character varying(255),
    description jsonb,
    is_active boolean,
    is_featured boolean,
    item_type character varying(255),
    search_summary character varying(255)
);


ALTER TABLE public.items OWNER TO "JOY";

--
-- Name: items_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.items_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.items_cmps OWNER TO "JOY";

--
-- Name: items_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.items_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_cmps_id_seq OWNER TO "JOY";

--
-- Name: items_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.items_cmps_id_seq OWNED BY public.items_cmps.id;


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_id_seq OWNER TO "JOY";

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: items_listing_type_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.items_listing_type_lnk (
    id integer NOT NULL,
    item_id integer,
    listing_type_id integer
);


ALTER TABLE public.items_listing_type_lnk OWNER TO "JOY";

--
-- Name: items_listing_type_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.items_listing_type_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_listing_type_lnk_id_seq OWNER TO "JOY";

--
-- Name: items_listing_type_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.items_listing_type_lnk_id_seq OWNED BY public.items_listing_type_lnk.id;


--
-- Name: items_related_identity_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.items_related_identity_lnk (
    id integer NOT NULL,
    item_id integer,
    identity_id integer
);


ALTER TABLE public.items_related_identity_lnk OWNER TO "JOY";

--
-- Name: items_related_identity_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.items_related_identity_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_related_identity_lnk_id_seq OWNER TO "JOY";

--
-- Name: items_related_identity_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.items_related_identity_lnk_id_seq OWNED BY public.items_related_identity_lnk.id;


--
-- Name: listing_types; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.listing_types (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    slug character varying(255),
    description jsonb,
    is_active boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    allow_comment boolean,
    allow_rating boolean,
    item_group jsonb,
    review_group jsonb,
    icon_set character varying(255),
    component_filter jsonb,
    test_field jsonb
);


ALTER TABLE public.listing_types OWNER TO "JOY";

--
-- Name: listing_types_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.listing_types_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.listing_types_cmps OWNER TO "JOY";

--
-- Name: listing_types_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.listing_types_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.listing_types_cmps_id_seq OWNER TO "JOY";

--
-- Name: listing_types_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.listing_types_cmps_id_seq OWNED BY public.listing_types_cmps.id;


--
-- Name: listing_types_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.listing_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.listing_types_id_seq OWNER TO "JOY";

--
-- Name: listing_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.listing_types_id_seq OWNED BY public.listing_types.id;


--
-- Name: listings; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.listings (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    slug character varying(255),
    url character varying(255),
    is_active boolean,
    description jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.listings OWNER TO "JOY";

--
-- Name: listings_category_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.listings_category_lnk (
    id integer NOT NULL,
    listing_id integer,
    category_id integer,
    listing_ord double precision
);


ALTER TABLE public.listings_category_lnk OWNER TO "JOY";

--
-- Name: listings_category_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.listings_category_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.listings_category_lnk_id_seq OWNER TO "JOY";

--
-- Name: listings_category_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.listings_category_lnk_id_seq OWNED BY public.listings_category_lnk.id;


--
-- Name: listings_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.listings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.listings_id_seq OWNER TO "JOY";

--
-- Name: listings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.listings_id_seq OWNED BY public.listings.id;


--
-- Name: listings_item_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.listings_item_lnk (
    id integer NOT NULL,
    listing_id integer,
    item_id integer,
    listing_ord double precision
);


ALTER TABLE public.listings_item_lnk OWNER TO "JOY";

--
-- Name: listings_item_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.listings_item_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.listings_item_lnk_id_seq OWNER TO "JOY";

--
-- Name: listings_item_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.listings_item_lnk_id_seq OWNED BY public.listings_item_lnk.id;


--
-- Name: navbars; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.navbars (
    id integer NOT NULL,
    document_id character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.navbars OWNER TO "JOY";

--
-- Name: navbars_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.navbars_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.navbars_cmps OWNER TO "JOY";

--
-- Name: navbars_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.navbars_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navbars_cmps_id_seq OWNER TO "JOY";

--
-- Name: navbars_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.navbars_cmps_id_seq OWNED BY public.navbars_cmps.id;


--
-- Name: navbars_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.navbars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navbars_id_seq OWNER TO "JOY";

--
-- Name: navbars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.navbars_id_seq OWNED BY public.navbars.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    breadcrumb_title character varying(255),
    slug character varying(255),
    full_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.pages OWNER TO "JOY";

--
-- Name: pages_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.pages_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.pages_cmps OWNER TO "JOY";

--
-- Name: pages_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.pages_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_cmps_id_seq OWNER TO "JOY";

--
-- Name: pages_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.pages_cmps_id_seq OWNED BY public.pages_cmps.id;


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_id_seq OWNER TO "JOY";

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: pages_parent_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.pages_parent_lnk (
    id integer NOT NULL,
    page_id integer,
    inv_page_id integer,
    page_ord double precision
);


ALTER TABLE public.pages_parent_lnk OWNER TO "JOY";

--
-- Name: pages_parent_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.pages_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_parent_lnk_id_seq OWNER TO "JOY";

--
-- Name: pages_parent_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.pages_parent_lnk_id_seq OWNED BY public.pages_parent_lnk.id;


--
-- Name: platforms; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.platforms (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    slug character varying(255),
    url character varying(255),
    is_active boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.platforms OWNER TO "JOY";

--
-- Name: platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.platforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.platforms_id_seq OWNER TO "JOY";

--
-- Name: platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.platforms_id_seq OWNED BY public.platforms.id;


--
-- Name: platforms_listings_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.platforms_listings_lnk (
    id integer NOT NULL,
    platform_id integer,
    listing_id integer,
    listing_ord double precision
);


ALTER TABLE public.platforms_listings_lnk OWNER TO "JOY";

--
-- Name: platforms_listings_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.platforms_listings_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.platforms_listings_lnk_id_seq OWNER TO "JOY";

--
-- Name: platforms_listings_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.platforms_listings_lnk_id_seq OWNED BY public.platforms_listings_lnk.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    target_type character varying(255),
    report_status character varying(255),
    reason character varying(255),
    description jsonb,
    note character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    proof_links jsonb
);


ALTER TABLE public.reports OWNER TO "JOY";

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reports_id_seq OWNER TO "JOY";

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: reports_reporter_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.reports_reporter_lnk (
    id integer NOT NULL,
    report_id integer,
    identity_id integer,
    report_ord double precision
);


ALTER TABLE public.reports_reporter_lnk OWNER TO "JOY";

--
-- Name: reports_reporter_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.reports_reporter_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reports_reporter_lnk_id_seq OWNER TO "JOY";

--
-- Name: reports_reporter_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.reports_reporter_lnk_id_seq OWNED BY public.reports_reporter_lnk.id;


--
-- Name: reports_review_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.reports_review_lnk (
    id integer NOT NULL,
    report_id integer,
    review_id integer,
    report_ord double precision
);


ALTER TABLE public.reports_review_lnk OWNER TO "JOY";

--
-- Name: reports_review_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.reports_review_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reports_review_lnk_id_seq OWNER TO "JOY";

--
-- Name: reports_review_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.reports_review_lnk_id_seq OWNED BY public.reports_review_lnk.id;


--
-- Name: reports_target_identity_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.reports_target_identity_lnk (
    id integer NOT NULL,
    report_id integer,
    identity_id integer,
    report_ord double precision
);


ALTER TABLE public.reports_target_identity_lnk OWNER TO "JOY";

--
-- Name: reports_target_identity_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.reports_target_identity_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reports_target_identity_lnk_id_seq OWNER TO "JOY";

--
-- Name: reports_target_identity_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.reports_target_identity_lnk_id_seq OWNED BY public.reports_target_identity_lnk.id;


--
-- Name: reports_target_item_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.reports_target_item_lnk (
    id integer NOT NULL,
    report_id integer,
    item_id integer,
    report_ord double precision
);


ALTER TABLE public.reports_target_item_lnk OWNER TO "JOY";

--
-- Name: reports_target_item_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.reports_target_item_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reports_target_item_lnk_id_seq OWNER TO "JOY";

--
-- Name: reports_target_item_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.reports_target_item_lnk_id_seq OWNED BY public.reports_target_item_lnk.id;


--
-- Name: reports_target_listing_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.reports_target_listing_lnk (
    id integer NOT NULL,
    report_id integer,
    listing_id integer,
    report_ord double precision
);


ALTER TABLE public.reports_target_listing_lnk OWNER TO "JOY";

--
-- Name: reports_target_listing_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.reports_target_listing_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reports_target_listing_lnk_id_seq OWNER TO "JOY";

--
-- Name: reports_target_listing_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.reports_target_listing_lnk_id_seq OWNED BY public.reports_target_listing_lnk.id;


--
-- Name: review_votes; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.review_votes (
    id integer NOT NULL,
    document_id character varying(255),
    is_helpful boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.review_votes OWNER TO "JOY";

--
-- Name: review_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.review_votes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_votes_id_seq OWNER TO "JOY";

--
-- Name: review_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.review_votes_id_seq OWNED BY public.review_votes.id;


--
-- Name: review_votes_identity_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.review_votes_identity_lnk (
    id integer NOT NULL,
    review_vote_id integer,
    identity_id integer
);


ALTER TABLE public.review_votes_identity_lnk OWNER TO "JOY";

--
-- Name: review_votes_identity_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.review_votes_identity_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_votes_identity_lnk_id_seq OWNER TO "JOY";

--
-- Name: review_votes_identity_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.review_votes_identity_lnk_id_seq OWNED BY public.review_votes_identity_lnk.id;


--
-- Name: review_votes_review_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.review_votes_review_lnk (
    id integer NOT NULL,
    review_vote_id integer,
    review_id integer
);


ALTER TABLE public.review_votes_review_lnk OWNER TO "JOY";

--
-- Name: review_votes_review_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.review_votes_review_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_votes_review_lnk_id_seq OWNER TO "JOY";

--
-- Name: review_votes_review_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.review_votes_review_lnk_id_seq OWNED BY public.review_votes_review_lnk.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    review_date timestamp(6) without time zone,
    is_featured boolean,
    review_status character varying(255),
    up_vote integer,
    down_vote integer,
    reported_count integer,
    reject_reason character varying(255),
    review_type character varying(255)
);


ALTER TABLE public.reviews OWNER TO "JOY";

--
-- Name: reviews_cmps; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.reviews_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.reviews_cmps OWNER TO "JOY";

--
-- Name: reviews_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.reviews_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_cmps_id_seq OWNER TO "JOY";

--
-- Name: reviews_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.reviews_cmps_id_seq OWNED BY public.reviews_cmps.id;


--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO "JOY";

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO "JOY";

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNER TO "JOY";

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_lnk OWNER TO "JOY";

--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNER TO "JOY";

--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    encrypted_key text,
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_tokens OWNER TO "JOY";

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNER TO "JOY";

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO "JOY";

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNER TO "JOY";

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO "JOY";

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_database_schema_id_seq OWNER TO "JOY";

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_history_versions; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);


ALTER TABLE public.strapi_history_versions OWNER TO "JOY";

--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_history_versions_id_seq OWNER TO "JOY";

--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO "JOY";

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_id_seq OWNER TO "JOY";

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_migrations_internal; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations_internal OWNER TO "JOY";

--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNER TO "JOY";

--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;


--
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_release_actions OWNER TO "JOY";

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_id_seq OWNER TO "JOY";

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- Name: strapi_release_actions_release_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);


ALTER TABLE public.strapi_release_actions_release_lnk OWNER TO "JOY";

--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNER TO "JOY";

--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;


--
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_releases OWNER TO "JOY";

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_releases_id_seq OWNER TO "JOY";

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO "JOY";

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNER TO "JOY";

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_lnk OWNER TO "JOY";

--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNER TO "JOY";

--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO "JOY";

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNER TO "JOY";

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO "JOY";

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_webhooks_id_seq OWNER TO "JOY";

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: strapi_workflows; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows OWNER TO "JOY";

--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_id_seq OWNER TO "JOY";

--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_workflows_stage_required_to_publish_lnk (
    id integer NOT NULL,
    workflow_id integer,
    workflow_stage_id integer
);


ALTER TABLE public.strapi_workflows_stage_required_to_publish_lnk OWNER TO "JOY";

--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNER TO "JOY";

--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNED BY public.strapi_workflows_stage_required_to_publish_lnk.id;


--
-- Name: strapi_workflows_stages; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows_stages OWNER TO "JOY";

--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNER TO "JOY";

--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;


--
-- Name: strapi_workflows_stages_permissions_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_permissions_lnk OWNER TO "JOY";

--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNER TO "JOY";

--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;


--
-- Name: strapi_workflows_stages_workflow_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_workflow_lnk OWNER TO "JOY";

--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNER TO "JOY";

--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;


--
-- Name: subscribers; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.subscribers (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    email character varying(255),
    message text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.subscribers OWNER TO "JOY";

--
-- Name: subscribers_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.subscribers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscribers_id_seq OWNER TO "JOY";

--
-- Name: subscribers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.subscribers_id_seq OWNED BY public.subscribers.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_permissions OWNER TO "JOY";

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_id_seq OWNER TO "JOY";

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.up_permissions_role_lnk OWNER TO "JOY";

--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNER TO "JOY";

--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_roles OWNER TO "JOY";

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_roles_id_seq OWNER TO "JOY";

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_users OWNER TO "JOY";

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_id_seq OWNER TO "JOY";

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);


ALTER TABLE public.up_users_role_lnk OWNER TO "JOY";

--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNER TO "JOY";

--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.upload_folders OWNER TO "JOY";

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_id_seq OWNER TO "JOY";

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_lnk; Type: TABLE; Schema: public; Owner: JOY
--

CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);


ALTER TABLE public.upload_folders_parent_lnk OWNER TO "JOY";

--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: JOY
--

CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNER TO "JOY";

--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: JOY
--

ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: categories_directory_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_directory_lnk ALTER COLUMN id SET DEFAULT nextval('public.categories_directory_lnk_id_seq'::regclass);


--
-- Name: categories_listing_type_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_listing_type_lnk ALTER COLUMN id SET DEFAULT nextval('public.categories_listing_type_lnk_id_seq'::regclass);


--
-- Name: categories_parent_category_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_parent_category_lnk ALTER COLUMN id SET DEFAULT nextval('public.categories_parent_category_lnk_id_seq'::regclass);


--
-- Name: components_contact_basics id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_contact_basics ALTER COLUMN id SET DEFAULT nextval('public.components_contact_basics_id_seq'::regclass);


--
-- Name: components_contact_locations id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_contact_locations ALTER COLUMN id SET DEFAULT nextval('public.components_contact_locations_id_seq'::regclass);


--
-- Name: components_contact_social_medias id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_contact_social_medias ALTER COLUMN id SET DEFAULT nextval('public.components_contact_social_medias_id_seq'::regclass);


--
-- Name: components_elements_footer_items id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_elements_footer_items ALTER COLUMN id SET DEFAULT nextval('public.components_elements_footer_items_id_seq'::regclass);


--
-- Name: components_elements_footer_items_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_elements_footer_items_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_elements_footer_items_cmps_id_seq'::regclass);


--
-- Name: components_forms_contact_forms id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_forms_contact_forms ALTER COLUMN id SET DEFAULT nextval('public.components_forms_contact_forms_id_seq'::regclass);


--
-- Name: components_forms_contact_forms_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_forms_contact_forms_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_forms_contact_forms_cmps_id_seq'::regclass);


--
-- Name: components_forms_newsletter_forms id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_forms_newsletter_forms ALTER COLUMN id SET DEFAULT nextval('public.components_forms_newsletter_forms_id_seq'::regclass);


--
-- Name: components_forms_newsletter_forms_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_forms_newsletter_forms_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_forms_newsletter_forms_cmps_id_seq'::regclass);


--
-- Name: components_info_bank_infos id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_info_bank_infos ALTER COLUMN id SET DEFAULT nextval('public.components_info_bank_infos_id_seq'::regclass);


--
-- Name: components_media_photos id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_media_photos ALTER COLUMN id SET DEFAULT nextval('public.components_media_photos_id_seq'::regclass);


--
-- Name: components_media_videos id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_media_videos ALTER COLUMN id SET DEFAULT nextval('public.components_media_videos_id_seq'::regclass);


--
-- Name: components_rating_criteria id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_rating_criteria ALTER COLUMN id SET DEFAULT nextval('public.components_rating_criteria_id_seq'::regclass);


--
-- Name: components_review_pro_items id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_review_pro_items ALTER COLUMN id SET DEFAULT nextval('public.components_review_pro_items_id_seq'::regclass);


--
-- Name: components_review_pros_cons id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_review_pros_cons ALTER COLUMN id SET DEFAULT nextval('public.components_review_pros_cons_id_seq'::regclass);


--
-- Name: components_review_pros_cons_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_review_pros_cons_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_review_pros_cons_cmps_id_seq'::regclass);


--
-- Name: components_sections_animated_logo_rows id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_animated_logo_rows ALTER COLUMN id SET DEFAULT nextval('public.components_sections_animated_logo_rows_id_seq'::regclass);


--
-- Name: components_sections_animated_logo_rows_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_animated_logo_rows_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_sections_animated_logo_rows_cmps_id_seq'::regclass);


--
-- Name: components_sections_carousels id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_carousels ALTER COLUMN id SET DEFAULT nextval('public.components_sections_carousels_id_seq'::regclass);


--
-- Name: components_sections_carousels_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_carousels_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_sections_carousels_cmps_id_seq'::regclass);


--
-- Name: components_sections_faqs id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_faqs ALTER COLUMN id SET DEFAULT nextval('public.components_sections_faqs_id_seq'::regclass);


--
-- Name: components_sections_faqs_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_faqs_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_sections_faqs_cmps_id_seq'::regclass);


--
-- Name: components_sections_heading_with_cta_buttons id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_heading_with_cta_buttons ALTER COLUMN id SET DEFAULT nextval('public.components_sections_heading_with_cta_buttons_id_seq'::regclass);


--
-- Name: components_sections_heading_with_cta_buttons_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_heading_with_cta_buttons_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_sections_heading_with_cta_buttons_cmps_id_seq'::regclass);


--
-- Name: components_sections_heroes id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_heroes ALTER COLUMN id SET DEFAULT nextval('public.components_sections_heroes_id_seq'::regclass);


--
-- Name: components_sections_heroes_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_heroes_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_sections_heroes_cmps_id_seq'::regclass);


--
-- Name: components_sections_horizontal_images id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_horizontal_images ALTER COLUMN id SET DEFAULT nextval('public.components_sections_horizontal_images_id_seq'::regclass);


--
-- Name: components_sections_horizontal_images_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_horizontal_images_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_sections_horizontal_images_cmps_id_seq'::regclass);


--
-- Name: components_sections_image_with_cta_buttons id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_image_with_cta_buttons ALTER COLUMN id SET DEFAULT nextval('public.components_sections_image_with_cta_buttons_id_seq'::regclass);


--
-- Name: components_sections_image_with_cta_buttons_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_image_with_cta_buttons_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_sections_image_with_cta_buttons_cmps_id_seq'::regclass);


--
-- Name: components_seo_utilities_meta_socials id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_meta_socials ALTER COLUMN id SET DEFAULT nextval('public.components_seo_utilities_meta_socials_id_seq'::regclass);


--
-- Name: components_seo_utilities_seo_ogs id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_seo_ogs ALTER COLUMN id SET DEFAULT nextval('public.components_seo_utilities_seo_ogs_id_seq'::regclass);


--
-- Name: components_seo_utilities_seo_twitters id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_seo_twitters ALTER COLUMN id SET DEFAULT nextval('public.components_seo_utilities_seo_twitters_id_seq'::regclass);


--
-- Name: components_seo_utilities_seos id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_seos ALTER COLUMN id SET DEFAULT nextval('public.components_seo_utilities_seos_id_seq'::regclass);


--
-- Name: components_seo_utilities_seos_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_seos_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_seo_utilities_seos_cmps_id_seq'::regclass);


--
-- Name: components_seo_utilities_social_icons id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_social_icons ALTER COLUMN id SET DEFAULT nextval('public.components_seo_utilities_social_icons_id_seq'::regclass);


--
-- Name: components_seo_utilities_social_icons_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_social_icons_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_seo_utilities_social_icons_cmps_id_seq'::regclass);


--
-- Name: components_shared_meta_socials id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_shared_meta_socials ALTER COLUMN id SET DEFAULT nextval('public.components_shared_meta_socials_id_seq'::regclass);


--
-- Name: components_shared_seos id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_shared_seos ALTER COLUMN id SET DEFAULT nextval('public.components_shared_seos_id_seq'::regclass);


--
-- Name: components_shared_seos_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_shared_seos_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_shared_seos_cmps_id_seq'::regclass);


--
-- Name: components_utilities_accordions id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_accordions ALTER COLUMN id SET DEFAULT nextval('public.components_utilities_accordions_id_seq'::regclass);


--
-- Name: components_utilities_basic_images id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_basic_images ALTER COLUMN id SET DEFAULT nextval('public.components_utilities_basic_images_id_seq'::regclass);


--
-- Name: components_utilities_ck_editor_contents id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_ck_editor_contents ALTER COLUMN id SET DEFAULT nextval('public.components_utilities_ck_editor_contents_id_seq'::regclass);


--
-- Name: components_utilities_image_with_links id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_image_with_links ALTER COLUMN id SET DEFAULT nextval('public.components_utilities_image_with_links_id_seq'::regclass);


--
-- Name: components_utilities_image_with_links_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_image_with_links_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_utilities_image_with_links_cmps_id_seq'::regclass);


--
-- Name: components_utilities_links id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_links ALTER COLUMN id SET DEFAULT nextval('public.components_utilities_links_id_seq'::regclass);


--
-- Name: components_utilities_links_with_titles id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_links_with_titles ALTER COLUMN id SET DEFAULT nextval('public.components_utilities_links_with_titles_id_seq'::regclass);


--
-- Name: components_utilities_links_with_titles_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_links_with_titles_cmps ALTER COLUMN id SET DEFAULT nextval('public.components_utilities_links_with_titles_cmps_id_seq'::regclass);


--
-- Name: components_utilities_texts id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_texts ALTER COLUMN id SET DEFAULT nextval('public.components_utilities_texts_id_seq'::regclass);


--
-- Name: components_violation_details id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_violation_details ALTER COLUMN id SET DEFAULT nextval('public.components_violation_details_id_seq'::regclass);


--
-- Name: components_violation_evidences id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_violation_evidences ALTER COLUMN id SET DEFAULT nextval('public.components_violation_evidences_id_seq'::regclass);


--
-- Name: components_violation_evidences_report_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_violation_evidences_report_lnk ALTER COLUMN id SET DEFAULT nextval('public.components_violation_evidences_report_lnk_id_seq'::regclass);


--
-- Name: directories id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.directories ALTER COLUMN id SET DEFAULT nextval('public.directories_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);


--
-- Name: files_related_mph id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);


--
-- Name: footers id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.footers ALTER COLUMN id SET DEFAULT nextval('public.footers_id_seq'::regclass);


--
-- Name: footers_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.footers_cmps ALTER COLUMN id SET DEFAULT nextval('public.footers_cmps_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: identities id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.identities ALTER COLUMN id SET DEFAULT nextval('public.identities_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: items_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_cmps ALTER COLUMN id SET DEFAULT nextval('public.items_cmps_id_seq'::regclass);


--
-- Name: items_listing_type_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_listing_type_lnk ALTER COLUMN id SET DEFAULT nextval('public.items_listing_type_lnk_id_seq'::regclass);


--
-- Name: items_related_identity_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_related_identity_lnk ALTER COLUMN id SET DEFAULT nextval('public.items_related_identity_lnk_id_seq'::regclass);


--
-- Name: listing_types id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listing_types ALTER COLUMN id SET DEFAULT nextval('public.listing_types_id_seq'::regclass);


--
-- Name: listing_types_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listing_types_cmps ALTER COLUMN id SET DEFAULT nextval('public.listing_types_cmps_id_seq'::regclass);


--
-- Name: listings id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings ALTER COLUMN id SET DEFAULT nextval('public.listings_id_seq'::regclass);


--
-- Name: listings_category_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings_category_lnk ALTER COLUMN id SET DEFAULT nextval('public.listings_category_lnk_id_seq'::regclass);


--
-- Name: listings_item_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings_item_lnk ALTER COLUMN id SET DEFAULT nextval('public.listings_item_lnk_id_seq'::regclass);


--
-- Name: navbars id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.navbars ALTER COLUMN id SET DEFAULT nextval('public.navbars_id_seq'::regclass);


--
-- Name: navbars_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.navbars_cmps ALTER COLUMN id SET DEFAULT nextval('public.navbars_cmps_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: pages_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages_cmps ALTER COLUMN id SET DEFAULT nextval('public.pages_cmps_id_seq'::regclass);


--
-- Name: pages_parent_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.pages_parent_lnk_id_seq'::regclass);


--
-- Name: platforms id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.platforms ALTER COLUMN id SET DEFAULT nextval('public.platforms_id_seq'::regclass);


--
-- Name: platforms_listings_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.platforms_listings_lnk ALTER COLUMN id SET DEFAULT nextval('public.platforms_listings_lnk_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: reports_reporter_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_reporter_lnk ALTER COLUMN id SET DEFAULT nextval('public.reports_reporter_lnk_id_seq'::regclass);


--
-- Name: reports_review_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_review_lnk ALTER COLUMN id SET DEFAULT nextval('public.reports_review_lnk_id_seq'::regclass);


--
-- Name: reports_target_identity_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_identity_lnk ALTER COLUMN id SET DEFAULT nextval('public.reports_target_identity_lnk_id_seq'::regclass);


--
-- Name: reports_target_item_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_item_lnk ALTER COLUMN id SET DEFAULT nextval('public.reports_target_item_lnk_id_seq'::regclass);


--
-- Name: reports_target_listing_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_listing_lnk ALTER COLUMN id SET DEFAULT nextval('public.reports_target_listing_lnk_id_seq'::regclass);


--
-- Name: review_votes id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes ALTER COLUMN id SET DEFAULT nextval('public.review_votes_id_seq'::regclass);


--
-- Name: review_votes_identity_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes_identity_lnk ALTER COLUMN id SET DEFAULT nextval('public.review_votes_identity_lnk_id_seq'::regclass);


--
-- Name: review_votes_review_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes_review_lnk ALTER COLUMN id SET DEFAULT nextval('public.review_votes_review_lnk_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: reviews_cmps id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reviews_cmps ALTER COLUMN id SET DEFAULT nextval('public.reviews_cmps_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_history_versions id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_migrations_internal id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);


--
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- Name: strapi_release_actions_release_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);


--
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: strapi_workflows id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_permissions_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_workflow_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);


--
-- Name: subscribers id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.subscribers ALTER COLUMN id SET DEFAULT nextval('public.subscribers_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_lnk id; Type: DEFAULT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.admin_permissions (id, document_id, action, action_parameters, subject, properties, conditions, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	es7u6wswozj6gdfdsvb2z36z	plugin::content-manager.explorer.create	{}	api::footer.footer	{"fields": ["sections.title", "sections.links.label", "sections.links.href", "sections.links.newTab", "links.label", "links.href", "links.newTab", "copyRight", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"]}	[]	2025-05-26 02:32:11.602	2025-05-26 02:32:11.602	2025-05-26 02:32:11.602	\N	\N	\N
3	mxv1zje7pcuho1p8x038vhpg	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["title", "breadcrumbTitle", "slug", "fullPath", "content", "children", "parent", "seo.metaTitle", "seo.metaDescription", "seo.metaImage", "seo.keywords", "seo.twitter.card", "seo.twitter.title", "seo.twitter.description", "seo.twitter.siteId", "seo.twitter.creator", "seo.twitter.creatorId", "seo.twitter.images", "seo.og.title", "seo.og.description", "seo.og.url", "seo.og.type", "seo.og.image", "seo.applicationName", "seo.siteName", "seo.email", "seo.canonicalUrl", "seo.metaRobots", "seo.structuredData"]}	[]	2025-05-26 02:32:11.614	2025-05-26 02:32:11.614	2025-05-26 02:32:11.615	\N	\N	\N
4	cltkzdgwjn85wpmdbv7mi0nd	plugin::content-manager.explorer.create	{}	api::subscriber.subscriber	{"fields": ["name", "email", "message"]}	[]	2025-05-26 02:32:11.619	2025-05-26 02:32:11.619	2025-05-26 02:32:11.62	\N	\N	\N
5	mosazmbmxgelncgx29a1jbg8	plugin::content-manager.explorer.read	{}	api::footer.footer	{"fields": ["sections.title", "sections.links.label", "sections.links.href", "sections.links.newTab", "links.label", "links.href", "links.newTab", "copyRight", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"]}	[]	2025-05-26 02:32:11.624	2025-05-26 02:32:11.624	2025-05-26 02:32:11.624	\N	\N	\N
7	dq0niv2r2u2wyd40s4738yae	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["title", "breadcrumbTitle", "slug", "fullPath", "content", "children", "parent", "seo.metaTitle", "seo.metaDescription", "seo.metaImage", "seo.keywords", "seo.twitter.card", "seo.twitter.title", "seo.twitter.description", "seo.twitter.siteId", "seo.twitter.creator", "seo.twitter.creatorId", "seo.twitter.images", "seo.og.title", "seo.og.description", "seo.og.url", "seo.og.type", "seo.og.image", "seo.applicationName", "seo.siteName", "seo.email", "seo.canonicalUrl", "seo.metaRobots", "seo.structuredData"]}	[]	2025-05-26 02:32:11.634	2025-05-26 02:32:11.634	2025-05-26 02:32:11.634	\N	\N	\N
8	zjo8go7mv4bryh2hznhnhdly	plugin::content-manager.explorer.read	{}	api::subscriber.subscriber	{"fields": ["name", "email", "message"]}	[]	2025-05-26 02:32:11.638	2025-05-26 02:32:11.638	2025-05-26 02:32:11.638	\N	\N	\N
9	np4nnbvuwdr530estulorrn1	plugin::content-manager.explorer.update	{}	api::footer.footer	{"fields": ["sections.title", "sections.links.label", "sections.links.href", "sections.links.newTab", "links.label", "links.href", "links.newTab", "copyRight", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"]}	[]	2025-05-26 02:32:11.643	2025-05-26 02:32:11.643	2025-05-26 02:32:11.643	\N	\N	\N
11	farw0gpdtj0hxtm1kb0x9oug	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["title", "breadcrumbTitle", "slug", "fullPath", "content", "children", "parent", "seo.metaTitle", "seo.metaDescription", "seo.metaImage", "seo.keywords", "seo.twitter.card", "seo.twitter.title", "seo.twitter.description", "seo.twitter.siteId", "seo.twitter.creator", "seo.twitter.creatorId", "seo.twitter.images", "seo.og.title", "seo.og.description", "seo.og.url", "seo.og.type", "seo.og.image", "seo.applicationName", "seo.siteName", "seo.email", "seo.canonicalUrl", "seo.metaRobots", "seo.structuredData"]}	[]	2025-05-26 02:32:11.653	2025-05-26 02:32:11.653	2025-05-26 02:32:11.653	\N	\N	\N
12	h1p8scvfb27v0geextj1skjk	plugin::content-manager.explorer.update	{}	api::subscriber.subscriber	{"fields": ["name", "email", "message"]}	[]	2025-05-26 02:32:11.658	2025-05-26 02:32:11.658	2025-05-26 02:32:11.658	\N	\N	\N
16	xiqiyy3dm238xv3hbnbohaec	plugin::content-manager.explorer.delete	{}	api::subscriber.subscriber	{}	[]	2025-05-26 02:32:11.678	2025-05-26 02:32:11.678	2025-05-26 02:32:11.679	\N	\N	\N
20	t3382s5w7mme7qilmrp5soeq	plugin::content-manager.explorer.publish	{}	api::subscriber.subscriber	{}	[]	2025-05-26 02:32:11.698	2025-05-26 02:32:11.698	2025-05-26 02:32:11.698	\N	\N	\N
21	fs9noanjfalfarklzw1lbhny	plugin::upload.read	{}	\N	{}	[]	2025-05-26 02:32:11.703	2025-05-26 02:32:11.703	2025-05-26 02:32:11.703	\N	\N	\N
22	d6zage35nb5e64tb5i87ut5y	plugin::upload.configure-view	{}	\N	{}	[]	2025-05-26 02:32:11.708	2025-05-26 02:32:11.708	2025-05-26 02:32:11.709	\N	\N	\N
23	aca7xq4kywymr4ddcyj4hidc	plugin::upload.assets.create	{}	\N	{}	[]	2025-05-26 02:32:11.714	2025-05-26 02:32:11.714	2025-05-26 02:32:11.714	\N	\N	\N
24	unducorffmfemcu20uhhavlh	plugin::upload.assets.update	{}	\N	{}	[]	2025-05-26 02:32:11.718	2025-05-26 02:32:11.718	2025-05-26 02:32:11.719	\N	\N	\N
25	qp8mul8o83iu600xpo2c6395	plugin::upload.assets.download	{}	\N	{}	[]	2025-05-26 02:32:11.724	2025-05-26 02:32:11.724	2025-05-26 02:32:11.724	\N	\N	\N
26	oowb7b742x1aif54q8rsr53e	plugin::upload.assets.copy-link	{}	\N	{}	[]	2025-05-26 02:32:11.729	2025-05-26 02:32:11.729	2025-05-26 02:32:11.729	\N	\N	\N
73	bhvzh29akkkl2rbdpq108711	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2025-05-26 02:32:12.009	2025-05-26 02:32:12.009	2025-05-26 02:32:12.009	\N	\N	\N
74	meutt49potizs28ya7ufu3my	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2025-05-26 02:32:12.014	2025-05-26 02:32:12.014	2025-05-26 02:32:12.014	\N	\N	\N
385	zrd8m1ywx15ryr4e9mznt9h3	plugin::content-manager.explorer.delete	{}	api::report.report	{}	[]	2025-05-29 02:02:16.823	2025-05-29 02:02:16.823	2025-05-29 02:02:16.823	\N	\N	\N
386	g1k51q05x49dusg8kn0ytb5r	plugin::content-manager.explorer.publish	{}	api::report.report	{}	[]	2025-05-29 02:02:16.828	2025-05-29 02:02:16.828	2025-05-29 02:02:16.828	\N	\N	\N
281	zfv4dka98o1sfykz0gtjqehw	plugin::content-manager.explorer.delete	{}	api::identity.identity	{}	[]	2025-05-27 23:50:43.315	2025-05-27 23:50:43.315	2025-05-27 23:50:43.315	\N	\N	\N
282	r52zorces9qr1551qcnuxhbn	plugin::content-manager.explorer.publish	{}	api::identity.identity	{}	[]	2025-05-27 23:50:43.323	2025-05-27 23:50:43.323	2025-05-27 23:50:43.323	\N	\N	\N
30	mog2i7ntnc938zmxv1s3gdih	plugin::content-manager.explorer.create	{}	api::subscriber.subscriber	{"fields": ["name", "email", "message"]}	["admin::is-creator"]	2025-05-26 02:32:11.75	2025-05-26 02:32:11.75	2025-05-26 02:32:11.75	\N	\N	\N
510	nmcd8b3xi9u25mubihl60nfm	plugin::content-manager.explorer.create	{}	api::review.review	{"fields": ["Title", "Content", "ReviewDate", "isFeatured", "ReviewStatus", "UpVote", "DownVote", "ReportedCount", "RejectReason", "ReviewType", "ReviewVote", "Reports", "FieldGroup"]}	[]	2025-06-01 15:00:52.927	2025-06-01 15:00:52.927	2025-06-01 15:00:52.928	\N	\N	\N
511	bkvtx7gfca9id6kuahdcz62z	plugin::content-manager.explorer.read	{}	api::review.review	{"fields": ["Title", "Content", "ReviewDate", "isFeatured", "ReviewStatus", "UpVote", "DownVote", "ReportedCount", "RejectReason", "ReviewType", "ReviewVote", "Reports", "FieldGroup"]}	[]	2025-06-01 15:00:52.936	2025-06-01 15:00:52.936	2025-06-01 15:00:52.937	\N	\N	\N
34	ox5tw9stzt4pi676c37v3t2b	plugin::content-manager.explorer.read	{}	api::subscriber.subscriber	{"fields": ["name", "email", "message"]}	["admin::is-creator"]	2025-05-26 02:32:11.77	2025-05-26 02:32:11.77	2025-05-26 02:32:11.77	\N	\N	\N
512	vnyq47ylh9a0dwp1sl7uq9u3	plugin::content-manager.explorer.update	{}	api::review.review	{"fields": ["Title", "Content", "ReviewDate", "isFeatured", "ReviewStatus", "UpVote", "DownVote", "ReportedCount", "RejectReason", "ReviewType", "ReviewVote", "Reports", "FieldGroup"]}	[]	2025-06-01 15:00:52.952	2025-06-01 15:00:52.952	2025-06-01 15:00:52.952	\N	\N	\N
38	wga3twtjbp383i7j23gdz4qh	plugin::content-manager.explorer.update	{}	api::subscriber.subscriber	{"fields": ["name", "email", "message"]}	["admin::is-creator"]	2025-05-26 02:32:11.795	2025-05-26 02:32:11.795	2025-05-26 02:32:11.795	\N	\N	\N
42	xlgemetyxp3dzhohmhlbxzwq	plugin::content-manager.explorer.delete	{}	api::subscriber.subscriber	{}	["admin::is-creator"]	2025-05-26 02:32:11.817	2025-05-26 02:32:11.817	2025-05-26 02:32:11.817	\N	\N	\N
43	rghm559k8d8nyrwt8g77o3km	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2025-05-26 02:32:11.823	2025-05-26 02:32:11.823	2025-05-26 02:32:11.823	\N	\N	\N
44	r5p9l5j2ngr8w4qorpziirzd	plugin::upload.configure-view	{}	\N	{}	[]	2025-05-26 02:32:11.829	2025-05-26 02:32:11.829	2025-05-26 02:32:11.829	\N	\N	\N
45	i4cg5o8w9jim5xykzijmtw60	plugin::upload.assets.create	{}	\N	{}	[]	2025-05-26 02:32:11.834	2025-05-26 02:32:11.834	2025-05-26 02:32:11.834	\N	\N	\N
46	m8xg0y0e5ezfn2sj08ehrfxp	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2025-05-26 02:32:11.84	2025-05-26 02:32:11.84	2025-05-26 02:32:11.84	\N	\N	\N
47	f91ao08sraaiggacnj2o5p7o	plugin::upload.assets.download	{}	\N	{}	[]	2025-05-26 02:32:11.847	2025-05-26 02:32:11.847	2025-05-26 02:32:11.847	\N	\N	\N
48	p8gf3a2s61exbgwk573ch83v	plugin::upload.assets.copy-link	{}	\N	{}	[]	2025-05-26 02:32:11.853	2025-05-26 02:32:11.853	2025-05-26 02:32:11.854	\N	\N	\N
320	od7mnyuv8ofv8ht2biwejymj	plugin::content-manager.explorer.publish	{}	api::platform.platform	{}	[]	2025-05-28 00:17:36.014	2025-05-28 00:17:36.014	2025-05-28 00:17:36.014	\N	\N	\N
324	yfm7tsbkonxohgjnkfsgyc8l	plugin::content-manager.explorer.delete	{}	api::review.review	{}	[]	2025-05-28 00:20:29.148	2025-05-28 00:20:29.148	2025-05-28 00:20:29.148	\N	\N	\N
325	i5gzf7jhxdwa6a871yt10u8k	plugin::content-manager.explorer.publish	{}	api::review.review	{}	[]	2025-05-28 00:20:29.155	2025-05-28 00:20:29.155	2025-05-28 00:20:29.155	\N	\N	\N
329	zotukqxt0syd0ctf5pbyth7o	plugin::content-manager.explorer.create	{}	api::platform.platform	{"fields": ["Name", "Slug", "URL", "is_Active", "Logo", "Listings"]}	[]	2025-05-28 00:33:20.08	2025-05-28 00:33:20.08	2025-05-28 00:33:20.081	\N	\N	\N
330	hawqx7o8dyu63azgicyt6p0v	plugin::content-manager.explorer.read	{}	api::platform.platform	{"fields": ["Name", "Slug", "URL", "is_Active", "Logo", "Listings"]}	[]	2025-05-28 00:33:20.091	2025-05-28 00:33:20.091	2025-05-28 00:33:20.092	\N	\N	\N
331	kal7bpgul91jdxds5l1ntjf7	plugin::content-manager.explorer.update	{}	api::platform.platform	{"fields": ["Name", "Slug", "URL", "is_Active", "Logo", "Listings"]}	[]	2025-05-28 00:33:20.099	2025-05-28 00:33:20.099	2025-05-28 00:33:20.099	\N	\N	\N
217	hroj4vfsalgm2g0s5vedkay1	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["title", "breadcrumbTitle", "slug", "fullPath", "content", "children", "parent", "seo.metaTitle", "seo.metaDescription", "seo.metaImage", "seo.keywords", "seo.twitter.card", "seo.twitter.title", "seo.twitter.description", "seo.twitter.siteId", "seo.twitter.creator", "seo.twitter.creatorId", "seo.twitter.images", "seo.og.title", "seo.og.description", "seo.og.url", "seo.og.type", "seo.og.image", "seo.applicationName", "seo.siteName", "seo.email", "seo.canonicalUrl", "seo.metaRobots", "seo.structuredData"], "locales": []}	["admin::is-creator"]	2025-05-27 14:58:22.864	2025-05-27 14:58:22.864	2025-05-27 14:58:22.864	\N	\N	\N
52	ci4wlvtmc39wfwk6s659firj	plugin::content-manager.explorer.create	{}	api::subscriber.subscriber	{"fields": ["name", "email", "message"]}	[]	2025-05-26 02:32:11.896	2025-05-26 02:32:11.896	2025-05-26 02:32:11.896	\N	\N	\N
53	zuy430vbwlhvakdbyiddpxnx	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-05-26 02:32:11.901	2025-05-26 02:32:11.901	2025-05-26 02:32:11.901	\N	\N	\N
218	qioyqissa6dppqk3vuwcwwht	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["title", "breadcrumbTitle", "slug", "fullPath", "content", "children", "parent", "seo.metaTitle", "seo.metaDescription", "seo.metaImage", "seo.keywords", "seo.twitter.card", "seo.twitter.title", "seo.twitter.description", "seo.twitter.siteId", "seo.twitter.creator", "seo.twitter.creatorId", "seo.twitter.images", "seo.og.title", "seo.og.description", "seo.og.url", "seo.og.type", "seo.og.image", "seo.applicationName", "seo.siteName", "seo.email", "seo.canonicalUrl", "seo.metaRobots", "seo.structuredData"], "locales": []}	["admin::is-creator"]	2025-05-27 14:58:22.876	2025-05-27 14:58:22.876	2025-05-27 14:58:22.876	\N	\N	\N
219	u7023iauec5daw3or0lcidix	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["title", "breadcrumbTitle", "slug", "fullPath", "content", "children", "parent", "seo.metaTitle", "seo.metaDescription", "seo.metaImage", "seo.keywords", "seo.twitter.card", "seo.twitter.title", "seo.twitter.description", "seo.twitter.siteId", "seo.twitter.creator", "seo.twitter.creatorId", "seo.twitter.images", "seo.og.title", "seo.og.description", "seo.og.url", "seo.og.type", "seo.og.image", "seo.applicationName", "seo.siteName", "seo.email", "seo.canonicalUrl", "seo.metaRobots", "seo.structuredData"], "locales": []}	["admin::is-creator"]	2025-05-27 14:58:22.884	2025-05-27 14:58:22.884	2025-05-27 14:58:22.884	\N	\N	\N
220	hmx0pz5er4vqbg375nuhcwr9	plugin::content-manager.explorer.create	{}	api::footer.footer	{"fields": ["sections.title", "sections.links.label", "sections.links.href", "sections.links.newTab", "links.label", "links.href", "links.newTab", "copyRight", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"], "locales": []}	["admin::is-creator"]	2025-05-27 14:58:22.893	2025-05-27 14:58:22.893	2025-05-27 14:58:22.893	\N	\N	\N
57	nxmt6hw84lzot8618jjct0so	plugin::content-manager.explorer.read	{}	api::subscriber.subscriber	{"fields": ["name", "email", "message"]}	[]	2025-05-26 02:32:11.923	2025-05-26 02:32:11.923	2025-05-26 02:32:11.924	\N	\N	\N
58	fp5rhjt5ls6yz9uw2hw0lemc	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-05-26 02:32:11.929	2025-05-26 02:32:11.929	2025-05-26 02:32:11.929	\N	\N	\N
221	urepip8gcwy2wez8iexjqwcs	plugin::content-manager.explorer.read	{}	api::footer.footer	{"fields": ["sections.title", "sections.links.label", "sections.links.href", "sections.links.newTab", "links.label", "links.href", "links.newTab", "copyRight", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"], "locales": []}	["admin::is-creator"]	2025-05-27 14:58:22.901	2025-05-27 14:58:22.901	2025-05-27 14:58:22.901	\N	\N	\N
222	op5uhfob0ctc7yy1f9g86yl6	plugin::content-manager.explorer.update	{}	api::footer.footer	{"fields": ["sections.title", "sections.links.label", "sections.links.href", "sections.links.newTab", "links.label", "links.href", "links.newTab", "copyRight", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"], "locales": []}	["admin::is-creator"]	2025-05-27 14:58:22.91	2025-05-27 14:58:22.91	2025-05-27 14:58:22.91	\N	\N	\N
223	d5wjqjnjmx73f7c75agrb0tp	plugin::content-manager.explorer.update	{}	api::navbar.navbar	{"fields": ["links.label", "links.href", "links.newTab", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"], "locales": ["en", "cs"]}	[]	2025-05-27 14:58:22.917	2025-05-27 14:58:22.917	2025-05-27 14:58:22.918	\N	\N	\N
62	qqfzkyk5qpqw8amgw9h85pnz	plugin::content-manager.explorer.update	{}	api::subscriber.subscriber	{"fields": ["name", "email", "message"]}	[]	2025-05-26 02:32:11.951	2025-05-26 02:32:11.951	2025-05-26 02:32:11.951	\N	\N	\N
63	q7w82o8dl86z8w2yvfr1dh0s	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-05-26 02:32:11.957	2025-05-26 02:32:11.957	2025-05-26 02:32:11.957	\N	\N	\N
67	ethgwt41u2xn1i7t8u7vsk52	plugin::content-manager.explorer.delete	{}	api::subscriber.subscriber	{}	[]	2025-05-26 02:32:11.977	2025-05-26 02:32:11.977	2025-05-26 02:32:11.977	\N	\N	\N
68	glxrf6mqklfodjpx6xwimzie	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2025-05-26 02:32:11.982	2025-05-26 02:32:11.982	2025-05-26 02:32:11.982	\N	\N	\N
72	ky1lkat40qupotk2voyp2fb9	plugin::content-manager.explorer.publish	{}	api::subscriber.subscriber	{}	[]	2025-05-26 02:32:12.003	2025-05-26 02:32:12.003	2025-05-26 02:32:12.003	\N	\N	\N
75	hzcuizbrm3rj6f6xf6qmyp1j	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2025-05-26 02:32:12.02	2025-05-26 02:32:12.02	2025-05-26 02:32:12.02	\N	\N	\N
76	jwz8gustjjw55s9zaokisqao	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2025-05-26 02:32:12.025	2025-05-26 02:32:12.025	2025-05-26 02:32:12.025	\N	\N	\N
77	pqw01j5hjwy9fvaewa247yns	plugin::content-type-builder.read	{}	\N	{}	[]	2025-05-26 02:32:12.029	2025-05-26 02:32:12.029	2025-05-26 02:32:12.029	\N	\N	\N
78	hvvtyzuiuodxxv9ux8d4xi26	plugin::email.settings.read	{}	\N	{}	[]	2025-05-26 02:32:12.035	2025-05-26 02:32:12.035	2025-05-26 02:32:12.035	\N	\N	\N
79	hcrh9jhew2d6785ibj5xkgum	plugin::upload.read	{}	\N	{}	[]	2025-05-26 02:32:12.04	2025-05-26 02:32:12.04	2025-05-26 02:32:12.04	\N	\N	\N
80	w3uha3shuwdrj46ng305g9py	plugin::upload.assets.create	{}	\N	{}	[]	2025-05-26 02:32:12.045	2025-05-26 02:32:12.045	2025-05-26 02:32:12.045	\N	\N	\N
81	c6tk7wflmbpupar6k0xdhqs2	plugin::upload.assets.update	{}	\N	{}	[]	2025-05-26 02:32:12.05	2025-05-26 02:32:12.05	2025-05-26 02:32:12.05	\N	\N	\N
82	gywamm62s8mcgqyimanxbmb0	plugin::upload.assets.download	{}	\N	{}	[]	2025-05-26 02:32:12.056	2025-05-26 02:32:12.056	2025-05-26 02:32:12.056	\N	\N	\N
83	yvzv41gjrvkoc6gfiusb9w8g	plugin::upload.assets.copy-link	{}	\N	{}	[]	2025-05-26 02:32:12.06	2025-05-26 02:32:12.06	2025-05-26 02:32:12.06	\N	\N	\N
84	yyevngzb914cjnrwpsuz8v2p	plugin::upload.configure-view	{}	\N	{}	[]	2025-05-26 02:32:12.065	2025-05-26 02:32:12.065	2025-05-26 02:32:12.065	\N	\N	\N
85	gugfiar732sbp9y6la059yqa	plugin::upload.settings.read	{}	\N	{}	[]	2025-05-26 02:32:12.07	2025-05-26 02:32:12.07	2025-05-26 02:32:12.07	\N	\N	\N
86	x4dex545b5rf982t10bn6a93	plugin::i18n.locale.create	{}	\N	{}	[]	2025-05-26 02:32:12.075	2025-05-26 02:32:12.075	2025-05-26 02:32:12.075	\N	\N	\N
87	mu6xa6v3mpunqviwk946kpcm	plugin::i18n.locale.read	{}	\N	{}	[]	2025-05-26 02:32:12.079	2025-05-26 02:32:12.079	2025-05-26 02:32:12.08	\N	\N	\N
88	tt92mymmvsh9owulbro0pjc2	plugin::i18n.locale.update	{}	\N	{}	[]	2025-05-26 02:32:12.085	2025-05-26 02:32:12.085	2025-05-26 02:32:12.085	\N	\N	\N
89	z9yygpe0cw480l93yeor24sh	plugin::i18n.locale.delete	{}	\N	{}	[]	2025-05-26 02:32:12.089	2025-05-26 02:32:12.089	2025-05-26 02:32:12.09	\N	\N	\N
90	j7io96ifee7pofbo8akozddz	plugin::seo.read	{}	\N	{}	[]	2025-05-26 02:32:12.094	2025-05-26 02:32:12.094	2025-05-26 02:32:12.094	\N	\N	\N
91	m2yl3uc2zr5jdtyp0yhy4jol	plugin::config-sync.settings.read	{}	\N	{}	[]	2025-05-26 02:32:12.099	2025-05-26 02:32:12.099	2025-05-26 02:32:12.099	\N	\N	\N
92	gkj3ljdnytyt29rpghvb9ca1	plugin::config-sync.menu-link	{}	\N	{}	[]	2025-05-26 02:32:12.104	2025-05-26 02:32:12.104	2025-05-26 02:32:12.104	\N	\N	\N
93	syp4higyl42ts0c3aht5yad0	plugin::users-permissions.roles.create	{}	\N	{}	[]	2025-05-26 02:32:12.109	2025-05-26 02:32:12.109	2025-05-26 02:32:12.109	\N	\N	\N
94	zeliyz0romdcn5higu0iuq1x	plugin::users-permissions.roles.read	{}	\N	{}	[]	2025-05-26 02:32:12.119	2025-05-26 02:32:12.119	2025-05-26 02:32:12.12	\N	\N	\N
95	tpc9r4ykji330vid5g9c6a9k	plugin::users-permissions.roles.update	{}	\N	{}	[]	2025-05-26 02:32:12.126	2025-05-26 02:32:12.126	2025-05-26 02:32:12.126	\N	\N	\N
96	tqtopc1vurlx2u4yk69ttoiq	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2025-05-26 02:32:12.132	2025-05-26 02:32:12.132	2025-05-26 02:32:12.132	\N	\N	\N
97	i9ij3gb9afehny9pbndq4poh	plugin::users-permissions.providers.read	{}	\N	{}	[]	2025-05-26 02:32:12.137	2025-05-26 02:32:12.137	2025-05-26 02:32:12.137	\N	\N	\N
98	hgq8605h4pxaubwzfnvi4obb	plugin::users-permissions.providers.update	{}	\N	{}	[]	2025-05-26 02:32:12.142	2025-05-26 02:32:12.142	2025-05-26 02:32:12.142	\N	\N	\N
99	ne3baz4zgiy241zs26vldb7v	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2025-05-26 02:32:12.147	2025-05-26 02:32:12.147	2025-05-26 02:32:12.148	\N	\N	\N
100	xz13y6druv5c7f5q9hcpbfte	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2025-05-26 02:32:12.153	2025-05-26 02:32:12.153	2025-05-26 02:32:12.153	\N	\N	\N
101	ir299hz9fwzkip6vzrhvm1gx	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2025-05-26 02:32:12.158	2025-05-26 02:32:12.158	2025-05-26 02:32:12.158	\N	\N	\N
102	eirs4pb36dn5hjujgwq168x6	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2025-05-26 02:32:12.163	2025-05-26 02:32:12.163	2025-05-26 02:32:12.163	\N	\N	\N
103	dx3ololrak1hhflhux6ltius	admin::marketplace.read	{}	\N	{}	[]	2025-05-26 02:32:12.169	2025-05-26 02:32:12.169	2025-05-26 02:32:12.169	\N	\N	\N
104	v75t4iuaolns5253o5wtv2uz	admin::webhooks.create	{}	\N	{}	[]	2025-05-26 02:32:12.175	2025-05-26 02:32:12.175	2025-05-26 02:32:12.175	\N	\N	\N
105	q9k3ekia2mcww0stds5omzzw	admin::webhooks.read	{}	\N	{}	[]	2025-05-26 02:32:12.181	2025-05-26 02:32:12.181	2025-05-26 02:32:12.181	\N	\N	\N
106	hzh3pb0pk7eano81fjelli9b	admin::webhooks.update	{}	\N	{}	[]	2025-05-26 02:32:12.186	2025-05-26 02:32:12.186	2025-05-26 02:32:12.186	\N	\N	\N
107	jizok94p0ca3eiybkm0tcq4u	admin::webhooks.delete	{}	\N	{}	[]	2025-05-26 02:32:12.191	2025-05-26 02:32:12.191	2025-05-26 02:32:12.191	\N	\N	\N
108	t1h7orhwquswgie2fjvdpyy0	admin::users.create	{}	\N	{}	[]	2025-05-26 02:32:12.196	2025-05-26 02:32:12.196	2025-05-26 02:32:12.196	\N	\N	\N
109	czw3n0a8emzl8c6jl8rcsrj7	admin::users.read	{}	\N	{}	[]	2025-05-26 02:32:12.201	2025-05-26 02:32:12.201	2025-05-26 02:32:12.201	\N	\N	\N
110	dw5ywi57hjes6sue97l7jx9u	admin::users.update	{}	\N	{}	[]	2025-05-26 02:32:12.206	2025-05-26 02:32:12.206	2025-05-26 02:32:12.206	\N	\N	\N
111	xmzt2nkria0h6cdao1ykq58w	admin::users.delete	{}	\N	{}	[]	2025-05-26 02:32:12.211	2025-05-26 02:32:12.211	2025-05-26 02:32:12.211	\N	\N	\N
112	ajq941e4avnpivwkm6y3idvk	admin::roles.create	{}	\N	{}	[]	2025-05-26 02:32:12.216	2025-05-26 02:32:12.216	2025-05-26 02:32:12.216	\N	\N	\N
113	fee1iptkdu265l747zaownld	admin::roles.read	{}	\N	{}	[]	2025-05-26 02:32:12.221	2025-05-26 02:32:12.221	2025-05-26 02:32:12.221	\N	\N	\N
114	mn90l27jlmn1si7z3dcxd8iq	admin::roles.update	{}	\N	{}	[]	2025-05-26 02:32:12.226	2025-05-26 02:32:12.226	2025-05-26 02:32:12.226	\N	\N	\N
115	vwazet86eq3wzqdprwhhqzkd	admin::roles.delete	{}	\N	{}	[]	2025-05-26 02:32:12.233	2025-05-26 02:32:12.233	2025-05-26 02:32:12.233	\N	\N	\N
116	bq02whomhnsbicy3qasbe7zu	admin::api-tokens.access	{}	\N	{}	[]	2025-05-26 02:32:12.238	2025-05-26 02:32:12.238	2025-05-26 02:32:12.238	\N	\N	\N
117	b1g7jn8suu971orwtcb526ap	admin::api-tokens.create	{}	\N	{}	[]	2025-05-26 02:32:12.243	2025-05-26 02:32:12.243	2025-05-26 02:32:12.243	\N	\N	\N
118	wfp2d2vu11pqijrvjo71i4m8	admin::api-tokens.read	{}	\N	{}	[]	2025-05-26 02:32:12.248	2025-05-26 02:32:12.248	2025-05-26 02:32:12.248	\N	\N	\N
119	rl9i4ygmj3sxa1fp81sbpba6	admin::api-tokens.update	{}	\N	{}	[]	2025-05-26 02:32:12.253	2025-05-26 02:32:12.253	2025-05-26 02:32:12.253	\N	\N	\N
120	z4lbg8rjn6oe7ynrci89i4er	admin::api-tokens.regenerate	{}	\N	{}	[]	2025-05-26 02:32:12.258	2025-05-26 02:32:12.258	2025-05-26 02:32:12.258	\N	\N	\N
121	a3iirejkygo80rhom0fril28	admin::api-tokens.delete	{}	\N	{}	[]	2025-05-26 02:32:12.263	2025-05-26 02:32:12.263	2025-05-26 02:32:12.263	\N	\N	\N
122	f3athqjy7xqhirfk1qccvu0l	admin::project-settings.update	{}	\N	{}	[]	2025-05-26 02:32:12.267	2025-05-26 02:32:12.267	2025-05-26 02:32:12.268	\N	\N	\N
123	sfywvgen955dccnrvxovg57y	admin::project-settings.read	{}	\N	{}	[]	2025-05-26 02:32:12.272	2025-05-26 02:32:12.272	2025-05-26 02:32:12.272	\N	\N	\N
124	yuuz4p6d32u6gc5zewe6nokk	admin::transfer.tokens.access	{}	\N	{}	[]	2025-05-26 02:32:12.277	2025-05-26 02:32:12.277	2025-05-26 02:32:12.277	\N	\N	\N
125	c3lphgupokuj3eggfoae48o3	admin::transfer.tokens.create	{}	\N	{}	[]	2025-05-26 02:32:12.282	2025-05-26 02:32:12.282	2025-05-26 02:32:12.282	\N	\N	\N
126	h0jr6rbridbdgaor3jyd01ww	admin::transfer.tokens.read	{}	\N	{}	[]	2025-05-26 02:32:12.287	2025-05-26 02:32:12.287	2025-05-26 02:32:12.287	\N	\N	\N
127	asulj3wl3m33yclx9bubkll3	admin::transfer.tokens.update	{}	\N	{}	[]	2025-05-26 02:32:12.292	2025-05-26 02:32:12.292	2025-05-26 02:32:12.292	\N	\N	\N
128	fpixe9o4gvxifh45qh86zxv0	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2025-05-26 02:32:12.297	2025-05-26 02:32:12.297	2025-05-26 02:32:12.297	\N	\N	\N
129	xx7spj14vam2kg3qn4m0cwoi	admin::transfer.tokens.delete	{}	\N	{}	[]	2025-05-26 02:32:12.302	2025-05-26 02:32:12.302	2025-05-26 02:32:12.302	\N	\N	\N
373	nz5ejqol5ciz3mio884p21pq	plugin::content-manager.explorer.create	{}	api::review-vote.review-vote	{"fields": ["isHelpful", "Identity", "Review"]}	[]	2025-05-29 01:53:04.247	2025-05-29 01:53:04.247	2025-05-29 01:53:04.247	\N	\N	\N
376	tkcomeovmq98oq0italjheg3	plugin::content-manager.explorer.read	{}	api::review-vote.review-vote	{"fields": ["isHelpful", "Identity", "Review"]}	[]	2025-05-29 01:53:04.263	2025-05-29 01:53:04.263	2025-05-29 01:53:04.263	\N	\N	\N
319	v6u5zgroay66axb7tp5lmhkz	plugin::content-manager.explorer.delete	{}	api::platform.platform	{}	[]	2025-05-28 00:17:36.006	2025-05-28 00:17:36.006	2025-05-28 00:17:36.007	\N	\N	\N
379	xvyxtz25zjc1sv6mqm2gda6d	plugin::content-manager.explorer.update	{}	api::review-vote.review-vote	{"fields": ["isHelpful", "Identity", "Review"]}	[]	2025-05-29 01:53:04.277	2025-05-29 01:53:04.277	2025-05-29 01:53:04.278	\N	\N	\N
380	a1t9g9q67xr0xd9ukddn21ko	plugin::content-manager.explorer.delete	{}	api::review-vote.review-vote	{}	[]	2025-05-29 01:53:04.282	2025-05-29 01:53:04.282	2025-05-29 01:53:04.282	\N	\N	\N
381	xlvec836zizynt7yl3so21e1	plugin::content-manager.explorer.publish	{}	api::review-vote.review-vote	{}	[]	2025-05-29 01:53:04.286	2025-05-29 01:53:04.286	2025-05-29 01:53:04.286	\N	\N	\N
408	bvab4jp2k7p112reb5jsezk1	plugin::content-manager.explorer.create	{}	api::identity.identity	{"fields": ["Name", "Type", "Slug", "Avatar", "Bio", "ReviewVote", "ReportMade", "ReportReceived"]}	[]	2025-05-29 02:15:10.771	2025-05-29 02:15:10.771	2025-05-29 02:15:10.772	\N	\N	\N
410	a6utg85nyj310xjgum1ynujg	plugin::content-manager.explorer.read	{}	api::identity.identity	{"fields": ["Name", "Type", "Slug", "Avatar", "Bio", "ReviewVote", "ReportMade", "ReportReceived"]}	[]	2025-05-29 02:15:10.784	2025-05-29 02:15:10.784	2025-05-29 02:15:10.785	\N	\N	\N
412	m05qegmaehufdeyw659azm7c	plugin::content-manager.explorer.update	{}	api::identity.identity	{"fields": ["Name", "Type", "Slug", "Avatar", "Bio", "ReviewVote", "ReportMade", "ReportReceived"]}	[]	2025-05-29 02:15:10.797	2025-05-29 02:15:10.797	2025-05-29 02:15:10.797	\N	\N	\N
634	uto6iv16t7oxxog6yb7wtaul	plugin::content-manager.explorer.create	{}	api::item.item	{"fields": ["Title", "Slug", "Description", "Image", "Gallery", "isActive", "isFeatured", "ItemType", "FieldGroup", "ListingType", "RelatedIdentity", "listings", "Reports", "SearchSummary"], "locales": ["cs", "vi", "en"]}	[]	2025-06-05 22:40:02.775	2025-06-05 22:40:02.775	2025-06-05 22:40:02.775	\N	\N	\N
635	pq6spfa5onmzx76wktcuv3di	plugin::content-manager.explorer.create	{}	api::listing-type.listing-type	{"fields": ["Name", "Slug", "Description", "isActive", "Categories", "Criteria.Name", "Criteria.Weight", "Criteria.Tooltip", "Criteria.isRequired", "Criteria.Order", "Criteria.Icon", "allowComment", "allowRating", "ItemGroup", "ReviewGroup", "IconSet", "TestField", "ComponentFilter"], "locales": ["cs", "vi", "en"]}	[]	2025-06-05 22:40:02.798	2025-06-05 22:40:02.798	2025-06-05 22:40:02.799	\N	\N	\N
636	pn946k93gvxwtepgofloxxog	plugin::content-manager.explorer.read	{}	api::item.item	{"fields": ["Title", "Slug", "Description", "Image", "Gallery", "isActive", "isFeatured", "ItemType", "FieldGroup", "ListingType", "RelatedIdentity", "listings", "Reports", "SearchSummary"], "locales": ["cs", "vi", "en"]}	[]	2025-06-05 22:40:02.804	2025-06-05 22:40:02.804	2025-06-05 22:40:02.804	\N	\N	\N
504	fmus3rcs2fnjjacdii6lc8xx	plugin::content-manager.explorer.create	{}	api::report.report	{"fields": ["Type", "TargetType", "ReportStatus", "Reason", "Description", "Note", "Review", "TargetItem", "TargetListing", "TargetIdentity", "Reporter", "ProofLinks", "Photo"]}	[]	2025-06-01 05:51:56.162	2025-06-01 05:51:56.162	2025-06-01 05:51:56.163	\N	\N	\N
516	ftsctmq19u6krnbnfifr406t	plugin::content-manager.explorer.create	{}	api::category.category	{"fields": ["Name", "Slug", "Description", "Image", "isActive", "Listings", "ListingType", "ParentCategory", "ChildCategories", "Directory"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.552	2025-06-01 23:30:19.552	2025-06-01 23:30:19.553	\N	\N	\N
517	j95n82oksyn7way4jbvd7wgw	plugin::content-manager.explorer.create	{}	api::directory.directory	{"fields": ["Name", "Slug", "Description", "Image", "isActive", "Categories"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.561	2025-06-01 23:30:19.561	2025-06-01 23:30:19.561	\N	\N	\N
518	e936mcq4s14rb10rxx9eo6wf	plugin::content-manager.explorer.create	{}	api::footer.footer	{"fields": ["sections.title", "sections.links.label", "sections.links.href", "sections.links.newTab", "links.label", "links.href", "links.newTab", "copyRight", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.565	2025-06-01 23:30:19.565	2025-06-01 23:30:19.566	\N	\N	\N
520	u322conc1js1ki3ezukk9guc	plugin::content-manager.explorer.create	{}	api::listing.listing	{"fields": ["Title", "Slug", "URL", "isActive", "Description", "Item", "Category", "Reports"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.576	2025-06-01 23:30:19.576	2025-06-01 23:30:19.576	\N	\N	\N
522	w6mk4hnu012tcl3k4o60sxvk	plugin::content-manager.explorer.create	{}	api::navbar.navbar	{"fields": ["links.label", "links.href", "links.newTab", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.586	2025-06-01 23:30:19.586	2025-06-01 23:30:19.586	\N	\N	\N
523	o7o5i4z2bl2onjj62fncd76h	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["title", "breadcrumbTitle", "slug", "fullPath", "content", "children", "parent", "seo.metaTitle", "seo.metaDescription", "seo.metaImage", "seo.keywords", "seo.twitter.card", "seo.twitter.title", "seo.twitter.description", "seo.twitter.siteId", "seo.twitter.creator", "seo.twitter.creatorId", "seo.twitter.images", "seo.og.title", "seo.og.description", "seo.og.url", "seo.og.type", "seo.og.image", "seo.applicationName", "seo.siteName", "seo.email", "seo.canonicalUrl", "seo.metaRobots", "seo.structuredData"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.589	2025-06-01 23:30:19.589	2025-06-01 23:30:19.59	\N	\N	\N
524	n72el47jmxqr5bkxkeljvw6x	plugin::content-manager.explorer.read	{}	api::category.category	{"fields": ["Name", "Slug", "Description", "Image", "isActive", "Listings", "ListingType", "ParentCategory", "ChildCategories", "Directory"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.594	2025-06-01 23:30:19.594	2025-06-01 23:30:19.594	\N	\N	\N
525	znkhc9yzagvyrmbl08khqlym	plugin::content-manager.explorer.read	{}	api::directory.directory	{"fields": ["Name", "Slug", "Description", "Image", "isActive", "Categories"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.598	2025-06-01 23:30:19.598	2025-06-01 23:30:19.598	\N	\N	\N
526	o3ydixd31y915hwkrt7yssy3	plugin::content-manager.explorer.read	{}	api::footer.footer	{"fields": ["sections.title", "sections.links.label", "sections.links.href", "sections.links.newTab", "links.label", "links.href", "links.newTab", "copyRight", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.601	2025-06-01 23:30:19.601	2025-06-01 23:30:19.602	\N	\N	\N
528	bajn4qezg97mecvejhx8u2ii	plugin::content-manager.explorer.read	{}	api::listing.listing	{"fields": ["Title", "Slug", "URL", "isActive", "Description", "Item", "Category", "Reports"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.612	2025-06-01 23:30:19.612	2025-06-01 23:30:19.612	\N	\N	\N
505	rmru0q9jo3d5jbhxnuxytfov	plugin::content-manager.explorer.read	{}	api::report.report	{"fields": ["Type", "TargetType", "ReportStatus", "Reason", "Description", "Note", "Review", "TargetItem", "TargetListing", "TargetIdentity", "Reporter", "ProofLinks", "Photo"]}	[]	2025-06-01 05:51:56.172	2025-06-01 05:51:56.172	2025-06-01 05:51:56.172	\N	\N	\N
506	f7zkmfm2bypsfcwsa3z84sxb	plugin::content-manager.explorer.update	{}	api::report.report	{"fields": ["Type", "TargetType", "ReportStatus", "Reason", "Description", "Note", "Review", "TargetItem", "TargetListing", "TargetIdentity", "Reporter", "ProofLinks", "Photo"]}	[]	2025-06-01 05:51:56.177	2025-06-01 05:51:56.177	2025-06-01 05:51:56.177	\N	\N	\N
530	zkkbjrzkyuemtxnnmpeup26f	plugin::content-manager.explorer.read	{}	api::navbar.navbar	{"fields": ["links.label", "links.href", "links.newTab", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.621	2025-06-01 23:30:19.621	2025-06-01 23:30:19.621	\N	\N	\N
531	oqpsr1cd9k29vj21u6j56b29	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["title", "breadcrumbTitle", "slug", "fullPath", "content", "children", "parent", "seo.metaTitle", "seo.metaDescription", "seo.metaImage", "seo.keywords", "seo.twitter.card", "seo.twitter.title", "seo.twitter.description", "seo.twitter.siteId", "seo.twitter.creator", "seo.twitter.creatorId", "seo.twitter.images", "seo.og.title", "seo.og.description", "seo.og.url", "seo.og.type", "seo.og.image", "seo.applicationName", "seo.siteName", "seo.email", "seo.canonicalUrl", "seo.metaRobots", "seo.structuredData"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.626	2025-06-01 23:30:19.626	2025-06-01 23:30:19.626	\N	\N	\N
532	f1slywgrperq0o42qqzuhvs3	plugin::content-manager.explorer.update	{}	api::category.category	{"fields": ["Name", "Slug", "Description", "Image", "isActive", "Listings", "ListingType", "ParentCategory", "ChildCategories", "Directory"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.631	2025-06-01 23:30:19.631	2025-06-01 23:30:19.631	\N	\N	\N
533	j4406lyquam67kow00k5j1d1	plugin::content-manager.explorer.update	{}	api::directory.directory	{"fields": ["Name", "Slug", "Description", "Image", "isActive", "Categories"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.635	2025-06-01 23:30:19.635	2025-06-01 23:30:19.635	\N	\N	\N
534	kvr82a154hvzbjg2gfkr01se	plugin::content-manager.explorer.update	{}	api::footer.footer	{"fields": ["sections.title", "sections.links.label", "sections.links.href", "sections.links.newTab", "links.label", "links.href", "links.newTab", "copyRight", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.639	2025-06-01 23:30:19.639	2025-06-01 23:30:19.639	\N	\N	\N
536	z8jwqndb41msx2l8jrilcvdw	plugin::content-manager.explorer.update	{}	api::listing.listing	{"fields": ["Title", "Slug", "URL", "isActive", "Description", "Item", "Category", "Reports"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.647	2025-06-01 23:30:19.647	2025-06-01 23:30:19.647	\N	\N	\N
538	aqq63yfimsnoa2nbcfbepjaq	plugin::content-manager.explorer.update	{}	api::navbar.navbar	{"fields": ["links.label", "links.href", "links.newTab", "logoImage.image.media", "logoImage.image.alt", "logoImage.image.width", "logoImage.image.height", "logoImage.image.fallbackSrc", "logoImage.link.label", "logoImage.link.href", "logoImage.link.newTab"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.66	2025-06-01 23:30:19.66	2025-06-01 23:30:19.66	\N	\N	\N
539	p5qcrxz5i0has7wvbzijiip0	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["title", "breadcrumbTitle", "slug", "fullPath", "content", "children", "parent", "seo.metaTitle", "seo.metaDescription", "seo.metaImage", "seo.keywords", "seo.twitter.card", "seo.twitter.title", "seo.twitter.description", "seo.twitter.siteId", "seo.twitter.creator", "seo.twitter.creatorId", "seo.twitter.images", "seo.og.title", "seo.og.description", "seo.og.url", "seo.og.type", "seo.og.image", "seo.applicationName", "seo.siteName", "seo.email", "seo.canonicalUrl", "seo.metaRobots", "seo.structuredData"], "locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.664	2025-06-01 23:30:19.664	2025-06-01 23:30:19.664	\N	\N	\N
540	ju2wyz2qmmg7u615s9kednov	plugin::content-manager.explorer.delete	{}	api::category.category	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.669	2025-06-01 23:30:19.669	2025-06-01 23:30:19.669	\N	\N	\N
541	blohjpb7rg042icql0ioechj	plugin::content-manager.explorer.delete	{}	api::directory.directory	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.673	2025-06-01 23:30:19.673	2025-06-01 23:30:19.673	\N	\N	\N
542	odo7munt6txwsfy542c8w4py	plugin::content-manager.explorer.delete	{}	api::footer.footer	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.678	2025-06-01 23:30:19.678	2025-06-01 23:30:19.678	\N	\N	\N
543	zsfvdhsf6wgpxo3x96e4auu0	plugin::content-manager.explorer.delete	{}	api::item.item	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.683	2025-06-01 23:30:19.683	2025-06-01 23:30:19.683	\N	\N	\N
544	aknka6gu1kcb5s4hy5ntrp4q	plugin::content-manager.explorer.delete	{}	api::listing.listing	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.687	2025-06-01 23:30:19.687	2025-06-01 23:30:19.687	\N	\N	\N
545	t9gbrc609pnb4byydi7z8mu6	plugin::content-manager.explorer.delete	{}	api::listing-type.listing-type	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.691	2025-06-01 23:30:19.691	2025-06-01 23:30:19.691	\N	\N	\N
546	mrznr3x2clp4hink57bviaj9	plugin::content-manager.explorer.delete	{}	api::navbar.navbar	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.696	2025-06-01 23:30:19.696	2025-06-01 23:30:19.696	\N	\N	\N
547	hw77wb8696213i1nb4jjkgp2	plugin::content-manager.explorer.delete	{}	api::page.page	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.7	2025-06-01 23:30:19.7	2025-06-01 23:30:19.7	\N	\N	\N
548	xt2euuki8w4dphaqx2onsxt9	plugin::content-manager.explorer.publish	{}	api::category.category	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.704	2025-06-01 23:30:19.704	2025-06-01 23:30:19.704	\N	\N	\N
549	wpkgs45ypqgae8esdlitrvad	plugin::content-manager.explorer.publish	{}	api::directory.directory	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.708	2025-06-01 23:30:19.708	2025-06-01 23:30:19.708	\N	\N	\N
550	ix3h3prwqk85d6qkag979fp7	plugin::content-manager.explorer.publish	{}	api::footer.footer	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.713	2025-06-01 23:30:19.713	2025-06-01 23:30:19.713	\N	\N	\N
551	z2f9rtvz9530b209z9kt5rzj	plugin::content-manager.explorer.publish	{}	api::item.item	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.717	2025-06-01 23:30:19.717	2025-06-01 23:30:19.717	\N	\N	\N
552	j6t129gqd2bm4c3bma9adx3v	plugin::content-manager.explorer.publish	{}	api::listing.listing	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.721	2025-06-01 23:30:19.721	2025-06-01 23:30:19.721	\N	\N	\N
553	ksnk6vgddowmei6anczy9go1	plugin::content-manager.explorer.publish	{}	api::listing-type.listing-type	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.726	2025-06-01 23:30:19.726	2025-06-01 23:30:19.727	\N	\N	\N
554	rg088auluyxu4bwx5h5s807a	plugin::content-manager.explorer.publish	{}	api::navbar.navbar	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.731	2025-06-01 23:30:19.731	2025-06-01 23:30:19.731	\N	\N	\N
555	kaz12tneyvnvmvs7k3vn760l	plugin::content-manager.explorer.publish	{}	api::page.page	{"locales": ["cs", "vi", "en"]}	[]	2025-06-01 23:30:19.735	2025-06-01 23:30:19.735	2025-06-01 23:30:19.736	\N	\N	\N
637	x8y4a2zqfvorwsos6c56vw56	plugin::content-manager.explorer.read	{}	api::listing-type.listing-type	{"fields": ["Name", "Slug", "Description", "isActive", "Categories", "Criteria.Name", "Criteria.Weight", "Criteria.Tooltip", "Criteria.isRequired", "Criteria.Order", "Criteria.Icon", "allowComment", "allowRating", "ItemGroup", "ReviewGroup", "IconSet", "TestField", "ComponentFilter"], "locales": ["cs", "vi", "en"]}	[]	2025-06-05 22:40:02.81	2025-06-05 22:40:02.81	2025-06-05 22:40:02.81	\N	\N	\N
638	gjx2mdmxa7b7etowo39gflek	plugin::content-manager.explorer.update	{}	api::item.item	{"fields": ["Title", "Slug", "Description", "Image", "Gallery", "isActive", "isFeatured", "ItemType", "FieldGroup", "ListingType", "RelatedIdentity", "listings", "Reports", "SearchSummary"], "locales": ["cs", "vi", "en"]}	[]	2025-06-05 22:40:02.816	2025-06-05 22:40:02.816	2025-06-05 22:40:02.816	\N	\N	\N
639	hc2rhw8z3ybyixx1d3k73yrv	plugin::content-manager.explorer.update	{}	api::listing-type.listing-type	{"fields": ["Name", "Slug", "Description", "isActive", "Categories", "Criteria.Name", "Criteria.Weight", "Criteria.Tooltip", "Criteria.isRequired", "Criteria.Order", "Criteria.Icon", "allowComment", "allowRating", "ItemGroup", "ReviewGroup", "IconSet", "TestField", "ComponentFilter"], "locales": ["cs", "vi", "en"]}	[]	2025-06-05 22:40:02.821	2025-06-05 22:40:02.821	2025-06-05 22:40:02.821	\N	\N	\N
\.


--
-- Data for Name: admin_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.admin_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	1	2	1
3	3	2	3
4	4	2	4
5	5	2	5
7	7	2	7
8	8	2	8
9	9	2	9
11	11	2	11
12	12	2	12
16	16	2	16
20	20	2	20
21	21	2	21
22	22	2	22
23	23	2	23
24	24	2	24
25	25	2	25
26	26	2	26
448	373	1	195
30	30	3	4
451	376	1	198
34	34	3	8
217	217	3	23
38	38	3	12
42	42	3	16
43	43	3	17
44	44	3	18
45	45	3	19
46	46	3	20
47	47	3	21
48	48	3	22
218	218	3	24
219	219	3	25
220	220	3	26
52	52	1	4
53	53	1	5
221	221	3	27
222	222	3	28
223	223	3	29
57	57	1	9
58	58	1	10
454	379	1	201
455	380	1	202
456	381	1	203
62	62	1	14
63	63	1	15
67	67	1	19
68	68	1	20
72	72	1	24
73	73	1	25
74	74	1	26
75	75	1	27
76	76	1	28
77	77	1	29
78	78	1	30
79	79	1	31
80	80	1	32
81	81	1	33
82	82	1	34
83	83	1	35
84	84	1	36
85	85	1	37
86	86	1	38
87	87	1	39
88	88	1	40
89	89	1	41
90	90	1	42
91	91	1	43
92	92	1	44
93	93	1	45
94	94	1	46
95	95	1	47
96	96	1	48
97	97	1	49
98	98	1	50
99	99	1	51
100	100	1	52
101	101	1	53
102	102	1	54
103	103	1	55
104	104	1	56
105	105	1	57
106	106	1	58
107	107	1	59
108	108	1	60
109	109	1	61
110	110	1	62
111	111	1	63
112	112	1	64
113	113	1	65
114	114	1	66
115	115	1	67
116	116	1	68
117	117	1	69
118	118	1	70
119	119	1	71
120	120	1	72
121	121	1	73
122	122	1	74
123	123	1	75
124	124	1	76
125	125	1	77
126	126	1	78
127	127	1	79
128	128	1	80
129	129	1	81
709	634	1	355
579	504	1	306
580	505	1	307
581	506	1	308
585	510	1	312
586	511	1	313
710	635	1	356
711	636	1	357
587	512	1	314
712	637	1	358
713	638	1	359
483	408	1	224
485	410	1	226
487	412	1	228
356	281	1	124
357	282	1	125
394	319	1	159
395	320	1	160
399	324	1	164
400	325	1	165
714	639	1	360
404	329	1	166
405	330	1	167
406	331	1	168
460	385	1	207
461	386	1	208
591	516	1	315
592	517	1	316
593	518	1	317
595	520	1	319
597	522	1	321
598	523	1	322
599	524	1	323
600	525	1	324
601	526	1	325
603	528	1	327
605	530	1	329
606	531	1	330
607	532	1	331
608	533	1	332
609	534	1	333
611	536	1	335
613	538	1	337
614	539	1	338
615	540	1	339
616	541	1	340
617	542	1	341
618	543	1	342
619	544	1	343
620	545	1	344
621	546	1	345
622	547	1	346
623	548	1	347
624	549	1	348
625	550	1	349
626	551	1	350
627	552	1	351
628	553	1	352
629	554	1	353
630	555	1	354
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.admin_roles (id, document_id, name, code, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	elpjmz3x7jy460g50xa8ykmi	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2025-05-26 02:32:11.585	2025-05-26 02:32:11.585	2025-05-26 02:32:11.585	\N	\N	\N
2	k5qpwlcncnuks30i9pbxbuad	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2025-05-26 02:32:11.592	2025-05-26 02:32:11.592	2025-05-26 02:32:11.592	\N	\N	\N
3	odzsp59enfj67t8y1zxz9xl8	Author	strapi-author	Authors can manage the content they have created.	2025-05-26 02:32:11.595	2025-05-27 14:58:22.743	2025-05-26 02:32:11.595	\N	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.admin_users (id, document_id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	pp3olk0oulcrmdrjqifgoie6	Anh	Le	JOY	joy@joy.vn	$2a$10$jcvFjVWUqVpfwyCEaiW7S.OkFYP5rZS2SplTZ5g7sOIkfcZ4KJNiy	\N	\N	t	f	\N	2025-05-26 02:32:58.506	2025-06-04 11:37:25.695	2025-05-26 02:32:58.507	\N	\N	\N
2	oiwhhumegzuudvw77ty6vjfv	AI	Agnet	AI	ai@rate.box	$2a$10$IYnO8S44UmvJvYtjr37cF.Om9HuFXyVpBpjFCOt.KRvo0PpFMuPZ6	\N	143e8f4c9c23a0c4b6c7a5d4fc665eb5ff0da2fa	t	f	\N	2025-06-05 17:50:02.364	2025-06-05 17:51:01.419	2025-06-05 17:50:02.364	\N	\N	\N
\.


--
-- Data for Name: admin_users_roles_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.admin_users_roles_lnk (id, user_id, role_id, role_ord, user_ord) FROM stdin;
1	1	1	1	1
3	2	1	1	2
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.categories (id, document_id, name, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, slug, description, is_active) FROM stdin;
27	hga0bri3sp2rn20gi9r74yw8	Test Category	2025-06-02 23:55:13.716	2025-06-02 23:55:20.541	2025-06-02 23:55:20.577	1	1	en	test-category	\N	t
15	cjj282wphypgpqdprjvgym6q	Spammer	2025-06-01 23:20:04.71	2025-06-01 23:20:04.71	\N	1	1	vi	Spammer	[{"type": "paragraph", "children": [{"text": "Spammer", "type": "text"}]}]	t
13	cjj282wphypgpqdprjvgym6q	Spammer	2025-06-01 23:19:42.654	2025-06-01 23:20:04.725	\N	1	1	en	Spammer	[{"type": "paragraph", "children": [{"text": "Spammer", "type": "text"}]}]	t
16	cjj282wphypgpqdprjvgym6q	Spammer	2025-06-01 23:20:04.71	2025-06-01 23:20:04.71	2025-06-01 23:20:04.739	1	1	vi	Spammer	[{"type": "paragraph", "children": [{"text": "Spammer", "type": "text"}]}]	t
7	up2iddxtyiiruau7iwagu6t3	Scammer	2025-06-01 20:32:16.157	2025-06-01 22:43:27.637	\N	1	1	vi	Scammer	[{"type": "paragraph", "children": [{"text": "Scammer", "type": "text"}]}]	t
1	up2iddxtyiiruau7iwagu6t3	Scammer	2025-05-31 20:08:17.844	2025-06-01 22:43:27.65	\N	1	1	en	scammer	[{"type": "paragraph", "children": [{"text": "Scammer", "type": "text"}]}]	t
11	up2iddxtyiiruau7iwagu6t3	Scammer	2025-06-01 20:32:16.157	2025-06-01 22:43:27.637	2025-06-01 22:43:27.663	1	1	vi	Scammer	[{"type": "paragraph", "children": [{"text": "Scammer", "type": "text"}]}]	t
9	up2iddxtyiiruau7iwagu6t3	Scammer	2025-05-31 20:08:17.844	2025-06-01 22:43:27.679	2025-06-01 22:43:10.728	1	1	en	scammer	[{"type": "paragraph", "children": [{"text": "Scammer", "type": "text"}]}]	t
14	cjj282wphypgpqdprjvgym6q	Spammer	2025-06-01 23:19:42.654	2025-06-01 23:20:04.759	2025-06-01 23:19:42.693	1	1	en	Spammer	[{"type": "paragraph", "children": [{"text": "Spammer", "type": "text"}]}]	t
21	mje9ij241ybi7f0w6scy8i7g	Bank	2025-06-01 23:25:01.201	2025-06-01 23:39:39.328	\N	1	1	en	Bank	[{"type": "paragraph", "children": [{"text": "Ngân Hàng", "type": "text"}]}]	t
23	mje9ij241ybi7f0w6scy8i7g	Ngân Hàng	2025-06-01 23:38:14.63	2025-06-01 23:39:39.344	\N	1	1	vi	ngan-hang	[{"type": "paragraph", "children": [{"text": "Ngân Hàng", "type": "text"}]}]	t
25	mje9ij241ybi7f0w6scy8i7g	Bank	2025-06-01 23:25:01.201	2025-06-01 23:39:39.328	2025-06-01 23:39:39.361	1	1	en	Bank	[{"type": "paragraph", "children": [{"text": "Ngân Hàng", "type": "text"}]}]	t
24	mje9ij241ybi7f0w6scy8i7g	Ngân Hàng	2025-06-01 23:38:14.63	2025-06-01 23:39:39.39	2025-06-01 23:38:14.679	1	1	vi	ngan-hang	[{"type": "paragraph", "children": [{"text": "Ngân Hàng", "type": "text"}]}]	t
26	hga0bri3sp2rn20gi9r74yw8	Test Category	2025-06-02 23:55:13.716	2025-06-02 23:55:20.541	\N	1	1	en	test-category	\N	t
\.


--
-- Data for Name: categories_directory_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.categories_directory_lnk (id, category_id, directory_id, category_ord) FROM stdin;
1	1	1	0
12	9	56	1
14	7	59	0
15	11	60	1
17	13	57	1
18	14	58	1
19	15	59	1
20	16	60	2
25	21	43	1
27	23	45	1
28	24	46	1
29	25	44	1
\.


--
-- Data for Name: categories_listing_type_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.categories_listing_type_lnk (id, category_id, listing_type_id, category_ord) FROM stdin;
1	1	1	1
5	7	4	0
6	11	5	1
8	21	7	0
11	23	9	0
12	24	10	1
16	9	15	1
18	25	17	1
\.


--
-- Data for Name: categories_parent_category_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.categories_parent_category_lnk (id, category_id, inv_category_id, category_ord) FROM stdin;
\.


--
-- Data for Name: components_contact_basics; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_contact_basics (id, email, phone, website) FROM stdin;
\.


--
-- Data for Name: components_contact_locations; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_contact_locations (id, address) FROM stdin;
\.


--
-- Data for Name: components_contact_social_medias; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_contact_social_medias (id, facebook, instagram, you_tube, tik_tok, linked_in, discord, telegram) FROM stdin;
\.


--
-- Data for Name: components_elements_footer_items; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_elements_footer_items (id, title) FROM stdin;
3	Pages
4	Pages
6	Pages
7	Pages
8	Pages
\.


--
-- Data for Name: components_elements_footer_items_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_elements_footer_items_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
11	3	41	utilities.link	links	1
12	3	42	utilities.link	links	2
13	4	43	utilities.link	links	1
14	4	44	utilities.link	links	2
17	6	70	utilities.link	links	1
18	6	71	utilities.link	links	2
19	7	91	utilities.link	links	1
20	7	92	utilities.link	links	2
21	8	94	utilities.link	links	1
22	8	95	utilities.link	links	2
\.


--
-- Data for Name: components_forms_contact_forms; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_forms_contact_forms (id, title, description) FROM stdin;
3	Contact Us	Have questions, feedback, or want to contribute? We’d love to hear from you. Whether you’re building with the starter, planning to use it in production, or have suggestions for improvement—reach out!
4	Contact Us	Have questions, feedback, or want to contribute? We’d love to hear from you. Whether you’re building with the starter, planning to use it in production, or have suggestions for improvement—reach out!
5	Contact Us	Have questions, feedback, or want to contribute? We’d love to hear from you. Whether you’re building with the starter, planning to use it in production, or have suggestions for improvement—reach out!
6	Contact Us	Have questions, feedback, or want to contribute? We’d love to hear from you. Whether you’re building with the starter, planning to use it in production, or have suggestions for improvement—reach out!
7	Contact Us	Have questions, feedback, or want to contribute? We’d love to hear from you. Whether you’re building with the starter, planning to use it in production, or have suggestions for improvement—reach out!
8	Contact Us	Have questions, feedback, or want to contribute? We’d love to hear from you. Whether you’re building with the starter, planning to use it in production, or have suggestions for improvement—reach out!
\.


--
-- Data for Name: components_forms_contact_forms_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_forms_contact_forms_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: components_forms_newsletter_forms; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_forms_newsletter_forms (id, title, description) FROM stdin;
\.


--
-- Data for Name: components_forms_newsletter_forms_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_forms_newsletter_forms_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: components_info_bank_infos; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_info_bank_infos (id, name, swift_bic) FROM stdin;
\.


--
-- Data for Name: components_media_photos; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_media_photos (id) FROM stdin;
\.


--
-- Data for Name: components_media_videos; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_media_videos (id, you_tube) FROM stdin;
\.


--
-- Data for Name: components_rating_criteria; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_rating_criteria (id, name, weight, tooltip, is_required, "order", icon) FROM stdin;
\.


--
-- Data for Name: components_review_pro_items; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_review_pro_items (id, item) FROM stdin;
\.


--
-- Data for Name: components_review_pros_cons; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_review_pros_cons (id) FROM stdin;
\.


--
-- Data for Name: components_review_pros_cons_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_review_pros_cons_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: components_sections_animated_logo_rows; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_animated_logo_rows (id, text) FROM stdin;
3	Technologies
4	Technologies
5	Technologies
6	Technologies
7	Technologies
8	Technologies
\.


--
-- Data for Name: components_sections_animated_logo_rows_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_animated_logo_rows_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
9	3	31	utilities.basic-image	logos	1
10	3	32	utilities.basic-image	logos	2
11	3	33	utilities.basic-image	logos	3
12	3	34	utilities.basic-image	logos	4
13	4	36	utilities.basic-image	logos	1
14	4	37	utilities.basic-image	logos	2
15	4	38	utilities.basic-image	logos	3
16	4	39	utilities.basic-image	logos	4
17	5	47	utilities.basic-image	logos	1
18	5	48	utilities.basic-image	logos	2
19	5	49	utilities.basic-image	logos	3
20	5	50	utilities.basic-image	logos	4
21	6	52	utilities.basic-image	logos	1
22	6	53	utilities.basic-image	logos	2
23	6	54	utilities.basic-image	logos	3
24	6	55	utilities.basic-image	logos	4
25	7	57	utilities.basic-image	logos	1
26	7	58	utilities.basic-image	logos	2
27	7	59	utilities.basic-image	logos	3
28	7	60	utilities.basic-image	logos	4
29	8	62	utilities.basic-image	logos	1
30	8	63	utilities.basic-image	logos	2
31	8	64	utilities.basic-image	logos	3
32	8	65	utilities.basic-image	logos	4
\.


--
-- Data for Name: components_sections_carousels; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_carousels (id, radius) FROM stdin;
7	lg
8	lg
9	lg
10	lg
11	lg
12	lg
\.


--
-- Data for Name: components_sections_carousels_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_carousels_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
19	7	26	utilities.image-with-link	images	1
20	7	27	utilities.image-with-link	images	2
21	7	28	utilities.image-with-link	images	3
22	8	29	utilities.image-with-link	images	1
23	8	30	utilities.image-with-link	images	2
24	8	31	utilities.image-with-link	images	3
25	9	36	utilities.image-with-link	images	1
26	9	37	utilities.image-with-link	images	2
27	9	38	utilities.image-with-link	images	3
28	10	39	utilities.image-with-link	images	1
29	10	40	utilities.image-with-link	images	2
30	10	41	utilities.image-with-link	images	3
31	11	42	utilities.image-with-link	images	1
32	11	43	utilities.image-with-link	images	2
33	11	44	utilities.image-with-link	images	3
34	12	45	utilities.image-with-link	images	1
35	12	46	utilities.image-with-link	images	2
36	12	47	utilities.image-with-link	images	3
\.


--
-- Data for Name: components_sections_faqs; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_faqs (id, title, sub_title) FROM stdin;
7	FAQ	\N
8	FAQ	\N
9	FAQ	\N
10	FAQ	\N
11	FAQ	\N
12	FAQ	\N
\.


--
-- Data for Name: components_sections_faqs_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_faqs_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
25	7	25	utilities.accordions	accordions	1
26	7	26	utilities.accordions	accordions	2
27	7	27	utilities.accordions	accordions	3
28	7	28	utilities.accordions	accordions	4
29	8	29	utilities.accordions	accordions	1
30	8	30	utilities.accordions	accordions	2
31	8	31	utilities.accordions	accordions	3
32	8	32	utilities.accordions	accordions	4
33	9	33	utilities.accordions	accordions	1
34	9	34	utilities.accordions	accordions	2
35	9	35	utilities.accordions	accordions	3
36	9	36	utilities.accordions	accordions	4
37	10	37	utilities.accordions	accordions	1
38	10	38	utilities.accordions	accordions	2
39	10	39	utilities.accordions	accordions	3
40	10	40	utilities.accordions	accordions	4
41	11	41	utilities.accordions	accordions	1
42	11	42	utilities.accordions	accordions	2
43	11	43	utilities.accordions	accordions	3
44	11	44	utilities.accordions	accordions	4
45	12	45	utilities.accordions	accordions	1
46	12	46	utilities.accordions	accordions	2
47	12	47	utilities.accordions	accordions	3
48	12	48	utilities.accordions	accordions	4
\.


--
-- Data for Name: components_sections_heading_with_cta_buttons; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_heading_with_cta_buttons (id, title, sub_text) FROM stdin;
7	Modern Stack, Zero Setup	Everything you need, preconfigured!
8	Modern Stack, Zero Setup	Everything you need, preconfigured!
9	Modern Stack, Zero Setup	Everything you need, preconfigured!
10	Modern Stack, Zero Setup	Everything you need, preconfigured!
11	Modern Stack, Zero Setup	Everything you need, preconfigured!
12	Modern Stack, Zero Setup	Everything you need, preconfigured!
\.


--
-- Data for Name: components_sections_heading_with_cta_buttons_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_heading_with_cta_buttons_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
7	7	79	utilities.link	cta	\N
8	8	83	utilities.link	cta	\N
9	9	105	utilities.link	cta	\N
10	10	109	utilities.link	cta	\N
11	11	113	utilities.link	cta	\N
12	12	117	utilities.link	cta	\N
\.


--
-- Data for Name: components_sections_heroes; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_heroes (id, title, sub_title, bg_color) FROM stdin;
3	Strapi + NextJS	Monorepo Starter	\N
4	Strapi + NextJS	Monorepo Starter	\N
5	Strapi + NextJS	Monorepo Starter	\N
6	Strapi + NextJS	Monorepo Starter	\N
7	Strapi + NextJS	Monorepo Starter	\N
8	Strapi + NextJS	Monorepo Starter	\N
\.


--
-- Data for Name: components_sections_heroes_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_heroes_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
7	3	75	utilities.link	links	1
8	3	76	utilities.link	links	2
9	3	35	utilities.basic-image	image	\N
10	4	77	utilities.link	links	1
11	4	78	utilities.link	links	2
12	4	40	utilities.basic-image	image	\N
13	5	97	utilities.link	links	1
14	5	98	utilities.link	links	2
15	5	51	utilities.basic-image	image	\N
16	6	99	utilities.link	links	1
17	6	100	utilities.link	links	2
18	6	56	utilities.basic-image	image	\N
19	7	101	utilities.link	links	1
20	7	102	utilities.link	links	2
21	7	61	utilities.basic-image	image	\N
22	8	103	utilities.link	links	1
23	8	104	utilities.link	links	2
24	8	66	utilities.basic-image	image	\N
\.


--
-- Data for Name: components_sections_horizontal_images; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_horizontal_images (id, title, spacing, image_radius, fixed_image_height, fixed_image_width) FROM stdin;
\.


--
-- Data for Name: components_sections_horizontal_images_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_horizontal_images_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: components_sections_image_with_cta_buttons; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_image_with_cta_buttons (id, title, sub_text) FROM stdin;
\.


--
-- Data for Name: components_sections_image_with_cta_buttons_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_sections_image_with_cta_buttons_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: components_seo_utilities_meta_socials; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_seo_utilities_meta_socials (id, social_network, title, description) FROM stdin;
\.


--
-- Data for Name: components_seo_utilities_seo_ogs; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_seo_utilities_seo_ogs (id, title, description, url, type) FROM stdin;
3	\N	\N	\N	website
4	\N	\N	\N	website
\.


--
-- Data for Name: components_seo_utilities_seo_twitters; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_seo_utilities_seo_twitters (id, card, title, description, site_id, creator, creator_id) FROM stdin;
3	\N	\N	\N	\N	\N	\N
4	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: components_seo_utilities_seos; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_seo_utilities_seos (id, meta_title, meta_description, keywords, application_name, site_name, email, canonical_url, meta_robots, structured_data) FROM stdin;
21	\N	\N	\N	\N	\N	\N	\N	all	\N
22	\N	\N	\N	\N	\N	\N	\N	all	\N
23	\N	\N	\N	\N	\N	\N	\N	all	\N
24	\N	\N	\N	\N	\N	\N	\N	all	\N
25	\N	\N	\N	\N	\N	\N	\N	all	\N
26	\N	\N	\N	\N	\N	\N	\N	all	\N
27	\N	\N	\N	\N	\N	\N	\N	all	\N
28	\N	\N	\N	\N	\N	\N	\N	all	\N
29	\N	\N	\N	\N	\N	\N	\N	all	\N
30	\N	\N	\N	\N	\N	\N	\N	all	\N
31	\N	\N	\N	\N	\N	\N	\N	all	\N
32	\N	\N	\N	\N	\N	\N	\N	all	\N
\.


--
-- Data for Name: components_seo_utilities_seos_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_seo_utilities_seos_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
5	31	3	seo-utilities.seo-twitter	twitter	\N
6	31	3	seo-utilities.seo-og	og	\N
7	32	4	seo-utilities.seo-twitter	twitter	\N
8	32	4	seo-utilities.seo-og	og	\N
\.


--
-- Data for Name: components_seo_utilities_social_icons; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_seo_utilities_social_icons (id, title) FROM stdin;
\.


--
-- Data for Name: components_seo_utilities_social_icons_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_seo_utilities_social_icons_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: components_shared_meta_socials; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_shared_meta_socials (id, social_network, title, description) FROM stdin;
\.


--
-- Data for Name: components_shared_seos; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_shared_seos (id, meta_title, meta_description, keywords, meta_robots, structured_data, meta_viewport, canonical_url) FROM stdin;
\.


--
-- Data for Name: components_shared_seos_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_shared_seos_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: components_utilities_accordions; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_utilities_accordions (id, question, answer) FROM stdin;
25	What is this starter project for?	This starter provides a fully configured monorepo setup combining Strapi v5 (as the headless CMS) with Next.js 14 (for the frontend), including TypeScript, Tailwind CSS, Shadcn/ui, and Turborepo. It's ideal for building scalable, fullstack applications quickly without wasting time on boilerplate setup.
26	Can I deploy the backend and frontend separately?	Yes. While the monorepo makes local development easy, the Strapi backend and Next.js frontend can be deployed independently on services like Vercel, Strapi Cloud, Heroku or DigitalOcean. Environment variables and Docker support make deployments flexible and environment-specific.
27	Does it support TypeScript end-to-end?	Absolutely. Both the backend (Strapi) and frontend (Next.js) are fully written in TypeScript. Shared types are included so your API contracts remain consistent across the entire stack.
28	How do I customize or extend the CMS?	Strapi v5 plugins and extensions are supported out of the box. You can add custom content types, controllers, routes, and policies using the provided TypeScript scaffolding. It's fully adaptable to your business logic and data model needs.
29	What is this starter project for?	This starter provides a fully configured monorepo setup combining Strapi v5 (as the headless CMS) with Next.js 14 (for the frontend), including TypeScript, Tailwind CSS, Shadcn/ui, and Turborepo. It's ideal for building scalable, fullstack applications quickly without wasting time on boilerplate setup.
30	Can I deploy the backend and frontend separately?	Yes. While the monorepo makes local development easy, the Strapi backend and Next.js frontend can be deployed independently on services like Vercel, Strapi Cloud, Heroku or DigitalOcean. Environment variables and Docker support make deployments flexible and environment-specific.
31	Does it support TypeScript end-to-end?	Absolutely. Both the backend (Strapi) and frontend (Next.js) are fully written in TypeScript. Shared types are included so your API contracts remain consistent across the entire stack.
32	How do I customize or extend the CMS?	Strapi v5 plugins and extensions are supported out of the box. You can add custom content types, controllers, routes, and policies using the provided TypeScript scaffolding. It's fully adaptable to your business logic and data model needs.
33	What is this starter project for?	This starter provides a fully configured monorepo setup combining Strapi v5 (as the headless CMS) with Next.js 14 (for the frontend), including TypeScript, Tailwind CSS, Shadcn/ui, and Turborepo. It's ideal for building scalable, fullstack applications quickly without wasting time on boilerplate setup.
34	Can I deploy the backend and frontend separately?	Yes. While the monorepo makes local development easy, the Strapi backend and Next.js frontend can be deployed independently on services like Vercel, Strapi Cloud, Heroku or DigitalOcean. Environment variables and Docker support make deployments flexible and environment-specific.
35	Does it support TypeScript end-to-end?	Absolutely. Both the backend (Strapi) and frontend (Next.js) are fully written in TypeScript. Shared types are included so your API contracts remain consistent across the entire stack.
36	How do I customize or extend the CMS?	Strapi v5 plugins and extensions are supported out of the box. You can add custom content types, controllers, routes, and policies using the provided TypeScript scaffolding. It's fully adaptable to your business logic and data model needs.
37	What is this starter project for?	This starter provides a fully configured monorepo setup combining Strapi v5 (as the headless CMS) with Next.js 14 (for the frontend), including TypeScript, Tailwind CSS, Shadcn/ui, and Turborepo. It's ideal for building scalable, fullstack applications quickly without wasting time on boilerplate setup.
38	Can I deploy the backend and frontend separately?	Yes. While the monorepo makes local development easy, the Strapi backend and Next.js frontend can be deployed independently on services like Vercel, Strapi Cloud, Heroku or DigitalOcean. Environment variables and Docker support make deployments flexible and environment-specific.
39	Does it support TypeScript end-to-end?	Absolutely. Both the backend (Strapi) and frontend (Next.js) are fully written in TypeScript. Shared types are included so your API contracts remain consistent across the entire stack.
40	How do I customize or extend the CMS?	Strapi v5 plugins and extensions are supported out of the box. You can add custom content types, controllers, routes, and policies using the provided TypeScript scaffolding. It's fully adaptable to your business logic and data model needs.
41	What is this starter project for?	This starter provides a fully configured monorepo setup combining Strapi v5 (as the headless CMS) with Next.js 14 (for the frontend), including TypeScript, Tailwind CSS, Shadcn/ui, and Turborepo. It's ideal for building scalable, fullstack applications quickly without wasting time on boilerplate setup.
42	Can I deploy the backend and frontend separately?	Yes. While the monorepo makes local development easy, the Strapi backend and Next.js frontend can be deployed independently on services like Vercel, Strapi Cloud, Heroku or DigitalOcean. Environment variables and Docker support make deployments flexible and environment-specific.
43	Does it support TypeScript end-to-end?	Absolutely. Both the backend (Strapi) and frontend (Next.js) are fully written in TypeScript. Shared types are included so your API contracts remain consistent across the entire stack.
44	How do I customize or extend the CMS?	Strapi v5 plugins and extensions are supported out of the box. You can add custom content types, controllers, routes, and policies using the provided TypeScript scaffolding. It's fully adaptable to your business logic and data model needs.
45	What is this starter project for?	This starter provides a fully configured monorepo setup combining Strapi v5 (as the headless CMS) with Next.js 14 (for the frontend), including TypeScript, Tailwind CSS, Shadcn/ui, and Turborepo. It's ideal for building scalable, fullstack applications quickly without wasting time on boilerplate setup.
46	Can I deploy the backend and frontend separately?	Yes. While the monorepo makes local development easy, the Strapi backend and Next.js frontend can be deployed independently on services like Vercel, Strapi Cloud, Heroku or DigitalOcean. Environment variables and Docker support make deployments flexible and environment-specific.
47	Does it support TypeScript end-to-end?	Absolutely. Both the backend (Strapi) and frontend (Next.js) are fully written in TypeScript. Shared types are included so your API contracts remain consistent across the entire stack.
48	How do I customize or extend the CMS?	Strapi v5 plugins and extensions are supported out of the box. You can add custom content types, controllers, routes, and policies using the provided TypeScript scaffolding. It's fully adaptable to your business logic and data model needs.
\.


--
-- Data for Name: components_utilities_basic_images; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_utilities_basic_images (id, alt, width, height, fallback_src) FROM stdin;
31	strapi	\N	\N	\N
32	nextjs	\N	\N	\N
33	tailwindcss	\N	\N	\N
34	shadcn/ui	\N	\N	\N
35	starter-template	\N	\N	\N
36	strapi	\N	\N	\N
37	nextjs	\N	\N	\N
38	tailwindcss	\N	\N	\N
39	shadcn/ui	\N	\N	\N
40	starter-template	\N	\N	\N
41	carousel1	\N	\N	\N
42	carousel-2	\N	\N	\N
43	carousel-3	\N	\N	\N
44	carousel1	\N	\N	\N
45	carousel-2	\N	\N	\N
46	carousel-3	\N	\N	\N
47	strapi	\N	\N	\N
48	nextjs	\N	\N	\N
49	tailwindcss	\N	\N	\N
50	shadcn/ui	\N	\N	\N
51	starter-template	\N	\N	\N
52	strapi	\N	\N	\N
53	nextjs	\N	\N	\N
54	tailwindcss	\N	\N	\N
55	shadcn/ui	\N	\N	\N
56	starter-template	\N	\N	\N
57	strapi	\N	\N	\N
58	nextjs	\N	\N	\N
59	tailwindcss	\N	\N	\N
60	shadcn/ui	\N	\N	\N
61	starter-template	\N	\N	\N
62	strapi	\N	\N	\N
63	nextjs	\N	\N	\N
64	tailwindcss	\N	\N	\N
65	shadcn/ui	\N	\N	\N
66	starter-template	\N	\N	\N
67	carousel1	\N	\N	\N
68	carousel-2	\N	\N	\N
69	carousel-3	\N	\N	\N
70	carousel1	\N	\N	\N
71	carousel-2	\N	\N	\N
72	carousel-3	\N	\N	\N
73	carousel1	\N	\N	\N
74	carousel-2	\N	\N	\N
75	carousel-3	\N	\N	\N
76	carousel1	\N	\N	\N
77	carousel-2	\N	\N	\N
78	carousel-3	\N	\N	\N
\.


--
-- Data for Name: components_utilities_ck_editor_contents; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_utilities_ck_editor_contents (id, content) FROM stdin;
3	<h3 style="text-align:center;">🚀 Kickstart your project development&nbsp;</h3><p style="text-align:center;"><span style="color:var(--color-muted-foreground);">Build Faster with the Ultimate Monorepo Starter for Strapi &amp; Next.js</span></p>
4	<h3 style="text-align:center;">🚀 Kickstart your project development&nbsp;</h3><p style="text-align:center;"><span style="color:var(--color-muted-foreground);">Build Faster with the Ultimate Monorepo Starter for Strapi &amp; Next.js</span></p>
5	<h3 style="text-align:center;">🚀 Kickstart your project development&nbsp;</h3><p style="text-align:center;"><span style="color:var(--color-muted-foreground);">Build Faster with the Ultimate Monorepo Starter for Strapi &amp; Next.js</span></p>
6	<h3 style="text-align:center;">🚀 Kickstart your project development&nbsp;</h3><p style="text-align:center;"><span style="color:var(--color-muted-foreground);">Build Faster with the Ultimate Monorepo Starter for Strapi &amp; Next.js</span></p>
7	<h3 style="text-align:center;">🚀 Kickstart your project development&nbsp;</h3><p style="text-align:center;"><span style="color:var(--color-muted-foreground);">Build Faster with the Ultimate Monorepo Starter for Strapi &amp; Next.js</span></p>
8	<h3 style="text-align:center;">🚀 Kickstart your project development&nbsp;</h3><p style="text-align:center;"><span style="color:var(--color-muted-foreground);">Build Faster with the Ultimate Monorepo Starter for Strapi &amp; Next.js</span></p>
\.


--
-- Data for Name: components_utilities_image_with_links; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_utilities_image_with_links (id) FROM stdin;
7
8
11
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
\.


--
-- Data for Name: components_utilities_image_with_links_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_utilities_image_with_links_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
37	26	41	utilities.basic-image	image	\N
38	27	42	utilities.basic-image	image	\N
39	28	43	utilities.basic-image	image	\N
40	26	80	utilities.link	link	\N
41	27	81	utilities.link	link	\N
42	28	82	utilities.link	link	\N
43	29	44	utilities.basic-image	image	\N
44	30	45	utilities.basic-image	image	\N
45	31	46	utilities.basic-image	image	\N
46	29	84	utilities.link	link	\N
47	30	85	utilities.link	link	\N
48	31	86	utilities.link	link	\N
49	36	67	utilities.basic-image	image	\N
50	37	68	utilities.basic-image	image	\N
51	38	69	utilities.basic-image	image	\N
52	36	106	utilities.link	link	\N
53	37	107	utilities.link	link	\N
54	38	108	utilities.link	link	\N
55	39	70	utilities.basic-image	image	\N
56	40	71	utilities.basic-image	image	\N
57	41	72	utilities.basic-image	image	\N
58	39	110	utilities.link	link	\N
59	40	111	utilities.link	link	\N
60	41	112	utilities.link	link	\N
61	42	73	utilities.basic-image	image	\N
62	43	74	utilities.basic-image	image	\N
63	44	75	utilities.basic-image	image	\N
64	42	114	utilities.link	link	\N
65	43	115	utilities.link	link	\N
66	44	116	utilities.link	link	\N
67	45	76	utilities.basic-image	image	\N
68	46	77	utilities.basic-image	image	\N
69	47	78	utilities.basic-image	image	\N
70	45	118	utilities.link	link	\N
71	46	119	utilities.link	link	\N
72	47	120	utilities.link	link	\N
\.


--
-- Data for Name: components_utilities_links; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_utilities_links (id, label, href, new_tab) FROM stdin;
87	Page 1	/page1	\N
88	Page 2	/page2	\N
89	Page 1	/page1	\N
4	Page 1	/page1	\N
5	Page 2	/page2	\N
90	Page 2	/page2	\N
91	Page 1	/page1	\N
92	Page 2	/page2	\N
93	Notum technologies	https://notum.cz/en/	t
94	Page 1	/page1	\N
95	Page 2	/page2	\N
96	Notum technologies	https://notum.cz/en/	t
97	Github	https://github.com/notum-cz/strapi-next-monorepo-starter	t
98	Notum	https://notum.cz/en/	t
99	Github	https://github.com/notum-cz/strapi-next-monorepo-starter	t
100	Notum	https://notum.cz/en/	t
101	Github	https://github.com/notum-cz/strapi-next-monorepo-starter	t
18	Menu1	/page1	t
19	link1	/page1	t
20	link 2	/page2	t
21	link1	/page1	t
22	link 2	/page2	t
102	Notum	https://notum.cz/en/	t
103	Github	https://github.com/notum-cz/strapi-next-monorepo-starter	t
104	Notum	https://notum.cz/en/	t
105	Get Started	https://github.com/notum-cz/strapi-next-monorepo-starter	t
106	carousel1	#	\N
107	carousel-2	#	\N
108	carousel-3	#	\N
30	Page 1	/page1	t
31	Page 2	/page2	t
109	Get Started	https://github.com/notum-cz/strapi-next-monorepo-starter	t
110	carousel1	#	\N
34	Page 1	/page1	t
35	Page 2	/page2	t
111	carousel-2	#	\N
112	carousel-3	#	\N
113	Get Started	https://github.com/notum-cz/strapi-next-monorepo-starter	t
114	carousel1	#	\N
115	carousel-2	#	\N
116	carousel-3	#	\N
117	Get Started	https://github.com/notum-cz/strapi-next-monorepo-starter	t
118	carousel1	#	\N
119	carousel-2	#	\N
120	carousel-3	#	\N
41	Page 1	/page1	\N
42	Page 2	/page2	\N
43	Page 1	/page1	\N
44	Page 2	/page2	\N
45	Notum technologies	https://notum.cz/en/	t
46	Notum technologies	https://notum.cz/en/	t
70	Page 1	/page1	\N
71	Page 2	/page2	\N
72	Notum technologies	https://notum.cz/en/	t
73	Page 1	/page1	\N
74	Page 2	/page2	\N
75	Github	https://github.com/notum-cz/strapi-next-monorepo-starter	t
76	Notum	https://notum.cz/en/	t
77	Github	https://github.com/notum-cz/strapi-next-monorepo-starter	t
78	Notum	https://notum.cz/en/	t
79	Get Started	https://github.com/notum-cz/strapi-next-monorepo-starter	t
80	carousel1	#	\N
81	carousel-2	#	\N
82	carousel-3	#	\N
83	Get Started	https://github.com/notum-cz/strapi-next-monorepo-starter	t
84	carousel1	#	\N
85	carousel-2	#	\N
86	carousel-3	#	\N
\.


--
-- Data for Name: components_utilities_links_with_titles; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_utilities_links_with_titles (id, title) FROM stdin;
\.


--
-- Data for Name: components_utilities_links_with_titles_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_utilities_links_with_titles_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: components_utilities_texts; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_utilities_texts (id, text) FROM stdin;
\.


--
-- Data for Name: components_violation_details; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_violation_details (id, type, severity, method, impact, amount, platform) FROM stdin;
\.


--
-- Data for Name: components_violation_evidences; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_violation_evidences (id, verification_date, note, verification_status) FROM stdin;
\.


--
-- Data for Name: components_violation_evidences_report_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.components_violation_evidences_report_lnk (id, evidence_id, report_id) FROM stdin;
\.


--
-- Data for Name: directories; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.directories (id, document_id, name, slug, description, is_active, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
4	njt2ly7l8lkr89q526gtrv9y	Electronics	electronics	[{"type": "paragraph", "children": [{"text": "Electronics description", "type": "text"}]}]	t	2025-06-01 16:52:22.223	2025-06-01 16:52:22.223	\N	1	1	en
5	njt2ly7l8lkr89q526gtrv9y	Electronics	electronics	[{"type": "paragraph", "children": [{"text": "Electronics description", "type": "text"}]}]	t	2025-06-01 16:52:22.223	2025-06-01 16:52:22.223	2025-06-01 16:52:22.251	1	1	en
6	wxgi86kdwfpt4obf9ye4w368	Home Appliances	home-appliances	[{"type": "paragraph", "children": [{"text": "Home Appliances", "type": "text"}]}]	f	2025-06-01 20:01:47.796	2025-06-01 20:01:47.796	\N	1	1	en
7	wxgi86kdwfpt4obf9ye4w368	Home Appliances	home-appliances	[{"type": "paragraph", "children": [{"text": "Home Appliances", "type": "text"}]}]	f	2025-06-01 20:01:47.796	2025-06-01 20:01:47.796	2025-06-01 20:01:47.811	1	1	en
8	wxgi86kdwfpt4obf9ye4w368	Thiết Bị Gia Dụng	thiet-bi-gia-dung	[{"type": "paragraph", "children": [{"text": "Thiết Bị Gia Dụng", "type": "text"}]}]	t	2025-06-01 20:02:05.357	2025-06-01 20:02:05.357	\N	1	1	vi
9	wxgi86kdwfpt4obf9ye4w368	Thiết Bị Gia Dụng	thiet-bi-gia-dung	[{"type": "paragraph", "children": [{"text": "Thiết Bị Gia Dụng", "type": "text"}]}]	t	2025-06-01 20:02:05.357	2025-06-01 20:02:05.357	2025-06-01 20:02:05.377	1	1	vi
10	gaba9iy1968vqt82cz0600an	Software & Digital Services	software-digital-services	[{"type": "paragraph", "children": [{"text": "Software & Digital Services", "type": "text"}]}]	t	2025-06-01 20:03:03.795	2025-06-01 20:03:03.795	\N	1	1	en
11	gaba9iy1968vqt82cz0600an	Software & Digital Services	software-digital-services	[{"type": "paragraph", "children": [{"text": "Software & Digital Services", "type": "text"}]}]	t	2025-06-01 20:03:03.795	2025-06-01 20:03:03.795	2025-06-01 20:03:03.817	1	1	en
12	gaba9iy1968vqt82cz0600an	Phần Mềm & Dịch Vụ Số	phan-mem-dich-vu-so	[{"type": "paragraph", "children": [{"text": "Phần Mềm & Dịch Vụ Số", "type": "text"}]}]	t	2025-06-01 20:03:17.611	2025-06-01 20:03:17.611	\N	1	1	vi
13	gaba9iy1968vqt82cz0600an	Phần Mềm & Dịch Vụ Số	phan-mem-dich-vu-so	[{"type": "paragraph", "children": [{"text": "Phần Mềm & Dịch Vụ Số", "type": "text"}]}]	t	2025-06-01 20:03:17.611	2025-06-01 20:03:17.611	2025-06-01 20:03:17.625	1	1	vi
14	udv9wvy6nn1xjzas4vvqt4rx	Travel & Hospitality	travel-hospitality	[{"type": "paragraph", "children": [{"text": "Travel & Hospitality", "type": "text"}]}]	t	2025-06-01 20:03:36.876	2025-06-01 20:03:36.876	\N	1	1	en
15	udv9wvy6nn1xjzas4vvqt4rx	Travel & Hospitality	travel-hospitality	[{"type": "paragraph", "children": [{"text": "Travel & Hospitality", "type": "text"}]}]	t	2025-06-01 20:03:36.876	2025-06-01 20:03:36.876	2025-06-01 20:03:36.893	1	1	en
16	udv9wvy6nn1xjzas4vvqt4rx	Du Lịch & Khách Sạn	du-lich-khach-san	[{"type": "paragraph", "children": [{"text": "Du Lịch & Khách Sạn", "type": "text"}]}]	t	2025-06-01 20:03:49.083	2025-06-01 20:03:49.083	\N	1	1	vi
17	udv9wvy6nn1xjzas4vvqt4rx	Du Lịch & Khách Sạn	du-lich-khach-san	[{"type": "paragraph", "children": [{"text": "Du Lịch & Khách Sạn", "type": "text"}]}]	t	2025-06-01 20:03:49.083	2025-06-01 20:03:49.083	2025-06-01 20:03:49.093	1	1	vi
18	p08rs2i9jmylurfikfng4mar	Food & Dining	food-dining	[{"type": "paragraph", "children": [{"text": "Food & Dining", "type": "text"}]}]	t	2025-06-01 20:07:42.611	2025-06-01 20:07:42.611	\N	1	1	en
19	p08rs2i9jmylurfikfng4mar	Food & Dining	food-dining	[{"type": "paragraph", "children": [{"text": "Food & Dining", "type": "text"}]}]	t	2025-06-01 20:07:42.611	2025-06-01 20:07:42.611	2025-06-01 20:07:42.629	1	1	en
20	p08rs2i9jmylurfikfng4mar	Ẩm Thực & Nhà Hàng	am-thuc-nha-hang	[{"type": "paragraph", "children": [{"text": "Ẩm Thực & Nhà Hàng", "type": "text"}]}]	t	2025-06-01 20:09:06.692	2025-06-01 20:09:06.692	\N	1	1	vi
21	p08rs2i9jmylurfikfng4mar	Ẩm Thực & Nhà Hàng	am-thuc-nha-hang	[{"type": "paragraph", "children": [{"text": "Ẩm Thực & Nhà Hàng", "type": "text"}]}]	t	2025-06-01 20:09:06.692	2025-06-01 20:09:06.692	2025-06-01 20:09:06.716	1	1	vi
22	vgbxxxveoxd5a23bg93cv7or	Automotive & Transport	automotive-transport	[{"type": "paragraph", "children": [{"text": "Automotive & Transport", "type": "text"}]}]	t	2025-06-01 20:09:34.813	2025-06-01 20:09:34.813	\N	1	1	en
23	vgbxxxveoxd5a23bg93cv7or	Automotive & Transport	automotive-transport	[{"type": "paragraph", "children": [{"text": "Automotive & Transport", "type": "text"}]}]	t	2025-06-01 20:09:34.813	2025-06-01 20:09:34.813	2025-06-01 20:09:34.826	1	1	en
24	vgbxxxveoxd5a23bg93cv7or	Xe Cộ & Vận Tải	xe-co-van-tai	[{"type": "paragraph", "children": [{"text": "Xe Cộ & Vận Tải", "type": "text"}]}]	t	2025-06-01 20:09:46.265	2025-06-01 20:09:46.265	\N	1	1	vi
25	vgbxxxveoxd5a23bg93cv7or	Xe Cộ & Vận Tải	xe-co-van-tai	[{"type": "paragraph", "children": [{"text": "Xe Cộ & Vận Tải", "type": "text"}]}]	t	2025-06-01 20:09:46.265	2025-06-01 20:09:46.265	2025-06-01 20:09:46.276	1	1	vi
26	zpa9vhastzjetgw4lq6k1ohr	Health & Beauty 	health-beauty	[{"type": "paragraph", "children": [{"text": "Health & Beauty ", "type": "text"}]}]	t	2025-06-01 20:10:16.001	2025-06-01 20:10:16.001	\N	1	1	en
27	zpa9vhastzjetgw4lq6k1ohr	Health & Beauty 	health-beauty	[{"type": "paragraph", "children": [{"text": "Health & Beauty ", "type": "text"}]}]	t	2025-06-01 20:10:16.001	2025-06-01 20:10:16.001	2025-06-01 20:10:16.014	1	1	en
28	zpa9vhastzjetgw4lq6k1ohr	Sức Khỏe & Làm Đẹp	suc-khoe-lam-dep	[{"type": "paragraph", "children": [{"text": "Sức Khỏe & Làm Đẹp", "type": "text"}]}]	t	2025-06-01 20:10:25.607	2025-06-01 20:10:25.607	\N	1	1	vi
29	zpa9vhastzjetgw4lq6k1ohr	Sức Khỏe & Làm Đẹp	suc-khoe-lam-dep	[{"type": "paragraph", "children": [{"text": "Sức Khỏe & Làm Đẹp", "type": "text"}]}]	t	2025-06-01 20:10:25.607	2025-06-01 20:10:25.607	2025-06-01 20:10:25.619	1	1	vi
30	a8z2mhvsl2hfyzd0yzbyj6i0	Education & Training	education-training	[{"type": "paragraph", "children": [{"text": "Education & Training", "type": "text"}]}]	t	2025-06-01 20:10:39.178	2025-06-01 20:10:39.178	\N	1	1	en
31	a8z2mhvsl2hfyzd0yzbyj6i0	Education & Training	education-training	[{"type": "paragraph", "children": [{"text": "Education & Training", "type": "text"}]}]	t	2025-06-01 20:10:39.178	2025-06-01 20:10:39.178	2025-06-01 20:10:39.192	1	1	en
32	a8z2mhvsl2hfyzd0yzbyj6i0	Giáo Dục & Đào Tạo	giao-duc-dao-tao	[{"type": "paragraph", "children": [{"text": "Giáo Dục & Đào Tạo", "type": "text"}]}]	t	2025-06-01 20:10:49.352	2025-06-01 20:10:49.352	\N	1	1	vi
33	a8z2mhvsl2hfyzd0yzbyj6i0	Giáo Dục & Đào Tạo	giao-duc-dao-tao	[{"type": "paragraph", "children": [{"text": "Giáo Dục & Đào Tạo", "type": "text"}]}]	t	2025-06-01 20:10:49.352	2025-06-01 20:10:49.352	2025-06-01 20:10:49.368	1	1	vi
34	tg103w6mjv44xdi1cuxctb59	Real Estate & Home Services	real-estate-home-services	[{"type": "paragraph", "children": [{"text": "Real Estate & Home Services", "type": "text"}]}]	t	2025-06-01 20:11:41.136	2025-06-01 20:11:41.136	\N	1	1	en
35	tg103w6mjv44xdi1cuxctb59	Real Estate & Home Services	real-estate-home-services	[{"type": "paragraph", "children": [{"text": "Real Estate & Home Services", "type": "text"}]}]	t	2025-06-01 20:11:41.136	2025-06-01 20:11:41.136	2025-06-01 20:11:41.168	1	1	en
36	tg103w6mjv44xdi1cuxctb59	Bất Động Sản & Dịch Vụ Nhà	bat-dong-san-dich-vu-nha	[{"type": "paragraph", "children": [{"text": "Bất Động Sản & Dịch Vụ Nhà", "type": "text"}]}]	t	2025-06-01 20:12:00.571	2025-06-01 20:12:00.571	\N	1	1	vi
37	tg103w6mjv44xdi1cuxctb59	Bất Động Sản & Dịch Vụ Nhà	bat-dong-san-dich-vu-nha	[{"type": "paragraph", "children": [{"text": "Bất Động Sản & Dịch Vụ Nhà", "type": "text"}]}]	t	2025-06-01 20:12:00.571	2025-06-01 20:12:00.571	2025-06-01 20:12:00.602	1	1	vi
38	rera5okt2hvwq52tq3vcqij3	Giải Trí & Truyền Thông	giai-tri-truyen-thong	[{"type": "paragraph", "children": [{"text": "Giải Trí & Truyền Thông", "type": "text"}]}]	t	2025-06-01 20:12:12.994	2025-06-01 20:12:22.291	\N	1	1	vi
40	rera5okt2hvwq52tq3vcqij3	Giải Trí & Truyền Thông	giai-tri-truyen-thong	[{"type": "paragraph", "children": [{"text": "Giải Trí & Truyền Thông", "type": "text"}]}]	t	2025-06-01 20:12:12.994	2025-06-01 20:12:22.291	2025-06-01 20:12:22.324	1	1	vi
41	rera5okt2hvwq52tq3vcqij3	Entertainment & Media	entertainment-media	[{"type": "paragraph", "children": [{"text": "Entertainment & Media", "type": "text"}]}]	t	2025-06-01 20:12:33.77	2025-06-01 20:12:33.77	\N	1	1	en
42	rera5okt2hvwq52tq3vcqij3	Entertainment & Media	entertainment-media	[{"type": "paragraph", "children": [{"text": "Entertainment & Media", "type": "text"}]}]	t	2025-06-01 20:12:33.77	2025-06-01 20:12:33.77	2025-06-01 20:12:33.788	1	1	en
43	nmf9n3zbysgbfh4s0t2dcyab	Finance & Insurance	finance-insurance	[{"type": "paragraph", "children": [{"text": "Finance & Insurance", "type": "text"}]}]	t	2025-06-01 20:12:49.36	2025-06-01 20:12:49.36	\N	1	1	en
44	nmf9n3zbysgbfh4s0t2dcyab	Finance & Insurance	finance-insurance	[{"type": "paragraph", "children": [{"text": "Finance & Insurance", "type": "text"}]}]	t	2025-06-01 20:12:49.36	2025-06-01 20:12:49.36	2025-06-01 20:12:49.376	1	1	en
45	nmf9n3zbysgbfh4s0t2dcyab	Tài Chính & Bảo Hiểm	tai-chinh-bao-hiem	[{"type": "paragraph", "children": [{"text": "Tài Chính & Bảo Hiểm", "type": "text"}]}]	t	2025-06-01 20:13:01.583	2025-06-01 20:13:01.583	\N	1	1	vi
46	nmf9n3zbysgbfh4s0t2dcyab	Tài Chính & Bảo Hiểm	tai-chinh-bao-hiem	[{"type": "paragraph", "children": [{"text": "Tài Chính & Bảo Hiểm", "type": "text"}]}]	t	2025-06-01 20:13:01.583	2025-06-01 20:13:01.583	2025-06-01 20:13:01.597	1	1	vi
47	oiaguc0yd5g9e9z2mm99mkyh	Gia Đình & Lối Sống	gia-dinh-loi-song	[{"type": "paragraph", "children": [{"text": "Gia Đình & Lối Sống", "type": "text"}]}]	t	2025-06-01 20:13:13.804	2025-06-01 20:13:13.804	\N	1	1	vi
48	oiaguc0yd5g9e9z2mm99mkyh	Gia Đình & Lối Sống	gia-dinh-loi-song	[{"type": "paragraph", "children": [{"text": "Gia Đình & Lối Sống", "type": "text"}]}]	t	2025-06-01 20:13:13.804	2025-06-01 20:13:13.804	2025-06-01 20:13:13.82	1	1	vi
49	oiaguc0yd5g9e9z2mm99mkyh	Family & Lifestyle	family-lifestyle	\N	t	2025-06-01 20:13:21.849	2025-06-01 20:13:21.849	\N	1	1	en
50	oiaguc0yd5g9e9z2mm99mkyh	Family & Lifestyle	family-lifestyle	\N	t	2025-06-01 20:13:21.849	2025-06-01 20:13:21.849	2025-06-01 20:13:21.861	1	1	en
51	njt2ly7l8lkr89q526gtrv9y	Thiết Bị Điện Tử	thiet-bi-dien-tu	[{"type": "paragraph", "children": [{"text": "Thiết Bị Điện Tử", "type": "text"}]}]	t	2025-06-01 20:16:00.181	2025-06-01 20:16:00.181	\N	1	1	vi
52	njt2ly7l8lkr89q526gtrv9y	Thiết Bị Điện Tử	thiet-bi-dien-tu	[{"type": "paragraph", "children": [{"text": "Thiết Bị Điện Tử", "type": "text"}]}]	t	2025-06-01 20:16:00.181	2025-06-01 20:16:00.181	2025-06-01 20:16:00.214	1	1	vi
53	x9vok198wqkcrr81wid6vzmt	Nhân Vật	nhan-vat	\N	t	2025-06-01 20:30:54.625	2025-06-01 20:33:03.61	\N	1	1	vi
55	x9vok198wqkcrr81wid6vzmt	Nhân Vật	nhan-vat	\N	t	2025-06-01 20:30:54.625	2025-06-01 20:33:03.61	2025-06-01 20:33:03.63	1	1	vi
1	x9vok198wqkcrr81wid6vzmt	Figures	Figures	[{"type": "paragraph", "children": [{"text": "Figures Directory", "type": "text"}]}]	t	2025-05-31 20:08:41.393	2025-06-01 22:41:47.689	\N	1	1	en
56	x9vok198wqkcrr81wid6vzmt	Figures	Figures	[{"type": "paragraph", "children": [{"text": "Figures Directory", "type": "text"}]}]	t	2025-05-31 20:08:41.393	2025-06-01 22:41:47.689	2025-06-01 22:41:47.713	1	1	en
57	jg389qbwgf3xys9ltctcicx9	Violators	violators	[{"type": "paragraph", "children": [{"text": "Violators", "type": "text"}]}]	t	2025-06-01 22:42:20.089	2025-06-01 22:42:20.089	\N	1	1	en
58	jg389qbwgf3xys9ltctcicx9	Violators	violators	[{"type": "paragraph", "children": [{"text": "Violators", "type": "text"}]}]	t	2025-06-01 22:42:20.089	2025-06-01 22:42:20.089	2025-06-01 22:42:20.107	1	1	en
59	jg389qbwgf3xys9ltctcicx9	Đối tượng vi phạm	doi-tuong-vi-pham	[{"type": "paragraph", "children": [{"text": "Đối tượng vi phạm", "type": "text"}]}]	t	2025-06-01 22:44:18.191	2025-06-01 22:44:18.191	\N	1	1	vi
60	jg389qbwgf3xys9ltctcicx9	Đối tượng vi phạm	doi-tuong-vi-pham	[{"type": "paragraph", "children": [{"text": "Đối tượng vi phạm", "type": "text"}]}]	t	2025-06-01 22:44:18.191	2025-06-01 22:44:18.191	2025-06-01 22:44:18.21	1	1	vi
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.files (id, document_id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
17	gw07ww94v48qn0h6bkyaysgj	images (1).png	\N	\N	474	106	{"thumbnail": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/thumbnail_images_1_bbe0e5df33.png", "hash": "thumbnail_images_1_bbe0e5df33", "mime": "image/png", "name": "thumbnail_images (1).png", "path": null, "size": 5.56, "width": 245, "height": 55, "sizeInBytes": 5555}}	images_1_bbe0e5df33	.png	image/png	2.65	https://strapi-next-starter.s3.eu-central-1.amazonaws.com/images_1_bbe0e5df33.png	\N	aws-s3	\N	/	2025-05-08 21:05:57.274	2025-05-08 21:05:57.274	2025-05-08 21:05:57.274	\N	\N	\N
11	ccjnki4cbtc4nc1qwkfc064z	221a294a.webp	\N	\N	1280	720	{"large": {"ext": ".webp", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/large_221a294a_4f4a1dd1be.webp", "hash": "large_221a294a_4f4a1dd1be", "mime": "image/webp", "name": "large_221a294a.webp", "path": null, "size": 23.03, "width": 1000, "height": 562, "sizeInBytes": 23028}, "small": {"ext": ".webp", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/small_221a294a_4f4a1dd1be.webp", "hash": "small_221a294a_4f4a1dd1be", "mime": "image/webp", "name": "small_221a294a.webp", "path": null, "size": 11.92, "width": 500, "height": 281, "sizeInBytes": 11924}, "medium": {"ext": ".webp", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/medium_221a294a_4f4a1dd1be.webp", "hash": "medium_221a294a_4f4a1dd1be", "mime": "image/webp", "name": "medium_221a294a.webp", "path": null, "size": 17.72, "width": 750, "height": 422, "sizeInBytes": 17720}, "thumbnail": {"ext": ".webp", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/thumbnail_221a294a_4f4a1dd1be.webp", "hash": "thumbnail_221a294a_4f4a1dd1be", "mime": "image/webp", "name": "thumbnail_221a294a.webp", "path": null, "size": 5.65, "width": 245, "height": 138, "sizeInBytes": 5648}}	221a294a_4f4a1dd1be	.webp	image/webp	33.63	https://strapi-next-starter.s3.eu-central-1.amazonaws.com/221a294a_4f4a1dd1be.webp	\N	aws-s3	\N	/	2025-05-08 20:43:22.569	2025-05-08 20:43:22.569	2025-05-08 20:43:22.569	\N	\N	\N
12	u5wgdy85u61l3qji5vbh6h46	ChatGPT Image May 7, 2025, 03_48_02 PM.png	\N	\N	1024	1024	{"large": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/large_Chat_GPT_Image_May_7_2025_03_48_02_PM_134056fcb1.png", "hash": "large_Chat_GPT_Image_May_7_2025_03_48_02_PM_134056fcb1", "mime": "image/png", "name": "large_ChatGPT Image May 7, 2025, 03_48_02 PM.png", "path": null, "size": 1086.78, "width": 1000, "height": 1000, "sizeInBytes": 1086778}, "small": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/small_Chat_GPT_Image_May_7_2025_03_48_02_PM_134056fcb1.png", "hash": "small_Chat_GPT_Image_May_7_2025_03_48_02_PM_134056fcb1", "mime": "image/png", "name": "small_ChatGPT Image May 7, 2025, 03_48_02 PM.png", "path": null, "size": 282.39, "width": 500, "height": 500, "sizeInBytes": 282392}, "medium": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/medium_Chat_GPT_Image_May_7_2025_03_48_02_PM_134056fcb1.png", "hash": "medium_Chat_GPT_Image_May_7_2025_03_48_02_PM_134056fcb1", "mime": "image/png", "name": "medium_ChatGPT Image May 7, 2025, 03_48_02 PM.png", "path": null, "size": 643.1, "width": 750, "height": 750, "sizeInBytes": 643099}, "thumbnail": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/thumbnail_Chat_GPT_Image_May_7_2025_03_48_02_PM_134056fcb1.png", "hash": "thumbnail_Chat_GPT_Image_May_7_2025_03_48_02_PM_134056fcb1", "mime": "image/png", "name": "thumbnail_ChatGPT Image May 7, 2025, 03_48_02 PM.png", "path": null, "size": 32.5, "width": 156, "height": 156, "sizeInBytes": 32498}}	Chat_GPT_Image_May_7_2025_03_48_02_PM_134056fcb1	.png	image/png	304.41	https://strapi-next-starter.s3.eu-central-1.amazonaws.com/Chat_GPT_Image_May_7_2025_03_48_02_PM_134056fcb1.png	\N	aws-s3	\N	/	2025-05-08 20:43:22.842	2025-05-08 20:43:22.842	2025-05-08 20:43:22.843	\N	\N	\N
13	lklxbgd1lvvboowts469badq	ChatGPT Image May 7, 2025, 03_43_27 PM.png	\N	\N	1024	1536	{"large": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/large_Chat_GPT_Image_May_7_2025_03_43_27_PM_95766c4c17.png", "hash": "large_Chat_GPT_Image_May_7_2025_03_43_27_PM_95766c4c17", "mime": "image/png", "name": "large_ChatGPT Image May 7, 2025, 03_43_27 PM.png", "path": null, "size": 564.55, "width": 667, "height": 1000, "sizeInBytes": 564547}, "small": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/small_Chat_GPT_Image_May_7_2025_03_43_27_PM_95766c4c17.png", "hash": "small_Chat_GPT_Image_May_7_2025_03_43_27_PM_95766c4c17", "mime": "image/png", "name": "small_ChatGPT Image May 7, 2025, 03_43_27 PM.png", "path": null, "size": 138.15, "width": 333, "height": 500, "sizeInBytes": 138154}, "medium": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/medium_Chat_GPT_Image_May_7_2025_03_43_27_PM_95766c4c17.png", "hash": "medium_Chat_GPT_Image_May_7_2025_03_43_27_PM_95766c4c17", "mime": "image/png", "name": "medium_ChatGPT Image May 7, 2025, 03_43_27 PM.png", "path": null, "size": 310.29, "width": 500, "height": 750, "sizeInBytes": 310291}, "thumbnail": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/thumbnail_Chat_GPT_Image_May_7_2025_03_43_27_PM_95766c4c17.png", "hash": "thumbnail_Chat_GPT_Image_May_7_2025_03_43_27_PM_95766c4c17", "mime": "image/png", "name": "thumbnail_ChatGPT Image May 7, 2025, 03_43_27 PM.png", "path": null, "size": 17.94, "width": 104, "height": 156, "sizeInBytes": 17944}}	Chat_GPT_Image_May_7_2025_03_43_27_PM_95766c4c17	.png	image/png	382.08	https://strapi-next-starter.s3.eu-central-1.amazonaws.com/Chat_GPT_Image_May_7_2025_03_43_27_PM_95766c4c17.png	\N	aws-s3	\N	/	2025-05-08 20:43:23.074	2025-05-08 20:43:23.074	2025-05-08 20:43:23.074	\N	\N	\N
14	mwhf74tznd38zqyr6anj9fcv	ChatGPT Image May 7, 2025, 03_43_26 PM.png	\N	\N	1024	1536	{"large": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/large_Chat_GPT_Image_May_7_2025_03_43_26_PM_59e3296a65.png", "hash": "large_Chat_GPT_Image_May_7_2025_03_43_26_PM_59e3296a65", "mime": "image/png", "name": "large_ChatGPT Image May 7, 2025, 03_43_26 PM.png", "path": null, "size": 785.65, "width": 667, "height": 1000, "sizeInBytes": 785654}, "small": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/small_Chat_GPT_Image_May_7_2025_03_43_26_PM_59e3296a65.png", "hash": "small_Chat_GPT_Image_May_7_2025_03_43_26_PM_59e3296a65", "mime": "image/png", "name": "small_ChatGPT Image May 7, 2025, 03_43_26 PM.png", "path": null, "size": 190.07, "width": 333, "height": 500, "sizeInBytes": 190066}, "medium": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/medium_Chat_GPT_Image_May_7_2025_03_43_26_PM_59e3296a65.png", "hash": "medium_Chat_GPT_Image_May_7_2025_03_43_26_PM_59e3296a65", "mime": "image/png", "name": "medium_ChatGPT Image May 7, 2025, 03_43_26 PM.png", "path": null, "size": 428.89, "width": 500, "height": 750, "sizeInBytes": 428888}, "thumbnail": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/thumbnail_Chat_GPT_Image_May_7_2025_03_43_26_PM_59e3296a65.png", "hash": "thumbnail_Chat_GPT_Image_May_7_2025_03_43_26_PM_59e3296a65", "mime": "image/png", "name": "thumbnail_ChatGPT Image May 7, 2025, 03_43_26 PM.png", "path": null, "size": 23.95, "width": 104, "height": 156, "sizeInBytes": 23952}}	Chat_GPT_Image_May_7_2025_03_43_26_PM_59e3296a65	.png	image/png	448.10	https://strapi-next-starter.s3.eu-central-1.amazonaws.com/Chat_GPT_Image_May_7_2025_03_43_26_PM_59e3296a65.png	\N	aws-s3	\N	/	2025-05-08 20:43:23.397	2025-05-08 20:43:23.397	2025-05-08 20:43:23.397	\N	\N	\N
15	tw7wgn1sj3al121vayj2eq08	ChatGPT Image May 7, 2025, 03_48_08 PM.png	\N	\N	1024	1024	{"large": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/large_Chat_GPT_Image_May_7_2025_03_48_08_PM_51865c048a.png", "hash": "large_Chat_GPT_Image_May_7_2025_03_48_08_PM_51865c048a", "mime": "image/png", "name": "large_ChatGPT Image May 7, 2025, 03_48_08 PM.png", "path": null, "size": 1086.78, "width": 1000, "height": 1000, "sizeInBytes": 1086778}, "small": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/small_Chat_GPT_Image_May_7_2025_03_48_08_PM_51865c048a.png", "hash": "small_Chat_GPT_Image_May_7_2025_03_48_08_PM_51865c048a", "mime": "image/png", "name": "small_ChatGPT Image May 7, 2025, 03_48_08 PM.png", "path": null, "size": 282.39, "width": 500, "height": 500, "sizeInBytes": 282392}, "medium": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/medium_Chat_GPT_Image_May_7_2025_03_48_08_PM_51865c048a.png", "hash": "medium_Chat_GPT_Image_May_7_2025_03_48_08_PM_51865c048a", "mime": "image/png", "name": "medium_ChatGPT Image May 7, 2025, 03_48_08 PM.png", "path": null, "size": 643.1, "width": 750, "height": 750, "sizeInBytes": 643099}, "thumbnail": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/thumbnail_Chat_GPT_Image_May_7_2025_03_48_08_PM_51865c048a.png", "hash": "thumbnail_Chat_GPT_Image_May_7_2025_03_48_08_PM_51865c048a", "mime": "image/png", "name": "thumbnail_ChatGPT Image May 7, 2025, 03_48_08 PM.png", "path": null, "size": 32.5, "width": 156, "height": 156, "sizeInBytes": 32498}}	Chat_GPT_Image_May_7_2025_03_48_08_PM_51865c048a	.png	image/png	304.41	https://strapi-next-starter.s3.eu-central-1.amazonaws.com/Chat_GPT_Image_May_7_2025_03_48_08_PM_51865c048a.png	\N	aws-s3	\N	/	2025-05-08 20:43:23.416	2025-05-08 20:43:23.416	2025-05-08 20:43:23.416	\N	\N	\N
16	zbuzga1viwjfotahoxkg3y5v	ChatGPT Image May 7, 2025, 03_48_04 PM.png	\N	\N	1024	1024	{"large": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/large_Chat_GPT_Image_May_7_2025_03_48_04_PM_b42a6a45e5.png", "hash": "large_Chat_GPT_Image_May_7_2025_03_48_04_PM_b42a6a45e5", "mime": "image/png", "name": "large_ChatGPT Image May 7, 2025, 03_48_04 PM.png", "path": null, "size": 1354.92, "width": 1000, "height": 1000, "sizeInBytes": 1354924}, "small": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/small_Chat_GPT_Image_May_7_2025_03_48_04_PM_b42a6a45e5.png", "hash": "small_Chat_GPT_Image_May_7_2025_03_48_04_PM_b42a6a45e5", "mime": "image/png", "name": "small_ChatGPT Image May 7, 2025, 03_48_04 PM.png", "path": null, "size": 340.37, "width": 500, "height": 500, "sizeInBytes": 340374}, "medium": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/medium_Chat_GPT_Image_May_7_2025_03_48_04_PM_b42a6a45e5.png", "hash": "medium_Chat_GPT_Image_May_7_2025_03_48_04_PM_b42a6a45e5", "mime": "image/png", "name": "medium_ChatGPT Image May 7, 2025, 03_48_04 PM.png", "path": null, "size": 788.77, "width": 750, "height": 750, "sizeInBytes": 788767}, "thumbnail": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/thumbnail_Chat_GPT_Image_May_7_2025_03_48_04_PM_b42a6a45e5.png", "hash": "thumbnail_Chat_GPT_Image_May_7_2025_03_48_04_PM_b42a6a45e5", "mime": "image/png", "name": "thumbnail_ChatGPT Image May 7, 2025, 03_48_04 PM.png", "path": null, "size": 36.57, "width": 156, "height": 156, "sizeInBytes": 36573}}	Chat_GPT_Image_May_7_2025_03_48_04_PM_b42a6a45e5	.png	image/png	371.11	https://strapi-next-starter.s3.eu-central-1.amazonaws.com/Chat_GPT_Image_May_7_2025_03_48_04_PM_b42a6a45e5.png	\N	aws-s3	\N	/	2025-05-08 20:43:23.546	2025-05-08 20:43:32.513	2025-05-08 20:43:23.546	\N	\N	\N
18	fvcp8qi44dz3lto6h0txs76y	tailwind-css.svg	\N	\N	2500	866	\N	tailwind_css_0fda0a53a0	.svg	image/svg+xml	2.35	https://strapi-next-starter.s3.eu-central-1.amazonaws.com/tailwind_css_0fda0a53a0.svg	\N	aws-s3	\N	/	2025-05-08 21:05:57.275	2025-05-08 21:05:57.275	2025-05-08 21:05:57.275	\N	\N	\N
19	qpkl5v8p06gsvaawa45foar8	next-js-logo-freelogovectors.net_.png	\N	\N	1280	800	{"large": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/large_next_js_logo_freelogovectors_net_10271b6b01.png", "hash": "large_next_js_logo_freelogovectors_net_10271b6b01", "mime": "image/png", "name": "large_next-js-logo-freelogovectors.net_.png", "path": null, "size": 21.3, "width": 1000, "height": 625, "sizeInBytes": 21299}, "small": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/small_next_js_logo_freelogovectors_net_10271b6b01.png", "hash": "small_next_js_logo_freelogovectors_net_10271b6b01", "mime": "image/png", "name": "small_next-js-logo-freelogovectors.net_.png", "path": null, "size": 8.84, "width": 500, "height": 313, "sizeInBytes": 8840}, "medium": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/medium_next_js_logo_freelogovectors_net_10271b6b01.png", "hash": "medium_next_js_logo_freelogovectors_net_10271b6b01", "mime": "image/png", "name": "medium_next-js-logo-freelogovectors.net_.png", "path": null, "size": 14.63, "width": 750, "height": 469, "sizeInBytes": 14628}, "thumbnail": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/thumbnail_next_js_logo_freelogovectors_net_10271b6b01.png", "hash": "thumbnail_next_js_logo_freelogovectors_net_10271b6b01", "mime": "image/png", "name": "thumbnail_next-js-logo-freelogovectors.net_.png", "path": null, "size": 4.38, "width": 245, "height": 153, "sizeInBytes": 4382}}	next_js_logo_freelogovectors_net_10271b6b01	.png	image/png	7.50	https://strapi-next-starter.s3.eu-central-1.amazonaws.com/next_js_logo_freelogovectors_net_10271b6b01.png	\N	aws-s3	\N	/	2025-05-08 21:05:57.292	2025-05-08 21:05:57.292	2025-05-08 21:05:57.292	\N	\N	\N
20	tnddu9v9cy06ovg0x6b8i2xp	Strapi.full.logo.dark.D_WYV59t.png	\N	\N	1751	424	{"large": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/large_Strapi_full_logo_dark_D_WYV_59t_a110d4e695.png", "hash": "large_Strapi_full_logo_dark_D_WYV_59t_a110d4e695", "mime": "image/png", "name": "large_Strapi.full.logo.dark.D_WYV59t.png", "path": null, "size": 30.84, "width": 1000, "height": 242, "sizeInBytes": 30844}, "small": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/small_Strapi_full_logo_dark_D_WYV_59t_a110d4e695.png", "hash": "small_Strapi_full_logo_dark_D_WYV_59t_a110d4e695", "mime": "image/png", "name": "small_Strapi.full.logo.dark.D_WYV59t.png", "path": null, "size": 14.64, "width": 500, "height": 121, "sizeInBytes": 14635}, "medium": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/medium_Strapi_full_logo_dark_D_WYV_59t_a110d4e695.png", "hash": "medium_Strapi_full_logo_dark_D_WYV_59t_a110d4e695", "mime": "image/png", "name": "medium_Strapi.full.logo.dark.D_WYV59t.png", "path": null, "size": 22.16, "width": 750, "height": 182, "sizeInBytes": 22159}, "thumbnail": {"ext": ".png", "url": "https://strapi-next-starter.s3.eu-central-1.amazonaws.com/thumbnail_Strapi_full_logo_dark_D_WYV_59t_a110d4e695.png", "hash": "thumbnail_Strapi_full_logo_dark_D_WYV_59t_a110d4e695", "mime": "image/png", "name": "thumbnail_Strapi.full.logo.dark.D_WYV59t.png", "path": null, "size": 7.33, "width": 245, "height": 59, "sizeInBytes": 7328}}	Strapi_full_logo_dark_D_WYV_59t_a110d4e695	.png	image/png	11.36	https://strapi-next-starter.s3.eu-central-1.amazonaws.com/Strapi_full_logo_dark_D_WYV_59t_a110d4e695.png	\N	aws-s3	\N	/	2025-05-08 21:05:57.351	2025-05-08 21:05:57.351	2025-05-08 21:05:57.351	\N	\N	\N
\.


--
-- Data for Name: files_folder_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.files_folder_lnk (id, file_id, folder_id, file_ord) FROM stdin;
\.


--
-- Data for Name: files_related_mph; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.files_related_mph (id, file_id, related_id, related_type, field, "order") FROM stdin;
31	16	41	utilities.basic-image	media	1
32	14	42	utilities.basic-image	media	1
33	13	43	utilities.basic-image	media	1
34	16	44	utilities.basic-image	media	1
35	14	45	utilities.basic-image	media	1
36	13	46	utilities.basic-image	media	1
37	20	31	utilities.basic-image	media	1
38	19	32	utilities.basic-image	media	1
39	18	33	utilities.basic-image	media	1
40	17	34	utilities.basic-image	media	1
41	15	35	utilities.basic-image	media	1
42	20	36	utilities.basic-image	media	1
43	19	37	utilities.basic-image	media	1
44	18	38	utilities.basic-image	media	1
45	17	39	utilities.basic-image	media	1
46	15	40	utilities.basic-image	media	1
47	20	47	utilities.basic-image	media	1
48	19	48	utilities.basic-image	media	1
49	18	49	utilities.basic-image	media	1
50	17	50	utilities.basic-image	media	1
51	15	51	utilities.basic-image	media	1
52	20	52	utilities.basic-image	media	1
53	19	53	utilities.basic-image	media	1
54	18	54	utilities.basic-image	media	1
55	17	55	utilities.basic-image	media	1
56	15	56	utilities.basic-image	media	1
57	20	57	utilities.basic-image	media	1
58	19	58	utilities.basic-image	media	1
59	18	59	utilities.basic-image	media	1
60	17	60	utilities.basic-image	media	1
61	15	61	utilities.basic-image	media	1
62	20	62	utilities.basic-image	media	1
63	19	63	utilities.basic-image	media	1
64	18	64	utilities.basic-image	media	1
65	17	65	utilities.basic-image	media	1
66	15	66	utilities.basic-image	media	1
67	16	67	utilities.basic-image	media	1
68	14	68	utilities.basic-image	media	1
69	13	69	utilities.basic-image	media	1
70	16	70	utilities.basic-image	media	1
71	14	71	utilities.basic-image	media	1
72	13	72	utilities.basic-image	media	1
73	16	73	utilities.basic-image	media	1
74	14	74	utilities.basic-image	media	1
75	13	75	utilities.basic-image	media	1
76	16	76	utilities.basic-image	media	1
77	14	77	utilities.basic-image	media	1
78	13	78	utilities.basic-image	media	1
\.


--
-- Data for Name: footers; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.footers (id, document_id, copy_right, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
6	ls2f509pk1vy8i8c7k2v6qej	\N	2025-05-08 22:24:55.119	2025-05-08 22:24:55.119	2025-05-08 22:24:54.691	\N	\N	en
7	ls2f509pk1vy8i8c7k2v6qej	\N	2025-05-27 23:29:41.65	2025-05-27 23:29:41.65	2025-05-27 23:29:41.629	1	1	vi
8	ls2f509pk1vy8i8c7k2v6qej	\N	2025-05-27 23:29:48.873	2025-05-27 23:29:48.873	2025-05-27 23:29:48.855	1	1	cs
\.


--
-- Data for Name: footers_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.footers_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
21	6	6	elements.footer-item	sections	1
22	6	72	utilities.link	links	1
23	7	7	elements.footer-item	sections	1
24	7	93	utilities.link	links	1
25	7	34	utilities.image-with-link	logoImage	\N
26	8	8	elements.footer-item	sections	1
27	8	96	utilities.link	links	1
28	8	35	utilities.image-with-link	logoImage	\N
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.i18n_locale (id, document_id, name, code, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
7	wjxg9t4kzl8nbiu9jxnhjufs	Czech (cs)	cs	2025-05-27 23:26:27.175	2025-05-27 23:26:27.175	2025-05-27 23:26:27.175	1	1	\N
8	sugkqhso45j4n6odwjggyh5v	Vietnamese (vi)	vi	2025-05-27 23:26:36.968	2025-05-27 23:26:36.968	2025-05-27 23:26:36.968	1	1	\N
6	b05qiqrbpfpco6w91sn0a19t	English (en)	en	2025-05-08 20:41:47.763	2025-06-01 23:19:07.993	2025-05-08 20:41:47.765	\N	1	\N
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.identities (id, document_id, name, type, slug, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, bio) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.items (id, document_id, title, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, slug, description, is_active, is_featured, item_type, search_summary) FROM stdin;
1	gfik7zn9bfn2kwr97wgj5mxl	Lê Giang Anh	2025-05-31 19:28:27.946	2025-05-31 19:29:20.887	\N	1	1	en	le-giang-anh	[{"type": "paragraph", "children": [{"text": "Lê Giang Anh description", "type": "text"}]}]	t	t	Other	\N
3	gfik7zn9bfn2kwr97wgj5mxl	Lê Giang Anh	2025-05-31 19:28:27.946	2025-05-31 19:29:20.887	2025-05-31 19:29:20.922	1	1	en	le-giang-anh	[{"type": "paragraph", "children": [{"text": "Lê Giang Anh description", "type": "text"}]}]	t	t	Other	\N
4	gfik7zn9bfn2kwr97wgj5mxl	Lê Giang Anh	2025-05-31 19:29:36.144	2025-05-31 19:29:36.144	\N	1	1	vi	le-giang-anh	[{"type": "paragraph", "children": [{"text": "Lê Giang Anh description", "type": "text"}]}]	t	t	Other	\N
5	gfik7zn9bfn2kwr97wgj5mxl	Lê Giang Anh	2025-05-31 19:29:36.144	2025-05-31 19:29:36.144	2025-05-31 19:29:36.174	1	1	vi	le-giang-anh	[{"type": "paragraph", "children": [{"text": "Lê Giang Anh description", "type": "text"}]}]	t	t	Other	\N
6	f98zymeazmd6zcqhdoaruftk	Scammer A	2025-06-03 00:04:42.481	2025-06-03 00:04:42.481	\N	1	1	en	scammer-a	\N	t	f	Other	\N
7	f98zymeazmd6zcqhdoaruftk	Scammer A	2025-06-03 00:04:42.481	2025-06-03 00:04:42.481	2025-06-03 00:04:42.531	1	1	en	scammer-a	\N	t	f	Other	\N
\.


--
-- Data for Name: items_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.items_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: items_listing_type_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.items_listing_type_lnk (id, item_id, listing_type_id) FROM stdin;
1	6	1
2	7	15
\.


--
-- Data for Name: items_related_identity_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.items_related_identity_lnk (id, item_id, identity_id) FROM stdin;
\.


--
-- Data for Name: listing_types; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.listing_types (id, document_id, name, slug, description, is_active, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, allow_comment, allow_rating, item_group, review_group, icon_set, component_filter, test_field) FROM stdin;
4	udpgtzhmbomsygmsxb7u0cuz	Scammer	Scammer	[{"type": "paragraph", "children": [{"text": "Đối Tượng Vi Phạm", "type": "text"}]}]	t	2025-06-01 23:23:04.559	2025-06-05 01:35:45.325	\N	1	1	vi	t	t	\N	["review.proscons"]	Classic	\N	\N
15	udpgtzhmbomsygmsxb7u0cuz	Scammer	Scammer	[{"type": "paragraph", "children": [{"text": "Scammer", "type": "text"}]}]	f	2025-05-31 20:04:30.346	2025-06-05 01:35:45.309	2025-06-05 01:35:45.343	1	1	en	f	f	["info.bank-info"]	["review.proscons"]	Classic	\N	\N
5	udpgtzhmbomsygmsxb7u0cuz	Scammer	Scammer	[{"type": "paragraph", "children": [{"text": "Đối Tượng Vi Phạm", "type": "text"}]}]	t	2025-06-01 23:23:04.559	2025-06-05 01:35:45.384	2025-06-01 23:23:04.588	1	1	vi	t	t	\N	["review.proscons"]	Classic	\N	\N
7	o86wqkhdji9lnpcgpeffrlhv	Bank	bank	[{"type": "paragraph", "children": [{"text": "Bank", "type": "text"}]}]	t	2025-06-01 23:25:13.043	2025-06-05 01:40:17.787	\N	1	1	en	t	t	["contact.social-media", "contact.location", "info.bank-info"]	["review.proscons"]	Classic	\N	\N
9	o86wqkhdji9lnpcgpeffrlhv	Ngân Hàng	ngan-hang	[{"type": "paragraph", "children": [{"text": "Ngân Hàng", "type": "text"}]}]	t	2025-06-01 23:40:11.514	2025-06-05 01:40:17.803	\N	1	1	vi	t	t	\N	["review.proscons"]	Classic	\N	\N
17	o86wqkhdji9lnpcgpeffrlhv	Bank	bank	[{"type": "paragraph", "children": [{"text": "Bank", "type": "text"}]}]	t	2025-06-01 23:25:13.043	2025-06-05 01:40:17.787	2025-06-05 01:40:17.823	1	1	en	t	t	["contact.social-media", "contact.location", "info.bank-info"]	["review.proscons"]	Classic	\N	\N
14	bhd55yz9202flxx9dz26w0tu	Test CSS Variables Theme	\N	\N	t	2025-06-04 22:55:32.691	2025-06-04 22:55:32.691	\N	1	1	en	t	t	\N	\N	Classic	\N	\N
1	udpgtzhmbomsygmsxb7u0cuz	Scammer	Scammer	[{"type": "paragraph", "children": [{"text": "Scammer", "type": "text"}]}]	f	2025-05-31 20:04:30.346	2025-06-05 01:35:45.309	\N	1	1	en	f	f	["info.bank-info"]	["review.proscons"]	Classic	\N	\N
10	o86wqkhdji9lnpcgpeffrlhv	Ngân Hàng	ngan-hang	[{"type": "paragraph", "children": [{"text": "Ngân Hàng", "type": "text"}]}]	t	2025-06-01 23:40:11.514	2025-06-05 01:40:17.845	2025-06-01 23:40:11.543	1	1	vi	t	t	\N	["review.proscons"]	Classic	\N	\N
\.


--
-- Data for Name: listing_types_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.listing_types_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: listings; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.listings (id, document_id, title, slug, url, is_active, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: listings_category_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.listings_category_lnk (id, listing_id, category_id, listing_ord) FROM stdin;
\.


--
-- Data for Name: listings_item_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.listings_item_lnk (id, listing_id, item_id, listing_ord) FROM stdin;
\.


--
-- Data for Name: navbars; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.navbars (id, document_id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
11	rqov3pijy8hy4d6lwtat13vz	2025-05-08 21:59:22.612	2025-05-08 21:59:22.612	2025-05-08 21:59:22.422	\N	\N	en
12	rqov3pijy8hy4d6lwtat13vz	2025-05-27 23:29:12.462	2025-05-27 23:29:12.462	2025-05-27 23:29:12.441	1	1	vi
13	rqov3pijy8hy4d6lwtat13vz	2025-05-27 23:29:27.125	2025-05-27 23:29:27.125	2025-05-27 23:29:27.114	1	1	cs
\.


--
-- Data for Name: navbars_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.navbars_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
21	11	73	utilities.link	links	1
22	11	74	utilities.link	links	2
23	12	87	utilities.link	links	1
24	12	88	utilities.link	links	2
25	12	32	utilities.image-with-link	logoImage	\N
26	13	89	utilities.link	links	1
27	13	90	utilities.link	links	2
28	13	33	utilities.image-with-link	logoImage	\N
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.pages (id, document_id, title, breadcrumb_title, slug, full_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
53	zj18v623qcixxhyypoti1fm2	Page 2	Page 2	page2	/page2	2025-05-27 23:33:58.329	2025-05-27 23:33:58.329	\N	1	1	cs
54	zj18v623qcixxhyypoti1fm2	Page 2	Page 2	page2	/page2	2025-05-27 23:33:58.329	2025-05-27 23:33:58.329	2025-05-27 23:33:58.392	1	1	cs
37	p7d0agmr5oen6948c5g3c4lv	Index	Home	/	/	2025-05-08 20:45:34.276	2025-05-08 21:41:52.624	\N	\N	\N	en
38	p7d0agmr5oen6948c5g3c4lv	Index	Home	/	/	2025-05-08 20:45:34.276	2025-05-08 21:41:52.624	2025-05-08 21:41:56.043	\N	\N	en
39	ok1o858xfxd4do4jau9lx7ze	Page 1	Page 1	page1	/page1	2025-05-08 22:02:39.381	2025-05-08 22:31:02.477	\N	\N	\N	en
40	ok1o858xfxd4do4jau9lx7ze	Page 1	Page 1	page1	/page1	2025-05-08 22:02:39.381	2025-05-08 22:31:02.477	2025-05-08 22:31:06.546	\N	\N	en
41	zj18v623qcixxhyypoti1fm2	Page 2	Page 2	page2	/page2	2025-05-08 22:34:24.045	2025-05-08 22:34:24.045	\N	\N	\N	en
42	zj18v623qcixxhyypoti1fm2	Page 2	Page 2	page2	/page2	2025-05-08 22:34:24.045	2025-05-08 22:34:24.045	2025-05-08 22:34:25.02	\N	\N	en
43	p7d0agmr5oen6948c5g3c4lv	Index	Home	/	/	2025-05-27 23:30:09.903	2025-05-27 23:30:09.903	\N	1	1	vi
44	p7d0agmr5oen6948c5g3c4lv	Index	Home	/	/	2025-05-27 23:30:09.903	2025-05-27 23:30:09.903	2025-05-27 23:30:09.98	1	1	vi
45	p7d0agmr5oen6948c5g3c4lv	Index	Home	/	/	2025-05-27 23:30:18.033	2025-05-27 23:30:18.033	\N	1	1	cs
46	p7d0agmr5oen6948c5g3c4lv	Index	Home	/	/	2025-05-27 23:30:18.033	2025-05-27 23:30:18.033	2025-05-27 23:30:18.103	1	1	cs
47	ok1o858xfxd4do4jau9lx7ze	Page 1	Page 1	page1	/page1	2025-05-27 23:32:05.661	2025-05-27 23:32:05.661	\N	1	1	vi
48	ok1o858xfxd4do4jau9lx7ze	Page 1	Page 1	page1	/page1	2025-05-27 23:32:05.661	2025-05-27 23:32:05.661	2025-05-27 23:32:05.737	1	1	vi
49	ok1o858xfxd4do4jau9lx7ze	Page 1	Page 1	page1	/page1	2025-05-27 23:32:12.657	2025-05-27 23:32:12.657	\N	1	1	cs
50	ok1o858xfxd4do4jau9lx7ze	Page 1	Page 1	page1	/page1	2025-05-27 23:32:12.657	2025-05-27 23:32:12.657	2025-05-27 23:32:12.717	1	1	cs
51	zj18v623qcixxhyypoti1fm2	Page 2	Page 2	page2	/page2	2025-05-27 23:33:40.585	2025-05-27 23:33:40.585	\N	1	1	vi
52	zj18v623qcixxhyypoti1fm2	Page 2	Page 2	page2	/page2	2025-05-27 23:33:40.585	2025-05-27 23:33:40.585	2025-05-27 23:33:40.656	1	1	vi
\.


--
-- Data for Name: pages_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.pages_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
53	37	3	sections.hero	content	1
54	37	3	utilities.ck-editor-content	content	2
55	37	3	sections.animated-logo-row	content	3
56	38	4	sections.hero	content	1
57	38	4	utilities.ck-editor-content	content	2
58	38	4	sections.animated-logo-row	content	3
59	39	7	sections.heading-with-cta-button	content	1
60	39	7	sections.carousel	content	2
61	39	7	sections.faq	content	3
62	40	8	sections.heading-with-cta-button	content	1
63	40	8	sections.carousel	content	2
64	40	8	sections.faq	content	3
65	41	3	forms.contact-form	content	1
66	42	4	forms.contact-form	content	1
67	43	5	sections.hero	content	1
68	43	5	utilities.ck-editor-content	content	2
69	43	5	sections.animated-logo-row	content	3
70	43	21	seo-utilities.seo	seo	\N
71	44	6	sections.hero	content	1
72	44	6	utilities.ck-editor-content	content	2
73	44	6	sections.animated-logo-row	content	3
74	44	22	seo-utilities.seo	seo	\N
75	45	7	sections.hero	content	1
76	45	7	utilities.ck-editor-content	content	2
77	45	7	sections.animated-logo-row	content	3
78	45	23	seo-utilities.seo	seo	\N
79	46	8	sections.hero	content	1
80	46	8	utilities.ck-editor-content	content	2
81	46	8	sections.animated-logo-row	content	3
82	46	24	seo-utilities.seo	seo	\N
83	47	9	sections.heading-with-cta-button	content	1
84	47	9	sections.carousel	content	2
85	47	9	sections.faq	content	3
86	47	25	seo-utilities.seo	seo	\N
87	48	10	sections.heading-with-cta-button	content	1
88	48	10	sections.carousel	content	2
89	48	10	sections.faq	content	3
90	48	26	seo-utilities.seo	seo	\N
91	49	11	sections.heading-with-cta-button	content	1
92	49	11	sections.carousel	content	2
93	49	11	sections.faq	content	3
94	49	27	seo-utilities.seo	seo	\N
95	50	12	sections.heading-with-cta-button	content	1
96	50	12	sections.carousel	content	2
97	50	12	sections.faq	content	3
98	50	28	seo-utilities.seo	seo	\N
99	51	5	forms.contact-form	content	1
100	51	29	seo-utilities.seo	seo	\N
101	52	6	forms.contact-form	content	1
102	52	30	seo-utilities.seo	seo	\N
103	53	7	forms.contact-form	content	1
104	53	31	seo-utilities.seo	seo	\N
105	54	8	forms.contact-form	content	1
106	54	32	seo-utilities.seo	seo	\N
\.


--
-- Data for Name: pages_parent_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.pages_parent_lnk (id, page_id, inv_page_id, page_ord) FROM stdin;
5	39	37	1
6	40	38	1
7	41	37	2
8	42	38	2
9	51	43	1
10	52	44	1
\.


--
-- Data for Name: platforms; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.platforms (id, document_id, name, slug, url, is_active, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: platforms_listings_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.platforms_listings_lnk (id, platform_id, listing_id, listing_ord) FROM stdin;
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.reports (id, document_id, type, target_type, report_status, reason, description, note, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, proof_links) FROM stdin;
\.


--
-- Data for Name: reports_reporter_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.reports_reporter_lnk (id, report_id, identity_id, report_ord) FROM stdin;
\.


--
-- Data for Name: reports_review_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.reports_review_lnk (id, report_id, review_id, report_ord) FROM stdin;
\.


--
-- Data for Name: reports_target_identity_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.reports_target_identity_lnk (id, report_id, identity_id, report_ord) FROM stdin;
\.


--
-- Data for Name: reports_target_item_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.reports_target_item_lnk (id, report_id, item_id, report_ord) FROM stdin;
\.


--
-- Data for Name: reports_target_listing_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.reports_target_listing_lnk (id, report_id, listing_id, report_ord) FROM stdin;
\.


--
-- Data for Name: review_votes; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.review_votes (id, document_id, is_helpful, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: review_votes_identity_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.review_votes_identity_lnk (id, review_vote_id, identity_id) FROM stdin;
\.


--
-- Data for Name: review_votes_review_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.review_votes_review_lnk (id, review_vote_id, review_id) FROM stdin;
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.reviews (id, document_id, title, content, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, review_date, is_featured, review_status, up_vote, down_vote, reported_count, reject_reason, review_type) FROM stdin;
\.


--
-- Data for Name: reviews_cmps; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.reviews_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_api_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
4	qpngsk0wmdzbuzo0qpngc5u5	api::page.page.find	2025-05-26 19:07:02.595	2025-05-26 19:07:02.595	2025-05-26 19:07:02.595	\N	\N	\N
5	mt130ha3cyjfv6ye9nc2bq9o	api::page.page.findOne	2025-05-26 19:07:02.595	2025-05-26 19:07:02.595	2025-05-26 19:07:02.596	\N	\N	\N
12	cottqg7wiqtbp2mirr6g1z76	api::footer.footer.update	2025-05-26 19:07:29.85	2025-05-26 19:07:29.85	2025-05-26 19:07:29.851	\N	\N	\N
13	kkpx6qrp9frs40iy8b9i1uxc	api::footer.footer.find	2025-05-26 19:07:29.85	2025-05-26 19:07:29.85	2025-05-26 19:07:29.851	\N	\N	\N
\.


--
-- Data for Name: strapi_api_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_api_token_permissions_token_lnk (id, api_token_permission_id, api_token_id, api_token_permission_ord) FROM stdin;
4	4	4	3
5	5	4	4
12	12	4	8
13	13	4	8
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_api_tokens (id, document_id, name, description, type, access_key, encrypted_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	iybl68yqyeq4j67fis1z3zwd	Read Only	A default API token with read-only permissions, only used for accessing resources	read-only	4083e2ca0006f91ce04a93c2bc77a591468da7425d72cdcf53328b19b0bdeee8095340135ceda343f22a0d65796982af3224bbfea8d18c538d1c7df45b41dd23	\N	\N	\N	\N	2025-05-26 02:32:12.37	2025-05-26 02:32:12.37	2025-05-26 02:32:12.37	\N	\N	\N
2	q1c4et9imnl7nr8peprp21f0	Full Access	A default API token with full access permissions, used for accessing or modifying resources	full-access	7cd648c848ad3dc4fbfc624fd75641557d743e7e4b28f16172f166fed7e0b5dee65a55037875ae09b4d0e22389f9a7c430d20d28df97d6f59fa16beac0de8ae1	\N	\N	\N	\N	2025-05-26 02:32:12.376	2025-05-26 02:32:12.376	2025-05-26 02:32:12.376	\N	\N	\N
3	ooa15c9v1t8ykx2nry1v4no0	UI Read-only		read-only	3889c12a07cfc09f3e2f3042e60c6082ca9e87f4fbb75a5231d4f9711fc65c8ae2f9889a8be710a007bd0c6cd00f4c8cf9aabb18e7b77ee8be05e85619ab1ec6	\N	\N	\N	\N	2025-05-26 09:46:13.142	2025-05-26 16:18:52.209	2025-05-26 09:46:13.142	\N	\N	\N
4	sbvzj0fdkq8z4rekzni9xxht	UI Custom		full-access	649faac8ae0bf72eb99d8a82f4f915c71d80a7e90e80f430ad04318a44da71d054323738f983ae62eae9f45291d1d543db3d25120abee299ef8dda3c96e602bd	\N	\N	\N	\N	2025-05-26 09:47:42.852	2025-06-01 22:46:29.689	2025-05-26 09:47:42.852	\N	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
241	strapi_content_types_schema	{"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"files"}}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"plugin":"upload","globalId":"UploadFile","uid":"plugin::upload.file","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"file"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"upload_folders"}}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"plugin":"upload","globalId":"UploadFolder","uid":"plugin::upload.folder","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true}},"kind":"collectionType"},"modelName":"folder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::i18n.locale","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"i18n_locale"}}},"plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale","uid":"plugin::i18n.locale","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"i18n_locale","info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelName":"locale"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_releases"}}},"plugin":"content-releases","globalId":"ContentReleasesRelease","uid":"plugin::content-releases.release","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelName":"release"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_release_actions"}}},"plugin":"content-releases","globalId":"ContentReleasesReleaseAction","uid":"plugin::content-releases.release-action","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelName":"release-action"},"plugin::review-workflows.workflow":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflow","uid":"plugin::review-workflows.workflow","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"}},"kind":"collectionType"},"modelName":"workflow"},"plugin::review-workflows.workflow-stage":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0","draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow-stage","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows_stages"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflowStage","uid":"plugin::review-workflows.workflow-stage","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false}},"kind":"collectionType"},"modelName":"workflow-stage"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_permissions"}}},"plugin":"users-permissions","globalId":"UsersPermissionsPermission","uid":"plugin::users-permissions.permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelName":"permission","options":{"draftAndPublish":false}},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_roles"}}},"plugin":"users-permissions","globalId":"UsersPermissionsRole","uid":"plugin::users-permissions.role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelName":"role","options":{"draftAndPublish":false}},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true,"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"plugin":"users-permissions","globalId":"UsersPermissionsUser","uid":"plugin::users-permissions.user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelName":"user"},"api::category.category":{"kind":"collectionType","collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"Name":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"Slug":{"type":"uid","targetField":"Name","required":false},"Description":{"type":"blocks","pluginOptions":{"i18n":{"localized":true}}},"Image":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"isActive":{"type":"boolean","default":true},"Listings":{"type":"relation","relation":"oneToMany","target":"api::listing.listing","mappedBy":"Category"},"ListingType":{"type":"relation","relation":"manyToOne","target":"api::listing-type.listing-type","inversedBy":"Categories"},"ParentCategory":{"type":"relation","relation":"manyToOne","target":"api::category.category","inversedBy":"ChildCategories"},"ChildCategories":{"type":"relation","relation":"oneToMany","target":"api::category.category","mappedBy":"ParentCategory"},"Directory":{"type":"relation","relation":"manyToOne","target":"api::directory.directory","inversedBy":"Categories"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::category.category","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"categories"}}},"apiName":"category","globalId":"Category","uid":"api::category.category","modelType":"contentType","__schema__":{"collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"Name":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"Slug":{"type":"uid","targetField":"Name","required":false},"Description":{"type":"blocks","pluginOptions":{"i18n":{"localized":true}}},"Image":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"isActive":{"type":"boolean","default":true},"Listings":{"type":"relation","relation":"oneToMany","target":"api::listing.listing","mappedBy":"Category"},"ListingType":{"type":"relation","relation":"manyToOne","target":"api::listing-type.listing-type","inversedBy":"Categories"},"ParentCategory":{"type":"relation","relation":"manyToOne","target":"api::category.category","inversedBy":"ChildCategories"},"ChildCategories":{"type":"relation","relation":"oneToMany","target":"api::category.category","mappedBy":"ParentCategory"},"Directory":{"type":"relation","relation":"manyToOne","target":"api::directory.directory","inversedBy":"Categories"}},"kind":"collectionType"},"modelName":"category","actions":{},"lifecycles":{}},"api::directory.directory":{"kind":"collectionType","collectionName":"directories","info":{"singularName":"directory","pluralName":"directories","displayName":"Directory","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"Name":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"Slug":{"type":"uid","targetField":"Name","required":true},"Description":{"type":"blocks","pluginOptions":{"i18n":{"localized":true}}},"Image":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":true}}},"isActive":{"type":"boolean","default":true,"pluginOptions":{"i18n":{"localized":true}}},"Categories":{"type":"relation","relation":"oneToMany","target":"api::category.category","mappedBy":"Directory"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::directory.directory","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"directories"}}},"apiName":"directory","globalId":"Directory","uid":"api::directory.directory","modelType":"contentType","__schema__":{"collectionName":"directories","info":{"singularName":"directory","pluralName":"directories","displayName":"Directory","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"Name":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"Slug":{"type":"uid","targetField":"Name","required":true},"Description":{"type":"blocks","pluginOptions":{"i18n":{"localized":true}}},"Image":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":true}}},"isActive":{"type":"boolean","default":true,"pluginOptions":{"i18n":{"localized":true}}},"Categories":{"type":"relation","relation":"oneToMany","target":"api::category.category","mappedBy":"Directory"}},"kind":"collectionType"},"modelName":"directory","actions":{},"lifecycles":{}},"api::footer.footer":{"kind":"singleType","collectionName":"footers","info":{"singularName":"footer","pluralName":"footers","displayName":"Footer","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"sections":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"elements.footer-item"},"links":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"utilities.link"},"copyRight":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"logoImage":{"type":"component","repeatable":false,"pluginOptions":{"i18n":{"localized":true}},"component":"utilities.image-with-link"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::footer.footer","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"footers"}}},"apiName":"footer","globalId":"Footer","uid":"api::footer.footer","modelType":"contentType","__schema__":{"collectionName":"footers","info":{"singularName":"footer","pluralName":"footers","displayName":"Footer","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"sections":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"elements.footer-item"},"links":{"type":"component","repeatable":true,"pluginOptions":{"i18n":{"localized":true}},"component":"utilities.link"},"copyRight":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"logoImage":{"type":"component","repeatable":false,"pluginOptions":{"i18n":{"localized":true}},"component":"utilities.image-with-link"}},"kind":"singleType"},"modelName":"footer","actions":{},"lifecycles":{}},"api::identity.identity":{"kind":"collectionType","collectionName":"identities","info":{"singularName":"identity","pluralName":"identities","displayName":"Identity","description":""},"options":{"draftAndPublish":true},"attributes":{"Name":{"type":"string","required":true},"Type":{"type":"enumeration","enum":["Individual","Organization"]},"Slug":{"type":"string"},"Avatar":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"Bio":{"type":"blocks"},"ReviewVote":{"type":"relation","relation":"oneToOne","target":"api::review-vote.review-vote","mappedBy":"Identity"},"ReportMade":{"type":"relation","relation":"oneToMany","target":"api::report.report","mappedBy":"Reporter"},"ReportReceived":{"type":"relation","relation":"oneToMany","target":"api::report.report","mappedBy":"TargetIdentity"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::identity.identity","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"identities"}}},"apiName":"identity","globalId":"Identity","uid":"api::identity.identity","modelType":"contentType","__schema__":{"collectionName":"identities","info":{"singularName":"identity","pluralName":"identities","displayName":"Identity","description":""},"options":{"draftAndPublish":true},"attributes":{"Name":{"type":"string","required":true},"Type":{"type":"enumeration","enum":["Individual","Organization"]},"Slug":{"type":"string"},"Avatar":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"Bio":{"type":"blocks"},"ReviewVote":{"type":"relation","relation":"oneToOne","target":"api::review-vote.review-vote","mappedBy":"Identity"},"ReportMade":{"type":"relation","relation":"oneToMany","target":"api::report.report","mappedBy":"Reporter"},"ReportReceived":{"type":"relation","relation":"oneToMany","target":"api::report.report","mappedBy":"TargetIdentity"}},"kind":"collectionType"},"modelName":"identity","actions":{},"lifecycles":{}},"api::item.item":{"kind":"collectionType","collectionName":"items","info":{"singularName":"item","pluralName":"items","displayName":"Item","description":"Generic item that can represent products, people, services, etc."},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"Title":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"Slug":{"type":"uid","targetField":"Title"},"Description":{"type":"blocks","pluginOptions":{"i18n":{"localized":true}}},"Image":{"type":"media","pluginOptions":{"i18n":{"localized":true}},"multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"Gallery":{"type":"media","pluginOptions":{"i18n":{"localized":true}},"multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"isActive":{"type":"boolean","pluginOptions":{"i18n":{"localized":true}},"default":true},"isFeatured":{"type":"boolean","pluginOptions":{"i18n":{"localized":true}},"default":false},"ItemType":{"type":"enumeration","pluginOptions":{"i18n":{"localized":true}},"default":"Other","enum":["Product","Service","Person","Business","Event","Other"]},"FieldGroup":{"type":"dynamiczone","pluginOptions":{"i18n":{"localized":true}},"components":["contact.basic","contact.location","contact.social-media","info.bank-info","violation.detail","violation.evidence","utilities.text","utilities.link","media.photo","media.video","review.pros-cons","rating.criterion"]},"ListingType":{"type":"relation","relation":"manyToOne","target":"api::listing-type.listing-type"},"RelatedIdentity":{"type":"relation","relation":"manyToOne","target":"api::identity.identity"},"listings":{"type":"relation","relation":"oneToMany","target":"api::listing.listing","mappedBy":"Item"},"Reports":{"type":"relation","relation":"oneToMany","target":"api::report.report","mappedBy":"TargetItem"},"SearchSummary":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::item.item","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"items"}}},"apiName":"item","globalId":"Item","uid":"api::item.item","modelType":"contentType","__schema__":{"collectionName":"items","info":{"singularName":"item","pluralName":"items","displayName":"Item","description":"Generic item that can represent products, people, services, etc."},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"Title":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"Slug":{"type":"uid","targetField":"Title"},"Description":{"type":"blocks","pluginOptions":{"i18n":{"localized":true}}},"Image":{"type":"media","pluginOptions":{"i18n":{"localized":true}},"multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"Gallery":{"type":"media","pluginOptions":{"i18n":{"localized":true}},"multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"isActive":{"type":"boolean","pluginOptions":{"i18n":{"localized":true}},"default":true},"isFeatured":{"type":"boolean","pluginOptions":{"i18n":{"localized":true}},"default":false},"ItemType":{"type":"enumeration","pluginOptions":{"i18n":{"localized":true}},"default":"Other","enum":["Product","Service","Person","Business","Event","Other"]},"FieldGroup":{"type":"dynamiczone","pluginOptions":{"i18n":{"localized":true}},"components":["contact.basic","contact.location","contact.social-media","info.bank-info","violation.detail","violation.evidence","utilities.text","utilities.link","media.photo","media.video","review.pros-cons","rating.criterion"]},"ListingType":{"type":"relation","relation":"manyToOne","target":"api::listing-type.listing-type"},"RelatedIdentity":{"type":"relation","relation":"manyToOne","target":"api::identity.identity"},"listings":{"type":"relation","relation":"oneToMany","target":"api::listing.listing","mappedBy":"Item"},"Reports":{"type":"relation","relation":"oneToMany","target":"api::report.report","mappedBy":"TargetItem"},"SearchSummary":{"type":"string","pluginOptions":{"i18n":{"localized":true}}}},"kind":"collectionType"},"modelName":"item","actions":{},"lifecycles":{}},"api::listing.listing":{"kind":"collectionType","collectionName":"listings","info":{"singularName":"listing","pluralName":"listings","displayName":"Listing","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"Title":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"Slug":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"URL":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"isActive":{"type":"boolean","default":true,"pluginOptions":{"i18n":{"localized":true}}},"Description":{"type":"blocks","pluginOptions":{"i18n":{"localized":true}}},"Item":{"type":"relation","relation":"manyToOne","target":"api::item.item","inversedBy":"listings"},"Category":{"type":"relation","relation":"manyToOne","target":"api::category.category","inversedBy":"Listings"},"Reports":{"type":"relation","relation":"oneToMany","target":"api::report.report","mappedBy":"TargetListing"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::listing.listing","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"listings"}}},"apiName":"listing","globalId":"Listing","uid":"api::listing.listing","modelType":"contentType","__schema__":{"collectionName":"listings","info":{"singularName":"listing","pluralName":"listings","displayName":"Listing","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"Title":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"Slug":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"URL":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"isActive":{"type":"boolean","default":true,"pluginOptions":{"i18n":{"localized":true}}},"Description":{"type":"blocks","pluginOptions":{"i18n":{"localized":true}}},"Item":{"type":"relation","relation":"manyToOne","target":"api::item.item","inversedBy":"listings"},"Category":{"type":"relation","relation":"manyToOne","target":"api::category.category","inversedBy":"Listings"},"Reports":{"type":"relation","relation":"oneToMany","target":"api::report.report","mappedBy":"TargetListing"}},"kind":"collectionType"},"modelName":"listing","actions":{},"lifecycles":{}},"api::listing-type.listing-type":{"kind":"collectionType","collectionName":"listing_types","info":{"singularName":"listing-type","pluralName":"listing-types","displayName":"Listing Type","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"Name":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"Slug":{"type":"uid","targetField":"Name"},"Description":{"type":"blocks","pluginOptions":{"i18n":{"localized":true}}},"isActive":{"type":"boolean","pluginOptions":{"i18n":{"localized":true}},"default":true},"Categories":{"type":"relation","relation":"oneToMany","target":"api::category.category","mappedBy":"ListingType"},"Criteria":{"type":"component","pluginOptions":{"i18n":{"localized":true}},"component":"rating.criterion","repeatable":true},"allowComment":{"type":"boolean","pluginOptions":{"i18n":{"localized":true}},"default":true},"allowRating":{"type":"boolean","pluginOptions":{"i18n":{"localized":true}},"default":true},"ItemGroup":{"type":"json","pluginOptions":{"i18n":{"localized":true}}},"ReviewGroup":{"type":"json"},"IconSet":{"type":"enumeration","default":"Classic","enum":["Classic","Warning","Thumb","Minimal"]},"TestField":{"type":"json","pluginOptions":{"i18n":{"localized":true}},"customField":"plugin::smart-component-filter.component-multi-select"},"ComponentFilter":{"type":"json","pluginOptions":{"i18n":{"localized":true}},"customField":"plugin::smart-component-filter.component-multi-select"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::listing-type.listing-type","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"listing_types"}}},"apiName":"listing-type","globalId":"ListingType","uid":"api::listing-type.listing-type","modelType":"contentType","__schema__":{"collectionName":"listing_types","info":{"singularName":"listing-type","pluralName":"listing-types","displayName":"Listing Type","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"Name":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"Slug":{"type":"uid","targetField":"Name"},"Description":{"type":"blocks","pluginOptions":{"i18n":{"localized":true}}},"isActive":{"type":"boolean","pluginOptions":{"i18n":{"localized":true}},"default":true},"Categories":{"type":"relation","relation":"oneToMany","target":"api::category.category","mappedBy":"ListingType"},"Criteria":{"type":"component","pluginOptions":{"i18n":{"localized":true}},"component":"rating.criterion","repeatable":true},"allowComment":{"type":"boolean","pluginOptions":{"i18n":{"localized":true}},"default":true},"allowRating":{"type":"boolean","pluginOptions":{"i18n":{"localized":true}},"default":true},"ItemGroup":{"type":"json","pluginOptions":{"i18n":{"localized":true}}},"ReviewGroup":{"type":"json"},"IconSet":{"type":"enumeration","default":"Classic","enum":["Classic","Warning","Thumb","Minimal"]},"TestField":{"type":"customField","pluginOptions":{"i18n":{"localized":true}},"customField":"plugin::smart-component-filter.component-multi-select"},"ComponentFilter":{"type":"customField","pluginOptions":{"i18n":{"localized":true}},"customField":"plugin::smart-component-filter.component-multi-select"}},"kind":"collectionType"},"modelName":"listing-type","actions":{},"lifecycles":{}},"api::navbar.navbar":{"kind":"singleType","collectionName":"navbars","info":{"singularName":"navbar","pluralName":"navbars","displayName":"Navbar"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"links":{"type":"component","repeatable":true,"component":"utilities.link","pluginOptions":{"i18n":{"localized":true}}},"logoImage":{"type":"component","repeatable":false,"component":"utilities.image-with-link","pluginOptions":{"i18n":{"localized":true}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::navbar.navbar","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"navbars"}}},"apiName":"navbar","globalId":"Navbar","uid":"api::navbar.navbar","modelType":"contentType","__schema__":{"collectionName":"navbars","info":{"singularName":"navbar","pluralName":"navbars","displayName":"Navbar"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"links":{"type":"component","repeatable":true,"component":"utilities.link","pluginOptions":{"i18n":{"localized":true}}},"logoImage":{"type":"component","repeatable":false,"component":"utilities.image-with-link","pluginOptions":{"i18n":{"localized":true}}}},"kind":"singleType"},"modelName":"navbar","actions":{},"lifecycles":{}},"api::page.page":{"kind":"collectionType","collectionName":"pages","info":{"singularName":"page","pluralName":"pages","displayName":"Page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"breadcrumbTitle":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"slug":{"type":"string","required":true,"regex":"^[a-z0-9/-]+$","pluginOptions":{"i18n":{"localized":true}}},"fullPath":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":false,"unique":true},"content":{"type":"dynamiczone","components":["sections.image-with-cta-button","sections.horizontal-images","sections.hero","sections.heading-with-cta-button","sections.faq","sections.carousel","sections.animated-logo-row","forms.newsletter-form","forms.contact-form","utilities.ck-editor-content"],"pluginOptions":{"i18n":{"localized":true}}},"children":{"type":"relation","relation":"oneToMany","target":"api::page.page","mappedBy":"parent"},"parent":{"type":"relation","relation":"manyToOne","target":"api::page.page","inversedBy":"children"},"seo":{"type":"component","repeatable":false,"component":"seo-utilities.seo","pluginOptions":{"i18n":{"localized":true}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::page.page","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"pages"}}},"apiName":"page","globalId":"Page","uid":"api::page.page","modelType":"contentType","__schema__":{"collectionName":"pages","info":{"singularName":"page","pluralName":"pages","displayName":"Page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true},"breadcrumbTitle":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"slug":{"type":"string","required":true,"regex":"^[a-z0-9/-]+$","pluginOptions":{"i18n":{"localized":true}}},"fullPath":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":false,"unique":true},"content":{"type":"dynamiczone","components":["sections.image-with-cta-button","sections.horizontal-images","sections.hero","sections.heading-with-cta-button","sections.faq","sections.carousel","sections.animated-logo-row","forms.newsletter-form","forms.contact-form","utilities.ck-editor-content"],"pluginOptions":{"i18n":{"localized":true}}},"children":{"type":"relation","relation":"oneToMany","target":"api::page.page","mappedBy":"parent"},"parent":{"type":"relation","relation":"manyToOne","target":"api::page.page","inversedBy":"children"},"seo":{"type":"component","repeatable":false,"component":"seo-utilities.seo","pluginOptions":{"i18n":{"localized":true}}}},"kind":"collectionType"},"modelName":"page","actions":{},"lifecycles":{}},"api::platform.platform":{"kind":"collectionType","collectionName":"platforms","info":{"singularName":"platform","pluralName":"platforms","displayName":"Platform","description":""},"options":{"draftAndPublish":true},"attributes":{"Name":{"type":"string","required":true},"Slug":{"type":"uid","targetField":"Name"},"URL":{"type":"string"},"is_Active":{"type":"boolean","default":true},"Logo":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"Listings":{"type":"relation","relation":"oneToMany","target":"api::listing.listing"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::platform.platform","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"platforms"}}},"apiName":"platform","globalId":"Platform","uid":"api::platform.platform","modelType":"contentType","__schema__":{"collectionName":"platforms","info":{"singularName":"platform","pluralName":"platforms","displayName":"Platform","description":""},"options":{"draftAndPublish":true},"attributes":{"Name":{"type":"string","required":true},"Slug":{"type":"uid","targetField":"Name"},"URL":{"type":"string"},"is_Active":{"type":"boolean","default":true},"Logo":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"Listings":{"type":"relation","relation":"oneToMany","target":"api::listing.listing"}},"kind":"collectionType"},"modelName":"platform","actions":{},"lifecycles":{}},"api::report.report":{"kind":"collectionType","collectionName":"reports","info":{"singularName":"report","pluralName":"reports","displayName":"Report","description":""},"options":{"draftAndPublish":true},"attributes":{"Type":{"type":"enumeration","enum":["Scam","Offensive","Fake Review","Spam","Copyright","Other"],"required":true},"TargetType":{"type":"enumeration","enum":["Identity","Review","Item","Listing"],"required":true},"ReportStatus":{"type":"enumeration","enum":["Pending","Investigating","Resolved","Dismissed"]},"Reason":{"type":"string"},"Description":{"type":"blocks"},"Note":{"type":"string"},"Review":{"type":"relation","relation":"manyToOne","target":"api::review.review","inversedBy":"Reports"},"TargetItem":{"type":"relation","relation":"manyToOne","target":"api::item.item","inversedBy":"Reports"},"TargetListing":{"type":"relation","relation":"manyToOne","target":"api::listing.listing","inversedBy":"Reports"},"TargetIdentity":{"type":"relation","relation":"manyToOne","target":"api::identity.identity","inversedBy":"ReportReceived"},"Reporter":{"type":"relation","relation":"manyToOne","target":"api::identity.identity","inversedBy":"ReportMade"},"ProofLinks":{"type":"json"},"Photo":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::report.report","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"reports"}}},"apiName":"report","globalId":"Report","uid":"api::report.report","modelType":"contentType","__schema__":{"collectionName":"reports","info":{"singularName":"report","pluralName":"reports","displayName":"Report","description":""},"options":{"draftAndPublish":true},"attributes":{"Type":{"type":"enumeration","enum":["Scam","Offensive","Fake Review","Spam","Copyright","Other"],"required":true},"TargetType":{"type":"enumeration","enum":["Identity","Review","Item","Listing"],"required":true},"ReportStatus":{"type":"enumeration","enum":["Pending","Investigating","Resolved","Dismissed"]},"Reason":{"type":"string"},"Description":{"type":"blocks"},"Note":{"type":"string"},"Review":{"type":"relation","relation":"manyToOne","target":"api::review.review","inversedBy":"Reports"},"TargetItem":{"type":"relation","relation":"manyToOne","target":"api::item.item","inversedBy":"Reports"},"TargetListing":{"type":"relation","relation":"manyToOne","target":"api::listing.listing","inversedBy":"Reports"},"TargetIdentity":{"type":"relation","relation":"manyToOne","target":"api::identity.identity","inversedBy":"ReportReceived"},"Reporter":{"type":"relation","relation":"manyToOne","target":"api::identity.identity","inversedBy":"ReportMade"},"ProofLinks":{"type":"json"},"Photo":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":true}},"kind":"collectionType"},"modelName":"report","actions":{},"lifecycles":{}},"api::review.review":{"kind":"collectionType","collectionName":"reviews","info":{"singularName":"review","pluralName":"reviews","displayName":"Review","description":""},"options":{"draftAndPublish":true},"attributes":{"Title":{"type":"string","required":true},"Content":{"type":"text"},"ReviewDate":{"type":"datetime"},"isFeatured":{"type":"boolean"},"ReviewStatus":{"type":"enumeration","enum":["Draft","Pending","Published","Rejected","Archived"]},"UpVote":{"type":"integer"},"DownVote":{"type":"integer"},"ReportedCount":{"type":"integer"},"RejectReason":{"type":"string"},"ReviewType":{"type":"enumeration","enum":["Expert","User"]},"ReviewVote":{"type":"relation","relation":"oneToOne","target":"api::review-vote.review-vote","mappedBy":"Review"},"Reports":{"type":"relation","relation":"oneToMany","target":"api::report.report","mappedBy":"Review"},"FieldGroup":{"type":"dynamiczone","components":["contact.basic"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::review.review","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"reviews"}}},"apiName":"review","globalId":"Review","uid":"api::review.review","modelType":"contentType","__schema__":{"collectionName":"reviews","info":{"singularName":"review","pluralName":"reviews","displayName":"Review","description":""},"options":{"draftAndPublish":true},"attributes":{"Title":{"type":"string","required":true},"Content":{"type":"text"},"ReviewDate":{"type":"datetime"},"isFeatured":{"type":"boolean"},"ReviewStatus":{"type":"enumeration","enum":["Draft","Pending","Published","Rejected","Archived"]},"UpVote":{"type":"integer"},"DownVote":{"type":"integer"},"ReportedCount":{"type":"integer"},"RejectReason":{"type":"string"},"ReviewType":{"type":"enumeration","enum":["Expert","User"]},"ReviewVote":{"type":"relation","relation":"oneToOne","target":"api::review-vote.review-vote","mappedBy":"Review"},"Reports":{"type":"relation","relation":"oneToMany","target":"api::report.report","mappedBy":"Review"},"FieldGroup":{"type":"dynamiczone","components":["contact.basic"]}},"kind":"collectionType"},"modelName":"review","actions":{},"lifecycles":{}},"api::review-vote.review-vote":{"kind":"collectionType","collectionName":"review_votes","info":{"singularName":"review-vote","pluralName":"review-votes","displayName":"Review Vote"},"options":{"draftAndPublish":true},"attributes":{"isHelpful":{"type":"boolean"},"Identity":{"type":"relation","relation":"oneToOne","target":"api::identity.identity","inversedBy":"ReviewVote"},"Review":{"type":"relation","relation":"oneToOne","target":"api::review.review","inversedBy":"ReviewVote"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::review-vote.review-vote","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"review_votes"}}},"apiName":"review-vote","globalId":"ReviewVote","uid":"api::review-vote.review-vote","modelType":"contentType","__schema__":{"collectionName":"review_votes","info":{"singularName":"review-vote","pluralName":"review-votes","displayName":"Review Vote"},"options":{"draftAndPublish":true},"attributes":{"isHelpful":{"type":"boolean"},"Identity":{"type":"relation","relation":"oneToOne","target":"api::identity.identity","inversedBy":"ReviewVote"},"Review":{"type":"relation","relation":"oneToOne","target":"api::review.review","inversedBy":"ReviewVote"}},"kind":"collectionType"},"modelName":"review-vote","actions":{},"lifecycles":{}},"api::subscriber.subscriber":{"kind":"collectionType","collectionName":"subscribers","info":{"singularName":"subscriber","pluralName":"subscribers","displayName":"Subscriber"},"options":{"draftAndPublish":false},"attributes":{"name":{"type":"string"},"email":{"type":"email"},"message":{"type":"text"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::subscriber.subscriber","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"subscribers"}}},"apiName":"subscriber","globalId":"Subscriber","uid":"api::subscriber.subscriber","modelType":"contentType","__schema__":{"collectionName":"subscribers","info":{"singularName":"subscriber","pluralName":"subscribers","displayName":"Subscriber"},"options":{"draftAndPublish":false},"attributes":{"name":{"type":"string"},"email":{"type":"email"},"message":{"type":"text"}},"kind":"collectionType"},"modelName":"subscriber","actions":{},"lifecycles":{}},"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_permissions"}}},"plugin":"admin","globalId":"AdminPermission","uid":"admin::permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelName":"permission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"plugin":"admin","globalId":"AdminUser","uid":"admin::user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelName":"user","options":{"draftAndPublish":false}},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_roles"}}},"plugin":"admin","globalId":"AdminRole","uid":"admin::role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelName":"role"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_tokens"}}},"plugin":"admin","globalId":"AdminApiToken","uid":"admin::api-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"api-token"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_token_permissions"}}},"plugin":"admin","globalId":"AdminApiTokenPermission","uid":"admin::api-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelName":"api-token-permission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_tokens"}}},"plugin":"admin","globalId":"AdminTransferToken","uid":"admin::transfer-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"transfer-token"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_token_permissions"}}},"plugin":"admin","globalId":"AdminTransferTokenPermission","uid":"admin::transfer-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelName":"transfer-token-permission"}}	object	\N	\N
314	plugin_seo_settings	{"api::category.category":{"collectionName":"category","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::directory.directory":{"collectionName":"directory","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::footer.footer":{"collectionName":"footer","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::identity.identity":{"collectionName":"identity","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::item.item":{"collectionName":"item","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::listing.listing":{"collectionName":"listing","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::listing-type.listing-type":{"collectionName":"listing-type","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::navbar.navbar":{"collectionName":"navbar","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::page.page":{"collectionName":"page","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::platform.platform":{"collectionName":"platform","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::report.report":{"collectionName":"report","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::review.review":{"collectionName":"review","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::review-vote.review-vote":{"collectionName":"review-vote","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}},"api::subscriber.subscriber":{"collectionName":"subscriber","seoChecks":{"metaTitle":true,"metaDescription":true,"metaRobots":true,"metaSocial":true,"wordCount":true,"canonicalUrl":true,"keywordDensity":true,"structuredData":true,"alternativeText":true,"lastUpdatedAt":true}}}	object	\N	\N
277	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
251	plugin_content_manager_configuration_components::sections.heading-with-cta-button	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"subText":{"edit":{"label":"subText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subText","searchable":true,"sortable":true}},"cta":{"edit":{"label":"cta","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cta","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","subText","cta"],"edit":[[{"name":"title","size":6},{"name":"subText","size":6}],[{"name":"cta","size":12}]]},"uid":"sections.heading-with-cta-button","isComponent":true}	object	\N	\N
259	plugin_content_manager_configuration_components::media.photo	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"Profile":{"edit":{"label":"Profile","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Profile","searchable":false,"sortable":false}},"Gallery":{"edit":{"label":"Gallery","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Gallery","searchable":false,"sortable":false}}},"layouts":{"list":["id","Profile","Gallery"],"edit":[[{"name":"Profile","size":6},{"name":"Gallery","size":6}]]},"uid":"media.photo","isComponent":true}	object	\N	\N
261	plugin_content_manager_configuration_components::elements.footer-item	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"links":{"edit":{"label":"links","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"links","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","links"],"edit":[[{"name":"title","size":6}],[{"name":"links","size":12}]]},"uid":"elements.footer-item","isComponent":true}	object	\N	\N
264	plugin_content_manager_configuration_components::contact.basic	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Email","defaultSortBy":"Email","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"Email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"Phone":{"edit":{"label":"Phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Phone","searchable":true,"sortable":true}},"Website":{"edit":{"label":"Website","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Website","searchable":true,"sortable":true}}},"layouts":{"list":["id","Email","Phone","Website"],"edit":[[{"name":"Email","size":6},{"name":"Phone","size":6}],[{"name":"Website","size":6}]]},"uid":"contact.basic","isComponent":true}	object	\N	\N
291	plugin_content_manager_configuration_content_types::api::listing-type.listing-type	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Name","defaultSortBy":"Name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"Slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"Description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":false,"sortable":false}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"Categories":{"edit":{"label":"Categories","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"Categories","searchable":false,"sortable":false}},"Criteria":{"edit":{"label":"Criteria","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Criteria","searchable":false,"sortable":false}},"allowComment":{"edit":{"label":"allowComment","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"allowComment","searchable":true,"sortable":true}},"allowRating":{"edit":{"label":"allowRating","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"allowRating","searchable":true,"sortable":true}},"ItemGroup":{"edit":{"label":"ItemGroup","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ItemGroup","searchable":false,"sortable":false}},"ReviewGroup":{"edit":{"label":"ReviewGroup","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ReviewGroup","searchable":false,"sortable":false}},"IconSet":{"edit":{"label":"IconSet","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"IconSet","searchable":true,"sortable":true}},"TestField":{"edit":{"label":"TestField","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"TestField","searchable":false,"sortable":false}},"ComponentFilter":{"edit":{"label":"ComponentFilter","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ComponentFilter","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Name","Slug","isActive"],"edit":[[{"name":"Name","size":6},{"name":"Slug","size":6}],[{"name":"Description","size":12}],[{"name":"isActive","size":4},{"name":"Categories","size":6}],[{"name":"Criteria","size":12}],[{"name":"allowComment","size":4},{"name":"allowRating","size":4}],[{"name":"ItemGroup","size":12}],[{"name":"ReviewGroup","size":12}],[{"name":"IconSet","size":6}],[{"name":"ComponentFilter","size":12}],[{"name":"TestField","size":6}]]},"uid":"api::listing-type.listing-type"}	object	\N	\N
276	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
287	plugin_content_manager_configuration_content_types::api::footer.footer	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"copyRight","defaultSortBy":"copyRight","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"sections":{"edit":{"label":"sections","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"sections","searchable":false,"sortable":false}},"links":{"edit":{"label":"links","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"links","searchable":false,"sortable":false}},"copyRight":{"edit":{"label":"copyRight","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"copyRight","searchable":true,"sortable":true}},"logoImage":{"edit":{"label":"logoImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"logoImage","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","sections","links","copyRight"],"edit":[[{"name":"sections","size":12}],[{"name":"links","size":12}],[{"name":"copyRight","size":6}],[{"name":"logoImage","size":12}]]},"uid":"api::footer.footer"}	object	\N	\N
301	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
269	plugin_content_manager_configuration_components::utilities.text	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"text","defaultSortBy":"text","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"text":{"edit":{"label":"text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"text","searchable":true,"sortable":true}}},"layouts":{"list":["id","text"],"edit":[[{"name":"text","size":6}]]},"uid":"utilities.text","isComponent":true}	object	\N	\N
275	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}	object	\N	\N
285	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"workflow":{"edit":{"label":"workflow","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"workflow","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","color","workflow"],"edit":[[{"name":"name","size":6},{"name":"color","size":6}],[{"name":"workflow","size":6},{"name":"permissions","size":6}]]},"uid":"plugin::review-workflows.workflow-stage"}	object	\N	\N
302	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"encryptedKey":{"edit":{"label":"encryptedKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"encryptedKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"encryptedKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
272	plugin_content_manager_configuration_components::forms.contact-form	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"gdpr":{"edit":{"label":"gdpr","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"gdpr","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","description","gdpr"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"gdpr","size":12}]]},"uid":"forms.contact-form","isComponent":true}	object	\N	\N
278	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
286	plugin_content_manager_configuration_content_types::api::directory.directory	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Name","defaultSortBy":"Name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"Slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"Description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":false,"sortable":false}},"Image":{"edit":{"label":"Image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Image","searchable":false,"sortable":false}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"Categories":{"edit":{"label":"Categories","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"Categories","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Name","Slug","Image"],"edit":[[{"name":"Name","size":6},{"name":"Slug","size":6}],[{"name":"Description","size":12}],[{"name":"Image","size":6},{"name":"isActive","size":4}],[{"name":"Categories","size":6}]]},"uid":"api::directory.directory"}	object	\N	\N
292	plugin_content_manager_configuration_content_types::api::navbar.navbar	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"links":{"edit":{"label":"links","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"links","searchable":false,"sortable":false}},"logoImage":{"edit":{"label":"logoImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"logoImage","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","links","logoImage","createdAt"],"edit":[[{"name":"links","size":12}],[{"name":"logoImage","size":12}]]},"uid":"api::navbar.navbar"}	object	\N	\N
303	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
253	plugin_content_manager_configuration_components::sections.carousel	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"images":{"edit":{"label":"images","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"images","searchable":false,"sortable":false}},"radius":{"edit":{"label":"radius","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"radius","searchable":true,"sortable":true}}},"layouts":{"list":["id","images","radius"],"edit":[[{"name":"images","size":12}],[{"name":"radius","size":6}]]},"uid":"sections.carousel","isComponent":true}	object	\N	\N
263	plugin_content_manager_configuration_components::contact.location	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Address","defaultSortBy":"Address","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"Address":{"edit":{"label":"Address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Address","searchable":true,"sortable":true}}},"layouts":{"list":["id","Address"],"edit":[[{"name":"Address","size":6}]]},"uid":"contact.location","isComponent":true}	object	\N	\N
280	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
290	plugin_content_manager_configuration_content_types::api::listing.listing	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Title","defaultSortBy":"Title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"Slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"URL":{"edit":{"label":"URL","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"URL","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"Description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":false,"sortable":false}},"Item":{"edit":{"label":"Item","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Title"},"list":{"label":"Item","searchable":true,"sortable":true}},"Category":{"edit":{"label":"Category","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"Category","searchable":true,"sortable":true}},"Reports":{"edit":{"label":"Reports","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Reason"},"list":{"label":"Reports","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Title","Slug","URL"],"edit":[[{"name":"Title","size":6},{"name":"Slug","size":6}],[{"name":"URL","size":6},{"name":"isActive","size":4}],[{"name":"Description","size":12}],[{"name":"Item","size":6},{"name":"Category","size":6}],[{"name":"Reports","size":6}]]},"uid":"api::listing.listing"}	object	\N	\N
299	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}	object	\N	\N
270	plugin_content_manager_configuration_components::seo-utilities.social-icons	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"socials":{"edit":{"label":"socials","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"socials","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","socials"],"edit":[[{"name":"title","size":6}],[{"name":"socials","size":12}]]},"uid":"seo-utilities.social-icons","isComponent":true}	object	\N	\N
254	plugin_content_manager_configuration_components::sections.animated-logo-row	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"text","defaultSortBy":"text","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"text":{"edit":{"label":"text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"text","searchable":true,"sortable":true}},"logos":{"edit":{"label":"logos","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"logos","searchable":false,"sortable":false}}},"layouts":{"list":["id","text","logos"],"edit":[[{"name":"text","size":6}],[{"name":"logos","size":12}]]},"uid":"sections.animated-logo-row","isComponent":true}	object	\N	\N
279	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
282	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"entryDocumentId":{"edit":{"label":"entryDocumentId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"entryDocumentId","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","entryDocumentId"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"entryDocumentId","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
283	plugin_content_manager_configuration_content_types::api::category.category	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Name","defaultSortBy":"Name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"Slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"Description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":false,"sortable":false}},"Image":{"edit":{"label":"Image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Image","searchable":false,"sortable":false}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"Listings":{"edit":{"label":"Listings","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Title"},"list":{"label":"Listings","searchable":false,"sortable":false}},"ListingType":{"edit":{"label":"ListingType","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"ListingType","searchable":true,"sortable":true}},"ParentCategory":{"edit":{"label":"ParentCategory","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"ParentCategory","searchable":true,"sortable":true}},"ChildCategories":{"edit":{"label":"ChildCategories","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"ChildCategories","searchable":false,"sortable":false}},"Directory":{"edit":{"label":"Directory","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"Directory","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Name","Slug","Image"],"edit":[[{"name":"Name","size":6},{"name":"Slug","size":6}],[{"name":"Description","size":12}],[{"name":"Image","size":6},{"name":"isActive","size":4}],[{"name":"Listings","size":6},{"name":"ListingType","size":6}],[{"name":"ParentCategory","size":6},{"name":"ChildCategories","size":6}],[{"name":"Directory","size":6}]]},"uid":"api::category.category"}	object	\N	\N
256	plugin_content_manager_configuration_components::review.pro-item	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Item","defaultSortBy":"Item","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"Item":{"edit":{"label":"Item","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Item","searchable":true,"sortable":true}}},"layouts":{"list":["id","Item"],"edit":[[{"name":"Item","size":6}]]},"uid":"review.pro-item","isComponent":true}	object	\N	\N
257	plugin_content_manager_configuration_components::media.video	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"YouTube","defaultSortBy":"YouTube","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"YouTube":{"edit":{"label":"YouTube","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"YouTube","searchable":true,"sortable":true}}},"layouts":{"list":["id","YouTube"],"edit":[[{"name":"YouTube","size":6}]]},"uid":"media.video","isComponent":true}	object	\N	\N
284	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"stages":{"edit":{"label":"stages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stages","searchable":false,"sortable":false}},"stageRequiredToPublish":{"edit":{"label":"stageRequiredToPublish","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stageRequiredToPublish","searchable":true,"sortable":true}},"contentTypes":{"edit":{"label":"contentTypes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentTypes","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","stages","stageRequiredToPublish"],"edit":[[{"name":"name","size":6},{"name":"stages","size":6}],[{"name":"stageRequiredToPublish","size":6}],[{"name":"contentTypes","size":12}]]},"uid":"plugin::review-workflows.workflow"}	object	\N	\N
296	plugin_content_manager_configuration_content_types::api::review.review	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Title","defaultSortBy":"Title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"Content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":true,"sortable":true}},"ReviewDate":{"edit":{"label":"ReviewDate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ReviewDate","searchable":true,"sortable":true}},"isFeatured":{"edit":{"label":"isFeatured","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isFeatured","searchable":true,"sortable":true}},"ReviewStatus":{"edit":{"label":"ReviewStatus","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ReviewStatus","searchable":true,"sortable":true}},"UpVote":{"edit":{"label":"UpVote","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"UpVote","searchable":true,"sortable":true}},"DownVote":{"edit":{"label":"DownVote","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"DownVote","searchable":true,"sortable":true}},"ReportedCount":{"edit":{"label":"ReportedCount","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ReportedCount","searchable":true,"sortable":true}},"RejectReason":{"edit":{"label":"RejectReason","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"RejectReason","searchable":true,"sortable":true}},"ReviewType":{"edit":{"label":"ReviewType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ReviewType","searchable":true,"sortable":true}},"ReviewVote":{"edit":{"label":"ReviewVote","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"ReviewVote","searchable":true,"sortable":true}},"Reports":{"edit":{"label":"Reports","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Reason"},"list":{"label":"Reports","searchable":false,"sortable":false}},"FieldGroup":{"edit":{"label":"FieldGroup","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"FieldGroup","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Title","Content","ReviewDate"],"edit":[[{"name":"Title","size":6},{"name":"Content","size":6}],[{"name":"ReviewDate","size":6},{"name":"isFeatured","size":4}],[{"name":"ReviewStatus","size":6},{"name":"UpVote","size":4}],[{"name":"DownVote","size":4},{"name":"ReportedCount","size":4}],[{"name":"RejectReason","size":6},{"name":"ReviewType","size":6}],[{"name":"ReviewVote","size":6},{"name":"Reports","size":6}],[{"name":"FieldGroup","size":12}]]},"uid":"api::review.review"}	object	\N	\N
267	plugin_content_manager_configuration_components::violation.detail	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Method","defaultSortBy":"Method","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"Type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"Severity":{"edit":{"label":"Severity","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Severity","searchable":true,"sortable":true}},"Method":{"edit":{"label":"Method","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Method","searchable":true,"sortable":true}},"Impact":{"edit":{"label":"Impact","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Impact","searchable":true,"sortable":true}},"Amount":{"edit":{"label":"Amount","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Amount","searchable":true,"sortable":true}},"Platform":{"edit":{"label":"Platform","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Platform","searchable":true,"sortable":true}}},"layouts":{"list":["id","Type","Severity","Method"],"edit":[[{"name":"Type","size":6},{"name":"Severity","size":6}],[{"name":"Method","size":6},{"name":"Impact","size":6}],[{"name":"Amount","size":4},{"name":"Platform","size":6}]]},"uid":"violation.detail","isComponent":true}	object	\N	\N
255	plugin_content_manager_configuration_components::review.pros-cons	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"Pros":{"edit":{"label":"Pros","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Pros","searchable":false,"sortable":false}},"Cons":{"edit":{"label":"Cons","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Cons","searchable":false,"sortable":false}}},"layouts":{"list":["id","Pros","Cons"],"edit":[[{"name":"Pros","size":12}],[{"name":"Cons","size":12}]]},"uid":"review.pros-cons","isComponent":true}	object	\N	\N
323	plugin_content_manager_configuration_components::shared.seo	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"metaTitle","defaultSortBy":"metaTitle","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"metaTitle":{"edit":{"label":"metaTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaTitle","searchable":true,"sortable":true}},"metaDescription":{"edit":{"label":"metaDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaDescription","searchable":true,"sortable":true}},"metaImage":{"edit":{"label":"metaImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaImage","searchable":false,"sortable":false}},"metaSocial":{"edit":{"label":"metaSocial","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaSocial","searchable":false,"sortable":false}},"keywords":{"edit":{"label":"keywords","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"keywords","searchable":true,"sortable":true}},"metaRobots":{"edit":{"label":"metaRobots","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaRobots","searchable":true,"sortable":true}},"structuredData":{"edit":{"label":"structuredData","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"structuredData","searchable":false,"sortable":false}},"metaViewport":{"edit":{"label":"metaViewport","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaViewport","searchable":true,"sortable":true}},"canonicalURL":{"edit":{"label":"canonicalURL","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"canonicalURL","searchable":true,"sortable":true}}},"layouts":{"list":["id","metaTitle","metaDescription","metaImage"],"edit":[[{"name":"metaTitle","size":6},{"name":"metaDescription","size":6}],[{"name":"metaImage","size":6}],[{"name":"metaSocial","size":12}],[{"name":"keywords","size":6},{"name":"metaRobots","size":6}],[{"name":"structuredData","size":12}],[{"name":"metaViewport","size":6},{"name":"canonicalURL","size":6}]]},"uid":"shared.seo","isComponent":true}	object	\N	\N
324	plugin_content_manager_configuration_components::info.bank-info	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Name","defaultSortBy":"Name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"Name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"SWIFT_BIC":{"edit":{"label":"SWIFT_BIC","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"SWIFT_BIC","searchable":true,"sortable":true}}},"layouts":{"list":["id","Name","SWIFT_BIC"],"edit":[[{"name":"Name","size":6},{"name":"SWIFT_BIC","size":6}]]},"uid":"info.bank-info","isComponent":true}	object	\N	\N
281	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
289	plugin_content_manager_configuration_content_types::api::identity.identity	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Name","defaultSortBy":"Name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"Type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"Slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"Avatar":{"edit":{"label":"Avatar","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Avatar","searchable":false,"sortable":false}},"Bio":{"edit":{"label":"Bio","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Bio","searchable":false,"sortable":false}},"ReviewVote":{"edit":{"label":"ReviewVote","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"ReviewVote","searchable":true,"sortable":true}},"ReportMade":{"edit":{"label":"ReportMade","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Reason"},"list":{"label":"ReportMade","searchable":false,"sortable":false}},"ReportReceived":{"edit":{"label":"ReportReceived","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Reason"},"list":{"label":"ReportReceived","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Name","Type","Slug"],"edit":[[{"name":"Name","size":6},{"name":"Type","size":6}],[{"name":"Slug","size":6},{"name":"Avatar","size":6}],[{"name":"Bio","size":12}],[{"name":"ReviewVote","size":6},{"name":"ReportMade","size":6}],[{"name":"ReportReceived","size":6}]]},"uid":"api::identity.identity"}	object	\N	\N
293	plugin_content_manager_configuration_content_types::api::page.page	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"breadcrumbTitle":{"edit":{"label":"breadcrumbTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"breadcrumbTitle","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"fullPath":{"edit":{"label":"fullPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"fullPath","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"children","searchable":false,"sortable":false}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"parent","searchable":true,"sortable":true}},"seo":{"edit":{"label":"seo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"seo","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","breadcrumbTitle","slug"],"edit":[[{"name":"title","size":6},{"name":"breadcrumbTitle","size":6}],[{"name":"slug","size":6},{"name":"fullPath","size":6}],[{"name":"content","size":12}],[{"name":"children","size":6},{"name":"parent","size":6}],[{"name":"seo","size":12}]]},"uid":"api::page.page"}	object	\N	\N
294	plugin_content_manager_configuration_content_types::api::platform.platform	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Name","defaultSortBy":"Name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"Slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"URL":{"edit":{"label":"URL","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"URL","searchable":true,"sortable":true}},"is_Active":{"edit":{"label":"is_Active","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"is_Active","searchable":true,"sortable":true}},"Logo":{"edit":{"label":"Logo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Logo","searchable":false,"sortable":false}},"Listings":{"edit":{"label":"Listings","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Title"},"list":{"label":"Listings","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Name","Slug","URL"],"edit":[[{"name":"Name","size":6},{"name":"Slug","size":6}],[{"name":"URL","size":6},{"name":"is_Active","size":4}],[{"name":"Logo","size":6},{"name":"Listings","size":6}]]},"uid":"api::platform.platform"}	object	\N	\N
258	plugin_content_manager_configuration_components::rating.criterion	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Name","defaultSortBy":"Name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"Name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"Weight":{"edit":{"label":"Weight","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Weight","searchable":true,"sortable":true}},"Tooltip":{"edit":{"label":"Tooltip","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Tooltip","searchable":true,"sortable":true}},"isRequired":{"edit":{"label":"isRequired","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isRequired","searchable":true,"sortable":true}},"Order":{"edit":{"label":"Order","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Order","searchable":true,"sortable":true}},"Icon":{"edit":{"label":"Icon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Icon","searchable":true,"sortable":true}}},"layouts":{"list":["id","Name","Weight","Tooltip"],"edit":[[{"name":"Name","size":6},{"name":"Weight","size":4}],[{"name":"Tooltip","size":6},{"name":"isRequired","size":4}],[{"name":"Order","size":4},{"name":"Icon","size":6}]]},"uid":"rating.criterion","isComponent":true}	object	\N	\N
288	plugin_content_manager_configuration_content_types::api::item.item	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Title","defaultSortBy":"Title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"Slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"Description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":false,"sortable":false}},"Image":{"edit":{"label":"Image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Image","searchable":false,"sortable":false}},"Gallery":{"edit":{"label":"Gallery","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Gallery","searchable":false,"sortable":false}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"isFeatured":{"edit":{"label":"isFeatured","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isFeatured","searchable":true,"sortable":true}},"ItemType":{"edit":{"label":"ItemType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ItemType","searchable":true,"sortable":true}},"FieldGroup":{"edit":{"label":"FieldGroup","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"FieldGroup","searchable":false,"sortable":false}},"ListingType":{"edit":{"label":"ListingType","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"ListingType","searchable":true,"sortable":true}},"RelatedIdentity":{"edit":{"label":"RelatedIdentity","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"RelatedIdentity","searchable":true,"sortable":true}},"listings":{"edit":{"label":"listings","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Title"},"list":{"label":"listings","searchable":false,"sortable":false}},"Reports":{"edit":{"label":"Reports","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Reason"},"list":{"label":"Reports","searchable":false,"sortable":false}},"SearchSummary":{"edit":{"label":"SearchSummary","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"SearchSummary","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Title","Slug","Image"],"edit":[[{"name":"Title","size":6},{"name":"Slug","size":6}],[{"name":"Description","size":12}],[{"name":"Image","size":6},{"name":"Gallery","size":6}],[{"name":"ItemType","size":6}],[{"name":"ListingType","size":6},{"name":"RelatedIdentity","size":6}],[{"name":"listings","size":6},{"name":"Reports","size":6}],[{"name":"SearchSummary","size":6},{"name":"isActive","size":4}],[{"name":"isFeatured","size":4}],[{"name":"FieldGroup","size":12}]]},"uid":"api::item.item"}	object	\N	\N
295	plugin_content_manager_configuration_content_types::api::report.report	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Reason","defaultSortBy":"Reason","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"Type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"TargetType":{"edit":{"label":"TargetType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"TargetType","searchable":true,"sortable":true}},"ReportStatus":{"edit":{"label":"ReportStatus","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ReportStatus","searchable":true,"sortable":true}},"Reason":{"edit":{"label":"Reason","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Reason","searchable":true,"sortable":true}},"Description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":false,"sortable":false}},"Note":{"edit":{"label":"Note","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Note","searchable":true,"sortable":true}},"Review":{"edit":{"label":"Review","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Title"},"list":{"label":"Review","searchable":true,"sortable":true}},"TargetItem":{"edit":{"label":"TargetItem","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Title"},"list":{"label":"TargetItem","searchable":true,"sortable":true}},"TargetListing":{"edit":{"label":"TargetListing","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Title"},"list":{"label":"TargetListing","searchable":true,"sortable":true}},"TargetIdentity":{"edit":{"label":"TargetIdentity","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"TargetIdentity","searchable":true,"sortable":true}},"Reporter":{"edit":{"label":"Reporter","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"Reporter","searchable":true,"sortable":true}},"ProofLinks":{"edit":{"label":"ProofLinks","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ProofLinks","searchable":false,"sortable":false}},"Photo":{"edit":{"label":"Photo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Photo","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","Type","TargetType","ReportStatus"],"edit":[[{"name":"Type","size":6},{"name":"TargetType","size":6}],[{"name":"ReportStatus","size":6},{"name":"Reason","size":6}],[{"name":"Description","size":12}],[{"name":"Note","size":6},{"name":"Review","size":6}],[{"name":"TargetItem","size":6},{"name":"TargetListing","size":6}],[{"name":"TargetIdentity","size":6},{"name":"Reporter","size":6}],[{"name":"ProofLinks","size":12}],[{"name":"Photo","size":6}]]},"uid":"api::report.report"}	object	\N	\N
305	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
325	plugin_content_manager_configuration_components::shared.meta-social	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"socialNetwork":{"edit":{"label":"socialNetwork","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"socialNetwork","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}}},"layouts":{"list":["id","socialNetwork","title","description"],"edit":[[{"name":"socialNetwork","size":6},{"name":"title","size":6}],[{"name":"description","size":6},{"name":"image","size":6}]]},"uid":"shared.meta-social","isComponent":true}	object	\N	\N
297	plugin_content_manager_configuration_content_types::api::review-vote.review-vote	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"isHelpful":{"edit":{"label":"isHelpful","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isHelpful","searchable":true,"sortable":true}},"Identity":{"edit":{"label":"Identity","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Name"},"list":{"label":"Identity","searchable":true,"sortable":true}},"Review":{"edit":{"label":"Review","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Title"},"list":{"label":"Review","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","isHelpful","Identity","Review"],"edit":[[{"name":"isHelpful","size":4},{"name":"Identity","size":6}],[{"name":"Review","size":6}]]},"uid":"api::review-vote.review-vote"}	object	\N	\N
298	plugin_content_manager_configuration_content_types::api::subscriber.subscriber	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"message":{"edit":{"label":"message","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"message","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","email","message"],"edit":[[{"name":"name","size":6},{"name":"email","size":6}],[{"name":"message","size":6}]]},"uid":"api::subscriber.subscriber"}	object	\N	\N
306	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
307	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
309	plugin_users-permissions_grant	{"email":{"icon":"envelope","enabled":true},"discord":{"icon":"discord","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"icon":"facebook-square","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/facebook/callback","scope":["email"]},"google":{"icon":"google","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/google/callback","scope":["email"]},"github":{"icon":"github","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"icon":"windows","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"icon":"twitter","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitter/callback"},"instagram":{"icon":"instagram","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"icon":"vk","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/vk/callback","scope":["email"]},"twitch":{"icon":"twitch","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"icon":"linkedin","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"icon":"aws","enabled":false,"key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"icon":"reddit","enabled":false,"key":"","secret":"","callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"icon":"book","enabled":false,"key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"icon":"","enabled":false,"key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"]}}	object	\N	\N
310	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
311	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
308	plugin_upload_metrics	{"weeklySchedule":"33 18 23 * * 0","lastWeeklyUpdate":1748794713025}	object	\N	\N
312	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
300	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
304	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
313	plugin_i18n_default_locale	"en"	string	\N	\N
242	plugin_content_manager_configuration_components::violation.evidence	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Note","defaultSortBy":"Note","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"Photo":{"edit":{"label":"Photo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Photo","searchable":false,"sortable":false}},"VerificationDate":{"edit":{"label":"VerificationDate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"VerificationDate","searchable":true,"sortable":true}},"Note":{"edit":{"label":"Note","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Note","searchable":true,"sortable":true}},"VerificationStatus":{"edit":{"label":"VerificationStatus","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"VerificationStatus","searchable":true,"sortable":true}},"Report":{"edit":{"label":"Report","description":"","placeholder":"","visible":true,"editable":true,"mainField":"Reason"},"list":{"label":"Report","searchable":true,"sortable":true}}},"layouts":{"list":["id","Photo","VerificationDate","Note"],"edit":[[{"name":"Photo","size":6},{"name":"VerificationDate","size":6}],[{"name":"Note","size":6},{"name":"VerificationStatus","size":6}],[{"name":"Report","size":6}]]},"uid":"violation.evidence","isComponent":true}	object	\N	\N
247	plugin_content_manager_configuration_components::utilities.accordions	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"question","defaultSortBy":"question","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"question":{"edit":{"label":"question","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"question","searchable":true,"sortable":true}},"answer":{"edit":{"label":"answer","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"answer","searchable":true,"sortable":true}}},"layouts":{"list":["id","question","answer"],"edit":[[{"name":"question","size":6},{"name":"answer","size":6}]]},"uid":"utilities.accordions","isComponent":true}	object	\N	\N
271	plugin_content_manager_configuration_components::utilities.link	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"label","defaultSortBy":"label","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"label":{"edit":{"label":"label","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"label","searchable":true,"sortable":true}},"href":{"edit":{"label":"href","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"href","searchable":true,"sortable":true}},"newTab":{"edit":{"label":"newTab","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"newTab","searchable":true,"sortable":true}}},"layouts":{"list":["id","label","href","newTab"],"edit":[[{"name":"label","size":6},{"name":"href","size":6}],[{"name":"newTab","size":4}]]},"uid":"utilities.link","isComponent":true}	object	\N	\N
244	plugin_content_manager_configuration_components::utilities.image-with-link	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":false,"sortable":false}}},"layouts":{"list":["id","image","link"],"edit":[[{"name":"image","size":12}],[{"name":"link","size":12}]]},"uid":"utilities.image-with-link","isComponent":true}	object	\N	\N
266	plugin_content_manager_configuration_components::utilities.links-with-title	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"links":{"edit":{"label":"links","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"links","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","links"],"edit":[[{"name":"title","size":6}],[{"name":"links","size":12}]]},"uid":"utilities.links-with-title","isComponent":true}	object	\N	\N
268	plugin_content_manager_configuration_components::seo-utilities.seo	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"metaTitle","defaultSortBy":"metaTitle","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"metaTitle":{"edit":{"label":"metaTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaTitle","searchable":true,"sortable":true}},"metaDescription":{"edit":{"label":"metaDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaDescription","searchable":true,"sortable":true}},"metaImage":{"edit":{"label":"metaImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaImage","searchable":false,"sortable":false}},"keywords":{"edit":{"label":"keywords","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"keywords","searchable":true,"sortable":true}},"twitter":{"edit":{"label":"twitter","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"twitter","searchable":false,"sortable":false}},"og":{"edit":{"label":"og","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"og","searchable":false,"sortable":false}},"applicationName":{"edit":{"label":"applicationName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"applicationName","searchable":true,"sortable":true}},"siteName":{"edit":{"label":"siteName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"siteName","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"canonicalUrl":{"edit":{"label":"canonicalUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"canonicalUrl","searchable":true,"sortable":true}},"metaRobots":{"edit":{"label":"metaRobots","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaRobots","searchable":true,"sortable":true}},"structuredData":{"edit":{"label":"structuredData","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"structuredData","searchable":false,"sortable":false}}},"layouts":{"list":["id","metaTitle","metaDescription","metaImage"],"edit":[[{"name":"metaTitle","size":6},{"name":"metaDescription","size":6}],[{"name":"metaImage","size":6},{"name":"keywords","size":6}],[{"name":"twitter","size":12}],[{"name":"og","size":12}],[{"name":"applicationName","size":6},{"name":"siteName","size":6}],[{"name":"email","size":6},{"name":"canonicalUrl","size":6}],[{"name":"metaRobots","size":6}],[{"name":"structuredData","size":12}]]},"uid":"seo-utilities.seo","isComponent":true}	object	\N	\N
245	plugin_content_manager_configuration_components::utilities.ck-editor-content	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}}},"layouts":{"list":["id"],"edit":[[{"name":"content","size":12}]]},"uid":"utilities.ck-editor-content","isComponent":true}	object	\N	\N
274	plugin_content_manager_configuration_components::seo-utilities.seo-twitter	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"card","defaultSortBy":"card","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"card":{"edit":{"label":"card","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"card","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"siteId":{"edit":{"label":"siteId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"siteId","searchable":true,"sortable":true}},"creator":{"edit":{"label":"creator","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"creator","searchable":true,"sortable":true}},"creatorId":{"edit":{"label":"creatorId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"creatorId","searchable":true,"sortable":true}},"images":{"edit":{"label":"images","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"images","searchable":false,"sortable":false}}},"layouts":{"list":["id","card","title","description"],"edit":[[{"name":"card","size":6},{"name":"title","size":6}],[{"name":"description","size":6},{"name":"siteId","size":6}],[{"name":"creator","size":6},{"name":"creatorId","size":6}],[{"name":"images","size":6}]]},"uid":"seo-utilities.seo-twitter","isComponent":true}	object	\N	\N
246	plugin_content_manager_configuration_components::utilities.basic-image	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"alt","defaultSortBy":"alt","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"media":{"edit":{"label":"media","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"media","searchable":false,"sortable":false}},"alt":{"edit":{"label":"alt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alt","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"fallbackSrc":{"edit":{"label":"fallbackSrc","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"fallbackSrc","searchable":true,"sortable":true}}},"layouts":{"list":["id","media","alt","width"],"edit":[[{"name":"media","size":6},{"name":"alt","size":6}],[{"name":"width","size":4},{"name":"height","size":4}],[{"name":"fallbackSrc","size":6}]]},"uid":"utilities.basic-image","isComponent":true}	object	\N	\N
249	plugin_content_manager_configuration_components::sections.horizontal-images	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"images":{"edit":{"label":"images","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"images","searchable":false,"sortable":false}},"spacing":{"edit":{"label":"spacing","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"spacing","searchable":true,"sortable":true}},"imageRadius":{"edit":{"label":"imageRadius","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"imageRadius","searchable":true,"sortable":true}},"fixedImageHeight":{"edit":{"label":"fixedImageHeight","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"fixedImageHeight","searchable":true,"sortable":true}},"fixedImageWidth":{"edit":{"label":"fixedImageWidth","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"fixedImageWidth","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","images","spacing"],"edit":[[{"name":"title","size":6}],[{"name":"images","size":12}],[{"name":"spacing","size":4},{"name":"imageRadius","size":6}],[{"name":"fixedImageHeight","size":4},{"name":"fixedImageWidth","size":4}]]},"uid":"sections.horizontal-images","isComponent":true}	object	\N	\N
250	plugin_content_manager_configuration_components::sections.hero	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"subTitle":{"edit":{"label":"subTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subTitle","searchable":true,"sortable":true}},"links":{"edit":{"label":"links","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"links","searchable":false,"sortable":false}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"bgColor":{"edit":{"label":"bgColor","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"bgColor","searchable":true,"sortable":true}},"steps":{"edit":{"label":"steps","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"steps","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","subTitle","links"],"edit":[[{"name":"title","size":6},{"name":"subTitle","size":6}],[{"name":"links","size":12}],[{"name":"image","size":12}],[{"name":"bgColor","size":6}],[{"name":"steps","size":12}]]},"uid":"sections.hero","isComponent":true}	object	\N	\N
252	plugin_content_manager_configuration_components::sections.faq	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"subTitle":{"edit":{"label":"subTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subTitle","searchable":true,"sortable":true}},"accordions":{"edit":{"label":"accordions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accordions","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","subTitle","accordions"],"edit":[[{"name":"title","size":6},{"name":"subTitle","size":6}],[{"name":"accordions","size":12}]]},"uid":"sections.faq","isComponent":true}	object	\N	\N
262	plugin_content_manager_configuration_components::contact.social-media	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"Facebook","defaultSortBy":"Facebook","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"Facebook":{"edit":{"label":"Facebook","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Facebook","searchable":true,"sortable":true}},"Instagram":{"edit":{"label":"Instagram","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Instagram","searchable":true,"sortable":true}},"YouTube":{"edit":{"label":"YouTube","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"YouTube","searchable":true,"sortable":true}},"TikTok":{"edit":{"label":"TikTok","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"TikTok","searchable":true,"sortable":true}},"LinkedIn":{"edit":{"label":"LinkedIn","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"LinkedIn","searchable":true,"sortable":true}},"Discord":{"edit":{"label":"Discord","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Discord","searchable":true,"sortable":true}},"Telegram":{"edit":{"label":"Telegram","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Telegram","searchable":true,"sortable":true}}},"layouts":{"list":["id","Facebook","Instagram","YouTube"],"edit":[[{"name":"Facebook","size":6},{"name":"Instagram","size":6}],[{"name":"YouTube","size":6},{"name":"TikTok","size":6}],[{"name":"LinkedIn","size":6},{"name":"Discord","size":6}],[{"name":"Telegram","size":6}]]},"uid":"contact.social-media","isComponent":true}	object	\N	\N
265	plugin_content_manager_configuration_components::seo-utilities.meta-social	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"socialNetwork":{"edit":{"label":"socialNetwork","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"socialNetwork","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}}},"layouts":{"list":["id","socialNetwork","title","description"],"edit":[[{"name":"socialNetwork","size":6},{"name":"title","size":6}],[{"name":"description","size":6},{"name":"image","size":6}]]},"uid":"seo-utilities.meta-social","isComponent":true}	object	\N	\N
243	plugin_content_manager_configuration_components::seo-utilities.seo-og	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","description","url"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"url","size":6},{"name":"type","size":6}],[{"name":"image","size":6}]]},"uid":"seo-utilities.seo-og","isComponent":true}	object	\N	\N
248	plugin_content_manager_configuration_components::sections.image-with-cta-button	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"subText":{"edit":{"label":"subText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subText","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","subText","image"],"edit":[[{"name":"title","size":6},{"name":"subText","size":6}],[{"name":"image","size":12}],[{"name":"link","size":12}]]},"uid":"sections.image-with-cta-button","isComponent":true}	object	\N	\N
273	plugin_content_manager_configuration_components::forms.newsletter-form	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"gdpr":{"edit":{"label":"gdpr","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"gdpr","searchable":false,"sortable":false}}},"layouts":{"list":["id","title","description","gdpr"],"edit":[[{"name":"title","size":6},{"name":"description","size":6}],[{"name":"gdpr","size":12}]]},"uid":"forms.newsletter-form","isComponent":true}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
652	{"tables":[{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_documents_idx","columns":["document_id","locale","published_at"]},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_documents_idx","columns":["document_id","locale","published_at"]},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_documents_idx","columns":["document_id","locale","published_at"]},{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"entry_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows","indexes":[{"name":"strapi_workflows_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_types","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_workflows_stages","indexes":[{"name":"strapi_workflows_stages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_roles","indexes":[{"name":"up_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_users","indexes":[{"name":"up_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"categories","indexes":[{"name":"categories_documents_idx","columns":["document_id","locale","published_at"]},{"name":"categories_created_by_id_fk","columns":["created_by_id"]},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"categories_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"directories","indexes":[{"name":"directories_documents_idx","columns":["document_id","locale","published_at"]},{"name":"directories_created_by_id_fk","columns":["created_by_id"]},{"name":"directories_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"directories_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"directories_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"footers_cmps","indexes":[{"name":"footers_field_idx","columns":["field"]},{"name":"footers_component_type_idx","columns":["component_type"]},{"name":"footers_entity_fk","columns":["entity_id"]},{"name":"footers_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"footers_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"footers","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"footers","indexes":[{"name":"footers_documents_idx","columns":["document_id","locale","published_at"]},{"name":"footers_created_by_id_fk","columns":["created_by_id"]},{"name":"footers_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"footers_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"footers_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"copy_right","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"identities","indexes":[{"name":"identities_documents_idx","columns":["document_id","locale","published_at"]},{"name":"identities_created_by_id_fk","columns":["created_by_id"]},{"name":"identities_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"identities_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"identities_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"bio","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"items_cmps","indexes":[{"name":"items_field_idx","columns":["field"]},{"name":"items_component_type_idx","columns":["component_type"]},{"name":"items_entity_fk","columns":["entity_id"]},{"name":"items_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"items_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"items","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"items","indexes":[{"name":"items_documents_idx","columns":["document_id","locale","published_at"]},{"name":"items_created_by_id_fk","columns":["created_by_id"]},{"name":"items_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"items_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"items_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_featured","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"item_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"search_summary","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"listings","indexes":[{"name":"listings_documents_idx","columns":["document_id","locale","published_at"]},{"name":"listings_created_by_id_fk","columns":["created_by_id"]},{"name":"listings_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"listings_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"listings_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"listing_types_cmps","indexes":[{"name":"listing_types_field_idx","columns":["field"]},{"name":"listing_types_component_type_idx","columns":["component_type"]},{"name":"listing_types_entity_fk","columns":["entity_id"]},{"name":"listing_types_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"listing_types_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"listing_types","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"listing_types","indexes":[{"name":"listing_types_documents_idx","columns":["document_id","locale","published_at"]},{"name":"listing_types_created_by_id_fk","columns":["created_by_id"]},{"name":"listing_types_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"listing_types_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"listing_types_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"allow_comment","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"allow_rating","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"item_group","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"review_group","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"icon_set","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"test_field","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"component_filter","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"navbars_cmps","indexes":[{"name":"navbars_field_idx","columns":["field"]},{"name":"navbars_component_type_idx","columns":["component_type"]},{"name":"navbars_entity_fk","columns":["entity_id"]},{"name":"navbars_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"navbars_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"navbars","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"navbars","indexes":[{"name":"navbars_documents_idx","columns":["document_id","locale","published_at"]},{"name":"navbars_created_by_id_fk","columns":["created_by_id"]},{"name":"navbars_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"navbars_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"navbars_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"pages_cmps","indexes":[{"name":"pages_field_idx","columns":["field"]},{"name":"pages_component_type_idx","columns":["component_type"]},{"name":"pages_entity_fk","columns":["entity_id"]},{"name":"pages_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"pages_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"pages","indexes":[{"name":"pages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"pages_created_by_id_fk","columns":["created_by_id"]},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"breadcrumb_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"full_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"platforms","indexes":[{"name":"platforms_documents_idx","columns":["document_id","locale","published_at"]},{"name":"platforms_created_by_id_fk","columns":["created_by_id"]},{"name":"platforms_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"platforms_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"platforms_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"reports","indexes":[{"name":"reports_documents_idx","columns":["document_id","locale","published_at"]},{"name":"reports_created_by_id_fk","columns":["created_by_id"]},{"name":"reports_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"reports_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"reports_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"target_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"report_status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reason","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"note","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"proof_links","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"reviews_cmps","indexes":[{"name":"reviews_field_idx","columns":["field"]},{"name":"reviews_component_type_idx","columns":["component_type"]},{"name":"reviews_entity_fk","columns":["entity_id"]},{"name":"reviews_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"reviews_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"reviews","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"reviews","indexes":[{"name":"reviews_documents_idx","columns":["document_id","locale","published_at"]},{"name":"reviews_created_by_id_fk","columns":["created_by_id"]},{"name":"reviews_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"reviews_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"reviews_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"review_date","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_featured","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"review_status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"up_vote","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"down_vote","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reported_count","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reject_reason","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"review_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"review_votes","indexes":[{"name":"review_votes_documents_idx","columns":["document_id","locale","published_at"]},{"name":"review_votes_created_by_id_fk","columns":["created_by_id"]},{"name":"review_votes_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"review_votes_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"review_votes_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_helpful","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"subscribers","indexes":[{"name":"subscribers_documents_idx","columns":["document_id","locale","published_at"]},{"name":"subscribers_created_by_id_fk","columns":["created_by_id"]},{"name":"subscribers_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"subscribers_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"subscribers_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"message","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_users","indexes":[{"name":"admin_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"encrypted_key","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_violation_evidences","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"verification_date","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"note","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"verification_status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_violation_details","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"severity","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"method","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"impact","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"amount","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"platform","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_utilities_texts","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_utilities_links_with_titles_cmps","indexes":[{"name":"components_utilities_links_with_titles_field_idx","columns":["field"]},{"name":"components_utilities_links_withe4603_component_type_idx","columns":["component_type"]},{"name":"components_utilities_links_with_titles_entity_fk","columns":["entity_id"]},{"name":"components_utilities_links_with_titles_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_utilities_links_with_titles_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_utilities_links_with_titles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_utilities_links_with_titles","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_utilities_links","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"label","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"href","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"new_tab","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_utilities_image_with_links_cmps","indexes":[{"name":"components_utilities_image_with_links_field_idx","columns":["field"]},{"name":"components_utilities_image_with37a81_component_type_idx","columns":["component_type"]},{"name":"components_utilities_image_with_links_entity_fk","columns":["entity_id"]},{"name":"components_utilities_image_with_links_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_utilities_image_with_links_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_utilities_image_with_links","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_utilities_image_with_links","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false}]},{"name":"components_utilities_ck_editor_contents","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_utilities_basic_images","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"alt","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"fallback_src","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_utilities_accordions","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"question","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"answer","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_seos_cmps","indexes":[{"name":"components_shared_seos_field_idx","columns":["field"]},{"name":"components_shared_seos_component_type_idx","columns":["component_type"]},{"name":"components_shared_seos_entity_fk","columns":["entity_id"]},{"name":"components_shared_seos_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_shared_seos_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_shared_seos","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_shared_seos","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"meta_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"keywords","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_robots","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"structured_data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_viewport","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"canonical_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_meta_socials","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"social_network","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_seo_utilities_social_icons_cmps","indexes":[{"name":"components_seo_utilities_social_icons_field_idx","columns":["field"]},{"name":"components_seo_utilities_sociale6b11_component_type_idx","columns":["component_type"]},{"name":"components_seo_utilities_social_icons_entity_fk","columns":["entity_id"]},{"name":"components_seo_utilities_social_icons_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_seo_utilities_social_icons_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_seo_utilities_social_icons","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_seo_utilities_social_icons","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_seo_utilities_seos_cmps","indexes":[{"name":"components_seo_utilities_seos_field_idx","columns":["field"]},{"name":"components_seo_utilities_seos_component_type_idx","columns":["component_type"]},{"name":"components_seo_utilities_seos_entity_fk","columns":["entity_id"]},{"name":"components_seo_utilities_seos_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_seo_utilities_seos_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_seo_utilities_seos","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_seo_utilities_seos","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"meta_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"keywords","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"application_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"site_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"canonical_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_robots","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"structured_data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_seo_utilities_seo_twitters","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"card","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"site_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"creator","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"creator_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_seo_utilities_seo_ogs","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_seo_utilities_meta_socials","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"social_network","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_sections_image_with_cta_buttons_cmps","indexes":[{"name":"components_sections_image_with_cta_buttons_field_idx","columns":["field"]},{"name":"components_sections_image_with_7e8fc_component_type_idx","columns":["component_type"]},{"name":"components_sections_image_with_cta_buttons_entity_fk","columns":["entity_id"]},{"name":"components_sections_image_with_cta_buttons_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_sections_image_with_cta_buttons_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_sections_image_with_cta_buttons","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_sections_image_with_cta_buttons","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"sub_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_sections_horizontal_images_cmps","indexes":[{"name":"components_sections_horizontal_images_field_idx","columns":["field"]},{"name":"components_sections_horizontal_1685d_component_type_idx","columns":["component_type"]},{"name":"components_sections_horizontal_images_entity_fk","columns":["entity_id"]},{"name":"components_sections_horizontal_images_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_sections_horizontal_images_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_sections_horizontal_images","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_sections_horizontal_images","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"spacing","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"image_radius","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"fixed_image_height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"fixed_image_width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_sections_heroes_cmps","indexes":[{"name":"components_sections_heroes_field_idx","columns":["field"]},{"name":"components_sections_heroes_component_type_idx","columns":["component_type"]},{"name":"components_sections_heroes_entity_fk","columns":["entity_id"]},{"name":"components_sections_heroes_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_sections_heroes_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_sections_heroes","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_sections_heroes","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"sub_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"bg_color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_sections_heading_with_cta_buttons_cmps","indexes":[{"name":"components_sections_heading_with_cta_buttons_field_idx","columns":["field"]},{"name":"components_sections_heading_wit3fa0d_component_type_idx","columns":["component_type"]},{"name":"components_sections_heading_with_cta_buttons_entity_fk","columns":["entity_id"]},{"name":"components_sections_heading_with_cta_buttons_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_sections_heading_with_cta_buttons_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_sections_heading_with_cta_buttons","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_sections_heading_with_cta_buttons","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"sub_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_sections_faqs_cmps","indexes":[{"name":"components_sections_faqs_field_idx","columns":["field"]},{"name":"components_sections_faqs_component_type_idx","columns":["component_type"]},{"name":"components_sections_faqs_entity_fk","columns":["entity_id"]},{"name":"components_sections_faqs_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_sections_faqs_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_sections_faqs","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_sections_faqs","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"sub_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_sections_carousels_cmps","indexes":[{"name":"components_sections_carousels_field_idx","columns":["field"]},{"name":"components_sections_carousels_component_type_idx","columns":["component_type"]},{"name":"components_sections_carousels_entity_fk","columns":["entity_id"]},{"name":"components_sections_carousels_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_sections_carousels_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_sections_carousels","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_sections_carousels","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"radius","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_sections_animated_logo_rows_cmps","indexes":[{"name":"components_sections_animated_logo_rows_field_idx","columns":["field"]},{"name":"components_sections_animated_lofcbcf_component_type_idx","columns":["component_type"]},{"name":"components_sections_animated_logo_rows_entity_fk","columns":["entity_id"]},{"name":"components_sections_animated_logo_rows_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_sections_animated_logo_rows_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_sections_animated_logo_rows","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_sections_animated_logo_rows","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_review_pros_cons_cmps","indexes":[{"name":"components_review_pros_cons_field_idx","columns":["field"]},{"name":"components_review_pros_cons_component_type_idx","columns":["component_type"]},{"name":"components_review_pros_cons_entity_fk","columns":["entity_id"]},{"name":"components_review_pros_cons_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_review_pros_cons_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_review_pros_cons","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_review_pros_cons","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false}]},{"name":"components_review_pro_items","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"item","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_rating_criteria","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"weight","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tooltip","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_required","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"icon","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_info_bank_infos","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"swift_bic","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_forms_newsletter_forms_cmps","indexes":[{"name":"components_forms_newsletter_forms_field_idx","columns":["field"]},{"name":"components_forms_newsletter_forms_component_type_idx","columns":["component_type"]},{"name":"components_forms_newsletter_forms_entity_fk","columns":["entity_id"]},{"name":"components_forms_newsletter_forms_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_forms_newsletter_forms_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_forms_newsletter_forms","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_forms_newsletter_forms","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_forms_contact_forms_cmps","indexes":[{"name":"components_forms_contact_forms_field_idx","columns":["field"]},{"name":"components_forms_contact_forms_component_type_idx","columns":["component_type"]},{"name":"components_forms_contact_forms_entity_fk","columns":["entity_id"]},{"name":"components_forms_contact_forms_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_forms_contact_forms_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_forms_contact_forms","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_forms_contact_forms","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_media_videos","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"you_tube","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_media_photos","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false}]},{"name":"components_contact_social_medias","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"facebook","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"instagram","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"you_tube","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tik_tok","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"linked_in","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"discord","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"telegram","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_contact_locations","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"address","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_contact_basics","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"website","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_elements_footer_items_cmps","indexes":[{"name":"components_elements_footer_items_field_idx","columns":["field"]},{"name":"components_elements_footer_items_component_type_idx","columns":["component_type"]},{"name":"components_elements_footer_items_entity_fk","columns":["entity_id"]},{"name":"components_elements_footer_items_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"components_elements_footer_items_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"components_elements_footer_items","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_elements_footer_items","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_history_versions","indexes":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"]}],"foreignKeys":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"schema","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_mph","indexes":[{"name":"files_related_mph_fk","columns":["file_id"]},{"name":"files_related_mph_oidx","columns":["order"]},{"name":"files_related_mph_idix","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_mph_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_lnk","indexes":[{"name":"files_folder_lnk_fk","columns":["file_id"]},{"name":"files_folder_lnk_ifk","columns":["folder_id"]},{"name":"files_folder_lnk_uq","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_lnk_oifk","columns":["file_ord"]}],"foreignKeys":[{"name":"files_folder_lnk_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_lnk_ifk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_lnk","indexes":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"]},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_lnk_uq","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_lnk_oifk","columns":["folder_ord"]}],"foreignKeys":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_lnk","indexes":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"]},{"name":"strapi_release_actions_release_lnk_uq","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_lnk_oifk","columns":["release_action_ord"]}],"foreignKeys":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stage_required_to_publish_lnk","indexes":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_uq","columns":["workflow_id","workflow_stage_id"],"type":"unique"}],"foreignKeys":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_workflow_lnk","indexes":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"]},{"name":"strapi_workflows_stages_workflow_lnk_uq","columns":["workflow_stage_id","workflow_id"],"type":"unique"},{"name":"strapi_workflows_stages_workflow_lnk_oifk","columns":["workflow_stage_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_permissions_lnk","indexes":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"]},{"name":"strapi_workflows_stages_permissions_lnk_uq","columns":["workflow_stage_id","permission_id"],"type":"unique"},{"name":"strapi_workflows_stages_permissions_lnk_ofk","columns":["permission_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_lnk","indexes":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"up_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_lnk","indexes":[{"name":"up_users_role_lnk_fk","columns":["user_id"]},{"name":"up_users_role_lnk_ifk","columns":["role_id"]},{"name":"up_users_role_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"up_users_role_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"categories_listing_type_lnk","indexes":[{"name":"categories_listing_type_lnk_fk","columns":["category_id"]},{"name":"categories_listing_type_lnk_ifk","columns":["listing_type_id"]},{"name":"categories_listing_type_lnk_uq","columns":["category_id","listing_type_id"],"type":"unique"},{"name":"categories_listing_type_lnk_oifk","columns":["category_ord"]}],"foreignKeys":[{"name":"categories_listing_type_lnk_fk","columns":["category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"},{"name":"categories_listing_type_lnk_ifk","columns":["listing_type_id"],"referencedColumns":["id"],"referencedTable":"listing_types","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"listing_type_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"categories_parent_category_lnk","indexes":[{"name":"categories_parent_category_lnk_fk","columns":["category_id"]},{"name":"categories_parent_category_lnk_ifk","columns":["inv_category_id"]},{"name":"categories_parent_category_lnk_uq","columns":["category_id","inv_category_id"],"type":"unique"},{"name":"categories_parent_category_lnk_oifk","columns":["category_ord"]}],"foreignKeys":[{"name":"categories_parent_category_lnk_fk","columns":["category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"},{"name":"categories_parent_category_lnk_ifk","columns":["inv_category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"categories_directory_lnk","indexes":[{"name":"categories_directory_lnk_fk","columns":["category_id"]},{"name":"categories_directory_lnk_ifk","columns":["directory_id"]},{"name":"categories_directory_lnk_uq","columns":["category_id","directory_id"],"type":"unique"},{"name":"categories_directory_lnk_oifk","columns":["category_ord"]}],"foreignKeys":[{"name":"categories_directory_lnk_fk","columns":["category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"},{"name":"categories_directory_lnk_ifk","columns":["directory_id"],"referencedColumns":["id"],"referencedTable":"directories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"directory_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"items_listing_type_lnk","indexes":[{"name":"items_listing_type_lnk_fk","columns":["item_id"]},{"name":"items_listing_type_lnk_ifk","columns":["listing_type_id"]},{"name":"items_listing_type_lnk_uq","columns":["item_id","listing_type_id"],"type":"unique"}],"foreignKeys":[{"name":"items_listing_type_lnk_fk","columns":["item_id"],"referencedColumns":["id"],"referencedTable":"items","onDelete":"CASCADE"},{"name":"items_listing_type_lnk_ifk","columns":["listing_type_id"],"referencedColumns":["id"],"referencedTable":"listing_types","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"listing_type_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"items_related_identity_lnk","indexes":[{"name":"items_related_identity_lnk_fk","columns":["item_id"]},{"name":"items_related_identity_lnk_ifk","columns":["identity_id"]},{"name":"items_related_identity_lnk_uq","columns":["item_id","identity_id"],"type":"unique"}],"foreignKeys":[{"name":"items_related_identity_lnk_fk","columns":["item_id"],"referencedColumns":["id"],"referencedTable":"items","onDelete":"CASCADE"},{"name":"items_related_identity_lnk_ifk","columns":["identity_id"],"referencedColumns":["id"],"referencedTable":"identities","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"identity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"listings_item_lnk","indexes":[{"name":"listings_item_lnk_fk","columns":["listing_id"]},{"name":"listings_item_lnk_ifk","columns":["item_id"]},{"name":"listings_item_lnk_uq","columns":["listing_id","item_id"],"type":"unique"},{"name":"listings_item_lnk_oifk","columns":["listing_ord"]}],"foreignKeys":[{"name":"listings_item_lnk_fk","columns":["listing_id"],"referencedColumns":["id"],"referencedTable":"listings","onDelete":"CASCADE"},{"name":"listings_item_lnk_ifk","columns":["item_id"],"referencedColumns":["id"],"referencedTable":"items","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"listing_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"listing_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"listings_category_lnk","indexes":[{"name":"listings_category_lnk_fk","columns":["listing_id"]},{"name":"listings_category_lnk_ifk","columns":["category_id"]},{"name":"listings_category_lnk_uq","columns":["listing_id","category_id"],"type":"unique"},{"name":"listings_category_lnk_oifk","columns":["listing_ord"]}],"foreignKeys":[{"name":"listings_category_lnk_fk","columns":["listing_id"],"referencedColumns":["id"],"referencedTable":"listings","onDelete":"CASCADE"},{"name":"listings_category_lnk_ifk","columns":["category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"listing_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"listing_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"pages_parent_lnk","indexes":[{"name":"pages_parent_lnk_fk","columns":["page_id"]},{"name":"pages_parent_lnk_ifk","columns":["inv_page_id"]},{"name":"pages_parent_lnk_uq","columns":["page_id","inv_page_id"],"type":"unique"},{"name":"pages_parent_lnk_oifk","columns":["page_ord"]}],"foreignKeys":[{"name":"pages_parent_lnk_fk","columns":["page_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"},{"name":"pages_parent_lnk_ifk","columns":["inv_page_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"page_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"platforms_listings_lnk","indexes":[{"name":"platforms_listings_lnk_fk","columns":["platform_id"]},{"name":"platforms_listings_lnk_ifk","columns":["listing_id"]},{"name":"platforms_listings_lnk_uq","columns":["platform_id","listing_id"],"type":"unique"},{"name":"platforms_listings_lnk_ofk","columns":["listing_ord"]}],"foreignKeys":[{"name":"platforms_listings_lnk_fk","columns":["platform_id"],"referencedColumns":["id"],"referencedTable":"platforms","onDelete":"CASCADE"},{"name":"platforms_listings_lnk_ifk","columns":["listing_id"],"referencedColumns":["id"],"referencedTable":"listings","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"platform_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"listing_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"listing_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"reports_review_lnk","indexes":[{"name":"reports_review_lnk_fk","columns":["report_id"]},{"name":"reports_review_lnk_ifk","columns":["review_id"]},{"name":"reports_review_lnk_uq","columns":["report_id","review_id"],"type":"unique"},{"name":"reports_review_lnk_oifk","columns":["report_ord"]}],"foreignKeys":[{"name":"reports_review_lnk_fk","columns":["report_id"],"referencedColumns":["id"],"referencedTable":"reports","onDelete":"CASCADE"},{"name":"reports_review_lnk_ifk","columns":["review_id"],"referencedColumns":["id"],"referencedTable":"reviews","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"report_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"review_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"report_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"reports_target_item_lnk","indexes":[{"name":"reports_target_item_lnk_fk","columns":["report_id"]},{"name":"reports_target_item_lnk_ifk","columns":["item_id"]},{"name":"reports_target_item_lnk_uq","columns":["report_id","item_id"],"type":"unique"},{"name":"reports_target_item_lnk_oifk","columns":["report_ord"]}],"foreignKeys":[{"name":"reports_target_item_lnk_fk","columns":["report_id"],"referencedColumns":["id"],"referencedTable":"reports","onDelete":"CASCADE"},{"name":"reports_target_item_lnk_ifk","columns":["item_id"],"referencedColumns":["id"],"referencedTable":"items","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"report_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"report_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"reports_target_listing_lnk","indexes":[{"name":"reports_target_listing_lnk_fk","columns":["report_id"]},{"name":"reports_target_listing_lnk_ifk","columns":["listing_id"]},{"name":"reports_target_listing_lnk_uq","columns":["report_id","listing_id"],"type":"unique"},{"name":"reports_target_listing_lnk_oifk","columns":["report_ord"]}],"foreignKeys":[{"name":"reports_target_listing_lnk_fk","columns":["report_id"],"referencedColumns":["id"],"referencedTable":"reports","onDelete":"CASCADE"},{"name":"reports_target_listing_lnk_ifk","columns":["listing_id"],"referencedColumns":["id"],"referencedTable":"listings","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"report_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"listing_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"report_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"reports_target_identity_lnk","indexes":[{"name":"reports_target_identity_lnk_fk","columns":["report_id"]},{"name":"reports_target_identity_lnk_ifk","columns":["identity_id"]},{"name":"reports_target_identity_lnk_uq","columns":["report_id","identity_id"],"type":"unique"},{"name":"reports_target_identity_lnk_oifk","columns":["report_ord"]}],"foreignKeys":[{"name":"reports_target_identity_lnk_fk","columns":["report_id"],"referencedColumns":["id"],"referencedTable":"reports","onDelete":"CASCADE"},{"name":"reports_target_identity_lnk_ifk","columns":["identity_id"],"referencedColumns":["id"],"referencedTable":"identities","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"report_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"identity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"report_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"reports_reporter_lnk","indexes":[{"name":"reports_reporter_lnk_fk","columns":["report_id"]},{"name":"reports_reporter_lnk_ifk","columns":["identity_id"]},{"name":"reports_reporter_lnk_uq","columns":["report_id","identity_id"],"type":"unique"},{"name":"reports_reporter_lnk_oifk","columns":["report_ord"]}],"foreignKeys":[{"name":"reports_reporter_lnk_fk","columns":["report_id"],"referencedColumns":["id"],"referencedTable":"reports","onDelete":"CASCADE"},{"name":"reports_reporter_lnk_ifk","columns":["identity_id"],"referencedColumns":["id"],"referencedTable":"identities","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"report_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"identity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"report_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"review_votes_identity_lnk","indexes":[{"name":"review_votes_identity_lnk_fk","columns":["review_vote_id"]},{"name":"review_votes_identity_lnk_ifk","columns":["identity_id"]},{"name":"review_votes_identity_lnk_uq","columns":["review_vote_id","identity_id"],"type":"unique"}],"foreignKeys":[{"name":"review_votes_identity_lnk_fk","columns":["review_vote_id"],"referencedColumns":["id"],"referencedTable":"review_votes","onDelete":"CASCADE"},{"name":"review_votes_identity_lnk_ifk","columns":["identity_id"],"referencedColumns":["id"],"referencedTable":"identities","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"review_vote_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"identity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"review_votes_review_lnk","indexes":[{"name":"review_votes_review_lnk_fk","columns":["review_vote_id"]},{"name":"review_votes_review_lnk_ifk","columns":["review_id"]},{"name":"review_votes_review_lnk_uq","columns":["review_vote_id","review_id"],"type":"unique"}],"foreignKeys":[{"name":"review_votes_review_lnk_fk","columns":["review_vote_id"],"referencedColumns":["id"],"referencedTable":"review_votes","onDelete":"CASCADE"},{"name":"review_votes_review_lnk_ifk","columns":["review_id"],"referencedColumns":["id"],"referencedTable":"reviews","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"review_vote_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"review_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_lnk","indexes":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"admin_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_lnk","indexes":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"]},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"]},{"name":"admin_users_roles_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_lnk_ofk","columns":["role_ord"]},{"name":"admin_users_roles_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_lnk","indexes":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_lnk_uq","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_lnk_oifk","columns":["api_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_lnk","indexes":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_uq","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_lnk_oifk","columns":["transfer_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"components_violation_evidences_report_lnk","indexes":[{"name":"components_violation_evidences_report_lnk_fk","columns":["evidence_id"]},{"name":"components_violation_evidences_report_lnk_ifk","columns":["report_id"]},{"name":"components_violation_evidences_report_lnk_uq","columns":["evidence_id","report_id"],"type":"unique"}],"foreignKeys":[{"name":"components_violation_evidences_report_lnk_fk","columns":["evidence_id"],"referencedColumns":["id"],"referencedTable":"components_violation_evidences","onDelete":"CASCADE"},{"name":"components_violation_evidences_report_lnk_ifk","columns":["report_id"],"referencedColumns":["id"],"referencedTable":"reports","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"evidence_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"report_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2025-06-05 22:40:01.628	aca50b59dc2fc00fc6caa3944d93b620cbd9b9ceeb5446802f359761591e0e14
\.


--
-- Data for Name: strapi_history_versions; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_history_versions (id, content_type, related_document_id, locale, status, data, schema, created_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
1	add-czech-locale.js	2025-05-27 14:27:24.618
\.


--
-- Data for Name: strapi_migrations_internal; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_migrations_internal (id, name, "time") FROM stdin;
1	5.0.0-rename-identifiers-longer-than-max-length	2025-05-26 02:32:09.691
2	5.0.0-02-created-document-id	2025-05-26 02:32:09.749
3	5.0.0-03-created-locale	2025-05-26 02:32:09.802
4	5.0.0-04-created-published-at	2025-05-26 02:32:09.856
5	5.0.0-05-drop-slug-fields-index	2025-05-26 02:32:09.915
6	core::5.0.0-discard-drafts	2025-05-26 02:32:09.973
\.


--
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_release_actions (id, document_id, type, content_type, entry_document_id, locale, is_entry_valid, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_release_actions_release_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_release_actions_release_lnk (id, release_action_id, release_id, release_action_ord) FROM stdin;
\.


--
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_releases (id, document_id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_transfer_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_transfer_token_permissions_token_lnk (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_transfer_tokens (id, document_id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: strapi_workflows; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_workflows (id, document_id, name, content_types, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_workflows_stage_required_to_publish_lnk (id, workflow_id, workflow_stage_id) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_workflows_stages (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_permissions_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_workflows_stages_permissions_lnk (id, workflow_stage_id, permission_id, permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_workflow_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.strapi_workflows_stages_workflow_lnk (id, workflow_stage_id, workflow_id, workflow_stage_ord) FROM stdin;
\.


--
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.subscribers (id, document_id, name, email, message, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
2	my6nqgp64maoawg6039zohui	Tomáš Jakúbek	tmsjkbk@gmail.com	asf aasf sa. sa a s	2025-05-09 01:06:37.351	2025-05-09 01:06:37.351	2025-05-09 01:06:37.349	\N	\N	\N
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.up_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
26	c942ti5w98l1vws4q0236o8s	plugin::users-permissions.user.me	2025-05-08 20:41:49.266	2025-05-08 20:41:49.266	2025-05-08 20:41:49.268	\N	\N	\N
27	rn5bub8qkam36wp2me9dni05	plugin::users-permissions.auth.changePassword	2025-05-08 20:41:49.266	2025-05-08 20:41:49.266	2025-05-08 20:41:49.268	\N	\N	\N
28	rm4s9ha0jn37vu3ok7cj42it	plugin::users-permissions.auth.connect	2025-05-08 20:41:49.557	2025-05-08 20:41:49.557	2025-05-08 20:41:49.558	\N	\N	\N
29	yg2abyvdcnxu9nv6y81x7owz	plugin::users-permissions.auth.emailConfirmation	2025-05-08 20:41:49.557	2025-05-08 20:41:49.557	2025-05-08 20:41:49.558	\N	\N	\N
30	kkaqdl58sab1xw9o5irdfwki	plugin::users-permissions.auth.register	2025-05-08 20:41:49.557	2025-05-08 20:41:49.557	2025-05-08 20:41:49.558	\N	\N	\N
31	r27tx4q516i8tmkqhwbliwqi	plugin::users-permissions.auth.resetPassword	2025-05-08 20:41:49.557	2025-05-08 20:41:49.557	2025-05-08 20:41:49.558	\N	\N	\N
32	ipdi4gogrfpuw478apl9w1js	plugin::users-permissions.auth.forgotPassword	2025-05-08 20:41:49.557	2025-05-08 20:41:49.557	2025-05-08 20:41:49.558	\N	\N	\N
33	hm077wfb70pwtuj6hzxvxdys	plugin::users-permissions.auth.callback	2025-05-08 20:41:49.557	2025-05-08 20:41:49.557	2025-05-08 20:41:49.558	\N	\N	\N
34	jb1sikqefhk6sagf1qhu34hw	plugin::users-permissions.auth.sendEmailConfirmation	2025-05-08 20:41:49.557	2025-05-08 20:41:49.557	2025-05-08 20:41:49.558	\N	\N	\N
35	x6ovzsyqfgelxgcxxaz66bvu	api::item.item.find	2025-06-02 16:41:47.054	2025-06-02 16:41:47.054	2025-06-02 16:41:47.055	\N	\N	\N
36	q7c85zi6jefu90fy8oj8v3n7	api::item.item.findOne	2025-06-02 16:41:47.054	2025-06-02 16:41:47.054	2025-06-02 16:41:47.056	\N	\N	\N
37	smebrhg3v2td1i9iednwq0fq	api::listing.listing.find	2025-06-02 16:41:47.054	2025-06-02 16:41:47.054	2025-06-02 16:41:47.056	\N	\N	\N
38	gmqkd0drinca3tsidcyvcq2f	api::listing.listing.findOne	2025-06-02 16:41:47.054	2025-06-02 16:41:47.054	2025-06-02 16:41:47.057	\N	\N	\N
39	rxo31oe8ekngvibt6wvxjd5i	api::page.page.find	2025-06-02 16:41:47.054	2025-06-02 16:41:47.054	2025-06-02 16:41:47.057	\N	\N	\N
40	gi5dlinb1lxpcxlpnl5ynmwi	api::page.page.findOne	2025-06-02 16:41:47.054	2025-06-02 16:41:47.054	2025-06-02 16:41:47.057	\N	\N	\N
41	r715gwkyl2xzvxmpl9hkwnq4	api::review.review.find	2025-06-02 16:41:47.054	2025-06-02 16:41:47.054	2025-06-02 16:41:47.057	\N	\N	\N
42	yfto1nxlkxr2bnjgr63drogw	api::review.review.findOne	2025-06-02 16:41:47.054	2025-06-02 16:41:47.054	2025-06-02 16:41:47.058	\N	\N	\N
43	v17tfh9b8yvlth2kfl3n4az6	api::category.category.find	2025-06-02 16:41:58.175	2025-06-02 16:41:58.175	2025-06-02 16:41:58.175	\N	\N	\N
45	rh1xgk9m1sir1sr4mo2axenx	api::directory.directory.find	2025-06-02 16:41:58.175	2025-06-02 16:41:58.175	2025-06-02 16:41:58.175	\N	\N	\N
46	y9b8nwo3texy38f8zhcrvs7n	api::directory.directory.findOne	2025-06-02 16:41:58.175	2025-06-02 16:41:58.175	2025-06-02 16:41:58.175	\N	\N	\N
44	kx6qnwpjrnl6l65p2jzza9cy	api::category.category.findOne	2025-06-02 16:41:58.175	2025-06-02 16:41:58.175	2025-06-02 16:41:58.175	\N	\N	\N
47	pmmaapkc884oo5idun10igyv	api::footer.footer.find	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	\N	\N	\N
48	sjdyyxem0t6hcpcgh89x181l	api::identity.identity.find	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	\N	\N	\N
49	zfyurdda5pfdtc48t7hxmate	api::identity.identity.findOne	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	\N	\N	\N
50	shc3shyt4y1t7tyxpult58kk	api::listing-type.listing-type.find	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	\N	\N	\N
51	mci5cr4emh93tlu7yt66q61g	api::listing-type.listing-type.findOne	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	\N	\N	\N
52	a1klq2xq0sgww497ff1dlv9x	api::navbar.navbar.find	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	\N	\N	\N
53	nxgc3m9qv6swoaz1crrx5i62	api::platform.platform.find	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	\N	\N	\N
54	zdxs0ynsyu6pz8xxjks8cbin	api::platform.platform.findOne	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	\N	\N	\N
55	mznkjgyuhkntcvnok9fsyae8	api::report.report.find	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	\N	\N	\N
56	k1m8le7r8j6s6givx0mtiylu	api::report.report.findOne	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	2025-06-02 16:45:10.086	\N	\N	\N
57	y0u71u2caa04muz5kvhpye6v	api::review-vote.review-vote.find	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	2025-06-02 16:45:10.086	\N	\N	\N
58	g20om4m67n14e76b8spfh98x	api::review-vote.review-vote.findOne	2025-06-02 16:45:10.085	2025-06-02 16:45:10.085	2025-06-02 16:45:10.086	\N	\N	\N
59	qibohr48biek085u40pygwmj	api::listing-type.listing-type.find	2025-06-05 09:14:00.911	2025-06-05 09:14:00.911	2025-06-05 09:14:00.911	\N	\N	\N
60	be80yywf9y6t7o52w5stpr4z	api::listing-type.listing-type.findOne	2025-06-05 09:14:00.911	2025-06-05 09:14:00.911	2025-06-05 09:14:00.912	\N	\N	\N
61	osqwiclftc1qt4slqj9btjkz	api::listing.listing.find	2025-06-05 09:15:06.509	2025-06-05 09:15:06.509	2025-06-05 09:15:06.509	\N	\N	\N
62	k7ardktshd4vog5w9rnu0pq2	api::listing.listing.findOne	2025-06-05 09:15:06.509	2025-06-05 09:15:06.509	2025-06-05 09:15:06.51	\N	\N	\N
\.


--
-- Data for Name: up_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.up_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
26	26	5	1
27	27	5	1
28	28	6	1
29	29	6	1
30	34	6	1
31	32	6	1
32	31	6	1
33	30	6	1
34	33	6	1
35	35	6	2
36	36	6	2
37	37	6	3
38	38	6	4
39	39	6	4
40	40	6	5
41	41	6	5
42	42	6	6
43	43	6	7
44	45	6	7
45	44	6	8
46	46	6	8
47	47	6	9
48	48	6	9
49	49	6	10
50	50	6	11
51	51	6	12
52	52	6	12
53	53	6	13
54	54	6	13
55	55	6	14
56	56	6	14
57	57	6	15
58	58	6	15
59	59	5	2
60	60	5	3
61	61	5	4
62	62	5	5
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.up_roles (id, document_id, name, description, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
6	uqlw8g5f3zyxkspmeaweiiw2	Public	Default role given to unauthenticated user.	public	2025-05-08 20:41:49.03	2025-06-02 16:45:10.067	2025-05-08 20:41:49.031	\N	\N	\N
5	caoelvgjtry6axw56g38kyuf	Authenticated	Default role given to authenticated user.	authenticated	2025-05-08 20:41:48.877	2025-06-05 09:15:06.503	2025-05-08 20:41:48.878	\N	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.up_users (id, document_id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
2	igfl46vj2z22o4tm999enpen	tmsjkbk@gmail.com	tmsjkbk@gmail.com	local	$2a$10$Z06Qhk4j1K2mB.6ts4q0Hetmst3WqO/QlUMLtCZQlJ.EAesAdutTa	\N	\N	t	f	2025-05-09 02:20:40.841	2025-05-09 02:41:52.335	2025-05-09 02:40:14.363	\N	\N	\N
\.


--
-- Data for Name: up_users_role_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.up_users_role_lnk (id, user_id, role_id, user_ord) FROM stdin;
2	2	5	1
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.upload_folders (id, document_id, name, path_id, path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: upload_folders_parent_lnk; Type: TABLE DATA; Schema: public; Owner: JOY
--

COPY public.upload_folders_parent_lnk (id, folder_id, inv_folder_id, folder_ord) FROM stdin;
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 639, true);


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 714, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 2, true);


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 4, true);


--
-- Name: categories_directory_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.categories_directory_lnk_id_seq', 29, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.categories_id_seq', 27, true);


--
-- Name: categories_listing_type_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.categories_listing_type_lnk_id_seq', 18, true);


--
-- Name: categories_parent_category_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.categories_parent_category_lnk_id_seq', 1, false);


--
-- Name: components_contact_basics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_contact_basics_id_seq', 1, false);


--
-- Name: components_contact_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_contact_locations_id_seq', 1, false);


--
-- Name: components_contact_social_medias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_contact_social_medias_id_seq', 1, false);


--
-- Name: components_elements_footer_items_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_elements_footer_items_cmps_id_seq', 22, true);


--
-- Name: components_elements_footer_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_elements_footer_items_id_seq', 8, true);


--
-- Name: components_forms_contact_forms_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_forms_contact_forms_cmps_id_seq', 1, false);


--
-- Name: components_forms_contact_forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_forms_contact_forms_id_seq', 8, true);


--
-- Name: components_forms_newsletter_forms_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_forms_newsletter_forms_cmps_id_seq', 1, false);


--
-- Name: components_forms_newsletter_forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_forms_newsletter_forms_id_seq', 1, false);


--
-- Name: components_info_bank_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_info_bank_infos_id_seq', 1, false);


--
-- Name: components_media_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_media_photos_id_seq', 1, false);


--
-- Name: components_media_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_media_videos_id_seq', 1, false);


--
-- Name: components_rating_criteria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_rating_criteria_id_seq', 1, false);


--
-- Name: components_review_pro_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_review_pro_items_id_seq', 1, false);


--
-- Name: components_review_pros_cons_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_review_pros_cons_cmps_id_seq', 1, false);


--
-- Name: components_review_pros_cons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_review_pros_cons_id_seq', 1, false);


--
-- Name: components_sections_animated_logo_rows_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_animated_logo_rows_cmps_id_seq', 32, true);


--
-- Name: components_sections_animated_logo_rows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_animated_logo_rows_id_seq', 8, true);


--
-- Name: components_sections_carousels_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_carousels_cmps_id_seq', 36, true);


--
-- Name: components_sections_carousels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_carousels_id_seq', 12, true);


--
-- Name: components_sections_faqs_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_faqs_cmps_id_seq', 48, true);


--
-- Name: components_sections_faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_faqs_id_seq', 12, true);


--
-- Name: components_sections_heading_with_cta_buttons_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_heading_with_cta_buttons_cmps_id_seq', 12, true);


--
-- Name: components_sections_heading_with_cta_buttons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_heading_with_cta_buttons_id_seq', 12, true);


--
-- Name: components_sections_heroes_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_heroes_cmps_id_seq', 24, true);


--
-- Name: components_sections_heroes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_heroes_id_seq', 8, true);


--
-- Name: components_sections_horizontal_images_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_horizontal_images_cmps_id_seq', 1, false);


--
-- Name: components_sections_horizontal_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_horizontal_images_id_seq', 1, false);


--
-- Name: components_sections_image_with_cta_buttons_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_image_with_cta_buttons_cmps_id_seq', 4, true);


--
-- Name: components_sections_image_with_cta_buttons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_sections_image_with_cta_buttons_id_seq', 2, true);


--
-- Name: components_seo_utilities_meta_socials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_seo_utilities_meta_socials_id_seq', 1, false);


--
-- Name: components_seo_utilities_seo_ogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_seo_utilities_seo_ogs_id_seq', 4, true);


--
-- Name: components_seo_utilities_seo_twitters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_seo_utilities_seo_twitters_id_seq', 4, true);


--
-- Name: components_seo_utilities_seos_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_seo_utilities_seos_cmps_id_seq', 8, true);


--
-- Name: components_seo_utilities_seos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_seo_utilities_seos_id_seq', 32, true);


--
-- Name: components_seo_utilities_social_icons_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_seo_utilities_social_icons_cmps_id_seq', 1, false);


--
-- Name: components_seo_utilities_social_icons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_seo_utilities_social_icons_id_seq', 1, false);


--
-- Name: components_shared_meta_socials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_shared_meta_socials_id_seq', 1, false);


--
-- Name: components_shared_seos_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_shared_seos_cmps_id_seq', 1, false);


--
-- Name: components_shared_seos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_shared_seos_id_seq', 1, false);


--
-- Name: components_utilities_accordions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_utilities_accordions_id_seq', 48, true);


--
-- Name: components_utilities_basic_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_utilities_basic_images_id_seq', 78, true);


--
-- Name: components_utilities_ck_editor_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_utilities_ck_editor_contents_id_seq', 8, true);


--
-- Name: components_utilities_image_with_links_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_utilities_image_with_links_cmps_id_seq', 72, true);


--
-- Name: components_utilities_image_with_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_utilities_image_with_links_id_seq', 47, true);


--
-- Name: components_utilities_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_utilities_links_id_seq', 120, true);


--
-- Name: components_utilities_links_with_titles_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_utilities_links_with_titles_cmps_id_seq', 1, false);


--
-- Name: components_utilities_links_with_titles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_utilities_links_with_titles_id_seq', 1, false);


--
-- Name: components_utilities_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_utilities_texts_id_seq', 1, false);


--
-- Name: components_violation_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_violation_details_id_seq', 1, false);


--
-- Name: components_violation_evidences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_violation_evidences_id_seq', 1, false);


--
-- Name: components_violation_evidences_report_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.components_violation_evidences_report_lnk_id_seq', 1, false);


--
-- Name: directories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.directories_id_seq', 62, true);


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.files_id_seq', 20, true);


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.files_related_mph_id_seq', 78, true);


--
-- Name: footers_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.footers_cmps_id_seq', 28, true);


--
-- Name: footers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.footers_id_seq', 8, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 8, true);


--
-- Name: identities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.identities_id_seq', 1, false);


--
-- Name: items_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.items_cmps_id_seq', 6, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.items_id_seq', 7, true);


--
-- Name: items_listing_type_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.items_listing_type_lnk_id_seq', 2, true);


--
-- Name: items_related_identity_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.items_related_identity_lnk_id_seq', 1, false);


--
-- Name: listing_types_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.listing_types_cmps_id_seq', 1, false);


--
-- Name: listing_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.listing_types_id_seq', 17, true);


--
-- Name: listings_category_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.listings_category_lnk_id_seq', 1, false);


--
-- Name: listings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.listings_id_seq', 1, false);


--
-- Name: listings_item_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.listings_item_lnk_id_seq', 1, false);


--
-- Name: navbars_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.navbars_cmps_id_seq', 28, true);


--
-- Name: navbars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.navbars_id_seq', 13, true);


--
-- Name: pages_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.pages_cmps_id_seq', 106, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.pages_id_seq', 54, true);


--
-- Name: pages_parent_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.pages_parent_lnk_id_seq', 10, true);


--
-- Name: platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.platforms_id_seq', 1, false);


--
-- Name: platforms_listings_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.platforms_listings_lnk_id_seq', 1, false);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.reports_id_seq', 1, false);


--
-- Name: reports_reporter_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.reports_reporter_lnk_id_seq', 1, false);


--
-- Name: reports_review_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.reports_review_lnk_id_seq', 1, false);


--
-- Name: reports_target_identity_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.reports_target_identity_lnk_id_seq', 1, false);


--
-- Name: reports_target_item_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.reports_target_item_lnk_id_seq', 1, false);


--
-- Name: reports_target_listing_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.reports_target_listing_lnk_id_seq', 1, false);


--
-- Name: review_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.review_votes_id_seq', 1, false);


--
-- Name: review_votes_identity_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.review_votes_identity_lnk_id_seq', 1, false);


--
-- Name: review_votes_review_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.review_votes_review_lnk_id_seq', 1, false);


--
-- Name: reviews_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.reviews_cmps_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 13, true);


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 13, true);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 4, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 325, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 652, true);


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, true);


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 6, true);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);


--
-- Name: subscribers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.subscribers_id_seq', 2, true);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 62, true);


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 62, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 6, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.up_users_id_seq', 2, true);


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 2, true);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: JOY
--

SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 1, false);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: categories_directory_lnk categories_directory_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_directory_lnk
    ADD CONSTRAINT categories_directory_lnk_pkey PRIMARY KEY (id);


--
-- Name: categories_directory_lnk categories_directory_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_directory_lnk
    ADD CONSTRAINT categories_directory_lnk_uq UNIQUE (category_id, directory_id);


--
-- Name: categories_listing_type_lnk categories_listing_type_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_listing_type_lnk
    ADD CONSTRAINT categories_listing_type_lnk_pkey PRIMARY KEY (id);


--
-- Name: categories_listing_type_lnk categories_listing_type_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_listing_type_lnk
    ADD CONSTRAINT categories_listing_type_lnk_uq UNIQUE (category_id, listing_type_id);


--
-- Name: categories_parent_category_lnk categories_parent_category_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_parent_category_lnk
    ADD CONSTRAINT categories_parent_category_lnk_pkey PRIMARY KEY (id);


--
-- Name: categories_parent_category_lnk categories_parent_category_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_parent_category_lnk
    ADD CONSTRAINT categories_parent_category_lnk_uq UNIQUE (category_id, inv_category_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: components_contact_basics components_contact_basics_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_contact_basics
    ADD CONSTRAINT components_contact_basics_pkey PRIMARY KEY (id);


--
-- Name: components_contact_locations components_contact_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_contact_locations
    ADD CONSTRAINT components_contact_locations_pkey PRIMARY KEY (id);


--
-- Name: components_contact_social_medias components_contact_social_medias_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_contact_social_medias
    ADD CONSTRAINT components_contact_social_medias_pkey PRIMARY KEY (id);


--
-- Name: components_elements_footer_items_cmps components_elements_footer_items_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_elements_footer_items_cmps
    ADD CONSTRAINT components_elements_footer_items_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_elements_footer_items components_elements_footer_items_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_elements_footer_items
    ADD CONSTRAINT components_elements_footer_items_pkey PRIMARY KEY (id);


--
-- Name: components_elements_footer_items_cmps components_elements_footer_items_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_elements_footer_items_cmps
    ADD CONSTRAINT components_elements_footer_items_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_forms_contact_forms_cmps components_forms_contact_forms_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_forms_contact_forms_cmps
    ADD CONSTRAINT components_forms_contact_forms_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_forms_contact_forms components_forms_contact_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_forms_contact_forms
    ADD CONSTRAINT components_forms_contact_forms_pkey PRIMARY KEY (id);


--
-- Name: components_forms_contact_forms_cmps components_forms_contact_forms_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_forms_contact_forms_cmps
    ADD CONSTRAINT components_forms_contact_forms_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_forms_newsletter_forms_cmps components_forms_newsletter_forms_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_forms_newsletter_forms_cmps
    ADD CONSTRAINT components_forms_newsletter_forms_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_forms_newsletter_forms components_forms_newsletter_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_forms_newsletter_forms
    ADD CONSTRAINT components_forms_newsletter_forms_pkey PRIMARY KEY (id);


--
-- Name: components_forms_newsletter_forms_cmps components_forms_newsletter_forms_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_forms_newsletter_forms_cmps
    ADD CONSTRAINT components_forms_newsletter_forms_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_info_bank_infos components_info_bank_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_info_bank_infos
    ADD CONSTRAINT components_info_bank_infos_pkey PRIMARY KEY (id);


--
-- Name: components_media_photos components_media_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_media_photos
    ADD CONSTRAINT components_media_photos_pkey PRIMARY KEY (id);


--
-- Name: components_media_videos components_media_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_media_videos
    ADD CONSTRAINT components_media_videos_pkey PRIMARY KEY (id);


--
-- Name: components_rating_criteria components_rating_criteria_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_rating_criteria
    ADD CONSTRAINT components_rating_criteria_pkey PRIMARY KEY (id);


--
-- Name: components_review_pro_items components_review_pro_items_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_review_pro_items
    ADD CONSTRAINT components_review_pro_items_pkey PRIMARY KEY (id);


--
-- Name: components_review_pros_cons_cmps components_review_pros_cons_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_review_pros_cons_cmps
    ADD CONSTRAINT components_review_pros_cons_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_review_pros_cons components_review_pros_cons_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_review_pros_cons
    ADD CONSTRAINT components_review_pros_cons_pkey PRIMARY KEY (id);


--
-- Name: components_review_pros_cons_cmps components_review_pros_cons_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_review_pros_cons_cmps
    ADD CONSTRAINT components_review_pros_cons_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_sections_animated_logo_rows_cmps components_sections_animated_logo_rows_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_animated_logo_rows_cmps
    ADD CONSTRAINT components_sections_animated_logo_rows_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_sections_animated_logo_rows components_sections_animated_logo_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_animated_logo_rows
    ADD CONSTRAINT components_sections_animated_logo_rows_pkey PRIMARY KEY (id);


--
-- Name: components_sections_animated_logo_rows_cmps components_sections_animated_logo_rows_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_animated_logo_rows_cmps
    ADD CONSTRAINT components_sections_animated_logo_rows_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_sections_carousels_cmps components_sections_carousels_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_carousels_cmps
    ADD CONSTRAINT components_sections_carousels_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_sections_carousels components_sections_carousels_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_carousels
    ADD CONSTRAINT components_sections_carousels_pkey PRIMARY KEY (id);


--
-- Name: components_sections_carousels_cmps components_sections_carousels_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_carousels_cmps
    ADD CONSTRAINT components_sections_carousels_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_sections_faqs_cmps components_sections_faqs_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_faqs_cmps
    ADD CONSTRAINT components_sections_faqs_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_sections_faqs components_sections_faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_faqs
    ADD CONSTRAINT components_sections_faqs_pkey PRIMARY KEY (id);


--
-- Name: components_sections_faqs_cmps components_sections_faqs_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_faqs_cmps
    ADD CONSTRAINT components_sections_faqs_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_sections_heading_with_cta_buttons_cmps components_sections_heading_with_cta_buttons_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_heading_with_cta_buttons_cmps
    ADD CONSTRAINT components_sections_heading_with_cta_buttons_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_sections_heading_with_cta_buttons components_sections_heading_with_cta_buttons_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_heading_with_cta_buttons
    ADD CONSTRAINT components_sections_heading_with_cta_buttons_pkey PRIMARY KEY (id);


--
-- Name: components_sections_heading_with_cta_buttons_cmps components_sections_heading_with_cta_buttons_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_heading_with_cta_buttons_cmps
    ADD CONSTRAINT components_sections_heading_with_cta_buttons_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_sections_heroes_cmps components_sections_heroes_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_heroes_cmps
    ADD CONSTRAINT components_sections_heroes_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_sections_heroes components_sections_heroes_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_heroes
    ADD CONSTRAINT components_sections_heroes_pkey PRIMARY KEY (id);


--
-- Name: components_sections_heroes_cmps components_sections_heroes_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_heroes_cmps
    ADD CONSTRAINT components_sections_heroes_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_sections_horizontal_images_cmps components_sections_horizontal_images_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_horizontal_images_cmps
    ADD CONSTRAINT components_sections_horizontal_images_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_sections_horizontal_images components_sections_horizontal_images_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_horizontal_images
    ADD CONSTRAINT components_sections_horizontal_images_pkey PRIMARY KEY (id);


--
-- Name: components_sections_horizontal_images_cmps components_sections_horizontal_images_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_horizontal_images_cmps
    ADD CONSTRAINT components_sections_horizontal_images_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_sections_image_with_cta_buttons_cmps components_sections_image_with_cta_buttons_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_image_with_cta_buttons_cmps
    ADD CONSTRAINT components_sections_image_with_cta_buttons_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_sections_image_with_cta_buttons components_sections_image_with_cta_buttons_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_image_with_cta_buttons
    ADD CONSTRAINT components_sections_image_with_cta_buttons_pkey PRIMARY KEY (id);


--
-- Name: components_sections_image_with_cta_buttons_cmps components_sections_image_with_cta_buttons_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_image_with_cta_buttons_cmps
    ADD CONSTRAINT components_sections_image_with_cta_buttons_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_seo_utilities_meta_socials components_seo_utilities_meta_socials_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_meta_socials
    ADD CONSTRAINT components_seo_utilities_meta_socials_pkey PRIMARY KEY (id);


--
-- Name: components_seo_utilities_seo_ogs components_seo_utilities_seo_ogs_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_seo_ogs
    ADD CONSTRAINT components_seo_utilities_seo_ogs_pkey PRIMARY KEY (id);


--
-- Name: components_seo_utilities_seo_twitters components_seo_utilities_seo_twitters_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_seo_twitters
    ADD CONSTRAINT components_seo_utilities_seo_twitters_pkey PRIMARY KEY (id);


--
-- Name: components_seo_utilities_seos_cmps components_seo_utilities_seos_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_seos_cmps
    ADD CONSTRAINT components_seo_utilities_seos_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_seo_utilities_seos components_seo_utilities_seos_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_seos
    ADD CONSTRAINT components_seo_utilities_seos_pkey PRIMARY KEY (id);


--
-- Name: components_seo_utilities_seos_cmps components_seo_utilities_seos_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_seos_cmps
    ADD CONSTRAINT components_seo_utilities_seos_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_seo_utilities_social_icons_cmps components_seo_utilities_social_icons_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_social_icons_cmps
    ADD CONSTRAINT components_seo_utilities_social_icons_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_seo_utilities_social_icons components_seo_utilities_social_icons_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_social_icons
    ADD CONSTRAINT components_seo_utilities_social_icons_pkey PRIMARY KEY (id);


--
-- Name: components_seo_utilities_social_icons_cmps components_seo_utilities_social_icons_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_social_icons_cmps
    ADD CONSTRAINT components_seo_utilities_social_icons_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_shared_meta_socials components_shared_meta_socials_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_shared_meta_socials
    ADD CONSTRAINT components_shared_meta_socials_pkey PRIMARY KEY (id);


--
-- Name: components_shared_seos_cmps components_shared_seos_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_shared_seos_cmps
    ADD CONSTRAINT components_shared_seos_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_shared_seos components_shared_seos_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_shared_seos
    ADD CONSTRAINT components_shared_seos_pkey PRIMARY KEY (id);


--
-- Name: components_shared_seos_cmps components_shared_seos_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_shared_seos_cmps
    ADD CONSTRAINT components_shared_seos_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_utilities_accordions components_utilities_accordions_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_accordions
    ADD CONSTRAINT components_utilities_accordions_pkey PRIMARY KEY (id);


--
-- Name: components_utilities_basic_images components_utilities_basic_images_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_basic_images
    ADD CONSTRAINT components_utilities_basic_images_pkey PRIMARY KEY (id);


--
-- Name: components_utilities_ck_editor_contents components_utilities_ck_editor_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_ck_editor_contents
    ADD CONSTRAINT components_utilities_ck_editor_contents_pkey PRIMARY KEY (id);


--
-- Name: components_utilities_image_with_links_cmps components_utilities_image_with_links_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_image_with_links_cmps
    ADD CONSTRAINT components_utilities_image_with_links_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_utilities_image_with_links components_utilities_image_with_links_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_image_with_links
    ADD CONSTRAINT components_utilities_image_with_links_pkey PRIMARY KEY (id);


--
-- Name: components_utilities_image_with_links_cmps components_utilities_image_with_links_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_image_with_links_cmps
    ADD CONSTRAINT components_utilities_image_with_links_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_utilities_links components_utilities_links_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_links
    ADD CONSTRAINT components_utilities_links_pkey PRIMARY KEY (id);


--
-- Name: components_utilities_links_with_titles_cmps components_utilities_links_with_titles_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_links_with_titles_cmps
    ADD CONSTRAINT components_utilities_links_with_titles_cmps_pkey PRIMARY KEY (id);


--
-- Name: components_utilities_links_with_titles components_utilities_links_with_titles_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_links_with_titles
    ADD CONSTRAINT components_utilities_links_with_titles_pkey PRIMARY KEY (id);


--
-- Name: components_utilities_links_with_titles_cmps components_utilities_links_with_titles_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_links_with_titles_cmps
    ADD CONSTRAINT components_utilities_links_with_titles_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: components_utilities_texts components_utilities_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_texts
    ADD CONSTRAINT components_utilities_texts_pkey PRIMARY KEY (id);


--
-- Name: components_violation_details components_violation_details_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_violation_details
    ADD CONSTRAINT components_violation_details_pkey PRIMARY KEY (id);


--
-- Name: components_violation_evidences components_violation_evidences_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_violation_evidences
    ADD CONSTRAINT components_violation_evidences_pkey PRIMARY KEY (id);


--
-- Name: components_violation_evidences_report_lnk components_violation_evidences_report_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_violation_evidences_report_lnk
    ADD CONSTRAINT components_violation_evidences_report_lnk_pkey PRIMARY KEY (id);


--
-- Name: components_violation_evidences_report_lnk components_violation_evidences_report_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_violation_evidences_report_lnk
    ADD CONSTRAINT components_violation_evidences_report_lnk_uq UNIQUE (evidence_id, report_id);


--
-- Name: directories directories_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.directories
    ADD CONSTRAINT directories_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_mph files_related_mph_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);


--
-- Name: footers_cmps footers_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.footers_cmps
    ADD CONSTRAINT footers_cmps_pkey PRIMARY KEY (id);


--
-- Name: footers footers_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.footers
    ADD CONSTRAINT footers_pkey PRIMARY KEY (id);


--
-- Name: footers_cmps footers_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.footers_cmps
    ADD CONSTRAINT footers_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: items_cmps items_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_cmps
    ADD CONSTRAINT items_cmps_pkey PRIMARY KEY (id);


--
-- Name: items_listing_type_lnk items_listing_type_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_listing_type_lnk
    ADD CONSTRAINT items_listing_type_lnk_pkey PRIMARY KEY (id);


--
-- Name: items_listing_type_lnk items_listing_type_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_listing_type_lnk
    ADD CONSTRAINT items_listing_type_lnk_uq UNIQUE (item_id, listing_type_id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: items_related_identity_lnk items_related_identity_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_related_identity_lnk
    ADD CONSTRAINT items_related_identity_lnk_pkey PRIMARY KEY (id);


--
-- Name: items_related_identity_lnk items_related_identity_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_related_identity_lnk
    ADD CONSTRAINT items_related_identity_lnk_uq UNIQUE (item_id, identity_id);


--
-- Name: items_cmps items_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_cmps
    ADD CONSTRAINT items_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: listing_types_cmps listing_types_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listing_types_cmps
    ADD CONSTRAINT listing_types_cmps_pkey PRIMARY KEY (id);


--
-- Name: listing_types listing_types_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listing_types
    ADD CONSTRAINT listing_types_pkey PRIMARY KEY (id);


--
-- Name: listing_types_cmps listing_types_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listing_types_cmps
    ADD CONSTRAINT listing_types_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: listings_category_lnk listings_category_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings_category_lnk
    ADD CONSTRAINT listings_category_lnk_pkey PRIMARY KEY (id);


--
-- Name: listings_category_lnk listings_category_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings_category_lnk
    ADD CONSTRAINT listings_category_lnk_uq UNIQUE (listing_id, category_id);


--
-- Name: listings_item_lnk listings_item_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings_item_lnk
    ADD CONSTRAINT listings_item_lnk_pkey PRIMARY KEY (id);


--
-- Name: listings_item_lnk listings_item_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings_item_lnk
    ADD CONSTRAINT listings_item_lnk_uq UNIQUE (listing_id, item_id);


--
-- Name: listings listings_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings
    ADD CONSTRAINT listings_pkey PRIMARY KEY (id);


--
-- Name: navbars_cmps navbars_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.navbars_cmps
    ADD CONSTRAINT navbars_cmps_pkey PRIMARY KEY (id);


--
-- Name: navbars navbars_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.navbars
    ADD CONSTRAINT navbars_pkey PRIMARY KEY (id);


--
-- Name: navbars_cmps navbars_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.navbars_cmps
    ADD CONSTRAINT navbars_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: pages_cmps pages_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages_cmps
    ADD CONSTRAINT pages_cmps_pkey PRIMARY KEY (id);


--
-- Name: pages_parent_lnk pages_parent_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages_parent_lnk
    ADD CONSTRAINT pages_parent_lnk_pkey PRIMARY KEY (id);


--
-- Name: pages_parent_lnk pages_parent_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages_parent_lnk
    ADD CONSTRAINT pages_parent_lnk_uq UNIQUE (page_id, inv_page_id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pages_cmps pages_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages_cmps
    ADD CONSTRAINT pages_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: platforms_listings_lnk platforms_listings_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.platforms_listings_lnk
    ADD CONSTRAINT platforms_listings_lnk_pkey PRIMARY KEY (id);


--
-- Name: platforms_listings_lnk platforms_listings_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.platforms_listings_lnk
    ADD CONSTRAINT platforms_listings_lnk_uq UNIQUE (platform_id, listing_id);


--
-- Name: platforms platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: reports_reporter_lnk reports_reporter_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_reporter_lnk
    ADD CONSTRAINT reports_reporter_lnk_pkey PRIMARY KEY (id);


--
-- Name: reports_reporter_lnk reports_reporter_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_reporter_lnk
    ADD CONSTRAINT reports_reporter_lnk_uq UNIQUE (report_id, identity_id);


--
-- Name: reports_review_lnk reports_review_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_review_lnk
    ADD CONSTRAINT reports_review_lnk_pkey PRIMARY KEY (id);


--
-- Name: reports_review_lnk reports_review_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_review_lnk
    ADD CONSTRAINT reports_review_lnk_uq UNIQUE (report_id, review_id);


--
-- Name: reports_target_identity_lnk reports_target_identity_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_identity_lnk
    ADD CONSTRAINT reports_target_identity_lnk_pkey PRIMARY KEY (id);


--
-- Name: reports_target_identity_lnk reports_target_identity_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_identity_lnk
    ADD CONSTRAINT reports_target_identity_lnk_uq UNIQUE (report_id, identity_id);


--
-- Name: reports_target_item_lnk reports_target_item_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_item_lnk
    ADD CONSTRAINT reports_target_item_lnk_pkey PRIMARY KEY (id);


--
-- Name: reports_target_item_lnk reports_target_item_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_item_lnk
    ADD CONSTRAINT reports_target_item_lnk_uq UNIQUE (report_id, item_id);


--
-- Name: reports_target_listing_lnk reports_target_listing_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_listing_lnk
    ADD CONSTRAINT reports_target_listing_lnk_pkey PRIMARY KEY (id);


--
-- Name: reports_target_listing_lnk reports_target_listing_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_listing_lnk
    ADD CONSTRAINT reports_target_listing_lnk_uq UNIQUE (report_id, listing_id);


--
-- Name: review_votes_identity_lnk review_votes_identity_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes_identity_lnk
    ADD CONSTRAINT review_votes_identity_lnk_pkey PRIMARY KEY (id);


--
-- Name: review_votes_identity_lnk review_votes_identity_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes_identity_lnk
    ADD CONSTRAINT review_votes_identity_lnk_uq UNIQUE (review_vote_id, identity_id);


--
-- Name: review_votes review_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes
    ADD CONSTRAINT review_votes_pkey PRIMARY KEY (id);


--
-- Name: review_votes_review_lnk review_votes_review_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes_review_lnk
    ADD CONSTRAINT review_votes_review_lnk_pkey PRIMARY KEY (id);


--
-- Name: review_votes_review_lnk review_votes_review_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes_review_lnk
    ADD CONSTRAINT review_votes_review_lnk_uq UNIQUE (review_vote_id, review_id);


--
-- Name: reviews_cmps reviews_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reviews_cmps
    ADD CONSTRAINT reviews_cmps_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: reviews_cmps reviews_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reviews_cmps
    ADD CONSTRAINT reviews_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_history_versions strapi_history_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations_internal strapi_migrations_internal_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);


--
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows strapi_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq UNIQUE (workflow_id, workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);


--
-- Name: strapi_workflows_stages strapi_workflows_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);


--
-- Name: subscribers subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);


--
-- Name: admin_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);


--
-- Name: admin_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);


--
-- Name: admin_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);


--
-- Name: admin_users_roles_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);


--
-- Name: admin_users_roles_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);


--
-- Name: admin_users_roles_lnk_ofk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);


--
-- Name: admin_users_roles_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: categories_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX categories_created_by_id_fk ON public.categories USING btree (created_by_id);


--
-- Name: categories_directory_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX categories_directory_lnk_fk ON public.categories_directory_lnk USING btree (category_id);


--
-- Name: categories_directory_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX categories_directory_lnk_ifk ON public.categories_directory_lnk USING btree (directory_id);


--
-- Name: categories_directory_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX categories_directory_lnk_oifk ON public.categories_directory_lnk USING btree (category_ord);


--
-- Name: categories_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX categories_documents_idx ON public.categories USING btree (document_id, locale, published_at);


--
-- Name: categories_listing_type_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX categories_listing_type_lnk_fk ON public.categories_listing_type_lnk USING btree (category_id);


--
-- Name: categories_listing_type_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX categories_listing_type_lnk_ifk ON public.categories_listing_type_lnk USING btree (listing_type_id);


--
-- Name: categories_listing_type_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX categories_listing_type_lnk_oifk ON public.categories_listing_type_lnk USING btree (category_ord);


--
-- Name: categories_parent_category_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX categories_parent_category_lnk_fk ON public.categories_parent_category_lnk USING btree (category_id);


--
-- Name: categories_parent_category_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX categories_parent_category_lnk_ifk ON public.categories_parent_category_lnk USING btree (inv_category_id);


--
-- Name: categories_parent_category_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX categories_parent_category_lnk_oifk ON public.categories_parent_category_lnk USING btree (category_ord);


--
-- Name: categories_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX categories_updated_by_id_fk ON public.categories USING btree (updated_by_id);


--
-- Name: components_elements_footer_items_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_elements_footer_items_component_type_idx ON public.components_elements_footer_items_cmps USING btree (component_type);


--
-- Name: components_elements_footer_items_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_elements_footer_items_entity_fk ON public.components_elements_footer_items_cmps USING btree (entity_id);


--
-- Name: components_elements_footer_items_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_elements_footer_items_field_idx ON public.components_elements_footer_items_cmps USING btree (field);


--
-- Name: components_forms_contact_forms_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_forms_contact_forms_component_type_idx ON public.components_forms_contact_forms_cmps USING btree (component_type);


--
-- Name: components_forms_contact_forms_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_forms_contact_forms_entity_fk ON public.components_forms_contact_forms_cmps USING btree (entity_id);


--
-- Name: components_forms_contact_forms_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_forms_contact_forms_field_idx ON public.components_forms_contact_forms_cmps USING btree (field);


--
-- Name: components_forms_newsletter_forms_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_forms_newsletter_forms_component_type_idx ON public.components_forms_newsletter_forms_cmps USING btree (component_type);


--
-- Name: components_forms_newsletter_forms_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_forms_newsletter_forms_entity_fk ON public.components_forms_newsletter_forms_cmps USING btree (entity_id);


--
-- Name: components_forms_newsletter_forms_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_forms_newsletter_forms_field_idx ON public.components_forms_newsletter_forms_cmps USING btree (field);


--
-- Name: components_review_pros_cons_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_review_pros_cons_component_type_idx ON public.components_review_pros_cons_cmps USING btree (component_type);


--
-- Name: components_review_pros_cons_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_review_pros_cons_entity_fk ON public.components_review_pros_cons_cmps USING btree (entity_id);


--
-- Name: components_review_pros_cons_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_review_pros_cons_field_idx ON public.components_review_pros_cons_cmps USING btree (field);


--
-- Name: components_sections_animated_lofcbcf_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_animated_lofcbcf_component_type_idx ON public.components_sections_animated_logo_rows_cmps USING btree (component_type);


--
-- Name: components_sections_animated_logo_rows_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_animated_logo_rows_entity_fk ON public.components_sections_animated_logo_rows_cmps USING btree (entity_id);


--
-- Name: components_sections_animated_logo_rows_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_animated_logo_rows_field_idx ON public.components_sections_animated_logo_rows_cmps USING btree (field);


--
-- Name: components_sections_carousels_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_carousels_component_type_idx ON public.components_sections_carousels_cmps USING btree (component_type);


--
-- Name: components_sections_carousels_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_carousels_entity_fk ON public.components_sections_carousels_cmps USING btree (entity_id);


--
-- Name: components_sections_carousels_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_carousels_field_idx ON public.components_sections_carousels_cmps USING btree (field);


--
-- Name: components_sections_faqs_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_faqs_component_type_idx ON public.components_sections_faqs_cmps USING btree (component_type);


--
-- Name: components_sections_faqs_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_faqs_entity_fk ON public.components_sections_faqs_cmps USING btree (entity_id);


--
-- Name: components_sections_faqs_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_faqs_field_idx ON public.components_sections_faqs_cmps USING btree (field);


--
-- Name: components_sections_heading_wit3fa0d_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_heading_wit3fa0d_component_type_idx ON public.components_sections_heading_with_cta_buttons_cmps USING btree (component_type);


--
-- Name: components_sections_heading_with_cta_buttons_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_heading_with_cta_buttons_entity_fk ON public.components_sections_heading_with_cta_buttons_cmps USING btree (entity_id);


--
-- Name: components_sections_heading_with_cta_buttons_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_heading_with_cta_buttons_field_idx ON public.components_sections_heading_with_cta_buttons_cmps USING btree (field);


--
-- Name: components_sections_heroes_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_heroes_component_type_idx ON public.components_sections_heroes_cmps USING btree (component_type);


--
-- Name: components_sections_heroes_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_heroes_entity_fk ON public.components_sections_heroes_cmps USING btree (entity_id);


--
-- Name: components_sections_heroes_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_heroes_field_idx ON public.components_sections_heroes_cmps USING btree (field);


--
-- Name: components_sections_horizontal_1685d_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_horizontal_1685d_component_type_idx ON public.components_sections_horizontal_images_cmps USING btree (component_type);


--
-- Name: components_sections_horizontal_images_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_horizontal_images_entity_fk ON public.components_sections_horizontal_images_cmps USING btree (entity_id);


--
-- Name: components_sections_horizontal_images_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_horizontal_images_field_idx ON public.components_sections_horizontal_images_cmps USING btree (field);


--
-- Name: components_sections_image_with_7e8fc_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_image_with_7e8fc_component_type_idx ON public.components_sections_image_with_cta_buttons_cmps USING btree (component_type);


--
-- Name: components_sections_image_with_cta_buttons_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_image_with_cta_buttons_entity_fk ON public.components_sections_image_with_cta_buttons_cmps USING btree (entity_id);


--
-- Name: components_sections_image_with_cta_buttons_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_sections_image_with_cta_buttons_field_idx ON public.components_sections_image_with_cta_buttons_cmps USING btree (field);


--
-- Name: components_seo_utilities_seos_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_seo_utilities_seos_component_type_idx ON public.components_seo_utilities_seos_cmps USING btree (component_type);


--
-- Name: components_seo_utilities_seos_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_seo_utilities_seos_entity_fk ON public.components_seo_utilities_seos_cmps USING btree (entity_id);


--
-- Name: components_seo_utilities_seos_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_seo_utilities_seos_field_idx ON public.components_seo_utilities_seos_cmps USING btree (field);


--
-- Name: components_seo_utilities_social_icons_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_seo_utilities_social_icons_entity_fk ON public.components_seo_utilities_social_icons_cmps USING btree (entity_id);


--
-- Name: components_seo_utilities_social_icons_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_seo_utilities_social_icons_field_idx ON public.components_seo_utilities_social_icons_cmps USING btree (field);


--
-- Name: components_seo_utilities_sociale6b11_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_seo_utilities_sociale6b11_component_type_idx ON public.components_seo_utilities_social_icons_cmps USING btree (component_type);


--
-- Name: components_shared_seos_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_shared_seos_component_type_idx ON public.components_shared_seos_cmps USING btree (component_type);


--
-- Name: components_shared_seos_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_shared_seos_entity_fk ON public.components_shared_seos_cmps USING btree (entity_id);


--
-- Name: components_shared_seos_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_shared_seos_field_idx ON public.components_shared_seos_cmps USING btree (field);


--
-- Name: components_utilities_image_with37a81_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_utilities_image_with37a81_component_type_idx ON public.components_utilities_image_with_links_cmps USING btree (component_type);


--
-- Name: components_utilities_image_with_links_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_utilities_image_with_links_entity_fk ON public.components_utilities_image_with_links_cmps USING btree (entity_id);


--
-- Name: components_utilities_image_with_links_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_utilities_image_with_links_field_idx ON public.components_utilities_image_with_links_cmps USING btree (field);


--
-- Name: components_utilities_links_with_titles_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_utilities_links_with_titles_entity_fk ON public.components_utilities_links_with_titles_cmps USING btree (entity_id);


--
-- Name: components_utilities_links_with_titles_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_utilities_links_with_titles_field_idx ON public.components_utilities_links_with_titles_cmps USING btree (field);


--
-- Name: components_utilities_links_withe4603_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_utilities_links_withe4603_component_type_idx ON public.components_utilities_links_with_titles_cmps USING btree (component_type);


--
-- Name: components_violation_evidences_report_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_violation_evidences_report_lnk_fk ON public.components_violation_evidences_report_lnk USING btree (evidence_id);


--
-- Name: components_violation_evidences_report_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX components_violation_evidences_report_lnk_ifk ON public.components_violation_evidences_report_lnk USING btree (report_id);


--
-- Name: directories_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX directories_created_by_id_fk ON public.directories USING btree (created_by_id);


--
-- Name: directories_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX directories_documents_idx ON public.directories USING btree (document_id, locale, published_at);


--
-- Name: directories_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX directories_updated_by_id_fk ON public.directories USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);


--
-- Name: files_folder_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);


--
-- Name: files_folder_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);


--
-- Name: files_folder_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);


--
-- Name: files_related_mph_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);


--
-- Name: files_related_mph_idix; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);


--
-- Name: files_related_mph_oidx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: footers_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX footers_component_type_idx ON public.footers_cmps USING btree (component_type);


--
-- Name: footers_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX footers_created_by_id_fk ON public.footers USING btree (created_by_id);


--
-- Name: footers_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX footers_documents_idx ON public.footers USING btree (document_id, locale, published_at);


--
-- Name: footers_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX footers_entity_fk ON public.footers_cmps USING btree (entity_id);


--
-- Name: footers_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX footers_field_idx ON public.footers_cmps USING btree (field);


--
-- Name: footers_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX footers_updated_by_id_fk ON public.footers USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: identities_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX identities_created_by_id_fk ON public.identities USING btree (created_by_id);


--
-- Name: identities_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX identities_documents_idx ON public.identities USING btree (document_id, locale, published_at);


--
-- Name: identities_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX identities_updated_by_id_fk ON public.identities USING btree (updated_by_id);


--
-- Name: items_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX items_component_type_idx ON public.items_cmps USING btree (component_type);


--
-- Name: items_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX items_created_by_id_fk ON public.items USING btree (created_by_id);


--
-- Name: items_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX items_documents_idx ON public.items USING btree (document_id, locale, published_at);


--
-- Name: items_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX items_entity_fk ON public.items_cmps USING btree (entity_id);


--
-- Name: items_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX items_field_idx ON public.items_cmps USING btree (field);


--
-- Name: items_listing_type_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX items_listing_type_lnk_fk ON public.items_listing_type_lnk USING btree (item_id);


--
-- Name: items_listing_type_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX items_listing_type_lnk_ifk ON public.items_listing_type_lnk USING btree (listing_type_id);


--
-- Name: items_related_identity_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX items_related_identity_lnk_fk ON public.items_related_identity_lnk USING btree (item_id);


--
-- Name: items_related_identity_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX items_related_identity_lnk_ifk ON public.items_related_identity_lnk USING btree (identity_id);


--
-- Name: items_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX items_updated_by_id_fk ON public.items USING btree (updated_by_id);


--
-- Name: listing_types_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listing_types_component_type_idx ON public.listing_types_cmps USING btree (component_type);


--
-- Name: listing_types_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listing_types_created_by_id_fk ON public.listing_types USING btree (created_by_id);


--
-- Name: listing_types_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listing_types_documents_idx ON public.listing_types USING btree (document_id, locale, published_at);


--
-- Name: listing_types_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listing_types_entity_fk ON public.listing_types_cmps USING btree (entity_id);


--
-- Name: listing_types_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listing_types_field_idx ON public.listing_types_cmps USING btree (field);


--
-- Name: listing_types_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listing_types_updated_by_id_fk ON public.listing_types USING btree (updated_by_id);


--
-- Name: listings_category_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listings_category_lnk_fk ON public.listings_category_lnk USING btree (listing_id);


--
-- Name: listings_category_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listings_category_lnk_ifk ON public.listings_category_lnk USING btree (category_id);


--
-- Name: listings_category_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listings_category_lnk_oifk ON public.listings_category_lnk USING btree (listing_ord);


--
-- Name: listings_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listings_created_by_id_fk ON public.listings USING btree (created_by_id);


--
-- Name: listings_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listings_documents_idx ON public.listings USING btree (document_id, locale, published_at);


--
-- Name: listings_item_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listings_item_lnk_fk ON public.listings_item_lnk USING btree (listing_id);


--
-- Name: listings_item_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listings_item_lnk_ifk ON public.listings_item_lnk USING btree (item_id);


--
-- Name: listings_item_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listings_item_lnk_oifk ON public.listings_item_lnk USING btree (listing_ord);


--
-- Name: listings_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX listings_updated_by_id_fk ON public.listings USING btree (updated_by_id);


--
-- Name: navbars_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX navbars_component_type_idx ON public.navbars_cmps USING btree (component_type);


--
-- Name: navbars_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX navbars_created_by_id_fk ON public.navbars USING btree (created_by_id);


--
-- Name: navbars_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX navbars_documents_idx ON public.navbars USING btree (document_id, locale, published_at);


--
-- Name: navbars_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX navbars_entity_fk ON public.navbars_cmps USING btree (entity_id);


--
-- Name: navbars_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX navbars_field_idx ON public.navbars_cmps USING btree (field);


--
-- Name: navbars_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX navbars_updated_by_id_fk ON public.navbars USING btree (updated_by_id);


--
-- Name: pages_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX pages_component_type_idx ON public.pages_cmps USING btree (component_type);


--
-- Name: pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX pages_created_by_id_fk ON public.pages USING btree (created_by_id);


--
-- Name: pages_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX pages_documents_idx ON public.pages USING btree (document_id, locale, published_at);


--
-- Name: pages_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX pages_entity_fk ON public.pages_cmps USING btree (entity_id);


--
-- Name: pages_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX pages_field_idx ON public.pages_cmps USING btree (field);


--
-- Name: pages_parent_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX pages_parent_lnk_fk ON public.pages_parent_lnk USING btree (page_id);


--
-- Name: pages_parent_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX pages_parent_lnk_ifk ON public.pages_parent_lnk USING btree (inv_page_id);


--
-- Name: pages_parent_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX pages_parent_lnk_oifk ON public.pages_parent_lnk USING btree (page_ord);


--
-- Name: pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX pages_updated_by_id_fk ON public.pages USING btree (updated_by_id);


--
-- Name: platforms_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX platforms_created_by_id_fk ON public.platforms USING btree (created_by_id);


--
-- Name: platforms_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX platforms_documents_idx ON public.platforms USING btree (document_id, locale, published_at);


--
-- Name: platforms_listings_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX platforms_listings_lnk_fk ON public.platforms_listings_lnk USING btree (platform_id);


--
-- Name: platforms_listings_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX platforms_listings_lnk_ifk ON public.platforms_listings_lnk USING btree (listing_id);


--
-- Name: platforms_listings_lnk_ofk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX platforms_listings_lnk_ofk ON public.platforms_listings_lnk USING btree (listing_ord);


--
-- Name: platforms_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX platforms_updated_by_id_fk ON public.platforms USING btree (updated_by_id);


--
-- Name: reports_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_created_by_id_fk ON public.reports USING btree (created_by_id);


--
-- Name: reports_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_documents_idx ON public.reports USING btree (document_id, locale, published_at);


--
-- Name: reports_reporter_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_reporter_lnk_fk ON public.reports_reporter_lnk USING btree (report_id);


--
-- Name: reports_reporter_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_reporter_lnk_ifk ON public.reports_reporter_lnk USING btree (identity_id);


--
-- Name: reports_reporter_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_reporter_lnk_oifk ON public.reports_reporter_lnk USING btree (report_ord);


--
-- Name: reports_review_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_review_lnk_fk ON public.reports_review_lnk USING btree (report_id);


--
-- Name: reports_review_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_review_lnk_ifk ON public.reports_review_lnk USING btree (review_id);


--
-- Name: reports_review_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_review_lnk_oifk ON public.reports_review_lnk USING btree (report_ord);


--
-- Name: reports_target_identity_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_target_identity_lnk_fk ON public.reports_target_identity_lnk USING btree (report_id);


--
-- Name: reports_target_identity_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_target_identity_lnk_ifk ON public.reports_target_identity_lnk USING btree (identity_id);


--
-- Name: reports_target_identity_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_target_identity_lnk_oifk ON public.reports_target_identity_lnk USING btree (report_ord);


--
-- Name: reports_target_item_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_target_item_lnk_fk ON public.reports_target_item_lnk USING btree (report_id);


--
-- Name: reports_target_item_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_target_item_lnk_ifk ON public.reports_target_item_lnk USING btree (item_id);


--
-- Name: reports_target_item_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_target_item_lnk_oifk ON public.reports_target_item_lnk USING btree (report_ord);


--
-- Name: reports_target_listing_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_target_listing_lnk_fk ON public.reports_target_listing_lnk USING btree (report_id);


--
-- Name: reports_target_listing_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_target_listing_lnk_ifk ON public.reports_target_listing_lnk USING btree (listing_id);


--
-- Name: reports_target_listing_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_target_listing_lnk_oifk ON public.reports_target_listing_lnk USING btree (report_ord);


--
-- Name: reports_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reports_updated_by_id_fk ON public.reports USING btree (updated_by_id);


--
-- Name: review_votes_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX review_votes_created_by_id_fk ON public.review_votes USING btree (created_by_id);


--
-- Name: review_votes_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX review_votes_documents_idx ON public.review_votes USING btree (document_id, locale, published_at);


--
-- Name: review_votes_identity_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX review_votes_identity_lnk_fk ON public.review_votes_identity_lnk USING btree (review_vote_id);


--
-- Name: review_votes_identity_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX review_votes_identity_lnk_ifk ON public.review_votes_identity_lnk USING btree (identity_id);


--
-- Name: review_votes_review_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX review_votes_review_lnk_fk ON public.review_votes_review_lnk USING btree (review_vote_id);


--
-- Name: review_votes_review_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX review_votes_review_lnk_ifk ON public.review_votes_review_lnk USING btree (review_id);


--
-- Name: review_votes_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX review_votes_updated_by_id_fk ON public.review_votes USING btree (updated_by_id);


--
-- Name: reviews_component_type_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reviews_component_type_idx ON public.reviews_cmps USING btree (component_type);


--
-- Name: reviews_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reviews_created_by_id_fk ON public.reviews USING btree (created_by_id);


--
-- Name: reviews_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reviews_documents_idx ON public.reviews USING btree (document_id, locale, published_at);


--
-- Name: reviews_entity_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reviews_entity_fk ON public.reviews_cmps USING btree (entity_id);


--
-- Name: reviews_field_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reviews_field_idx ON public.reviews_cmps USING btree (field);


--
-- Name: reviews_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX reviews_updated_by_id_fk ON public.reviews USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_history_versions_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);


--
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- Name: strapi_release_actions_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);


--
-- Name: strapi_release_actions_release_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);


--
-- Name: strapi_release_actions_release_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);


--
-- Name: strapi_release_actions_release_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);


--
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- Name: strapi_releases_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);


--
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: strapi_workflows_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);


--
-- Name: strapi_workflows_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_fk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_ifk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);


--
-- Name: strapi_workflows_stages_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stages_permissions_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ofk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);


--
-- Name: strapi_workflows_stages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);


--
-- Name: strapi_workflows_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);


--
-- Name: subscribers_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX subscribers_created_by_id_fk ON public.subscribers USING btree (created_by_id);


--
-- Name: subscribers_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX subscribers_documents_idx ON public.subscribers USING btree (document_id, locale, published_at);


--
-- Name: subscribers_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX subscribers_updated_by_id_fk ON public.subscribers USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);


--
-- Name: up_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);


--
-- Name: up_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);


--
-- Name: up_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);


--
-- Name: up_users_role_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);


--
-- Name: up_users_role_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);


--
-- Name: up_users_role_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_documents_idx; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);


--
-- Name: upload_folders_parent_lnk_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);


--
-- Name: upload_folders_parent_lnk_ifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_lnk_oifk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: JOY
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories categories_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories_directory_lnk categories_directory_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_directory_lnk
    ADD CONSTRAINT categories_directory_lnk_fk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: categories_directory_lnk categories_directory_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_directory_lnk
    ADD CONSTRAINT categories_directory_lnk_ifk FOREIGN KEY (directory_id) REFERENCES public.directories(id) ON DELETE CASCADE;


--
-- Name: categories_listing_type_lnk categories_listing_type_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_listing_type_lnk
    ADD CONSTRAINT categories_listing_type_lnk_fk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: categories_listing_type_lnk categories_listing_type_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_listing_type_lnk
    ADD CONSTRAINT categories_listing_type_lnk_ifk FOREIGN KEY (listing_type_id) REFERENCES public.listing_types(id) ON DELETE CASCADE;


--
-- Name: categories_parent_category_lnk categories_parent_category_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_parent_category_lnk
    ADD CONSTRAINT categories_parent_category_lnk_fk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: categories_parent_category_lnk categories_parent_category_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories_parent_category_lnk
    ADD CONSTRAINT categories_parent_category_lnk_ifk FOREIGN KEY (inv_category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: categories categories_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: components_elements_footer_items_cmps components_elements_footer_items_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_elements_footer_items_cmps
    ADD CONSTRAINT components_elements_footer_items_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_elements_footer_items(id) ON DELETE CASCADE;


--
-- Name: components_forms_contact_forms_cmps components_forms_contact_forms_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_forms_contact_forms_cmps
    ADD CONSTRAINT components_forms_contact_forms_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_forms_contact_forms(id) ON DELETE CASCADE;


--
-- Name: components_forms_newsletter_forms_cmps components_forms_newsletter_forms_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_forms_newsletter_forms_cmps
    ADD CONSTRAINT components_forms_newsletter_forms_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_forms_newsletter_forms(id) ON DELETE CASCADE;


--
-- Name: components_review_pros_cons_cmps components_review_pros_cons_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_review_pros_cons_cmps
    ADD CONSTRAINT components_review_pros_cons_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_review_pros_cons(id) ON DELETE CASCADE;


--
-- Name: components_sections_animated_logo_rows_cmps components_sections_animated_logo_rows_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_animated_logo_rows_cmps
    ADD CONSTRAINT components_sections_animated_logo_rows_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_sections_animated_logo_rows(id) ON DELETE CASCADE;


--
-- Name: components_sections_carousels_cmps components_sections_carousels_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_carousels_cmps
    ADD CONSTRAINT components_sections_carousels_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_sections_carousels(id) ON DELETE CASCADE;


--
-- Name: components_sections_faqs_cmps components_sections_faqs_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_faqs_cmps
    ADD CONSTRAINT components_sections_faqs_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_sections_faqs(id) ON DELETE CASCADE;


--
-- Name: components_sections_heading_with_cta_buttons_cmps components_sections_heading_with_cta_buttons_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_heading_with_cta_buttons_cmps
    ADD CONSTRAINT components_sections_heading_with_cta_buttons_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_sections_heading_with_cta_buttons(id) ON DELETE CASCADE;


--
-- Name: components_sections_heroes_cmps components_sections_heroes_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_heroes_cmps
    ADD CONSTRAINT components_sections_heroes_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_sections_heroes(id) ON DELETE CASCADE;


--
-- Name: components_sections_horizontal_images_cmps components_sections_horizontal_images_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_horizontal_images_cmps
    ADD CONSTRAINT components_sections_horizontal_images_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_sections_horizontal_images(id) ON DELETE CASCADE;


--
-- Name: components_sections_image_with_cta_buttons_cmps components_sections_image_with_cta_buttons_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_sections_image_with_cta_buttons_cmps
    ADD CONSTRAINT components_sections_image_with_cta_buttons_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_sections_image_with_cta_buttons(id) ON DELETE CASCADE;


--
-- Name: components_seo_utilities_seos_cmps components_seo_utilities_seos_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_seos_cmps
    ADD CONSTRAINT components_seo_utilities_seos_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_seo_utilities_seos(id) ON DELETE CASCADE;


--
-- Name: components_seo_utilities_social_icons_cmps components_seo_utilities_social_icons_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_seo_utilities_social_icons_cmps
    ADD CONSTRAINT components_seo_utilities_social_icons_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_seo_utilities_social_icons(id) ON DELETE CASCADE;


--
-- Name: components_shared_seos_cmps components_shared_seos_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_shared_seos_cmps
    ADD CONSTRAINT components_shared_seos_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_shared_seos(id) ON DELETE CASCADE;


--
-- Name: components_utilities_image_with_links_cmps components_utilities_image_with_links_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_image_with_links_cmps
    ADD CONSTRAINT components_utilities_image_with_links_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_utilities_image_with_links(id) ON DELETE CASCADE;


--
-- Name: components_utilities_links_with_titles_cmps components_utilities_links_with_titles_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_utilities_links_with_titles_cmps
    ADD CONSTRAINT components_utilities_links_with_titles_entity_fk FOREIGN KEY (entity_id) REFERENCES public.components_utilities_links_with_titles(id) ON DELETE CASCADE;


--
-- Name: components_violation_evidences_report_lnk components_violation_evidences_report_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_violation_evidences_report_lnk
    ADD CONSTRAINT components_violation_evidences_report_lnk_fk FOREIGN KEY (evidence_id) REFERENCES public.components_violation_evidences(id) ON DELETE CASCADE;


--
-- Name: components_violation_evidences_report_lnk components_violation_evidences_report_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.components_violation_evidences_report_lnk
    ADD CONSTRAINT components_violation_evidences_report_lnk_ifk FOREIGN KEY (report_id) REFERENCES public.reports(id) ON DELETE CASCADE;


--
-- Name: directories directories_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.directories
    ADD CONSTRAINT directories_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: directories directories_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.directories
    ADD CONSTRAINT directories_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_lnk files_folder_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_lnk files_folder_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_mph files_related_mph_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: footers footers_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.footers
    ADD CONSTRAINT footers_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: footers_cmps footers_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.footers_cmps
    ADD CONSTRAINT footers_entity_fk FOREIGN KEY (entity_id) REFERENCES public.footers(id) ON DELETE CASCADE;


--
-- Name: footers footers_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.footers
    ADD CONSTRAINT footers_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: identities identities_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: identities identities_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: items items_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: items_cmps items_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_cmps
    ADD CONSTRAINT items_entity_fk FOREIGN KEY (entity_id) REFERENCES public.items(id) ON DELETE CASCADE;


--
-- Name: items_listing_type_lnk items_listing_type_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_listing_type_lnk
    ADD CONSTRAINT items_listing_type_lnk_fk FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE CASCADE;


--
-- Name: items_listing_type_lnk items_listing_type_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_listing_type_lnk
    ADD CONSTRAINT items_listing_type_lnk_ifk FOREIGN KEY (listing_type_id) REFERENCES public.listing_types(id) ON DELETE CASCADE;


--
-- Name: items_related_identity_lnk items_related_identity_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_related_identity_lnk
    ADD CONSTRAINT items_related_identity_lnk_fk FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE CASCADE;


--
-- Name: items_related_identity_lnk items_related_identity_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items_related_identity_lnk
    ADD CONSTRAINT items_related_identity_lnk_ifk FOREIGN KEY (identity_id) REFERENCES public.identities(id) ON DELETE CASCADE;


--
-- Name: items items_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: listing_types listing_types_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listing_types
    ADD CONSTRAINT listing_types_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: listing_types_cmps listing_types_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listing_types_cmps
    ADD CONSTRAINT listing_types_entity_fk FOREIGN KEY (entity_id) REFERENCES public.listing_types(id) ON DELETE CASCADE;


--
-- Name: listing_types listing_types_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listing_types
    ADD CONSTRAINT listing_types_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: listings_category_lnk listings_category_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings_category_lnk
    ADD CONSTRAINT listings_category_lnk_fk FOREIGN KEY (listing_id) REFERENCES public.listings(id) ON DELETE CASCADE;


--
-- Name: listings_category_lnk listings_category_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings_category_lnk
    ADD CONSTRAINT listings_category_lnk_ifk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: listings listings_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings
    ADD CONSTRAINT listings_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: listings_item_lnk listings_item_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings_item_lnk
    ADD CONSTRAINT listings_item_lnk_fk FOREIGN KEY (listing_id) REFERENCES public.listings(id) ON DELETE CASCADE;


--
-- Name: listings_item_lnk listings_item_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings_item_lnk
    ADD CONSTRAINT listings_item_lnk_ifk FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE CASCADE;


--
-- Name: listings listings_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.listings
    ADD CONSTRAINT listings_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: navbars navbars_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.navbars
    ADD CONSTRAINT navbars_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: navbars_cmps navbars_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.navbars_cmps
    ADD CONSTRAINT navbars_entity_fk FOREIGN KEY (entity_id) REFERENCES public.navbars(id) ON DELETE CASCADE;


--
-- Name: navbars navbars_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.navbars
    ADD CONSTRAINT navbars_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: pages pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: pages_cmps pages_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages_cmps
    ADD CONSTRAINT pages_entity_fk FOREIGN KEY (entity_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_parent_lnk pages_parent_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages_parent_lnk
    ADD CONSTRAINT pages_parent_lnk_fk FOREIGN KEY (page_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_parent_lnk pages_parent_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages_parent_lnk
    ADD CONSTRAINT pages_parent_lnk_ifk FOREIGN KEY (inv_page_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: platforms platforms_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: platforms_listings_lnk platforms_listings_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.platforms_listings_lnk
    ADD CONSTRAINT platforms_listings_lnk_fk FOREIGN KEY (platform_id) REFERENCES public.platforms(id) ON DELETE CASCADE;


--
-- Name: platforms_listings_lnk platforms_listings_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.platforms_listings_lnk
    ADD CONSTRAINT platforms_listings_lnk_ifk FOREIGN KEY (listing_id) REFERENCES public.listings(id) ON DELETE CASCADE;


--
-- Name: platforms platforms_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: reports reports_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: reports_reporter_lnk reports_reporter_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_reporter_lnk
    ADD CONSTRAINT reports_reporter_lnk_fk FOREIGN KEY (report_id) REFERENCES public.reports(id) ON DELETE CASCADE;


--
-- Name: reports_reporter_lnk reports_reporter_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_reporter_lnk
    ADD CONSTRAINT reports_reporter_lnk_ifk FOREIGN KEY (identity_id) REFERENCES public.identities(id) ON DELETE CASCADE;


--
-- Name: reports_review_lnk reports_review_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_review_lnk
    ADD CONSTRAINT reports_review_lnk_fk FOREIGN KEY (report_id) REFERENCES public.reports(id) ON DELETE CASCADE;


--
-- Name: reports_review_lnk reports_review_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_review_lnk
    ADD CONSTRAINT reports_review_lnk_ifk FOREIGN KEY (review_id) REFERENCES public.reviews(id) ON DELETE CASCADE;


--
-- Name: reports_target_identity_lnk reports_target_identity_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_identity_lnk
    ADD CONSTRAINT reports_target_identity_lnk_fk FOREIGN KEY (report_id) REFERENCES public.reports(id) ON DELETE CASCADE;


--
-- Name: reports_target_identity_lnk reports_target_identity_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_identity_lnk
    ADD CONSTRAINT reports_target_identity_lnk_ifk FOREIGN KEY (identity_id) REFERENCES public.identities(id) ON DELETE CASCADE;


--
-- Name: reports_target_item_lnk reports_target_item_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_item_lnk
    ADD CONSTRAINT reports_target_item_lnk_fk FOREIGN KEY (report_id) REFERENCES public.reports(id) ON DELETE CASCADE;


--
-- Name: reports_target_item_lnk reports_target_item_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_item_lnk
    ADD CONSTRAINT reports_target_item_lnk_ifk FOREIGN KEY (item_id) REFERENCES public.items(id) ON DELETE CASCADE;


--
-- Name: reports_target_listing_lnk reports_target_listing_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_listing_lnk
    ADD CONSTRAINT reports_target_listing_lnk_fk FOREIGN KEY (report_id) REFERENCES public.reports(id) ON DELETE CASCADE;


--
-- Name: reports_target_listing_lnk reports_target_listing_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports_target_listing_lnk
    ADD CONSTRAINT reports_target_listing_lnk_ifk FOREIGN KEY (listing_id) REFERENCES public.listings(id) ON DELETE CASCADE;


--
-- Name: reports reports_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: review_votes review_votes_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes
    ADD CONSTRAINT review_votes_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: review_votes_identity_lnk review_votes_identity_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes_identity_lnk
    ADD CONSTRAINT review_votes_identity_lnk_fk FOREIGN KEY (review_vote_id) REFERENCES public.review_votes(id) ON DELETE CASCADE;


--
-- Name: review_votes_identity_lnk review_votes_identity_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes_identity_lnk
    ADD CONSTRAINT review_votes_identity_lnk_ifk FOREIGN KEY (identity_id) REFERENCES public.identities(id) ON DELETE CASCADE;


--
-- Name: review_votes_review_lnk review_votes_review_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes_review_lnk
    ADD CONSTRAINT review_votes_review_lnk_fk FOREIGN KEY (review_vote_id) REFERENCES public.review_votes(id) ON DELETE CASCADE;


--
-- Name: review_votes_review_lnk review_votes_review_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes_review_lnk
    ADD CONSTRAINT review_votes_review_lnk_ifk FOREIGN KEY (review_id) REFERENCES public.reviews(id) ON DELETE CASCADE;


--
-- Name: review_votes review_votes_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.review_votes
    ADD CONSTRAINT review_votes_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: reviews reviews_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: reviews_cmps reviews_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reviews_cmps
    ADD CONSTRAINT reviews_entity_fk FOREIGN KEY (entity_id) REFERENCES public.reviews(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_history_versions strapi_history_versions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows strapi_workflows_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows strapi_workflows_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: subscribers subscribers_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: subscribers subscribers_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_lnk up_users_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_lnk up_users_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: JOY
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: JOY
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: accounts_otpcode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_otpcode (
    id bigint NOT NULL,
    phone_number character varying(11) NOT NULL,
    code smallint NOT NULL,
    created timestamp with time zone NOT NULL,
    CONSTRAINT accounts_otpcode_code_check CHECK ((code >= 0))
);


ALTER TABLE public.accounts_otpcode OWNER TO postgres;

--
-- Name: accounts_otpcode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_otpcode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_otpcode_id_seq OWNER TO postgres;

--
-- Name: accounts_otpcode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_otpcode_id_seq OWNED BY public.accounts_otpcode.id;


--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    is_staff boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    username character varying(50) NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    recovery character varying(15) NOT NULL,
    email character varying(50),
    phone_number character varying(13),
    birth_date timestamp with time zone,
    gender character varying(10),
    country character varying(40),
    is_active boolean NOT NULL
);


ALTER TABLE public.accounts_user OWNER TO postgres;

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_groups_id_seq OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_groups_id_seq OWNED BY public.accounts_user_groups.id;


--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_id_seq OWNER TO postgres;

--
-- Name: accounts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts_user.id;


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_user_permissions_id_seq OWNED BY public.accounts_user_user_permissions.id;


--
-- Name: admin_tools_stats_cachedvalue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_tools_stats_cachedvalue (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    time_scale character varying(90) NOT NULL,
    operation character varying(90),
    operation_field_name character varying(90),
    filtered_value character varying(512),
    value double precision,
    dynamic_choices jsonb NOT NULL,
    multiple_series_choice_id bigint,
    stats_id bigint NOT NULL,
    is_final boolean NOT NULL,
    "order" integer
);


ALTER TABLE public.admin_tools_stats_cachedvalue OWNER TO postgres;

--
-- Name: admin_tools_stats_cachedvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_tools_stats_cachedvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_tools_stats_cachedvalue_id_seq OWNER TO postgres;

--
-- Name: admin_tools_stats_cachedvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_tools_stats_cachedvalue_id_seq OWNED BY public.admin_tools_stats_cachedvalue.id;


--
-- Name: admin_tools_stats_criteriatostatsm2m; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_tools_stats_criteriatostatsm2m (
    id bigint NOT NULL,
    "order" integer,
    prefix character varying(255) NOT NULL,
    use_as character varying(90) NOT NULL,
    criteria_id bigint NOT NULL,
    stats_id bigint NOT NULL,
    default_option character varying(255) NOT NULL,
    choices_based_on_time_range boolean NOT NULL,
    count_limit integer,
    CONSTRAINT admin_tools_stats_criteriatostatsm2m_count_limit_check CHECK ((count_limit >= 0)),
    CONSTRAINT admin_tools_stats_criteriatostatsm2m_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.admin_tools_stats_criteriatostatsm2m OWNER TO postgres;

--
-- Name: admin_tools_stats_criteriatostatsm2m_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_tools_stats_criteriatostatsm2m_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_tools_stats_criteriatostatsm2m_id_seq OWNER TO postgres;

--
-- Name: admin_tools_stats_criteriatostatsm2m_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_tools_stats_criteriatostatsm2m_id_seq OWNED BY public.admin_tools_stats_criteriatostatsm2m.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: dash_stats_criteria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dash_stats_criteria (
    id bigint NOT NULL,
    criteria_name character varying(90) NOT NULL,
    criteria_fix_mapping jsonb,
    dynamic_criteria_field_name character varying(90),
    criteria_dynamic_mapping jsonb,
    created_date timestamp with time zone NOT NULL,
    updated_date timestamp with time zone NOT NULL
);


ALTER TABLE public.dash_stats_criteria OWNER TO postgres;

--
-- Name: dash_stats_criteria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dash_stats_criteria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dash_stats_criteria_id_seq OWNER TO postgres;

--
-- Name: dash_stats_criteria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dash_stats_criteria_id_seq OWNED BY public.dash_stats_criteria.id;


--
-- Name: dashboard_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_stats (
    id bigint NOT NULL,
    graph_key character varying(90) NOT NULL,
    graph_title character varying(90) NOT NULL,
    model_app_name character varying(90) NOT NULL,
    model_name character varying(90) NOT NULL,
    date_field_name character varying(90) NOT NULL,
    operation_field_name character varying(90),
    type_operation_field_name character varying(90),
    is_visible boolean NOT NULL,
    created_date timestamp with time zone NOT NULL,
    updated_date timestamp with time zone NOT NULL,
    user_field_name character varying(90),
    default_chart_type character varying(90) NOT NULL,
    default_time_period integer NOT NULL,
    default_time_scale character varying(90) NOT NULL,
    y_axis_format character varying(90),
    "distinct" boolean NOT NULL,
    default_multiseries_criteria_id bigint,
    show_to_users boolean NOT NULL,
    allowed_chart_types character varying(1000),
    allowed_time_scales character varying(1000) NOT NULL,
    allowed_type_operation_field_name character varying(1000),
    cache_values boolean NOT NULL,
    CONSTRAINT dashboard_stats_default_time_period_check CHECK ((default_time_period >= 0))
);


ALTER TABLE public.dashboard_stats OWNER TO postgres;

--
-- Name: dashboard_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_stats_id_seq OWNER TO postgres;

--
-- Name: dashboard_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_stats_id_seq OWNED BY public.dashboard_stats.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: mail_page_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_page_contacts (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(60) NOT NULL,
    phone_number character varying(13),
    other_email character varying(60),
    birth_date timestamp with time zone,
    owner_id bigint NOT NULL
);


ALTER TABLE public.mail_page_contacts OWNER TO postgres;

--
-- Name: mail_page_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_page_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_page_contacts_id_seq OWNER TO postgres;

--
-- Name: mail_page_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_page_contacts_id_seq OWNED BY public.mail_page_contacts.id;


--
-- Name: mail_page_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_page_email (
    id bigint NOT NULL,
    receiver character varying(50),
    cc character varying(800),
    bcc character varying(800),
    subject character varying(100),
    body text,
    file character varying(100),
    "timestamp" timestamp with time zone,
    is_draft boolean NOT NULL,
    is_read boolean NOT NULL,
    is_reply boolean NOT NULL,
    is_archived boolean,
    is_trash boolean,
    status character varying(20) NOT NULL,
    reply_id bigint,
    signature_id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE public.mail_page_email OWNER TO postgres;

--
-- Name: mail_page_email_filter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_page_email_filter (
    id bigint NOT NULL,
    email_id bigint NOT NULL,
    filter_id bigint NOT NULL
);


ALTER TABLE public.mail_page_email_filter OWNER TO postgres;

--
-- Name: mail_page_email_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_page_email_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_page_email_filter_id_seq OWNER TO postgres;

--
-- Name: mail_page_email_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_page_email_filter_id_seq OWNED BY public.mail_page_email_filter.id;


--
-- Name: mail_page_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_page_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_page_email_id_seq OWNER TO postgres;

--
-- Name: mail_page_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_page_email_id_seq OWNED BY public.mail_page_email.id;


--
-- Name: mail_page_email_label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_page_email_label (
    id bigint NOT NULL,
    email_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.mail_page_email_label OWNER TO postgres;

--
-- Name: mail_page_email_label_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_page_email_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_page_email_label_id_seq OWNER TO postgres;

--
-- Name: mail_page_email_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_page_email_label_id_seq OWNED BY public.mail_page_email_label.id;


--
-- Name: mail_page_filter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_page_filter (
    id bigint NOT NULL,
    sender character varying(50),
    subject character varying(500),
    body text,
    file boolean,
    bootstrap_label character varying(20),
    owner_id bigint NOT NULL
);


ALTER TABLE public.mail_page_filter OWNER TO postgres;

--
-- Name: mail_page_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_page_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_page_filter_id_seq OWNER TO postgres;

--
-- Name: mail_page_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_page_filter_id_seq OWNED BY public.mail_page_filter.id;


--
-- Name: mail_page_label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_page_label (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    owner_id bigint NOT NULL
);


ALTER TABLE public.mail_page_label OWNER TO postgres;

--
-- Name: mail_page_label_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_page_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_page_label_id_seq OWNER TO postgres;

--
-- Name: mail_page_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_page_label_id_seq OWNED BY public.mail_page_label.id;


--
-- Name: mail_page_signature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_page_signature (
    id bigint NOT NULL,
    title character varying(300) NOT NULL,
    owner_id bigint NOT NULL
);


ALTER TABLE public.mail_page_signature OWNER TO postgres;

--
-- Name: mail_page_signature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_page_signature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_page_signature_id_seq OWNER TO postgres;

--
-- Name: mail_page_signature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_page_signature_id_seq OWNED BY public.mail_page_signature.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: accounts_otpcode id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_otpcode ALTER COLUMN id SET DEFAULT nextval('public.accounts_otpcode_id_seq'::regclass);


--
-- Name: accounts_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);


--
-- Name: accounts_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_groups_id_seq'::regclass);


--
-- Name: accounts_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_user_permissions_id_seq'::regclass);


--
-- Name: admin_tools_stats_cachedvalue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_tools_stats_cachedvalue ALTER COLUMN id SET DEFAULT nextval('public.admin_tools_stats_cachedvalue_id_seq'::regclass);


--
-- Name: admin_tools_stats_criteriatostatsm2m id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_tools_stats_criteriatostatsm2m ALTER COLUMN id SET DEFAULT nextval('public.admin_tools_stats_criteriatostatsm2m_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: dash_stats_criteria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dash_stats_criteria ALTER COLUMN id SET DEFAULT nextval('public.dash_stats_criteria_id_seq'::regclass);


--
-- Name: dashboard_stats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_stats ALTER COLUMN id SET DEFAULT nextval('public.dashboard_stats_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: mail_page_contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_contacts ALTER COLUMN id SET DEFAULT nextval('public.mail_page_contacts_id_seq'::regclass);


--
-- Name: mail_page_email id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email ALTER COLUMN id SET DEFAULT nextval('public.mail_page_email_id_seq'::regclass);


--
-- Name: mail_page_email_filter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email_filter ALTER COLUMN id SET DEFAULT nextval('public.mail_page_email_filter_id_seq'::regclass);


--
-- Name: mail_page_email_label id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email_label ALTER COLUMN id SET DEFAULT nextval('public.mail_page_email_label_id_seq'::regclass);


--
-- Name: mail_page_filter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_filter ALTER COLUMN id SET DEFAULT nextval('public.mail_page_filter_id_seq'::regclass);


--
-- Name: mail_page_label id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_label ALTER COLUMN id SET DEFAULT nextval('public.mail_page_label_id_seq'::regclass);


--
-- Name: mail_page_signature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_signature ALTER COLUMN id SET DEFAULT nextval('public.mail_page_signature_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Data for Name: accounts_otpcode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_otpcode (id, phone_number, code, created) FROM stdin;
\.


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user (id, password, last_login, is_superuser, is_staff, date_joined, username, first_name, last_name, recovery, email, phone_number, birth_date, gender, country, is_active) FROM stdin;
1	pbkdf2_sha256$260000$4Imy4sdIRwzxdEPSaqYe0q$qGm1Bv9Um/XY8+DfPti6GQiAsEs7KzajrW7+x7FMgTw=	\N	t	t	2022-04-07 02:14:30.392696+04:30	admin	\N	\N		\N	\N	\N	\N	\N	t
2	pbkdf2_sha256$260000$Iw0I3Bj872ncHV7h21cuEj$IHzHL7P5oIZ5yYoNpWwX3SViZv4WOEgViiXdhFJ6TY4=	\N	t	t	2022-04-07 02:14:42.618868+04:30	yugi	\N	\N		\N	\N	\N	\N	\N	t
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: admin_tools_stats_cachedvalue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_tools_stats_cachedvalue (id, date, time_scale, operation, operation_field_name, filtered_value, value, dynamic_choices, multiple_series_choice_id, stats_id, is_final, "order") FROM stdin;
\.


--
-- Data for Name: admin_tools_stats_criteriatostatsm2m; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_tools_stats_criteriatostatsm2m (id, "order", prefix, use_as, criteria_id, stats_id, default_option, choices_based_on_time_range, count_limit) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add dashboard stats	1	add_dashboardstats
2	Can change dashboard stats	1	change_dashboardstats
3	Can delete dashboard stats	1	delete_dashboardstats
4	Can view dashboard stats	1	view_dashboardstats
5	Can add dashboard stats criteria	2	add_dashboardstatscriteria
6	Can change dashboard stats criteria	2	change_dashboardstatscriteria
7	Can delete dashboard stats criteria	2	delete_dashboardstatscriteria
8	Can view dashboard stats criteria	2	view_dashboardstatscriteria
9	Can add criteria to stats m2m	3	add_criteriatostatsm2m
10	Can change criteria to stats m2m	3	change_criteriatostatsm2m
11	Can delete criteria to stats m2m	3	delete_criteriatostatsm2m
12	Can view criteria to stats m2m	3	view_criteriatostatsm2m
13	Can add cached value	4	add_cachedvalue
14	Can change cached value	4	change_cachedvalue
15	Can delete cached value	4	delete_cachedvalue
16	Can view cached value	4	view_cachedvalue
17	Can add log entry	5	add_logentry
18	Can change log entry	5	change_logentry
19	Can delete log entry	5	delete_logentry
20	Can view log entry	5	view_logentry
21	Can add permission	6	add_permission
22	Can change permission	6	change_permission
23	Can delete permission	6	delete_permission
24	Can view permission	6	view_permission
25	Can add group	7	add_group
26	Can change group	7	change_group
27	Can delete group	7	delete_group
28	Can view group	7	view_group
29	Can add content type	8	add_contenttype
30	Can change content type	8	change_contenttype
31	Can delete content type	8	delete_contenttype
32	Can view content type	8	view_contenttype
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
37	Can add signature	10	add_signature
38	Can change signature	10	change_signature
39	Can delete signature	10	delete_signature
40	Can view signature	10	view_signature
41	Can add label	11	add_label
42	Can change label	11	change_label
43	Can delete label	11	delete_label
44	Can view label	11	view_label
45	Can add filter	12	add_filter
46	Can change filter	12	change_filter
47	Can delete filter	12	delete_filter
48	Can view filter	12	view_filter
49	Can add email	13	add_email
50	Can change email	13	change_email
51	Can delete email	13	delete_email
52	Can view email	13	view_email
53	Can add contacts	14	add_contacts
54	Can change contacts	14	change_contacts
55	Can delete contacts	14	delete_contacts
56	Can view contacts	14	view_contacts
57	Can add otp code	15	add_otpcode
58	Can change otp code	15	change_otpcode
59	Can delete otp code	15	delete_otpcode
60	Can view otp code	15	view_otpcode
61	Can add user	16	add_user
62	Can change user	16	change_user
63	Can delete user	16	delete_user
64	Can view user	16	view_user
65	Can add tag	17	add_tag
66	Can change tag	17	change_tag
67	Can delete tag	17	delete_tag
68	Can view tag	17	view_tag
69	Can add tagged item	18	add_taggeditem
70	Can change tagged item	18	change_taggeditem
71	Can delete tagged item	18	delete_taggeditem
72	Can view tagged item	18	view_taggeditem
73	Can add Token	19	add_token
74	Can change Token	19	change_token
75	Can delete Token	19	delete_token
76	Can view Token	19	view_token
77	Can add token	20	add_tokenproxy
78	Can change token	20	change_tokenproxy
79	Can delete token	20	delete_tokenproxy
80	Can view token	20	view_tokenproxy
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: dash_stats_criteria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dash_stats_criteria (id, criteria_name, criteria_fix_mapping, dynamic_criteria_field_name, criteria_dynamic_mapping, created_date, updated_date) FROM stdin;
\.


--
-- Data for Name: dashboard_stats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_stats (id, graph_key, graph_title, model_app_name, model_name, date_field_name, operation_field_name, type_operation_field_name, is_visible, created_date, updated_date, user_field_name, default_chart_type, default_time_period, default_time_scale, y_axis_format, "distinct", default_multiseries_criteria_id, show_to_users, allowed_chart_types, allowed_time_scales, allowed_type_operation_field_name, cache_values) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin_tools_stats	dashboardstats
2	admin_tools_stats	dashboardstatscriteria
3	admin_tools_stats	criteriatostatsm2m
4	admin_tools_stats	cachedvalue
5	admin	logentry
6	auth	permission
7	auth	group
8	contenttypes	contenttype
9	sessions	session
10	mail_page	signature
11	mail_page	label
12	mail_page	filter
13	mail_page	email
14	mail_page	contacts
15	accounts	otpcode
16	accounts	user
17	taggit	tag
18	taggit	taggeditem
19	authtoken	token
20	authtoken	tokenproxy
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-04-07 02:14:06.620536+04:30
2	contenttypes	0002_remove_content_type_name	2022-04-07 02:14:06.679053+04:30
3	auth	0001_initial	2022-04-07 02:14:07.108717+04:30
4	auth	0002_alter_permission_name_max_length	2022-04-07 02:14:07.119723+04:30
5	auth	0003_alter_user_email_max_length	2022-04-07 02:14:07.129717+04:30
6	auth	0004_alter_user_username_opts	2022-04-07 02:14:07.137715+04:30
7	auth	0005_alter_user_last_login_null	2022-04-07 02:14:07.146716+04:30
8	auth	0006_require_contenttypes_0002	2022-04-07 02:14:07.150715+04:30
9	auth	0007_alter_validators_add_error_messages	2022-04-07 02:14:07.167717+04:30
10	auth	0008_alter_user_username_max_length	2022-04-07 02:14:07.178778+04:30
11	auth	0009_alter_user_last_name_max_length	2022-04-07 02:14:07.190778+04:30
12	auth	0010_alter_group_name_max_length	2022-04-07 02:14:07.222719+04:30
13	auth	0011_update_proxy_permissions	2022-04-07 02:14:07.235716+04:30
14	auth	0012_alter_user_first_name_max_length	2022-04-07 02:14:07.250721+04:30
15	accounts	0001_initial	2022-04-07 02:14:07.907559+04:30
16	admin	0001_initial	2022-04-07 02:14:08.042603+04:30
17	admin	0002_logentry_remove_auto_add	2022-04-07 02:14:08.056622+04:30
18	admin	0003_logentry_add_action_flag_choices	2022-04-07 02:14:08.070601+04:30
19	admin_tools_stats	0001_initial	2022-04-07 02:14:08.529019+04:30
20	admin_tools_stats	0002_auto_20190920_1058	2022-04-07 02:14:08.556018+04:30
21	admin_tools_stats	0003_auto_20191007_0950	2022-04-07 02:14:08.608055+04:30
22	admin_tools_stats	0004_dashboardstats_y_tick_format	2022-04-07 02:14:08.617127+04:30
23	admin_tools_stats	0005_auto_20200203_1537	2022-04-07 02:14:08.687804+04:30
24	admin_tools_stats	0006_auto_20200205_0944	2022-04-07 02:14:08.83854+04:30
25	admin_tools_stats	0007_auto_20200205_1054	2022-04-07 02:14:08.868533+04:30
26	admin_tools_stats	0008_auto_20200911_1400	2022-04-07 02:14:08.93858+04:30
27	admin_tools_stats	0009_auto_20200928_1003	2022-04-07 02:14:08.955577+04:30
28	admin_tools_stats	0010_dashboardstats_show_to_users	2022-04-07 02:14:08.963618+04:30
29	admin_tools_stats	0011_auto_20210204_1206	2022-04-07 02:14:08.983579+04:30
30	admin_tools_stats	0012_auto_20210207_0859	2022-04-07 02:14:09.01462+04:30
31	admin_tools_stats	0013_auto_20210221_1247	2022-04-07 02:14:09.036593+04:30
32	admin_tools_stats	0014_auto_20211122_1511	2022-04-07 02:14:09.242405+04:30
33	admin_tools_stats	0015_auto_20211209_0822	2022-04-07 02:14:09.26541+04:30
34	admin_tools_stats	0016_dashboardstats_cache_values	2022-04-07 02:14:09.278408+04:30
35	admin_tools_stats	0017_auto_20220405_2349	2022-04-07 02:14:11.359166+04:30
36	authtoken	0001_initial	2022-04-07 02:14:11.568073+04:30
37	authtoken	0002_auto_20160226_1747	2022-04-07 02:14:11.605159+04:30
38	authtoken	0003_tokenproxy	2022-04-07 02:14:11.610116+04:30
39	mail_page	0001_initial	2022-04-07 02:14:12.680888+04:30
40	sessions	0001_initial	2022-04-07 02:14:12.809956+04:30
41	taggit	0001_initial	2022-04-07 02:14:13.298996+04:30
42	taggit	0002_auto_20150616_2121	2022-04-07 02:14:13.347515+04:30
43	taggit	0003_taggeditem_add_unique_index	2022-04-07 02:14:13.390909+04:30
44	taggit	0004_alter_taggeditem_content_type_alter_taggeditem_tag	2022-04-07 02:14:13.434946+04:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: mail_page_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_page_contacts (id, name, email, phone_number, other_email, birth_date, owner_id) FROM stdin;
\.


--
-- Data for Name: mail_page_email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_page_email (id, receiver, cc, bcc, subject, body, file, "timestamp", is_draft, is_read, is_reply, is_archived, is_trash, status, reply_id, signature_id, user_id) FROM stdin;
\.


--
-- Data for Name: mail_page_email_filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_page_email_filter (id, email_id, filter_id) FROM stdin;
\.


--
-- Data for Name: mail_page_email_label; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_page_email_label (id, email_id, label_id) FROM stdin;
\.


--
-- Data for Name: mail_page_filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_page_filter (id, sender, subject, body, file, bootstrap_label, owner_id) FROM stdin;
\.


--
-- Data for Name: mail_page_label; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_page_label (id, title, owner_id) FROM stdin;
\.


--
-- Data for Name: mail_page_signature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_page_signature (id, title, owner_id) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Name: accounts_otpcode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_otpcode_id_seq', 1, false);


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 2, true);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


--
-- Name: admin_tools_stats_cachedvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_tools_stats_cachedvalue_id_seq', 1, false);


--
-- Name: admin_tools_stats_criteriatostatsm2m_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_tools_stats_criteriatostatsm2m_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: dash_stats_criteria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dash_stats_criteria_id_seq', 1, false);


--
-- Name: dashboard_stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_stats_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 44, true);


--
-- Name: mail_page_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_page_contacts_id_seq', 1, false);


--
-- Name: mail_page_email_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_page_email_filter_id_seq', 1, false);


--
-- Name: mail_page_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_page_email_id_seq', 1, false);


--
-- Name: mail_page_email_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_page_email_label_id_seq', 1, false);


--
-- Name: mail_page_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_page_filter_id_seq', 1, false);


--
-- Name: mail_page_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_page_label_id_seq', 1, false);


--
-- Name: mail_page_signature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_page_signature_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: accounts_otpcode accounts_otpcode_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_otpcode
    ADD CONSTRAINT accounts_otpcode_phone_number_key UNIQUE (phone_number);


--
-- Name: accounts_otpcode accounts_otpcode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_otpcode
    ADD CONSTRAINT accounts_otpcode_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_email_key UNIQUE (email);


--
-- Name: accounts_user_groups accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);


--
-- Name: accounts_user accounts_user_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_phone_number_key UNIQUE (phone_number);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_username_key UNIQUE (username);


--
-- Name: admin_tools_stats_cachedvalue admin_tools_stats_cachedvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_tools_stats_cachedvalue
    ADD CONSTRAINT admin_tools_stats_cachedvalue_pkey PRIMARY KEY (id);


--
-- Name: admin_tools_stats_criteriatostatsm2m admin_tools_stats_criteriatostatsm2m_order_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_tools_stats_criteriatostatsm2m
    ADD CONSTRAINT admin_tools_stats_criteriatostatsm2m_order_key UNIQUE ("order");


--
-- Name: admin_tools_stats_criteriatostatsm2m admin_tools_stats_criteriatostatsm2m_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_tools_stats_criteriatostatsm2m
    ADD CONSTRAINT admin_tools_stats_criteriatostatsm2m_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: dash_stats_criteria dash_stats_criteria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dash_stats_criteria
    ADD CONSTRAINT dash_stats_criteria_pkey PRIMARY KEY (id);


--
-- Name: dashboard_stats dashboard_stats_graph_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_stats
    ADD CONSTRAINT dashboard_stats_graph_key_key UNIQUE (graph_key);


--
-- Name: dashboard_stats dashboard_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_stats
    ADD CONSTRAINT dashboard_stats_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: mail_page_contacts mail_page_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_contacts
    ADD CONSTRAINT mail_page_contacts_pkey PRIMARY KEY (id);


--
-- Name: mail_page_email_filter mail_page_email_filter_email_id_filter_id_4dcbe4b8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email_filter
    ADD CONSTRAINT mail_page_email_filter_email_id_filter_id_4dcbe4b8_uniq UNIQUE (email_id, filter_id);


--
-- Name: mail_page_email_filter mail_page_email_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email_filter
    ADD CONSTRAINT mail_page_email_filter_pkey PRIMARY KEY (id);


--
-- Name: mail_page_email_label mail_page_email_label_email_id_label_id_e901a235_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email_label
    ADD CONSTRAINT mail_page_email_label_email_id_label_id_e901a235_uniq UNIQUE (email_id, label_id);


--
-- Name: mail_page_email_label mail_page_email_label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email_label
    ADD CONSTRAINT mail_page_email_label_pkey PRIMARY KEY (id);


--
-- Name: mail_page_email mail_page_email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email
    ADD CONSTRAINT mail_page_email_pkey PRIMARY KEY (id);


--
-- Name: mail_page_filter mail_page_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_filter
    ADD CONSTRAINT mail_page_filter_pkey PRIMARY KEY (id);


--
-- Name: mail_page_label mail_page_label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_label
    ADD CONSTRAINT mail_page_label_pkey PRIMARY KEY (id);


--
-- Name: mail_page_label mail_page_label_title_owner_id_7e21acab_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_label
    ADD CONSTRAINT mail_page_label_title_owner_id_7e21acab_uniq UNIQUE (title, owner_id);


--
-- Name: mail_page_signature mail_page_signature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_signature
    ADD CONSTRAINT mail_page_signature_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: accounts_otpcode_phone_number_da335c33_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_otpcode_phone_number_da335c33_like ON public.accounts_otpcode USING btree (phone_number varchar_pattern_ops);


--
-- Name: accounts_user_email_b2644a56_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_email_b2644a56_like ON public.accounts_user USING btree (email varchar_pattern_ops);


--
-- Name: accounts_user_groups_group_id_bd11a704; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id_52b62117; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_phone_number_af3e1068_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_phone_number_af3e1068_like ON public.accounts_user USING btree (phone_number varchar_pattern_ops);


--
-- Name: accounts_user_user_permissions_permission_id_113bb443; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id_e4f0a161; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);


--
-- Name: accounts_user_username_6088629e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_username_6088629e_like ON public.accounts_user USING btree (username varchar_pattern_ops);


--
-- Name: admin_tools_stats_cachedva_multiple_series_choice_id_f68b8312; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_tools_stats_cachedva_multiple_series_choice_id_f68b8312 ON public.admin_tools_stats_cachedvalue USING btree (multiple_series_choice_id);


--
-- Name: admin_tools_stats_cachedvalue_stats_id_952da855; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_tools_stats_cachedvalue_stats_id_952da855 ON public.admin_tools_stats_cachedvalue USING btree (stats_id);


--
-- Name: admin_tools_stats_criteriatostatsm2m_criteria_id_bfe67f05; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_tools_stats_criteriatostatsm2m_criteria_id_bfe67f05 ON public.admin_tools_stats_criteriatostatsm2m USING btree (criteria_id);


--
-- Name: admin_tools_stats_criteriatostatsm2m_stats_id_10bd79ea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_tools_stats_criteriatostatsm2m_stats_id_10bd79ea ON public.admin_tools_stats_criteriatostatsm2m USING btree (stats_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: dash_stats_criteria_criteria_name_7fe7ae1e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dash_stats_criteria_criteria_name_7fe7ae1e ON public.dash_stats_criteria USING btree (criteria_name);


--
-- Name: dash_stats_criteria_criteria_name_7fe7ae1e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dash_stats_criteria_criteria_name_7fe7ae1e_like ON public.dash_stats_criteria USING btree (criteria_name varchar_pattern_ops);


--
-- Name: dashboard_stats_default_multiseries_criteria_id_1c00740c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dashboard_stats_default_multiseries_criteria_id_1c00740c ON public.dashboard_stats USING btree (default_multiseries_criteria_id);


--
-- Name: dashboard_stats_graph_key_4256e63f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dashboard_stats_graph_key_4256e63f_like ON public.dashboard_stats USING btree (graph_key varchar_pattern_ops);


--
-- Name: dashboard_stats_graph_title_99e6d271; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dashboard_stats_graph_title_99e6d271 ON public.dashboard_stats USING btree (graph_title);


--
-- Name: dashboard_stats_graph_title_99e6d271_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dashboard_stats_graph_title_99e6d271_like ON public.dashboard_stats USING btree (graph_title varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: mail_page_contacts_owner_id_94a0f644; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_page_contacts_owner_id_94a0f644 ON public.mail_page_contacts USING btree (owner_id);


--
-- Name: mail_page_email_filter_email_id_a74ddca9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_page_email_filter_email_id_a74ddca9 ON public.mail_page_email_filter USING btree (email_id);


--
-- Name: mail_page_email_filter_filter_id_fa4514c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_page_email_filter_filter_id_fa4514c0 ON public.mail_page_email_filter USING btree (filter_id);


--
-- Name: mail_page_email_label_email_id_664bc686; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_page_email_label_email_id_664bc686 ON public.mail_page_email_label USING btree (email_id);


--
-- Name: mail_page_email_label_label_id_4ec2d445; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_page_email_label_label_id_4ec2d445 ON public.mail_page_email_label USING btree (label_id);


--
-- Name: mail_page_email_reply_id_3be89f01; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_page_email_reply_id_3be89f01 ON public.mail_page_email USING btree (reply_id);


--
-- Name: mail_page_email_signature_id_c36fd73a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_page_email_signature_id_c36fd73a ON public.mail_page_email USING btree (signature_id);


--
-- Name: mail_page_email_user_id_8fa7b63f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_page_email_user_id_8fa7b63f ON public.mail_page_email USING btree (user_id);


--
-- Name: mail_page_filter_owner_id_da374caf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_page_filter_owner_id_da374caf ON public.mail_page_filter USING btree (owner_id);


--
-- Name: mail_page_label_owner_id_4911c1dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_page_label_owner_id_4911c1dc ON public.mail_page_label USING btree (owner_id);


--
-- Name: mail_page_signature_owner_id_96497f38; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_page_signature_owner_id_96497f38 ON public.mail_page_signature USING btree (owner_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_tools_stats_cachedvalue admin_tools_stats_cachedv_multiple_series_choice_id_f68b8312_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_tools_stats_cachedvalue
    ADD CONSTRAINT admin_tools_stats_cachedv_multiple_series_choice_id_f68b8312_fk FOREIGN KEY (multiple_series_choice_id) REFERENCES public.dash_stats_criteria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_tools_stats_cachedvalue admin_tools_stats_cachedvalue_stats_id_952da855_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_tools_stats_cachedvalue
    ADD CONSTRAINT admin_tools_stats_cachedvalue_stats_id_952da855_fk FOREIGN KEY (stats_id) REFERENCES public.dashboard_stats(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_tools_stats_criteriatostatsm2m admin_tools_stats_criteriatostatsm2m_criteria_id_bfe67f05_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_tools_stats_criteriatostatsm2m
    ADD CONSTRAINT admin_tools_stats_criteriatostatsm2m_criteria_id_bfe67f05_fk FOREIGN KEY (criteria_id) REFERENCES public.dash_stats_criteria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_tools_stats_criteriatostatsm2m admin_tools_stats_criteriatostatsm2m_stats_id_10bd79ea_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_tools_stats_criteriatostatsm2m
    ADD CONSTRAINT admin_tools_stats_criteriatostatsm2m_stats_id_10bd79ea_fk FOREIGN KEY (stats_id) REFERENCES public.dashboard_stats(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dashboard_stats dashboard_stats_default_multiseries_criteria_id_1c00740c_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_stats
    ADD CONSTRAINT dashboard_stats_default_multiseries_criteria_id_1c00740c_fk FOREIGN KEY (default_multiseries_criteria_id) REFERENCES public.admin_tools_stats_criteriatostatsm2m(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_page_contacts mail_page_contacts_owner_id_94a0f644_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_contacts
    ADD CONSTRAINT mail_page_contacts_owner_id_94a0f644_fk_accounts_user_id FOREIGN KEY (owner_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_page_email_filter mail_page_email_filt_filter_id_fa4514c0_fk_mail_page; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email_filter
    ADD CONSTRAINT mail_page_email_filt_filter_id_fa4514c0_fk_mail_page FOREIGN KEY (filter_id) REFERENCES public.mail_page_filter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_page_email_filter mail_page_email_filter_email_id_a74ddca9_fk_mail_page_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email_filter
    ADD CONSTRAINT mail_page_email_filter_email_id_a74ddca9_fk_mail_page_email_id FOREIGN KEY (email_id) REFERENCES public.mail_page_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_page_email_label mail_page_email_label_email_id_664bc686_fk_mail_page_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email_label
    ADD CONSTRAINT mail_page_email_label_email_id_664bc686_fk_mail_page_email_id FOREIGN KEY (email_id) REFERENCES public.mail_page_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_page_email_label mail_page_email_label_label_id_4ec2d445_fk_mail_page_label_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email_label
    ADD CONSTRAINT mail_page_email_label_label_id_4ec2d445_fk_mail_page_label_id FOREIGN KEY (label_id) REFERENCES public.mail_page_label(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_page_email mail_page_email_reply_id_3be89f01_fk_mail_page_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email
    ADD CONSTRAINT mail_page_email_reply_id_3be89f01_fk_mail_page_email_id FOREIGN KEY (reply_id) REFERENCES public.mail_page_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_page_email mail_page_email_signature_id_c36fd73a_fk_mail_page_signature_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email
    ADD CONSTRAINT mail_page_email_signature_id_c36fd73a_fk_mail_page_signature_id FOREIGN KEY (signature_id) REFERENCES public.mail_page_signature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_page_email mail_page_email_user_id_8fa7b63f_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_email
    ADD CONSTRAINT mail_page_email_user_id_8fa7b63f_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_page_filter mail_page_filter_owner_id_da374caf_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_filter
    ADD CONSTRAINT mail_page_filter_owner_id_da374caf_fk_accounts_user_id FOREIGN KEY (owner_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_page_label mail_page_label_owner_id_4911c1dc_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_label
    ADD CONSTRAINT mail_page_label_owner_id_4911c1dc_fk_accounts_user_id FOREIGN KEY (owner_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_page_signature mail_page_signature_owner_id_96497f38_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_page_signature
    ADD CONSTRAINT mail_page_signature_owner_id_96497f38_fk_accounts_user_id FOREIGN KEY (owner_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


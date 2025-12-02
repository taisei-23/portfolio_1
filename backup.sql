--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13 (Debian 15.13-0+deb12u1)

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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookmarks (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.bookmarks OWNER TO postgres;

--
-- Name: bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookmarks_id_seq OWNER TO postgres;

--
-- Name: bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookmarks_id_seq OWNED BY public.bookmarks.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    body text,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: mountain_searches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mountain_searches (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    mountain_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.mountain_searches OWNER TO postgres;

--
-- Name: mountain_searches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mountain_searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mountain_searches_id_seq OWNER TO postgres;

--
-- Name: mountain_searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mountain_searches_id_seq OWNED BY public.mountain_searches.id;


--
-- Name: mountains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mountains (
    id bigint NOT NULL,
    place_id character varying,
    name character varying,
    latitude double precision,
    longitude double precision,
    address character varying,
    rating double precision,
    user_ratings_total integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.mountains OWNER TO postgres;

--
-- Name: mountains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mountains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mountains_id_seq OWNER TO postgres;

--
-- Name: mountains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mountains_id_seq OWNED BY public.mountains.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    title character varying,
    body text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    provider character varying,
    uid character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: bookmarks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks ALTER COLUMN id SET DEFAULT nextval('public.bookmarks_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: mountain_searches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountain_searches ALTER COLUMN id SET DEFAULT nextval('public.mountain_searches_id_seq'::regclass);


--
-- Name: mountains id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountains ALTER COLUMN id SET DEFAULT nextval('public.mountains_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	icon_image	User	6	1	2025-08-01 16:38:25.863375
2	image	ActiveStorage::VariantRecord	2	2	2025-08-01 16:38:26.302943
3	image	ActiveStorage::VariantRecord	1	3	2025-08-01 16:38:26.304084
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	3usrhucxkukvvgnd6vs0ngm44vwv	image.jpg	image/jpeg	{"identified":true,"width":1920,"height":960,"analyzed":true}	local	797062	GpEVfGIkFUtwdxKfaP27wA==	2025-08-01 16:38:25.8615
3	8e89qwb55p0ayityysovv14dilrj	image.jpg	image/jpeg	{"identified":true,"width":40,"height":20,"analyzed":true}	local	2153	uOk4D1oPodTAh9+YShaNhA==	2025-08-01 16:38:26.301726
2	v2bknyuhr7pxgr9x85061kb2mgsr	image.jpg	image/jpeg	{"identified":true,"width":150,"height":75,"analyzed":true}	local	6921	7nPwC3Jo7UNUz4QM9xrwyg==	2025-08-01 16:38:26.300479
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
2	1	W3rQbiDVl3RX0dJoKIDlgkZ9b4A=
1	1	zueyRMx6NQe4IG85gn8z0hqj9lg=
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
schema_sha1	319d18355a4808ed8a0096f58a12f162c48ec9f0	2025-07-24 15:12:36.662452	2025-07-24 15:12:36.662453
environment	development	2025-07-24 15:12:36.660076	2025-08-20 08:42:05.999126
\.


--
-- Data for Name: bookmarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookmarks (id, user_id, post_id, created_at, updated_at) FROM stdin;
19	6	177	2025-08-26 18:12:04.669699	2025-08-26 18:12:04.669699
35	1341	177	2025-09-04 10:26:08.198643	2025-09-04 10:26:08.198643
36	1341	774	2025-09-04 10:27:26.277895	2025-09-04 10:27:26.277895
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, body, user_id, post_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mountain_searches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mountain_searches (id, user_id, mountain_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mountains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mountains (id, place_id, name, latitude, longitude, address, rating, user_ratings_total, created_at, updated_at) FROM stdin;
57	ChIJb_dBmbY-hV8Rnpr8w73ksn8	安比高原スキー場	40.0022571	140.9705409	日本、〒028-7306 岩手県八幡平市安比高原１１７	4.2	2463	2025-07-24 17:33:45.555942	2025-07-24 17:33:45.555942
97	ChIJE85WkikF9l8Rug1Tuxidh5M	野沢温泉スキー場	36.9206775	138.4523232	野沢温泉村豊郷７６５３	4.6	4046	2025-07-27 15:53:49.586355	2025-09-19 15:49:44.235074
59	ChIJzf_AnnfGDF8Rrbwmt94mI7Y	美瑛町民スキー場	43.5897515	142.4449234	日本、〒071-0216 北海道上川郡美瑛町大村村山	4.2	32	2025-07-24 17:35:51.049344	2025-07-24 17:35:51.049344
32	ChIJtX3mXOw99l8RnkTL9LS2KEQ	赤倉温泉スキー場	36.890901	138.176707	妙高市関山	4.1	934	2025-07-24 15:25:06.014852	2025-08-31 10:58:16.707022
33	ChIJUVe6sXtAHmARTJ8WO95uA1c	たんばらスキーパーク	36.7784094	139.0728093	沼田市玉原高原	3.9	3216	2025-07-24 15:27:23.502708	2025-09-19 15:49:44.263143
132	ChIJba7_IZXN918R4VIbHkNj89Q	白馬岩岳スノーフィールド	36.7168103	137.8570099	白馬村北城	4.3	1711	2025-07-28 15:06:47.27685	2025-08-31 10:58:16.753297
103	ChIJoY6rz2ZIHmARGuEO-ViaHv8	ホワイトワールド尾瀬岩鞍	36.8150792	139.2198874	片品村土出２６０９	4.3	1800	2025-07-27 15:53:49.61953	2025-09-19 15:49:44.245288
104	ChIJgaiD-jDuHWARBy4BupCQUUk	横手山・渋峠スキー場	36.6772672	138.5104185	山ノ内町平穏７１４８	4.3	1146	2025-07-27 15:53:49.623222	2025-09-19 15:49:44.254363
107	ChIJkzrT23wDHmARHfuU56c-Gf4	湯沢中里 スノーリゾート	36.9141426	138.8490268	湯沢町土樽５０４４−１	4.1	1320	2025-07-27 15:53:49.637537	2025-09-19 15:49:44.266077
111	ChIJbSOQ16rnHWARcE_OEaoszM0	草津温泉スキー場	36.6284168	138.5871725	草津町草津白根国有林158 林班	4.1	2634	2025-07-27 15:53:49.652914	2025-09-19 15:49:44.272441
130	ChIJc8khzbsk9l8RPUyblGSEDnI	黒姫高原スノーパーク／黒姫GREEN GARDEN	36.8264004	138.1619578	信濃町野尻３８０７	4	1025	2025-07-28 15:06:47.264691	2025-08-31 10:58:16.734512
105	ChIJz0rAIXRDHmARmSrEq5VQpxU	川場スキー場	36.7689011	139.1080597	川場村谷地２７５５−２	4.1	2579	2025-07-27 15:53:49.626872	2025-09-19 15:49:44.260185
118	ChIJPVFgE4Uf9V8Rqx8kUymJt2o	冬鳥越スキーガーデン	37.6425077	139.1180172	加茂市長谷１８６−７	3.9	411	2025-07-27 17:31:57.325589	2025-08-11 10:03:49.310723
101	ChIJ___r-BvG9F8RhoQ30qhS_mo	苗場スキー場	36.7916359	138.7796405	湯沢町三国２０２	4.2	1942	2025-07-27 15:53:49.612442	2025-09-19 15:49:44.257252
135	ChIJpWzeep3xHWARFSykqdk3Vjs	X-JAM高井富士	36.7997407	138.4271002	山ノ内町北志賀高原１２７１３−９４	4	386	2025-07-28 15:06:47.288518	2025-08-31 12:59:20.417417
98	ChIJtb0hvvIBHmARIsCgIEv9iKY	湯沢高原スキー場／パノラマパーク	36.940232	138.8039011	湯沢町湯沢４９０	4.1	1097	2025-07-27 15:53:49.594847	2025-09-19 15:49:44.238939
112	ChIJLbrqd8LuHWARKTXRlAkGcME	万座温泉スキー場	36.63576219999999	138.5062212	嬬恋村干俣万座温泉２４０１	4	775	2025-07-27 15:53:49.656366	2025-09-19 15:49:44.275233
117	ChIJ4wiNCkgp9V8RO1pVDo04wxQ	三川温泉スキー場	37.7206781	139.3933726	堤ノ下-２１６６ 川口 阿賀町	4	174	2025-07-27 17:31:57.32134	2025-08-20 14:42:52.612133
99	ChIJ6yBeCMbxHWARRU5Kxn7wJXk	志賀高原	36.71885280000001	138.4922758	山ノ内町平穏７１４８	4.5	1376	2025-07-27 15:53:49.598529	2025-09-19 15:49:44.241985
128	ChIJJaFBg9zM918RLsWB-s8oaI0	栂池高原スキー場	36.7489715	137.8661573	小谷村千国１２８４０−１	4.4	1180	2025-07-28 15:06:47.242901	2025-08-31 10:58:16.71912
113	ChIJhZAnN3k-HmARknz9JeoYDAw	水上高原スキーリゾート	36.855499	139.0765476	みなかみ町藤原６１５２−１	4	808	2025-07-27 15:53:49.659966	2025-09-19 15:49:44.27813
129	ChIJnSNvHAnO918RR59j-Pg3h7o	白馬八方尾根スキー場	36.7019841	137.8369446	白馬村北城	4.4	2691	2025-07-28 15:06:47.261326	2025-08-31 10:58:16.741733
106	ChIJBf1_zfbtHWARMxw0gt9lDYU	ヤマボクワイルドスノーパーク	36.6676338	138.4606908	高山村奥山田	4.3	312	2025-07-27 15:53:49.630378	2025-08-31 10:58:16.760053
139	ChIJke7cWw9t9l8RNJiIE7r0_5U	アライマウンテンリゾート	36.989476	138.1800776	妙高市両善寺	4.1	475	2025-07-28 15:06:47.309744	2025-08-31 10:58:16.767239
81	dummy_place_id	たんばらスキーパーク	36.1	138.9	群馬県	4.5	100	2025-07-26 09:02:37.840659	2025-07-26 09:02:37.840659
115	ChIJMWthLKwAHmARHgO8fWUWqIU	かぐらスキー場	36.8598524	138.7265013	湯沢町三俣７４２	4.3	618	2025-07-27 15:53:49.668435	2025-08-31 10:58:16.771075
133	ChIJWRIqSmYz9l8RKNyRq2nzUVA	白馬コルチナスキー場	36.7770681	137.8851453	小谷村千国１２８６０−１	4.3	1281	2025-07-28 15:06:47.281295	2025-08-31 10:58:16.775794
84	dummy_place_id	たんばらスキーパーク	36.1	138.9	群馬県	4.5	100	2025-07-26 09:17:24.026402	2025-07-26 09:17:24.026402
102	ChIJt8ucB4RMHmAR_P3FgKLiSL4	丸沼高原スキー場	36.814633	139.3300313	片品村東小川４６５８−５８	4.2	3853	2025-07-27 15:53:49.615781	2025-09-19 15:49:44.248484
108	ChIJRybfDJzUHWARK46DdvT5pH8	軽井沢プリンスホテルスキー場 Karuizawa Prince Hotel Snow Resort	36.3405106	138.6436871	軽井沢町軽井沢	4	2413	2025-07-27 15:53:49.641281	2025-09-19 15:49:44.269646
109	ChIJkynjzitIHmARfbV0gigSB_E	スノーパーク尾瀬戸倉	36.8510516	139.2390106	片品村戸倉３２９	4	675	2025-07-27 15:53:49.645282	2025-09-19 15:49:44.248212
114	ChIJF8olKJb1HWARk5gx8pSBlig	小丸山スキー場	36.794799	138.448638	山ノ内町夜間瀬１１４９４	3.8	366	2025-07-27 15:53:49.664845	2025-09-19 15:49:44.251353
89	ChIJCRZYclqvil8RJJPeDfpYB3A	絶景・猪苗代スキー場	37.5752673	140.0946582	日本、〒969-3102 福島県耶麻郡猪苗代町葉山７１０５	4.1	1627	2025-07-26 09:57:39.497444	2025-07-26 09:57:39.497444
110	ChIJlSMQ9EKyH2ARx2oh3B7Y83Q	日光湯元温泉スキー場	36.8035156	139.4195244	日光市湯元温泉	4	457	2025-07-27 15:53:49.649505	2025-09-19 15:49:44.261673
119	ChIJez_xuFQB9V8RuaSkMOqCHeo	立ヶ入スキー場	37.5375129	138.806066	長岡市与板町与板乙１０１	\N	\N	2025-07-27 17:31:57.329233	2025-07-27 17:31:57.329233
131	ChIJZzRdN38Y9l8R-dVRiE21tOw	斑尾高原スキー場	36.8524572	138.2906058	飯山市斑尾高原	4.2	1468	2025-07-28 15:06:47.272414	2025-07-28 15:06:47.272414
134	ChIJXf_hga4f9l8R7bUeIzRcMq4	スノーリゾートロマンスの神様	36.8200023	138.4034731	木島平村上木島３８７６−２	4.1	744	2025-07-28 15:06:47.284821	2025-07-28 15:06:47.284821
136	ChIJE4oMQEP1HWARI4npKspcvJI	よませ温泉スキー場	36.7854596	138.415017	山ノ内町夜間瀬７０７８	4.1	250	2025-07-28 15:06:47.293267	2025-07-28 15:06:47.293267
137	ChIJwyoPZgsQ9l8Rx3TedYXmJJs	戸狩温泉スキー場	36.9321655	138.3878788	飯山市豊田6356-二	4.1	873	2025-07-28 15:06:47.297393	2025-07-28 15:06:47.297393
138	ChIJxd2d7i_3HWARTbtBTZDuC-A	奥志賀高原スキー場	36.7659475	138.514592	山ノ内町 大字夜間瀬大沢12377−17	4.4	474	2025-07-28 15:06:47.303052	2025-07-28 15:06:47.303052
140	ChIJScNRUrsf9l8RLDI-UbSa0jI	The きじまスノーパーク	36.8181953	138.3964008	木島平村上木島３２７８−２１２	4.2	48	2025-07-28 15:06:47.313871	2025-07-28 15:06:47.313871
157	ChIJtz83wd1YGWARFuDyQHpd5u8	カムイみさかスキー場	35.582514	138.7531784	笛吹市御坂町上黒駒５３２１−１	3.8	1028	2025-08-01 17:06:04.02097	2025-08-01 17:06:04.02097
158	ChIJq_Y4Un-7G2ARrZBVPTSZtRw	リバウェル井川スキー場	35.2157096	138.2788903	静岡市葵区井川２６２９−１９０	4.1	123	2025-08-01 17:06:04.02686	2025-08-01 17:06:04.02686
159	ChIJ5VGNiSURGWARxn0b6DBkBts	スノーパラダイス	35.6027845	139.2024492	相模原市緑区若柳	3	3	2025-08-01 17:06:04.030867	2025-08-01 17:06:04.030867
160	ChIJaSXu6t5YGWARsSgMlB2dgSw	カムイみさか室内ゲレンデ	35.5814232	138.7556612	〒406-0814 山梨 県 笛吹 市 御坂 町 藤野 木 １３９７, １３９７ 御坂町藤野木 笛吹市	4.3	40	2025-08-01 17:06:04.03439	2025-08-01 17:06:04.03439
161	ChIJE8kXZGmpGWARKGN3xfTU_ck	湘南ブラッシュ	35.3594995	139.2698869	平塚市南金目１０２	4.5	30	2025-08-01 17:06:04.038411	2025-08-01 17:06:04.038411
162	ChIJByxk0YdoGWARavHq02L8wY4	サンパーク都留グラススキー場	35.510664	138.8896515	都留市鹿留３９００	4	27	2025-08-01 17:06:04.041868	2025-08-01 17:06:04.041868
163	ChIJX9MHkZ7Z918RSmxO8PYWKK0	鹿島槍スキー場 ファミリーパーク	36.5969431	137.8254561	大町市平２０４９０−４	4	934	2025-08-01 17:08:45.571876	2025-08-01 17:08:45.571876
164	ChIJh07LxNjR918Rbbk4bjyrGZ8	Hakuba47 ウインタースポーツパーク	36.685	137.8283333	白馬村神城２４１９６−４７	4.4	2325	2025-08-01 17:08:45.585132	2025-08-01 17:08:45.585132
165	ChIJ5XBudb499l8RtqsNirEHCKU	赤倉観光リゾートスキー場	36.8868178	138.1775851	妙高市田切２１６	4.1	898	2025-08-01 17:08:45.598676	2025-08-01 17:08:45.598676
166	ChIJs0lCzl4-HmARXhsvBAksMz4	群馬みなかみほうだいぎスキー場	36.8372869	139.0782966	みなかみ町藤原３８３９−１	4.2	1672	2025-08-02 15:38:44.21336	2025-08-02 15:38:44.21336
100	ChIJPT-aI8H49V8RiU8ePeHz6QA	石打丸山スキー場/ザ・ヴェランダ石打丸山	36.9793434	138.8025941	日本、〒949-6372 新潟県南魚沼市石打１６５５	4.2	1965	2025-07-27 15:53:49.608532	2025-08-02 15:45:08.184635
167	ChIJKf4mWsz1HWARiQeKqtt7qQU	竜王スキーパーク	36.7874659	138.4482513	内町夜間瀬１１７００ 下高井郡山	3.8	1546	2025-08-31 10:58:16.746944	2025-08-31 10:58:16.746944
168	ChIJYU1_Ry1E9l8R0KuSGMCYNr0	糸魚川シーサイドバレースキー場 塩の道温泉ホワイトクリフ	36.9410695	137.8992382	糸魚川市山口１５１−１	4.1	291	2025-08-31 10:58:16.763792	2025-08-31 10:58:16.763792
169	ChIJixSFfOQu9l8Rnies_GYAehQ	戸隠スキー場	36.754361	138.094631	長野市戸隠３６８２−３	4.3	1284	2025-08-31 10:58:16.781067	2025-08-31 10:58:16.781067
31	ChIJG40YzrbfG2ARODq4RToaU9Y	ふじてんスノーリゾート	35.4422765	138.6888912	日本、〒401-0320 山梨県南都留郡鳴沢村字富士山８５４５−１	4.1	3464	2025-07-24 15:24:59.206504	2025-09-04 08:05:14.201005
272	ChIJZbfJa1BeGGAR7wanTGaMfJI	スノーヴァ新横浜	35.5246013	139.6588169	日本、〒230-0072 神奈川県横浜市鶴見区梶山１丁目２−４３	3.6	269	2025-09-15 10:28:22.10682	2025-09-15 10:28:22.10682
273	ChIJZcIAPgn5AWAR4xKy5gzkLME	余呉高原リゾートYAP	35.6982962	136.1579078	長浜市余呉町中河内３７３	3.7	298	2025-09-15 10:28:32.066843	2025-09-15 10:28:32.066843
274	ChIJaVE6Pj6b-F8RVZ_ZxFnE9UE	スキージャム勝山	36.0730988	136.555577	勝山市芳野１７０−７０	4.2	2394	2025-09-15 10:28:32.071309	2025-09-15 10:28:32.071309
275	ChIJqbYHil56AmAR3uDc_09QrVg	福井和泉スキー場	35.93964390000001	136.6922302	大野市朝日前坂２７	4.2	297	2025-09-15 10:28:32.076525	2025-09-15 10:28:32.076525
276	ChIJF70ZZoBm-F8RfJ87vPSLH98	白山一里野温泉スキー場	36.2682922	136.7150196	白山市尾添リ63	4.1	826	2025-09-15 10:28:32.080673	2025-09-15 10:28:32.080673
277	ChIJG8RXVRRwAmAR51iZA0-ZJic	九頭竜スキー場	35.8982983	136.6545753	大野市角野１４−３	4.1	182	2025-09-15 10:28:32.084572	2025-09-15 10:28:32.084572
278	ChIJBWIKw-hC-F8RvgURKlXrP-U	白山セイモアスキー場	36.3470823	136.6777564	白山市 河内町 内尾 ロ ２０ ２	4.1	393	2025-09-15 10:28:32.088902	2025-09-15 10:28:32.088902
279	ChIJBYsC12sHAmARHL5in9qeTRg	新保ファミリースキー場	35.855765	136.30777	池田町新保１３−４	4	76	2025-09-15 10:28:32.092397	2025-09-15 10:28:32.092397
280	ChIJnRKtW7uI-F8R643XTu9XsyA	クロスカントリーセンター	36.1543917	136.6026175	白山市白峰６−１０４	4	38	2025-09-15 10:28:32.096401	2025-09-15 10:28:32.096401
281	ChIJPaXiPQn5AWARFO6IfMU3qlc	余呉高原スキー場	35.6982639	136.1580593	長浜市余呉町中河内３７３	3.5	24	2025-09-15 10:28:32.100062	2025-09-15 10:28:32.100062
282	ChIJKa6EjoVn-F8RnQxXhNdaldg	石川県白山一里野シャンツェ	36.2714351	136.7022171	白山市尾添	2.2	5	2025-09-15 10:28:32.103559	2025-09-15 10:28:32.103559
283	ChIJzVYa44Bm-F8Rfkv38ULJQEs	白山一里野温泉スキー場 ゴンドラ	36.2680838	136.7125163	白山市尾添２８	4.2	25	2025-09-15 10:28:32.107606	2025-09-15 10:28:32.107606
284	ChIJawvxFABf-F8RsrZvGbtUcy0	大倉岳高原スキー場	36.2838401	136.5381469	小松市尾小屋町レ４１	\N	\N	2025-09-15 10:28:32.111376	2025-09-15 10:28:32.111376
285	ChIJw_NRzTFTml8RfeNMuKxbGIw	青森スプリング・スキーリゾート	40.6953	140.2819897	鰺ヶ沢町長平町西岩木山７５−２ 鯵ヶ沢高原	4	468	2025-09-15 10:28:48.033237	2025-09-15 10:28:48.033237
286	ChIJh9hSm1kVnF8RdVu_rnB1ug0	釜臥山スキー場	41.2627198	141.1382583	むつ市大湊大川守４４−５	4	138	2025-09-15 10:28:48.039501	2025-09-15 10:28:48.039501
287	ChIJP88hewAVm18Rev1pJHB6NTo	EXP スキー・スノーボードのオフトレ施設	40.5867254	141.0205652	十和田市法量渕瀬２９	\N	\N	2025-09-15 10:28:48.043577	2025-09-15 10:28:48.043577
288	ChIJsyNQUqEVm18RIS6Rku46t2w	奥入瀬渓流温泉スキー場（旧：十和田湖温泉スキー場）	40.579275	140.9932551	十和田市法量焼山６４−１２２	4	350	2025-09-15 10:28:48.047152	2025-09-15 10:28:48.047152
289	ChIJS76gsjkLm18R5oFu2Z9-1j0	モヤヒルズ	40.7366202	140.7940869	青森市雲谷梨野木６３	3.9	577	2025-09-15 10:28:48.050951	2025-09-15 10:28:48.050951
290	ChIJly3mPez-ml8RfRj_MdGoaIM	そうまロマントピアスキー場	40.575678	140.390077	弘前市水木在家桜井４４	4.1	116	2025-09-15 10:28:48.055226	2025-09-15 10:28:48.055226
291	ChIJ56udmCJ_m18RrMEOXvHvxWY	まかど温泉スキー場	40.8752973	141.0707589	野辺地町地続山１−１	4	201	2025-09-15 10:28:48.058667	2025-09-15 10:28:48.058667
292	ChIJN10h3_Timl8Rj2jBMULsQrE	大鰐温泉スキー場	40.507733	140.5646315	大鰐町虹貝清川４８−１	3.8	228	2025-09-15 10:28:48.064531	2025-09-15 10:28:48.064531
293	ChIJO7CRdd9um18RCKTXBULrP9M	七戸町営スキー場	40.6980496	141.0990893	七戸町左組１０６−５	3.9	128	2025-09-15 10:28:48.068063	2025-09-15 10:28:48.068063
294	ChIJ23kEXaYNm18RV7tTcVFixM4	八甲田国際スキー場	40.6793611	140.8326515	青森市荒川寒水沢１−３４	4.2	234	2025-09-15 10:28:48.072103	2025-09-15 10:28:48.072103
295	ChIJ0cdGaW3jml8RbGSPwRPUoyo	大鰐温泉スキー場 雨池スキーコミュニティセンター	40.5076995	140.5646017	大鰐町虹貝清川４８−１	4.2	34	2025-09-15 10:28:48.076312	2025-09-15 10:28:48.076312
296	ChIJBx8QDnKBm18RkofWJMCp6u4	夜越山スキー場	40.921682	140.987776	平内町浜子堀替３６−１	4	51	2025-09-15 10:28:48.080224	2025-09-15 10:28:48.080224
297	ChIJLeI8REe8m18RLrBDQHbmyB8	嘉瀬スキー場	40.8820233	140.4775297	五所川原市金木町嘉瀬	3.9	7	2025-09-15 10:28:48.083907	2025-09-15 10:28:48.083907
298	ChIJeXBAOvJjm18RadeeeEMVt0c	みどりの大地とロマンの森公園町営スキー場	40.7850464	141.2054138	東北町北膳前	4.3	4	2025-09-15 10:28:48.087288	2025-09-15 10:28:48.087288
299	ChIJId75b1GVm18R-uNV4OgQKxM	中泊町宮野沢スキー場	40.966359	140.4490561	中泊町宮野沢浦島９７−６５	4	5	2025-09-15 10:28:48.090804	2025-09-15 10:28:48.090804
300	ChIJ708IfaYNm18RALC2DNXVrbk	ベルジャヤ八甲田 スキーリゾート	40.6790239	140.8297842	青森市荒川寒水沢1−５８	3.9	177	2025-09-15 10:28:48.094619	2025-09-15 10:28:48.094619
301	ChIJA1K7XETjml8RND71L54Lj18	大鰐温泉スキー場 国際エリア	40.508214	140.5645525	大鰐町虹貝清川４８−１	4.2	37	2025-09-15 10:28:48.09905	2025-09-15 10:28:48.09905
302	ChIJFeKWJFE3m18R-J4LGjcMRHU	金ヶ沢スキー場	40.4707489	141.1674356	新郷村戸来八ツ役	4.7	3	2025-09-15 10:28:48.102284	2025-09-15 10:28:48.102284
303	ChIJpcYzbUqnm18RyDeDoiQMMqQ	西山アップルヒルスキー場	40.7201035	140.5785999	青森市浪岡大字浪岡山元	3.1	7	2025-09-15 10:28:48.106065	2025-09-15 10:28:48.106065
116	ChIJF4y_4ncvi18Rt_qYWpZ-MFQ	ニノックススノーパーク	37.9268164	139.4679026	新発田市上三光 大平国有林無番地	3.7	416	2025-07-27 17:31:57.314396	2025-09-15 10:41:18.335211
304	ChIJZRyJYO0BHmARzpSbSCMTyTE	湯沢高原パノラマパーク ロープウェイ／アルプの里	36.9401909	138.8038994	湯沢町湯沢４９０	4.2	986	2025-09-19 15:49:44.254512	2025-09-19 15:49:44.254512
305	ChIJfUCHHybwHWARztS_mepw3Yc	志賀高原 一の瀬ファミリースキー場	36.7374139	138.514236	山ノ内町平穏	4.2	1008	2025-09-19 15:49:44.258966	2025-09-19 15:49:44.258966
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, title, body, created_at, updated_at, user_id) FROM stdin;
177	あさ	46	2025-07-26 15:00:19.623779	2025-07-26 15:00:19.623779	6
134	aaaaaa	aaaaaaaaa	2025-07-26 14:16:00.319167	2025-07-26 14:16:00.319167	6
773	4511111	1111111	2025-08-01 15:21:03.977475	2025-08-01 15:21:03.977475	6
774	あああ	あああ	2025-08-01 15:59:10.494331	2025-08-01 15:59:10.494331	6
775	kkkkk	;;;;;;;	2025-08-01 16:04:51.896277	2025-08-01 16:04:51.896277	6
103	Test Post	This is a test post.	2025-07-26 09:02:37.774812	2025-07-26 09:02:37.774812	257
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20250626104700
20250626104647
20250622154834
20250616094552
20250616072143
20250605161649
20250605144513
20250601094621
20250820082221
20250822153203
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, created_at, updated_at, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, provider, uid) FROM stdin;
6	taisei23	szktisi13@gmail.com	2025-07-24 15:19:59.927026	2025-09-19 15:50:51.407663	$2a$12$h2M5KvAVXLvaO47wM.PQCOniayWsW5tGuSHNm7vFFyssby5xVj9qG	\N	\N	\N	\N	\N
1341	admin	staisei008@gmail.com	2025-08-20 15:38:37.611163	2025-08-31 10:58:31.93331	$2a$12$XGJSTXxXXPsAxR.NyRqzluLH2fQng.hBUEJJltWt9hmYMfE4wz4G6	\N	\N	\N	google_oauth2	100141646080056319575
257	Test User	test@example.com	2025-07-26 09:02:37.763401	2025-07-26 09:02:37.763401	$2a$04$0m35q6wWUiGP16AzPNkXUeASETRvpfAtUAPlZAcOOiyt7sb9/gtQq	\N	\N	\N	\N	\N
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 3, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 3, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 2, true);


--
-- Name: bookmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookmarks_id_seq', 128, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 21, true);


--
-- Name: mountain_searches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mountain_searches_id_seq', 1, false);


--
-- Name: mountains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mountains_id_seq', 305, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 1517, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2773, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bookmarks bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: mountain_searches mountain_searches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountain_searches
    ADD CONSTRAINT mountain_searches_pkey PRIMARY KEY (id);


--
-- Name: mountains mountains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountains
    ADD CONSTRAINT mountains_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_bookmarks_on_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_bookmarks_on_post_id ON public.bookmarks USING btree (post_id);


--
-- Name: index_bookmarks_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_bookmarks_on_user_id ON public.bookmarks USING btree (user_id);


--
-- Name: index_bookmarks_on_user_id_and_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_bookmarks_on_user_id_and_post_id ON public.bookmarks USING btree (user_id, post_id);


--
-- Name: index_comments_on_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comments_on_post_id ON public.comments USING btree (post_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);


--
-- Name: index_mountain_searches_on_mountain_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_mountain_searches_on_mountain_id ON public.mountain_searches USING btree (mountain_id);


--
-- Name: index_mountain_searches_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_mountain_searches_on_user_id ON public.mountain_searches USING btree (user_id);


--
-- Name: index_posts_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_posts_on_user_id ON public.posts USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: mountain_searches fk_rails_0791eda28a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountain_searches
    ADD CONSTRAINT fk_rails_0791eda28a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments fk_rails_2fd19c0db7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_2fd19c0db7 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: posts fk_rails_5b5ddfd518; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_5b5ddfd518 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: mountain_searches fk_rails_5b655f1c27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountain_searches
    ADD CONSTRAINT fk_rails_5b655f1c27 FOREIGN KEY (mountain_id) REFERENCES public.mountains(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: bookmarks fk_rails_c1ff6fa4ac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT fk_rails_c1ff6fa4ac FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: bookmarks fk_rails_d8b54790ff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmarks
    ADD CONSTRAINT fk_rails_d8b54790ff FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- PostgreSQL database dump complete
--


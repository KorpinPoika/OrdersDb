-- Database: OrdersDb

-- DROP DATABASE IF EXISTS "OrdersDb";

CREATE DATABASE "OrdersDb"
    WITH
    OWNER = sa
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Table: public.clients

-- DROP TABLE IF EXISTS public.clients;

CREATE TABLE IF NOT EXISTS public.clients
(
    c_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    c_fio character varying(150) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (c_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.clients
    OWNER to sa;

-- Table: public.articuls

-- DROP TABLE IF EXISTS public.articuls;

CREATE TABLE IF NOT EXISTS public.articuls
(
    a_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    a_name character varying(150) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT articul_pk PRIMARY KEY (a_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.articuls
    OWNER to sa;

-- Table: public.orders

-- DROP TABLE IF EXISTS public.orders;

CREATE TABLE IF NOT EXISTS public.orders
(
    o_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    o_datetime timestamp without time zone NOT NULL,
    o_client_id integer NOT NULL,
    o_articul_id integer NOT NULL,
    CONSTRAINT order_pk PRIMARY KEY (o_id),
    CONSTRAINT orders_articul_fk FOREIGN KEY (o_articul_id)
        REFERENCES public.articuls (a_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT orders_client_fk FOREIGN KEY (o_client_id)
        REFERENCES public.clients (c_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.orders
    OWNER to sa;


insert INTO public.Clients (c_fio) VALUES (N'Ivanov Ivan Ivanovich');
insert INTO public.Clients (c_fio) VALUES (N'Sidorov Sidor Sidorovich');
insert INTO public.Clients (c_fio) VALUES (N'Petrov Petr Petrovich');
insert INTO public.Clients (c_fio) VALUES (N'Иванова Наталия Петровна');
insert INTO public.Clients (c_fio) VALUES (N'Демьянова Ольга Игоревна');


INSERT INTO public.articuls(a_name) VALUES (Самовар);
INSERT INTO public.articuls(a_name) VALUES (Лопата);
INSERT INTO public.articuls(a_name) VALUES (Тележка);
INSERT INTO public.articuls(a_name) VALUES (Грабли);
INSERT INTO public.articuls(a_name) VALUES (Вилы);
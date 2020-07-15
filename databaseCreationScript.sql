-- SCHEMA: public

-- DROP SCHEMA public ;

CREATE SCHEMA public
    AUTHORIZATION postgres;

COMMENT ON SCHEMA public
    IS 'standard public schema';

GRANT ALL ON SCHEMA public TO PUBLIC;

GRANT ALL ON SCHEMA public TO postgres;

-- Table: public.books

-- DROP TABLE public.books;

CREATE TABLE public.books
(
    "BookId" integer NOT NULL,
    "Title" text COLLATE pg_catalog."default" NOT NULL,
    "ISBN" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT books_pkey PRIMARY KEY ("BookId")
)

TABLESPACE pg_default;

ALTER TABLE public.books
    OWNER to bookish;

-- Table: public.authors

-- DROP TABLE public.authors;

CREATE TABLE public.authors
(
    "AuthorId" integer NOT NULL,
    "Name" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT authors_pkey PRIMARY KEY ("AuthorId")
)

TABLESPACE pg_default;

ALTER TABLE public.authors
    OWNER to bookish;

-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    "UserId" integer NOT NULL,
    "Name" text COLLATE pg_catalog."default" NOT NULL,
    "Password" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY ("UserId")
)

TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to bookish;

-- Table: public.writtenby

-- DROP TABLE public.writtenby;

CREATE TABLE public.writtenby
(
    "WrittenById" integer NOT NULL,
    "BookId" integer NOT NULL,
    "AuthorId" integer NOT NULL,
    CONSTRAINT writtenby_pkey PRIMARY KEY ("WrittenById"),
    CONSTRAINT "writtenby_AuthorId_fkey" FOREIGN KEY ("AuthorId")
        REFERENCES public.authors ("AuthorId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "writtenby_BookId_fkey" FOREIGN KEY ("BookId")
        REFERENCES public.books ("BookId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.writtenby
    OWNER to bookish;

-- Table: public.library

-- DROP TABLE public.library;

CREATE TABLE public.library
(
    "BarcodeId" integer NOT NULL,
    "BookId" integer NOT NULL,
    CONSTRAINT library_pkey PRIMARY KEY ("BarcodeId"),
    CONSTRAINT "library_BookId_fkey" FOREIGN KEY ("BookId")
        REFERENCES public.books ("BookId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.library
    OWNER to bookish;

-- Table: public.checkouts

-- DROP TABLE public.checkouts;

CREATE TABLE public.checkouts
(
    "CheckoutId" integer NOT NULL,
    "BarcodeId" integer NOT NULL,
    "UserId" integer NOT NULL,
    "DateDue" date NOT NULL,
    "DateReturned" date,
    CONSTRAINT checkouts_pkey PRIMARY KEY ("CheckoutId"),
    CONSTRAINT "checkouts_BarcodeId_fkey" FOREIGN KEY ("BarcodeId")
        REFERENCES public.library ("BarcodeId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "checkouts_UserId_fkey" FOREIGN KEY ("UserId")
        REFERENCES public.users ("UserId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.checkouts
    OWNER to bookish;
	
	
	
	
	
	
	
	
	
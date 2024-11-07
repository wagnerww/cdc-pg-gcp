CREATE TABLE IF NOT EXISTS public.clientes (
    id serial4 NOT NULL,
    nome varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    telefone varchar(20) NULL,
    data_cadastro timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT clientes_email_key UNIQUE (email),
    CONSTRAINT clientes_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.clientes_enderecos (
    id serial4 NOT NULL,
    cliente_id int4 NULL,
    logradouro varchar(100) NOT NULL,
    CONSTRAINT clientes_enderecos_pkey PRIMARY KEY (id)
);

CREATE SCHEMA enem;

CREATE TABLE enem.tb_enem(
    nu_inscricao text,
    nu_ano text,
    tp_faixa_etaria text,
    tp_sexo text,
    tp_estado_civil text,
    tp_cor_raca text,
    tp_nacionalidade text,
    tp_st_conclusao text,
    tp_ano_concluiu text,
    tp_escola text,
    tp_ensino text,
    in_treineiro text,
    co_municipio_esc text,
    no_municipio_esc text,
    co_uf_esc text,
    sg_uf_esc text,
    tp_dependencia_adm_esc text,
    tp_localizacao_esc text,
    tp_sit_func_esc text,
    co_municipio_prova text,
    no_municipio_prova text,
    co_uf_prova text,
    sg_uf_prova text,
    tp_presenca_cn numeric,
    tp_presenca_ch numeric,
    tp_presenca_lc numeric,
    tp_presenca_mt numeric,
    co_prova_cn text,
    co_prova_ch text,
    co_prova_lc text,
    co_prova_mt text,
    nu_nota_cn numeric,
    nu_nota_ch numeric,
    nu_nota_lc numeric,
    nu_nota_mt numeric,
    tx_respostas_cn text, 
    tx_respostas_ch text,
    tx_respostas_lc text,
    tx_respostas_mt text,
    tp_lingua text,
    tx_gabarito_cn text,
    tx_gabarito_ch text,
    tx_gabarito_lc text,
    tx_gabarito_mt text,
    tp_status_redacao text,
    nu_nota_comp1 numeric,
    nu_nota_comp2 numeric,
    nu_nota_comp3 numeric,
    nu_nota_comp4 numeric,
    nu_nota_comp5 numeric,
    nu_nota_redacao numeric,
    q001 text,
    q002 text, 
    q003 text,
    q004 text,
    q005 text,
    q006 text,
    q007 text,
    q008 text,
    q009 text,
    q010 text,
    q011 text,
    q012 text,
    q013 text,
    q014 text,
    q015 text,
    q016 text,
    q017 text,
    q018 text,
    q019 text,
    q020 text,
    q021 text,
    q022 text,
    q023 text,
    q024 text,
    q025 text
);

CREATE TABLE enem.tb_raca(
    co_raca text,
    no_raca text
);

INSERT INTO enem.tb_raca (co_raca,no_raca) VALUES ('0','Não declarado');
INSERT INTO enem.tb_raca (co_raca,no_raca) VALUES ('1','Branca');
INSERT INTO enem.tb_raca (co_raca,no_raca) VALUES ('2','Preta');
INSERT INTO enem.tb_raca (co_raca,no_raca) VALUES ('3','Parda');
INSERT INTO enem.tb_raca (co_raca,no_raca) VALUES ('4','Amarela');
INSERT INTO enem.tb_raca (co_raca,no_raca) VALUES ('5','Indígena');
INSERT INTO enem.tb_raca (co_raca,no_raca) VALUES ('6','Não dispõe da informação');

COPY enem.tb_enem
FROM '/postgres-data/enem_10.csv' 
DELIMITER ';'
ENCODING 'iso-8859-1'
CSV HEADER;

ALTER TABLE enem.tb_enem
ADD COLUMN nota_final numeric;

UPDATE enem.tb_enem
SET nota_final = nu_nota_cn + nu_nota_ch + nu_nota_lc + nu_nota_mt+ nu_nota_redacao;

ALTER TABLE enem.tb_enem
ADD COLUMN presenca numeric;

UPDATE enem.tb_enem
SET presenca = tp_presenca_cn+tp_presenca_ch+tp_presenca_lc+tp_presenca_mt;
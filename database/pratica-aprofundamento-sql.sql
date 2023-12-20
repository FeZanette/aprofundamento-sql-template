-- Active: 1703111582462@@127.0.0.1@3306
-- Conecte o arquivo pratica-aprofundamento-sql.db com a extensão MySQL e ative a conexão aqui

-- Deletar tabela (caso tenha uma tabela de pokemons, primeiro deleta ela para criar uma nova)
DROP TABLE pokemons;

-- Criar tabela
CREATE TABLE
    pokemons (
        id INTEGER PRIMARY KEY UNIQUE NOT NULL,
        name TEXT UNIQUE NOT NULL,
        type TEXT NOT NULL,
        hp INTEGER NOT NULL,
        attack INTEGER NOT NULL,
        defense INTEGER NOT NULL,
        special_attack INTEGER NOT NULL,
        special_defense INTEGER NOT NULL,
        speed INTEGER NOT NULL
    );

-- Popular tabela
INSERT INTO
    pokemons (
        id,
        name,
        type,
        hp,
        attack,
        defense,
        special_attack,
        special_defense,
        speed
    )
VALUES (
        1,
        'bulbasaur',
        'grass',
        45,
        49,
        49,
        65,
        65,
        45
    ), (
        2,
        'ivysaur',
        'grass',
        60,
        62,
        63,
        80,
        80,
        60
    ), (
        3,
        'venusaur',
        'grass',
        80,
        82,
        83,
        100,
        100,
        80
    ), (
        4,
        'charmander',
        'fire',
        39,
        52,
        43,
        60,
        50,
        65
    ), (
        5,
        'charmeleon',
        'fire',
        58,
        64,
        58,
        80,
        65,
        80
    ), (
        6,
        'charizard',
        'fire',
        78,
        84,
        78,
        109,
        85,
        100
    ), (
        7,
        'squirtle',
        'water',
        44,
        48,
        65,
        50,
        64,
        43
    ), (
        8,
        'wartortle',
        'water',
        59,
        63,
        80,
        65,
        80,
        58
    ), (
        9,
        'blastoise',
        'water',
        79,
        83,
        100,
        85,
        105,
        78
    );

-- Buscar todos os pokemons
SELECT * FROM pokemons;

-- Prática 1

-- Buscar pokemons com speed maior que 60
SELECT * FROM pokemons WHERE speed > 60;

-- Buscar pokemons com attack ou special_attack maior que 60
SELECT * FROM pokemons WHERE attack >= 60 AND special_attack >= 60;

-- Buscar pokemons que tenham na coluna name o termo "saur" no final do texto
SELECT * FROM pokemons WHERE name LIKE '%saur';

-- Prática 2

-- Buscar pokemons a média simples da coluna hp
SELECT AVG(hp) FROM pokemons;

-- Buscar o número de linhas da tabela pokemons
SELECT COUNT(*) FROM pokemons;

-- Refatorar as queries acima apelidando as colunas com funções para nomes mais semânticos em camelCase
SELECT AVG(hp) AS mediaHp FROM pokemons;

SELECT COUNT(*) AS numeroDePokemons FROM pokemons;
-- Prática 3

-- Buscar todos os pokemons e ordene-os baseado na coluna defense em ordem descrescente
SELECT * FROM pokemons ORDER BY defense DESC;

SELECT * FROM pokemons ORDER BY defense ASC;

-- Buscar o número de pokemons cadastrados, mas agrupar o resultado baseado na coluna type
SELECT
    COUNT(*) AS quantidadeDePokemons,
    type
FROM pokemons
GROUP BY type;

-- Buscar todos os pokemons, limitar o resultado a 3 linhas iniciando a partir da quinta linha
SELECT * FROM pokemons LIMIT 3 OFFSET 4;

-- Fixação:

-- Buscar por todos os pokemons aplicando:

-- 1. filtrar o resultado, mostrando somente os itens que possuem a coluna type valendo fire ou grass
-- 2. ordem crescente baseado na coluna attack
-- 3. resultado das linhas limitado a 3 e iniciando a partir da terceira linha

SELECT *
FROM pokemons
WHERE
    type LIKE 'fire'
    OR type LIKE 'grass'
ORDER BY attack ASC
LIMIT 3
OFFSET 2;
--Consultas de Agregação:

--a) Média dos preços de skin com valor maior que 1000 de RP e que não sejam skins Clássicas
SELECT round(AVG(preço), 2)
from skins
where nome <> 'Skin Clássica'
and preço > 1000;


--b) selecionar o nome de campeonatos cujo que ocorreram no segundo semestre e que sejam de seasons com premiação maior que 1200000.
 SELECT nome
 FROM campeonato
 where semestre = '2º'
 and(ano,semestre) in(
	SELECT ano , semestre
   	from season
    GROUP by (ano,semestre)
    HAVING premiação > 1200000);

--c) Retorna a soma do valor de contrato dos contratos que tiverem prazo igual a dois anos e valor de contrato maior que 13000
SELECT SUM (Valor)
FROM contratacao
WHERE (valor) in(
SELECT valor
FROM contratacao
WHERE valor > 13000 and periodo = '2 anos');


--Consultas normais:

--d) Seleciona nome, ano e semestre de campeonatos que tiveram uma premiação anual menor que 3000000 . Ordenados em ordem alfabética decrescente.
Select nome,ano,semestre
from Campeonato
where ano in 
(SELECT ano 
 from season
 where premiação < 3000000)
 ORDER by nome Desc;





--e) Jogadores maiores de idade
SELECT nick, idade
FROM Jogador
WHERE idade >= 18
ORDER BY idade DESC;



--f) Todos os itens usados no campeoanto
SELECT Nome as Itens_Usados
FROM Itens
INTERSECT
SELECT nomeitem
FROM Build;

--g) Contar a quantidade de jogadores com determinado elo
SELECT elo as Elo,COUNT(elo) as Num_Jogadores
FROM Jogador
GROUP by elo;

--h) Média de idade dos jogadores com Elo Desafiante 
SELECT round(avg(idade),2)
from Jogador
WHERE elo = 'Desafiante';


--i) Idade média e Elo médio dos Jogadores da equipe 1
SELECT round(AVG(idade),2) as média_Idade,MAX(elo) as Média_Elo
from Jogador
WHERE idequipe = 1;


--j) Quais personagens que o jogador Miguel21, jogou em todas as partidas

SELECT distinct jogador.nick, personagens.nome FRom jogador
inner join equipe on equipe.id = jogador.idequipe
inner join partida on partida.idazul = equipe.id or partida.idvermelho = equipe.id
inner join draft on draft.sala = partida.sala
inner join personagens on personagens.nome = draft.nomepersonagem
where jogador.nick = 'Miguel21';

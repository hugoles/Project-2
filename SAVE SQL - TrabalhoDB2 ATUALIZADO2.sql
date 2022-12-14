CREATE TABLE Season 
( 
 Ano varchar(10),  
 Semestre varchar(10),  
 Patrocínio varchar (50) not Null,  
 Premiação INT NOT NULL,
 CONSTRAINT pk_Season PRIMARY key (Ano,Semestre)
);


CREATE TABLE Equipe ( 
Id integer PRIMARY KEY );


CREATE TABLE Ranking
(
  Elo varchar(25),
  Ano varchar(10),
  Semestre varchar(10),
  CONSTRAINT fk_season FOREIGN key (Ano, Semestre) references Season(ano, semestre),
  constraint pk_rank primary key (Elo, Semestre, Ano)

);

CREATE TABLE Jogador ( 
 Nick varchar(50) PRIMARY KEY,  
 Idade integer not NULL,  
 Sexo varchar(10) NOT NULL,  
 idEquipe integer,
 elo varchar(25),
  ano varchar(10),
  semestre varchar(10),
CONSTRAINT fk_equi FOREIGN KEY (idEquipe)
      REFERENCES Equipe(ID),
CONSTRAINT fk_rank FOREIGN KEY (elo, ano, semestre) REFERENCES Ranking(Elo, ano, semestre));

CREATE TABLE Organizacao (
 Nome char(50),
 Endereco char(125),
 CONSTRAINT pk_org PRIMARY KEY (Nome,Endereco));

CREATE TABLE Coach 
( 
 Nome varchar (50) PRIMARY KEY
);

CREATE TABLE Skins 
( 
 Preço integer not NULL,  
 Nome varchar(50) PRIMARY KEY  
); 

CREATE TABLE Campeonato 
( 
  Nome varchar(50) PRIMARY KEY,
  Ano varchar(10),
  Semestre char(10),
  CONSTRAINT fk_season FOREIGN key (Ano, Semestre) references Season(ano, semestre)
);

CREATE TABLE Partida 
( 
 Data_partida date,  
 Sala varchar(25),
 Ano char(10),
 Semestre char(10),
 IDAzul integer,
 IDVermelho integer,
 CONSTRAINT pk_Partida PRIMARY KEY(Data_partida,Sala),
 CONSTRAINT fk_eqpA FOREIGN KEY (IdAzul)REFERENCES equipe(id),
 CONSTRAINT fk_eqpV FOREIGN KEY (IdVermelho)REFERENCES equipe(id),
 CONSTRAINT fk_Season FOREIGN key (Ano,Semestre) REFERENCES season(Ano,Semestre)
);


CREATE TABLE Runas 
( 
 Nome varchar(50) PRIMARY KEY  
); 



CREATE TABLE Personagens 
( 
 Nome varchar(50) PRIMARY KEY,
 NomeSkin varchar(25),
 NomeRuna varchar(50),
 CONSTRAINT fk_skin FOREIGN key (NomeSkin) REFERENCES skins(nome),
 CONSTRAINT fk_runa FOREIGN key (NomeRuna) REFERENCES runas(nome));



CREATE TABLE Habilidades 
( 
 Nome varchar(50) PRIMARY KEY,  
 Tipo varchar(25),
 NomePersonagem varchar(50),
 CONSTRAINT fk_personagem FOREIGN key (NomePersonagem)
 REFERENCES Personagens(Nome)
);

CREATE TABLE Itens 
( 
 Nome varchar(50) PRIMARY KEY  
); 

CREATE TABLE Classe 
( 
 Nome varchar(50) PRIMARY KEY  
); 


CREATE TABLE Build (
  NomeItem varchar(25),
  NomePersonagem varchar(50),
  CONSTRAINT fk_personagem FOREIGN key (NomePersonagem) REFERENCES Personagens(Nome),
  constraint fk_itens foreign key (nomeItem) references itens(nome),
  CONSTRAINT pk_build PRIMARY KEY(NomePersonagem,NomeItem));
  

CREATE TABLE Draft (
  sala varchar(25),
  Data_partida date,
  NomePersonagem varchar(50),
  CONSTRAINT fk_personagem FOREIGN key (NomePersonagem) 
  REFERENCES Personagens(Nome),
  CONSTRAINT fk_partida FOREIGN KEY (Data_partida,Sala) 
  REFERENCES Partida(Data_partida,Sala),
  CONSTRAINT pk_draft PRIMARY KEY(NomePersonagem,sala, Data_partida)
);


CREATE TABLE Tipo (
  NomeClasse varchar(25),
  NomePersonagem varchar(50),
  CONSTRAINT pk_Tipo PRIMARY KEY(NomeClasse,NomePersonagem)
  );
 

  CREATE TABLE Contratacao (
   cod int,
   id int,
   NomeOrg CHAR(50),
   EndOrg CHAR(125),
   CodCoach CHAR(50),
   Periodo CHAR(10),
   Valor float,
   CONSTRAINT fk_coach FOREIGN KEY (CodCoach) REFERENCES coach(nome)
    on delete cascade
    on update cascade,
   CONSTRAINT fk_org FOREIGN KEY (NomeOrg, EndOrg) REFERENCES organizacao (nome, endereco)
    on delete cascade
    on update cascade,
   constraint fk_equipe foreign key (id) references equipe(id),
   CONSTRAINT pk_Contrato PRIMARY KEY(EndOrg,NomeOrg,id,cod)
  );

-- Inserção de Organizções
INSERT into organizacao values ('Coca-Cola', 'Bangu');
INSERT into organizacao values('Loud', 'São Paulo');
INSERT into organizacao values('Kabum', 'Porto Alegre');
INSERT into organizacao values('Flamengo Los Grandes', 'Rio De Janeiro');
INSERT into organizacao values('Pain', 'São Paulo'),('MonoChampions','Bahia');

-- Inserção de Seasons
Insert Into Season Values('2022','1º','Kit-Kat', 100000);
Insert Into Season Values('2022','2º','Globo', 2000000);
Insert Into Season Values('2020','1º','Sportv', 500000);
Insert Into Season Values('2020','2º','Intel', 400000);
Insert Into Season Values('2021','1º','Prefeitura-Rio',4000000);
Insert Into Season Values('2021','2º','Chilli-Beans',1200000);

-- Inserção de Id de Equipes
Insert Into Equipe values (1),(2),(3),(4),(5);

--Inserção de Runas
INSERT INTO Runas values ('Triunfo');
INSERT INTO Runas values ('Eletrocutar');
INSERT INTO Runas values ('Cometa');
INSERT INTO Runas values ('Calçados Mágicos');
INSERT INTO Runas values ('Entrega de Biscoitos');
INSERT INTO Runas values ('Ritmo Fatal');

--Inserção de Rankings
INSERT INTO Ranking values ('Desafiante','2022','2º');
INSERT INTO Ranking values('Desafiante','2022','1º');
INSERT INTO Ranking values('Mestre','2021','2º');
INSERT INTO Ranking values('Mestre','2021','1º');
INSERT INTO Ranking values('Grão-Mestre','2022','2º');
INSERT INTO Ranking values('Grão-Mestre','2022','1º');
INSERT INTO Ranking values('Diamante','2021','2º');
INSERT INTO Ranking values('Diamante','2021','1º');

--Inserção de Coachs
Insert into Coach values ('Cariok');
Insert into Coach values('Maestro');
Insert into Coach values('Gorilla');
Insert into Coach values('Von');
Insert into Coach values('Brance');

-- Inserção de Campeonatos 
INSERT into Campeonato VALUES ('CBLOL','2022','1º');
INSERT into Campeonato VALUES ('MUNDIAL','2022','2º');
INSERT into Campeonato VALUES ('LEC','2022','2º');
INSERT into Campeonato VALUES ('LCK','2022','2º');
INSERT into Campeonato VALUES ('LPL','2022','2º');

-- Inserção de Classes 
INSERT into Classe VALUES ('Assasino'),('Mago'),('Atirador'),('Guerreiro'),('Suporte');
-- Inserção de Skins
INSERT INTO Skins VALUES(0,'Skin Clássica');
INSERT INTO Skins VALUES(520,'Ashe de Freljord');
INSERT INTO Skins VALUES(3250,'Lux Elementalista');
INSERT INTO Skins VALUES(1350,'Vex Emissária da Luz');
INSERT INTO Skins VALUES(1820,'Deus-Rei Garen');
INSERT INTO Skins VALUES(975,'Lulu Perversa');

-- Inserção de Personagens
INSERT INTO Personagens VALUES('Lux','Lux Elementalista','Calçados Mágicos');
INSERT INTO Personagens VALUES('Zed','Skin Clássica','Eletrocutar');
INSERT INTO Personagens VALUES('Vex','Vex Emissária da Luz','Cometa');
INSERT INTO Personagens VALUES('Garen','Deus-Rei Garen','Triunfo');
INSERT INTO Personagens VALUES('Lulu','Lulu Perversa','Entrega de Biscoitos');
INSERT INTO Personagens VALUES('Ashe','Ashe de Freljord','Ritmo Fatal');


--Inserção de itens
insert into itens (nome) values
('Braçadeira Cristalina'),
('Fulgor'),
('Estilhaço de Kircheis'),
('Ídolo Proibido'),
('Cota de Malha'),
('Faca da Fúria'),
('Couraça Lunar Alada'),
('Gema Ardente'),
('Colete Espinhoso'),
('Chamado do Carrasco'),
('Orbe do Oblívio'),
('Cintilação Etérea'),
('Cetro Vampírico'),
('Capa Negatron'),
('Broquel Glacial');;

--Inserção de Tipo
INSERT INTO Tipo VALUES('Lux','Mago'), ('Lux','Suporte');
INSERT INTO Tipo VALUES('Zed','Assassino');
INSERT INTO Tipo VALUES('Vex','Mago');
INSERT INTO Tipo VALUES('Garen','Guerreiro');
INSERT INTO Tipo VALUES('Lulu','Suporte');
INSERT INTO Tipo VALUES('Ashe','Atirador');

--Inserção de Partidas
INSERT INTO Partida VALUES('2022-12-07','10','2022','2º',1,2);
INSERT INTO Partida VALUES('2022-01-01','101','2022','1º',3,4);
INSERT INTO Partida VALUES('2022-12-10','7','2021','2º',1,3);
INSERT INTO Partida VALUES('2022-03-22','999','2021','1º',2,5);
INSERT INTO Partida VALUES('2022-11-01','222','2021','2º',3,2);
INSERT INTO Partida VALUES('2022-02-25','65520','2020','1º',1,4);
INSERT INTO Partida VALUES('2022-04-17','1','2020','1º',2,4);
INSERT INTO Partida VALUES('2022-08-28','1572','2020','2º',5,1);
-- Inserção de Drafts
INSERT INTO Draft VALUES('10','2022-12-07', 'Zed');
INSERT INTO Draft VALUES('10','2022-12-07', 'Lulu');
INSERT INTO Draft VALUES('10','2022-12-07', 'Garen');
INSERT INTO Draft VALUES('10','2022-12-07', 'Lux');
INSERT INTO Draft VALUES('10','2022-12-07', 'Ashe');
INSERT INTO Draft VALUES('101','2022-01-01', 'Zed');
INSERT INTO Draft VALUES('101','2022-01-01', 'Lulu');
INSERT INTO Draft VALUES('101','2022-01-01', 'Garen');
INSERT INTO Draft VALUES('101','2022-01-01', 'Lux');
INSERT INTO Draft VALUES('101','2022-01-01', 'Ashe');
INSERT INTO Draft VALUES('65520','2022-02-25', 'Zed');
INSERT INTO Draft VALUES('65520','2022-02-25', 'Lulu');
INSERT INTO Draft VALUES('65520','2022-02-25', 'Garen');
INSERT INTO Draft VALUES('65520','2022-02-25', 'Lux');
INSERT INTO Draft VALUES('65520','2022-02-25', 'Ashe');
INSERT INTO Draft VALUES('1572','2022-08-28', 'Zed');
INSERT INTO Draft VALUES('1572','2022-08-28', 'Lulu');
INSERT INTO Draft VALUES('1572','2022-08-28', 'Garen');
INSERT INTO Draft VALUES('1572','2022-08-28', 'Lux');
INSERT INTO Draft VALUES('1572','2022-08-28', 'Ashe');


--Inserção da Habilidades
insert into habilidades(nome, tipo, nomepersonagem) VALUES
('Rajada','w','Ashe'),
('Concentração','q','Ashe'),
('Rajada Mistral','q','Vex'),
('Espaço Pessoal','w','Vex'),
('Penumbra Iminente','e','Vex'),
('Lança-Purpurina','q','Lulu'),
('Caprichos','w','Lulu'),
('Singularidade Lucente', 'e', 'Lux'),
('Ligação da Luz', 'q', 'Lux'),
('Shuriken Laminado', 'q', 'Zed'),
('Corte Sombrio', 'w', 'Zed'),
('Sombra Viva', 'e', 'Zed'),
('Golpe Decisivo', 'q', 'Garen'),
('O julgamento', 'w', 'Garen'),
('Courage', 'e', 'Garen');

--Inserção de Builds
INSERT INTO Build(NomePersonagem, NomeItem) VALUES
('Lux', 'Orbe do Oblívio'),
('Zed','Cetro Vampírico'),
('Vex','Ídolo Proibido'),
('Garen','Cota de Malha'),
('Lulu','Braçadeira Cristalina'),
('Ashe', 'Estilhaço de Kircheis');
INSERT INTO Build(NomePersonagem, NomeItem) VALUES
('Lux','Cintilação Etérea');


-- Inseção de jogador
insert into jogador(nick, idade,sexo, elo, idequipe) VALUES
('Gabriel11', '11', 'm', 'Desafiante', '2'),
('João12', '12', 'm', 'Diamante', '3'),
('Gabriel13', '13', 'm', 'Mestre', '4'),
('Luiz14', '14', 'm', 'Grão-Mestre', '5'),
('Henrique15', '15', 'm', 'Desafiante', '1'),
('Arthur16', '16', 'm', 'Diamante', '2'),
('Miguel17', '17', 'm', 'Mestre', '3'),
('João18', '18', 'm', 'Grão-Mestre', '4'),
('Guilherme19', '19', 'm', 'Desafiante', '5'),
('Luiz20', '20', 'm', 'Diamante', '1'),
('Miguel21', '21', 'm', 'Mestre', '2'),
('TFT Mathews', '22', 'm', 'Grão-Mestre', '3'),
('MatheusStrondosso', '23', 'm', 'Desafiante', '4'),
('HugorOmatador', '24', 'm', 'Diamante', '5'),
('Bru-não123', '25', 'm', 'Mestre', '1'),
('LEKdosLEK', '26', 'm', 'Grão-Mestre', '2'),
('He50', '27', 'm', 'Desafiante', '3'),
('DaviLucca28', '28', 'm', 'Diamante', '4'),
('thu9', '29', 'm', 'Mestre', '5'),
('Gabrl30', '30', 'm', 'Grão-Mestre', '1'),
('Marci', '31', 'f', 'Desafiante', '2'),
('Gabriel32', '32', 'm', 'Diamante', '3'),
('Lucia7', '33', 'f', 'Mestre', '4'),
('Henrique34', '34', 'm', 'Grão-Mestre', '5'),
('Juca', '35', 'm', 'Desafiante', '1'),
('Mil36', '36', 'm', 'Diamante', '2');




--Inserção de Contratação
Insert into Contratacao(cod, CodCoach, NomeOrg, EndOrg, Periodo, Valor, id) values 
(0, 'Cariok','Flamengo Los Grandes', 'Rio De Janeiro', '2 anos', 16000, 1),
(1, 'Maestro','Pain', 'São Paulo', '2 anos', 15000, 2),
(2, 'Gorilla','Kabum', 'Porto Alegre', '1 ano', 7000, 3),
(3, 'Von','Loud', 'São Paulo', '2 anos', 12000, 4),
(4, 'Brance','Coca-Cola', 'Bangu', '1 ano', 30000, 5);














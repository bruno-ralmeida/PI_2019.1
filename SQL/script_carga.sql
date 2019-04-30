INSERT INTO usuario (nome, email, senha) VALUES 
('Bruno Rocha','bruno.rocha@usjt.br','aluno123'),
('Murilo Navarro','murilo@usjt.com.br','aluno123'),
('Iuri Pika','iuri.pika@pt.com','aluno123'),
('Gabriel','gabriel@hotmail.com','aluno123'),
('Sofia souza','sofia.17@bolsominion.com','aluno123'),
('Paulo coelho ','paulo.coelho@gmail.com','admin123'),
('Bolsonaro Comunista','bolsonaro.elenao@13.com','prof123'),
('Maria Creuza','maria@usjt.com','prof123'),
('Cleyton Rasta','cabeca.de.gelo@gmail.com','admin123');

INSERT INTO `aluno` VALUES 
(1,'8080123'),
(2,'8080122'),
(3,'80809090'),
(4,'8080658'),
(5,'8080999');



INSERT INTO `tema` VALUES 
(1,'2019-04-19 00:00:00','Java','Introducao a Java Orientado a Objetos','Logica de Programacao'),
(3,'2019-02-10 00:00:00','HTML','Introducao a HTML e CSS','Sem conhecimentos necessarios'),
(2,'2019-02-23 00:00:00','Algoritmos e estruturas de dados','Elaboracao de algoritmos','Sem conhecimento necessarios');


INSERT INTO `atividade`(tema_id, numero, descricao, formato_entrega, dt_inicio, dt_fim) VALUES 
(2,1,'Entrega de métodos recusivos','E-mail','2019-02-12 00:00:00','2019-03-30 00:00:00');

INSERT INTO `professor` VALUES 
(6,1,'2019usjt8823'),
(7,0,'2005usjt3374'),
(8,0,'2000anima8234'),
(9,1,'2010anima8364');

INSERT INTO `grupo`(orientador_id, numero, nome) VALUES 
(7,1,'Bruno Rocha'),
(7,1,'Murilo Navarro'),
(7,1,'Iuri Pika'),
(7,1,'Gabriel');


INSERT INTO `banca`(grupo_id, data, sala) VALUES 
(1,'2019-08-01 10:30:00','104h');


INSERT INTO `entrega` (grupo_id, atividade_id, dt_cadastro) VALUES 
(1,1,'2019-03-15 00:00:00');


INSERT INTO `professores_banca`(banca_id, Professor_id, avaliacao) VALUES 
(1,7,92.50);


INSERT INTO `turma` (semestre_letivo, ano_letivo, sigla, tema_id)VALUES 
(1,2019,'SI',2);
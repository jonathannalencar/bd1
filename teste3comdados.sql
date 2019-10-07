--
-- File generated with SQLiteStudio v3.2.1 on seg out 7 15:13:39 2019
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Curso
CREATE TABLE Curso (IDCURSO INTEGER PRIMARY KEY AUTOINCREMENT, NOMECURSO VARCHAR, TOTALPERIODOS INTEGER);
INSERT INTO Curso (IDCURSO, NOMECURSO, TOTALPERIODOS) VALUES (1, 'ccomp', 8);

-- Table: EstacionamentoAluno
CREATE TABLE EstacionamentoAluno (PLACA VARCHAR PRIMARY KEY, MODELO VARCHAR, MATRICULADONO INTEGER REFERENCES User (MATRICULA), TIPO VARCHAR DEFAULT ALUNO NOT NULL);
INSERT INTO EstacionamentoAluno (PLACA, MODELO, MATRICULADONO, TIPO) VALUES ('987', 'a', 1, 'ALUNO');
INSERT INTO EstacionamentoAluno (PLACA, MODELO, MATRICULADONO, TIPO) VALUES ('988', 'b', 2, 'ALUNO');
INSERT INTO EstacionamentoAluno (PLACA, MODELO, MATRICULADONO, TIPO) VALUES ('989', 'c', 3, 'ALUNO');

-- Table: EstacionamentoProf
CREATE TABLE EstacionamentoProf (PLACA VARCHAR PRIMARY KEY, MODELO VARCHAR, MATRICULADONO INTEGER REFERENCES Professor (MATRICULA), TIPO VARCHAR DEFAULT PROFESSOR NOT NULL);
INSERT INTO EstacionamentoProf (PLACA, MODELO, MATRICULADONO, TIPO) VALUES ('654', 'A', 201, 'PROFESSOR');
INSERT INTO EstacionamentoProf (PLACA, MODELO, MATRICULADONO, TIPO) VALUES ('655', 'B', 202, 'PROFESSOR');
INSERT INTO EstacionamentoProf (PLACA, MODELO, MATRICULADONO, TIPO) VALUES ('656', 'C', 203, 'PROFESSOR');

-- Table: IniciacaoCientifica
CREATE TABLE IniciacaoCientifica (RESPONSAVEL INTEGER REFERENCES Professor (MATRICULA) PRIMARY KEY, TEMA VARCHAR, OBJETIVO VARCHAR);

-- Table: Materias
CREATE TABLE Materias (CODMATERIA INTEGER PRIMARY KEY AUTOINCREMENT, IDCURSO INTEGER REFERENCES Curso (IDCURSO), NOMEMAT VARCHAR, PERIODOSUG INTEGER, CREDITOS INTEGER);
INSERT INTO Materias (CODMATERIA, IDCURSO, NOMEMAT, PERIODOSUG, CREDITOS) VALUES (1, 1, 'calc1', 1, 0);
INSERT INTO Materias (CODMATERIA, IDCURSO, NOMEMAT, PERIODOSUG, CREDITOS) VALUES (2, 1, 'calc2', 2, 0);
INSERT INTO Materias (CODMATERIA, IDCURSO, NOMEMAT, PERIODOSUG, CREDITOS) VALUES (3, 1, 'lp1', 2, 0);
INSERT INTO Materias (CODMATERIA, IDCURSO, NOMEMAT, PERIODOSUG, CREDITOS) VALUES (4, 1, 'aed2', 3, 0);
INSERT INTO Materias (CODMATERIA, IDCURSO, NOMEMAT, PERIODOSUG, CREDITOS) VALUES (5, 1, 'arq', 4, 0);
INSERT INTO Materias (CODMATERIA, IDCURSO, NOMEMAT, PERIODOSUG, CREDITOS) VALUES (6, 1, 'graf', 4, 0);
INSERT INTO Materias (CODMATERIA, IDCURSO, NOMEMAT, PERIODOSUG, CREDITOS) VALUES (7, 1, 'arq2', 5, 0);
INSERT INTO Materias (CODMATERIA, IDCURSO, NOMEMAT, PERIODOSUG, CREDITOS) VALUES (8, 1, 'lp2', 3, 0);
INSERT INTO Materias (CODMATERIA, IDCURSO, NOMEMAT, PERIODOSUG, CREDITOS) VALUES (9, 1, 'calc4', 3, 0);
INSERT INTO Materias (CODMATERIA, IDCURSO, NOMEMAT, PERIODOSUG, CREDITOS) VALUES (10, 1, 'aed1', 2, 0);

-- Table: Professor
CREATE TABLE Professor (MATRICULA INTEGER PRIMARY KEY AUTOINCREMENT, NOMEPROF VARCHAR, ENDERECOPROF VARCHAR);
INSERT INTO Professor (MATRICULA, NOMEPROF, ENDERECOPROF) VALUES (1, 'clicia', NULL);
INSERT INTO Professor (MATRICULA, NOMEPROF, ENDERECOPROF) VALUES (2, 'eustaquio', NULL);
INSERT INTO Professor (MATRICULA, NOMEPROF, ENDERECOPROF) VALUES (3, 'paulo', NULL);
INSERT INTO Professor (MATRICULA, NOMEPROF, ENDERECOPROF) VALUES (4, 'roger', NULL);
INSERT INTO Professor (MATRICULA, NOMEPROF, ENDERECOPROF) VALUES (201, 'cliciaa', NULL);
INSERT INTO Professor (MATRICULA, NOMEPROF, ENDERECOPROF) VALUES (202, 'eeustaquio', NULL);
INSERT INTO Professor (MATRICULA, NOMEPROF, ENDERECOPROF) VALUES (203, 'pauloo', NULL);
INSERT INTO Professor (MATRICULA, NOMEPROF, ENDERECOPROF) VALUES (204, 'rooger', NULL);

-- Table: ProfessorTel
CREATE TABLE ProfessorTel (IDTELPROF INTEGER PRIMARY KEY AUTOINCREMENT, MATRICULA INTEGER REFERENCES Professor (MATRICULA), TELPROF VARCHAR, TIPO VARHAR DEFAULT PROFESSOR);
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (1, 201, '998008602', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (2, 204, '998020615', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (3, 204, '998004906', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (4, 202, '998004633', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (5, 201, '998022010', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (6, 201, '998017036', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (7, 202, '998016160', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (8, 204, '998008127', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (9, 204, '998015496', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (10, 201, '998020758', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (11, 203, '998019430', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (12, 202, '998013845', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (13, 202, '998024047', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (14, 203, '998000813', 'PROFESSOR');
INSERT INTO ProfessorTel (IDTELPROF, MATRICULA, TELPROF, TIPO) VALUES (15, 201, '998031177', 'PROFESSOR');

-- Table: Result
CREATE TABLE Result (NOMEUSER TEXT, NOMEMAT TEXT, NOMEPROF TEXT, PERIODOSUG INT, DIASEM TEXT, DIASEM2 TEXT, VAGAS INT);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('chris', 'arq2', 'roger', 5, 'seg34', 'qua34', 55);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('chris', 'calc2', 'clicia', 2, 'ter56', 'ter12', 58);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('chris', 'graf', 'paulo', 4, 'sex12', 'sex34', 54);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('chris', 'lp1', 'eustaquio', 2, 'ter34', 'qui12', 39);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('chris', 'lp2', 'clicia', 3, 'qui34', 'sex56', 39);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('jon', 'aed2', 'sem professor', 3, 'seg34', 'qui56', 49);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('jon', 'graf', 'paulo', 4, 'sex12', 'sex34', 54);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('jon', 'lp1', 'eustaquio', 2, 'ter34', 'qui12', 39);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('jon', 'lp2', 'clicia', 3, 'qui34', 'sex56', 39);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('luis', 'arq2', 'roger', 5, 'seg34', 'qua34', 55);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('luis', 'calc2', 'clicia', 2, 'ter56', 'ter12', 58);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('luis', 'calc4', 'paulo', 3, 'qui34', 'qui56', 39);
INSERT INTO Result (NOMEUSER, NOMEMAT, NOMEPROF, PERIODOSUG, DIASEM, DIASEM2, VAGAS) VALUES ('luis', 'graf', 'paulo', 4, 'sex12', 'sex34', 54);

-- Table: Turmas
CREATE TABLE Turmas (IDTURMA INTEGER PRIMARY KEY AUTOINCREMENT, CODMATERIA INTEGER REFERENCES Materias (CODMATERIA), NUMEROTURMA INTEGER, NOMEPROF VARCHAR, DIASEM VARCHAR, HORARIO VARCHAR, DIASEM2 VARCHAR, HORARIO2 VARCHAR, VAGAS INTEGER);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (2, 7, 1, 'paulo', 'ter', '12', 'seg', '56', 41);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (3, 10, 1, 'eustaquio', 'qui', '12', 'qui', '34', 58);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (4, 1, 1, 'clicia', 'seg', '12', 'seg', '56', 46);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (5, 4, 1, 'paulo', 'qua', '12', 'qui', '12', 36);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (6, 1, 2, 'eustaquio', 'sex', '56', 'qui', '34', 58);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (7, 2, 1, 'clicia', 'qui', '34', 'qui', '12', 49);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (8, 4, 2, 'sem professor', 'seg', '34', 'qui', '56', 49);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (9, 3, 1, 'roger', 'qui', '34', 'sex', '56', 40);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (10, 7, 2, 'clicia', 'ter', '56', 'qua', '12', 42);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (11, 2, 2, 'paulo', 'ter', '12', 'qua', '12', 39);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (12, 3, 2, 'clicia', 'qui', '56', 'seg', '56', 35);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (13, 9, 1, 'roger', 'qua', '34', 'seg', '34', 41);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (14, 5, 1, 'paulo', 'seg', '56', 'qua', '56', 50);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (15, 8, 1, 'eustaquio', 'seg', '12', 'ter', '56', 53);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (16, 1, 3, 'clicia', 'seg', '56', 'sex', '34', 54);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (17, 5, 2, 'paulo', 'sex', '34', 'seg', '34', 35);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (18, 4, 3, 'sem professor', 'qua', '34', 'seg', '34', 55);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (19, 7, 3, 'sem professor', 'qua', '12', 'seg', '56', 45);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (20, 1, 4, 'paulo', 'ter', '34', 'sex', '56', 58);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (21, 2, 3, 'clicia', 'ter', '56', 'ter', '12', 58);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (22, 4, 4, 'sem professor', 'qua', '56', 'seg', '34', 55);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (23, 1, 5, 'eustaquio', 'qua', '12', 'seg', '12', 35);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (24, 2, 4, 'clicia', 'ter', '56', 'seg', '34', 58);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (25, 8, 2, 'roger', 'seg', '12', 'seg', '56', 40);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (26, 2, 5, 'paulo', 'qua', '12', 'ter', '34', 56);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (27, 2, 6, 'eustaquio', 'qua', '12', 'seg', '34', 41);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (28, 1, 6, 'clicia', 'sex', '34', 'qui', '12', 48);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (29, 3, 3, 'sem professor', 'qui', '12', 'sex', '12', 53);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (30, 1, 7, 'sem professor', 'qui', '56', 'qua', '34', 60);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (31, 6, 1, 'eustaquio', 'sex', '34', 'seg', '12', 60);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (32, 3, 4, 'paulo', 'sex', '34', 'seg', '56', 50);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (33, 3, 5, 'clicia', 'qua', '34', 'qui', '56', 53);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (34, 7, 4, 'roger', 'seg', '34', 'qua', '12', 40);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (35, 6, 2, 'sem professor', 'qua', '56', 'seg', '34', 49);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (36, 4, 5, 'roger', 'sex', '12', 'seg', '56', 58);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (37, 4, 6, 'sem professor', 'qua', '34', 'ter', '56', 41);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (38, 1, 8, 'paulo', 'ter', '12', 'qua', '56', 44);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (39, 2, 7, 'sem professor', 'qua', '56', 'seg', '34', 45);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (40, 3, 6, 'roger', 'qua', '56', 'seg', '34', 36);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (41, 2, 8, 'sem professor', 'sex', '12', 'sex', '56', 42);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (42, 10, 2, 'eustaquio', 'ter', '12', 'qua', '34', 59);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (43, 5, 3, 'paulo', 'seg', '56', 'ter', '34', 36);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (44, 7, 5, 'clicia', 'ter', '12', 'sex', '12', 49);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (45, 3, 7, 'eustaquio', 'ter', '34', 'qui', '12', 39);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (46, 10, 3, 'roger', 'qui', '34', 'ter', '12', 37);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (47, 2, 9, 'sem professor', 'qui', '12', 'seg', '12', 55);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (48, 9, 2, 'paulo', 'qui', '34', 'qui', '56', 39);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (49, 8, 3, 'sem professor', 'qua', '34', 'seg', '56', 42);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (50, 7, 6, 'sem professor', 'qua', '56', 'qui', '56', 55);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (51, 1, 9, 'clicia', 'qui', '12', 'sex', '12', 50);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (52, 5, 4, 'sem professor', 'sex', '34', 'qui', '12', 40);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (53, 6, 3, 'paulo', 'sex', '12', 'sex', '34', 54);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (54, 7, 7, 'roger', 'seg', '34', 'qua', '34', 55);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (55, 9, 3, 'clicia', 'qua', '56', 'qua', '56', 41);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (56, 9, 4, 'eustaquio', 'qui', '12', 'ter', '34', 41);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (57, 10, 4, 'roger', 'sex', '34', 'qua', '12', 35);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (58, 5, 5, 'paulo', 'qui', '56', 'seg', '12', 59);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (59, 5, 6, 'sem professor', 'sex', '12', 'qua', '34', 43);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (60, 9, 5, 'sem professor', 'sex', '34', 'ter', '34', 60);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (61, 6, 4, 'eustaquio', 'sex', '12', 'qua', '34', 56);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (62, 2, 10, 'sem professor', 'sex', '12', 'sex', '56', 59);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (63, 5, 7, 'paulo', 'sex', '56', 'qua', '12', 45);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (64, 4, 7, 'roger', 'seg', '34', 'qui', '56', 58);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (65, 10, 5, 'sem professor', 'qua', '12', 'ter', '12', 44);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (66, 6, 5, 'eustaquio', 'qui', '12', 'sex', '12', 45);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (67, 3, 8, 'roger', 'sex', '56', 'qua', '12', 40);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (68, 8, 4, 'clicia', 'qua', '12', 'qui', '12', 55);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (69, 2, 11, 'eustaquio', 'sex', '34', 'seg', '12', 51);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (70, 8, 5, 'clicia', 'qui', '34', 'sex', '56', 39);
INSERT INTO Turmas (IDTURMA, CODMATERIA, NUMEROTURMA, NOMEPROF, DIASEM, HORARIO, DIASEM2, HORARIO2, VAGAS) VALUES (71, 2, 12, 'sem professor', 'qui', '34', 'sex', '12', 49);

-- Table: User
CREATE TABLE User (MATRICULA INTEGER PRIMARY KEY AUTOINCREMENT, IDCURSO INTEGER REFERENCES Curso (IDCURSO), NOMEUSER VARCHAR, PERIODO INTEGER, CREDITOS INTEGER, ENDERECOUSER VARCHAR, RESPONSAVELINICIACAO INTEGER REFERENCES IniciacaoCientifica (RESPONSAVEL));
INSERT INTO User (MATRICULA, IDCURSO, NOMEUSER, PERIODO, CREDITOS, ENDERECOUSER, RESPONSAVELINICIACAO) VALUES (1, NULL, 'jon', 5, 70, NULL, NULL);
INSERT INTO User (MATRICULA, IDCURSO, NOMEUSER, PERIODO, CREDITOS, ENDERECOUSER, RESPONSAVELINICIACAO) VALUES (2, NULL, 'luis', 6, 70, NULL, NULL);
INSERT INTO User (MATRICULA, IDCURSO, NOMEUSER, PERIODO, CREDITOS, ENDERECOUSER, RESPONSAVELINICIACAO) VALUES (3, NULL, 'chris', 5, 60, NULL, NULL);

-- Table: UserTel
CREATE TABLE UserTel (IDTEL INTEGER PRIMARY KEY AUTOINCREMENT, MATRICULA INTEGER REFERENCES User (MATRICULA), TELALUNO VARCHAR, TIPO VARCHAR DEFAULT ALUNO);
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (1, 2, '991004954', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (2, 3, '991022047', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (3, 2, '991017862', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (4, 3, '991001433', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (5, 3, '991026948', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (6, 1, '991018408', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (7, 3, '991026876', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (8, 1, '991024857', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (9, 3, '991009750', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (10, 1, '991007461', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (11, 1, '991015063', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (12, 1, '991019499', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (13, 1, '991030989', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (14, 3, '991021501', 'ALUNO');
INSERT INTO UserTel (IDTEL, MATRICULA, TELALUNO, TIPO) VALUES (15, 3, '991010158', 'ALUNO');

-- Table: Verif
CREATE TABLE Verif (IDVERIF INTEGER PRIMARY KEY AUTOINCREMENT, MATRICULA INTEGER REFERENCES User (MATRICULA), CODMATERIA INTEGER REFERENCES Materias (CODMATERIA), JAFEZ BOOLEAN);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (1, 1, 1, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (2, 1, 2, 2);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (3, 1, 3, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (4, 2, 1, 1);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (5, 2, 2, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (6, 2, 3, 1);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (7, 1, 4, 2);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (8, 1, 5, 1);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (9, 1, 6, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (10, 1, 7, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (11, 1, 8, 2);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (12, 1, 9, 2);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (13, 1, 10, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (14, 2, 4, 2);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (15, 2, 5, 1);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (16, 2, 6, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (17, 2, 7, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (18, 2, 8, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (19, 2, 9, 2);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (20, 2, 10, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (21, 3, 2, 2);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (22, 3, 3, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (23, 3, 4, 2);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (24, 3, 5, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (25, 3, 6, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (26, 3, 7, 2);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (27, 3, 8, 2);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (28, 3, 9, 2);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (29, 3, 10, 0);
INSERT INTO Verif (IDVERIF, MATRICULA, CODMATERIA, JAFEZ) VALUES (30, 3, 1, 0);

-- View: CompletoHorariosFULL
CREATE VIEW CompletoHorariosFULL AS SELECT JAFEZ, User.NOMEUSER, Materias.NOMEMAT,Turmas.NOMEPROF, Materias.PERIODOSUG, Turmas.DIASEM, MIN(Turmas.DIASEM, Turmas.HORARIO) AS HORARIO1, Turmas.DIASEM2, MIN(Turmas.DIASEM2, Turmas.HORARIO2) AS HORARIO2, Turmas.VAGAS 
FROM Verif
JOIN User
ON User.MATRICULA = Verif.MATRICULA
JOIN Materias
ON Materias.CODMATERIA = Verif.CODMATERIA
JOIN Turmas
ON Turmas.CODMATERIA = Verif.CODMATERIA
WHERE JAFEZ = 0 
GROUP BY User.NOMEUSER, Materias.NOMEMAT, Turmas.DIASEM, Turmas.HORARIO
ORDER BY User.NOMEUSER, Turmas.DIASEM, Turmas.HORARIO;

-- View: MateriasNaoFeitasFULL
CREATE VIEW MateriasNaoFeitasFULL AS SELECT JAFEZ, User.NOMEUSER, Materias.NOMEMAT, Materias.PERIODOSUG
FROM Verif
JOIN User
ON User.MATRICULA = Verif.MATRICULA
JOIN Materias
ON Materias.CODMATERIA = Verif.CODMATERIA
JOIN Turmas
ON Turmas.CODMATERIA = Verif.CODMATERIA
WHERE JAFEZ = 0
GROUP BY Materias.NOMEMAT, User.NOMEUSER
ORDER BY Materias.PERIODOSUG, Turmas.HORARIO;

-- View: Resultado12
CREATE VIEW Resultado12 AS SELECT * FROM zUNIONComparaTempo12
GROUP BY NOMEUSER, NOMEMAT;

-- View: Resultado21
CREATE VIEW Resultado21 AS SELECT * FROM zUNIONComparaTempo21
GROUP BY NOMEUSER, NOMEMAT;

-- View: TelefonesCadastrados
CREATE VIEW TelefonesCadastrados AS SELECT * FROM zTelUserFULL
UNION
SELECT * FROM zTelProfFULL;

-- View: TurmasProfX
CREATE VIEW TurmasProfX AS SELECT Materias.NOMEMAT,
       NOMEPROF,
       NUMEROTURMA,
       DIASEM,
       HORARIO,
       DIASEM2,
       HORARIO2
  FROM Turmas
       JOIN
       Materias ON Materias.CODMATERIA = Turmas.CODMATERIA;

-- View: TurmasSemProfX
CREATE VIEW TurmasSemProfX AS SELECT Materias.NOMEMAT,
       NOMEPROF NUMEROTURMA,
       DIASEM,
       HORARIO,
       DIASEM2,
       HORARIO2
  FROM Turmas
       JOIN
       Materias ON Materias.CODMATERIA = Turmas.CODMATERIA
EXCEPT
SELECT Materias.NOMEMAT,
       NOMEPROF NUMEROTURMA,
       DIASEM,
       HORARIO,
       DIASEM2,
       HORARIO2
  FROM Turmas
       JOIN
       Materias ON Materias.CODMATERIA = Turmas.CODMATERIA
 WHERE NOMEPROF = 'paulo';

-- View: VeiculosCadastrados
CREATE VIEW VeiculosCadastrados AS SELECT * FROM EstacionamentoProf
UNION
SELECT * FROM EstacionamentoAluno;

-- View: zComparaTempo12112
CREATE VIEW zComparaTempo12112 AS SELECT *
  FROM zTEMPOy12
 WHERE (TEMPO2 NOT IN (
           SELECT *
             FROM zTEMPOx112
       )
       ) 
 GROUP BY NOMEMAT,
          NOMEUSER
 ORDER BY NOMEUSER;

-- View: zComparaTempo12121
CREATE VIEW zComparaTempo12121 AS SELECT *
  FROM zTEMPOy12
 WHERE (TEMPO2 NOT IN (
           SELECT *
             FROM zTEMPOx121
       )
       ) 
 GROUP BY NOMEMAT,
          NOMEUSER
 ORDER BY NOMEUSER;

-- View: zComparaTempo12212
CREATE VIEW zComparaTempo12212 AS SELECT *
  FROM zTEMPOy12
 WHERE (TEMPO1 NOT IN (
           SELECT *
             FROM zTEMPOx212
       )
       ) 
 GROUP BY NOMEMAT,
          NOMEUSER
 ORDER BY NOMEUSER;

-- View: zComparaTempo12221
CREATE VIEW zComparaTempo12221 AS SELECT *
  FROM zTEMPOy12
 WHERE (TEMPO1 NOT IN (
           SELECT *
             FROM zTEMPOx221
       )
       ) 
 GROUP BY NOMEMAT,
          NOMEUSER
 ORDER BY NOMEUSER;

-- View: zComparaTempo21112
CREATE VIEW zComparaTempo21112 AS SELECT *
  FROM zTEMPOy21
 WHERE (TEMPO2 NOT IN (
           SELECT *
             FROM zTEMPOx112
       )
       ) 
 GROUP BY NOMEMAT,
          NOMEUSER
 ORDER BY NOMEUSER;

-- View: zComparaTempo21121
CREATE VIEW zComparaTempo21121 AS SELECT *
  FROM zTEMPOy21
 WHERE (TEMPO2 NOT IN (
           SELECT *
             FROM zTEMPOx121
       )
       ) 
 GROUP BY NOMEMAT,
          NOMEUSER
 ORDER BY NOMEUSER;

-- View: zComparaTempo21212
CREATE VIEW zComparaTempo21212 AS SELECT *
  FROM zTEMPOy21
 WHERE (TEMPO1 NOT IN (
           SELECT *
             FROM zTEMPOx212
       )
       ) 
 GROUP BY NOMEMAT,
          NOMEUSER
 ORDER BY NOMEUSER;

-- View: zComparaTempo21221
CREATE VIEW zComparaTempo21221 AS SELECT *
  FROM zTEMPOy21
 WHERE (TEMPO1 NOT IN (
           SELECT *
             FROM zTEMPOx221
       )
       ) 
 GROUP BY NOMEMAT,
          NOMEUSER
 ORDER BY NOMEUSER;

-- View: zTelProfFULL
CREATE VIEW zTelProfFULL AS SELECT ProfessorTel.MATRICULA,
       Professor.NOMEPROF AS NOME,
       TELPROF AS TEL,
       TIPO
  FROM ProfessorTel
       JOIN
       Professor ON Professor.MATRICULA = ProfessorTel.MATRICULA
 ORDER BY Professor.NOMEPROF;

-- View: zTelUserFULL
CREATE VIEW zTelUserFULL AS SELECT UserTel.MATRICULA,
       User.NOMEUSER AS NOME,
       TELALUNO AS TEL,
       TIPO
  FROM UserTel
       JOIN
       User ON User.MATRICULA = UserTel.MATRICULA
 ORDER BY User.NOMEUSER;

-- View: zTEMPOx112
CREATE VIEW zTEMPOx112 AS SELECT TEMPO1
  FROM (
           SELECT NOMEUSER,
                  NOMEMAT,
                  NOMEPROF,
                  NUMEROTURMA,
                  PERIODOSUG,
                  (DIASEM || HORARIO1) AS TEMPO1,
                  (DIASEM2 || HORARIO2) AS TEMPO2,
                  VAGAS
             FROM (
                      SELECT *
                        FROM (
                                 SELECT *
                                   FROM (
                                            SELECT JAFEZ,
                                                   User.NOMEUSER,
                                                   Materias.NOMEMAT,
                                                   Turmas.NOMEPROF,
                                                   Turmas.NUMEROTURMA,
                                                   Materias.PERIODOSUG,
                                                   Turmas.DIASEM,
                                                   Turmas.HORARIO AS HORARIO1,
                                                   MAX( (DIASEM || HORARIO) ) AS TEMPO1,
                                                   MAX( (DIASEM2 || HORARIO2) ) AS TEMPO2,
                                                   Turmas.DIASEM2,
                                                   Turmas.HORARIO2 AS HORARIO2,
                                                   Turmas.VAGAS
                                              FROM Verif
                                                   JOIN
                                                   User ON User.MATRICULA = Verif.MATRICULA
                                                   JOIN
                                                   Materias ON Materias.CODMATERIA = Verif.CODMATERIA
                                                   JOIN
                                                   Turmas ON Turmas.CODMATERIA = Verif.CODMATERIA
                                             WHERE JAFEZ = 0 AND 
                                                   Turmas.VAGAS > 0 AND 
                                                   User.CREDITOS >= Materias.CREDITOS
                                             GROUP BY Materias.NOMEMAT,
                                                      Turmas.DIASEM,
                                                      Turmas.HORARIO,
                                                      User.NOMEUSER
                                             ORDER BY User.NOMEUSER,
                                                      Turmas.DIASEM,
                                                      Turmas.HORARIO
                                        )
                                        Resultado1
                                  GROUP BY NOMEMAT,
                                           TEMPO2,
                                           NOMEUSER
                             )
                             Resultado2
                       GROUP BY TEMPO1,
                                NOMEUSER
                  )
                  Resultado3
            GROUP BY TEMPO2,
                     NOMEUSER
       )
       Resultado4
 GROUP BY NOMEMAT,
          NOMEUSER;

-- View: zTEMPOx121
CREATE VIEW zTEMPOx121 AS SELECT TEMPO1
  FROM (
           SELECT NOMEUSER,
                  NOMEMAT,
                  NOMEPROF,
                  NUMEROTURMA,
                  PERIODOSUG,
                  (DIASEM || HORARIO1) AS TEMPO1,
                  (DIASEM2 || HORARIO2) AS TEMPO2,
                  VAGAS
             FROM (
                      SELECT *
                        FROM (
                                 SELECT *
                                   FROM (
                                            SELECT JAFEZ,
                                                   User.NOMEUSER,
                                                   Materias.NOMEMAT,
                                                   Turmas.NOMEPROF,
                                                   Turmas.NUMEROTURMA,
                                                   Materias.PERIODOSUG,
                                                   Turmas.DIASEM,
                                                   Turmas.HORARIO AS HORARIO1,
                                                   MAX( (DIASEM || HORARIO) ) AS TEMPO1,
                                                   MAX( (DIASEM2 || HORARIO2) ) AS TEMPO2,
                                                   Turmas.DIASEM2,
                                                   Turmas.HORARIO2 AS HORARIO2,
                                                   Turmas.VAGAS
                                              FROM Verif
                                                   JOIN
                                                   User ON User.MATRICULA = Verif.MATRICULA
                                                   JOIN
                                                   Materias ON Materias.CODMATERIA = Verif.CODMATERIA
                                                   JOIN
                                                   Turmas ON Turmas.CODMATERIA = Verif.CODMATERIA
                                             WHERE JAFEZ = 0 AND 
                                                   Turmas.VAGAS > 0 AND 
                                                   User.CREDITOS >= Materias.CREDITOS
                                             GROUP BY Materias.NOMEMAT,
                                                      Turmas.DIASEM2,
                                                      Turmas.HORARIO2,
                                                      User.NOMEUSER
                                             ORDER BY User.NOMEUSER,
                                                      Turmas.DIASEM,
                                                      Turmas.HORARIO
                                        )
                                        Resultado1
                                  GROUP BY NOMEMAT,
                                           TEMPO1,
                                           NOMEUSER
                             )
                             Resultado2
                       GROUP BY TEMPO2,
                                NOMEUSER
                  )
                  Resultado3
            GROUP BY TEMPO1,
                     NOMEUSER
       )
       Resultado4
 GROUP BY NOMEMAT,
          NOMEUSER;

-- View: zTEMPOx212
CREATE VIEW zTEMPOx212 AS SELECT TEMPO2
             FROM (
                      SELECT NOMEUSER,
                             NOMEMAT,
                             NOMEPROF,
                             NUMEROTURMA,
                             PERIODOSUG,
                             (DIASEM || HORARIO1) AS TEMPO1,
                             (DIASEM2 || HORARIO2) AS TEMPO2,
                             VAGAS
                        FROM (
                                 SELECT *
                                   FROM (
                                            SELECT *
                                              FROM (
                                                       SELECT JAFEZ,
                                                              User.NOMEUSER,
                                                              Materias.NOMEMAT,
                                                              Turmas.NOMEPROF,
                                                              Turmas.NUMEROTURMA,
                                                              Materias.PERIODOSUG,
                                                              Turmas.DIASEM,
                                                              Turmas.HORARIO AS HORARIO1,
                                                              MAX( (DIASEM || HORARIO) ) AS TEMPO1,
                                                              MAX( (DIASEM2 || HORARIO2) ) AS TEMPO2,
                                                              Turmas.DIASEM2,
                                                              Turmas.HORARIO2 AS HORARIO2,
                                                              Turmas.VAGAS
                                                         FROM Verif
                                                              JOIN
                                                              User ON User.MATRICULA = Verif.MATRICULA
                                                              JOIN
                                                              Materias ON Materias.CODMATERIA = Verif.CODMATERIA
                                                              JOIN
                                                              Turmas ON Turmas.CODMATERIA = Verif.CODMATERIA
                                                        WHERE JAFEZ = 0 AND Turmas.VAGAS > 0 AND User.CREDITOS >= Materias.CREDITOS
                                                        GROUP BY Materias.NOMEMAT,
                                                                 Turmas.DIASEM,
                                                                 Turmas.HORARIO,
                                                                 User.NOMEUSER
                                                        ORDER BY User.NOMEUSER,
                                                                 Turmas.DIASEM,
                                                                 Turmas.HORARIO
                                                   )
                                                   Resultado1
                                             GROUP BY NOMEMAT,
                                                      TEMPO2,
                                                      NOMEUSER
                                        )
                                        Resultado2
                                        GROUP BY TEMPO1, NOMEUSER
                             )
                             Resultado3
                       GROUP BY TEMPO2,
                                NOMEUSER
                  )
                  Resultado4
            GROUP BY NOMEMAT,
                     NOMEUSER;

-- View: zTEMPOx221
CREATE VIEW zTEMPOx221 AS SELECT TEMPO2
  FROM (
           SELECT NOMEUSER,
                  NOMEMAT,
                  NOMEPROF,
                  NUMEROTURMA,
                  PERIODOSUG,
                  (DIASEM || HORARIO1) AS TEMPO1,
                  (DIASEM2 || HORARIO2) AS TEMPO2,
                  VAGAS
             FROM (
                      SELECT *
                        FROM (
                                 SELECT *
                                   FROM (
                                            SELECT JAFEZ,
                                                   User.NOMEUSER,
                                                   Materias.NOMEMAT,
                                                   Turmas.NOMEPROF,
                                                   Turmas.NUMEROTURMA,
                                                   Materias.PERIODOSUG,
                                                   Turmas.DIASEM,
                                                   Turmas.HORARIO AS HORARIO1,
                                                   MAX( (DIASEM || HORARIO) ) AS TEMPO1,
                                                   MAX( (DIASEM2 || HORARIO2) ) AS TEMPO2,
                                                   Turmas.DIASEM2,
                                                   Turmas.HORARIO2 AS HORARIO2,
                                                   Turmas.VAGAS
                                              FROM Verif
                                                   JOIN
                                                   User ON User.MATRICULA = Verif.MATRICULA
                                                   JOIN
                                                   Materias ON Materias.CODMATERIA = Verif.CODMATERIA
                                                   JOIN
                                                   Turmas ON Turmas.CODMATERIA = Verif.CODMATERIA
                                             WHERE JAFEZ = 0 AND 
                                                   Turmas.VAGAS > 0 AND 
                                                   User.CREDITOS >= Materias.CREDITOS
                                             GROUP BY Materias.NOMEMAT,
                                                      Turmas.DIASEM2,
                                                      Turmas.HORARIO2,
                                                      User.NOMEUSER
                                             ORDER BY User.NOMEUSER,
                                                      Turmas.DIASEM,
                                                      Turmas.HORARIO
                                        )
                                        Resultado1
                                  GROUP BY NOMEMAT,
                                           TEMPO1,
                                           NOMEUSER
                             )
                             Resultado2
                       GROUP BY TEMPO2,
                                NOMEUSER
                  )
                  Resultado3
            GROUP BY TEMPO1,
                     NOMEUSER
       )
       Resultado4
 GROUP BY NOMEMAT,
          NOMEUSER;

-- View: zTEMPOy12
CREATE VIEW zTEMPOy12 AS SELECT NOMEUSER,
       NOMEMAT,
       NOMEPROF,
       NUMEROTURMA,
       PERIODOSUG,
       (DIASEM || HORARIO1) AS TEMPO1,
       (DIASEM2 || HORARIO2) AS TEMPO2,
       VAGAS
  FROM (
           SELECT *
             FROM (
                      SELECT *
                        FROM (
                                 SELECT JAFEZ,
                                        User.NOMEUSER,
                                        Materias.NOMEMAT,
                                        Turmas.NOMEPROF,
                                        Turmas.NUMEROTURMA,
                                        Materias.PERIODOSUG,
                                        Turmas.DIASEM,
                                        Turmas.HORARIO AS HORARIO1,
                                        MAX( (DIASEM || HORARIO) ) AS TEMPO1,
                                        MAX( (DIASEM2 || HORARIO2) ) AS TEMPO2,
                                        Turmas.DIASEM2,
                                        Turmas.HORARIO2 AS HORARIO2,
                                        Turmas.VAGAS
                                   FROM Verif
                                        JOIN
                                        User ON User.MATRICULA = Verif.MATRICULA
                                        JOIN
                                        Materias ON Materias.CODMATERIA = Verif.CODMATERIA
                                        JOIN
                                        Turmas ON Turmas.CODMATERIA = Verif.CODMATERIA
                                  WHERE JAFEZ = 0 AND 
                                        Turmas.VAGAS > 0 AND 
                                        User.CREDITOS >= Materias.CREDITOS
                                  GROUP BY Materias.NOMEMAT,
                                           Turmas.DIASEM,
                                           Turmas.HORARIO,
                                           User.NOMEUSER
                                  ORDER BY User.NOMEUSER,
                                           Turmas.DIASEM,
                                           Turmas.HORARIO
                             )
                             Resultado1
                       GROUP BY NOMEMAT,
                                TEMPO2,
                                NOMEUSER
                  )
                  Resultado2
            GROUP BY TEMPO1,
                     NOMEUSER
       )
       Resultado3
 GROUP BY TEMPO2,
          NOMEUSER;

-- View: zTEMPOy21
CREATE VIEW zTEMPOy21 AS SELECT NOMEUSER,
                  NOMEMAT,
                  NOMEPROF,
                  NUMEROTURMA,
                  PERIODOSUG,
                  (DIASEM || HORARIO1) AS TEMPO1,
                  (DIASEM2 || HORARIO2) AS TEMPO2,
                  VAGAS
             FROM (
                      SELECT *
                        FROM (
                                 SELECT *
                                   FROM (
                                            SELECT JAFEZ,
                                                   User.NOMEUSER,
                                                   Materias.NOMEMAT,
                                                   Turmas.NOMEPROF,
                                                   Turmas.NUMEROTURMA,
                                                   Materias.PERIODOSUG,
                                                   Turmas.DIASEM,
                                                   Turmas.HORARIO AS HORARIO1,
                                                   MAX( (DIASEM || HORARIO) ) AS TEMPO1,
                                                   MAX( (DIASEM2 || HORARIO2) ) AS TEMPO2,
                                                   Turmas.DIASEM2,
                                                   Turmas.HORARIO2 AS HORARIO2,
                                                   Turmas.VAGAS
                                              FROM Verif
                                                   JOIN
                                                   User ON User.MATRICULA = Verif.MATRICULA
                                                   JOIN
                                                   Materias ON Materias.CODMATERIA = Verif.CODMATERIA
                                                   JOIN
                                                   Turmas ON Turmas.CODMATERIA = Verif.CODMATERIA
                                             WHERE JAFEZ = 0 AND 
                                                   Turmas.VAGAS > 0 AND 
                                                   User.CREDITOS >= Materias.CREDITOS
                                             GROUP BY Materias.NOMEMAT,
                                                      Turmas.DIASEM2,
                                                      Turmas.HORARIO2,
                                                      User.NOMEUSER
                                             ORDER BY User.NOMEUSER,
                                                      Turmas.DIASEM,
                                                      Turmas.HORARIO
                                        )
                                        Resultado1
                                  GROUP BY NOMEMAT,
                                           TEMPO1,
                                           NOMEUSER
                             )
                             Resultado2
                             GROUP BY TEMPO2, NOMEUSER
                  )
                  Resultado3
            GROUP BY TEMPO1,
                     NOMEUSER;

-- View: zUNIONComparaTempo12
CREATE VIEW zUNIONComparaTempo12 AS SELECT *
  FROM zComparaTempo12112
UNION
SELECT *
  FROM zComparaTempo12121
UNION
SELECT *
  FROM zComparaTempo12212
UNION
SELECT *
  FROM zComparaTempo12221;

-- View: zUNIONComparaTempo21
CREATE VIEW zUNIONComparaTempo21 AS SELECT *
  FROM zComparaTempo21112
UNION
SELECT *
  FROM zComparaTempo21121
UNION
SELECT *
  FROM zComparaTempo21212
UNION
SELECT *
  FROM zComparaTempo21221;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;

--
-- File generated with SQLiteStudio v3.2.1 on seg out 7 15:13:17 2019
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Curso
CREATE TABLE Curso (IDCURSO INTEGER PRIMARY KEY AUTOINCREMENT, NOMECURSO VARCHAR, TOTALPERIODOS INTEGER);

-- Table: EstacionamentoAluno
CREATE TABLE EstacionamentoAluno (PLACA VARCHAR PRIMARY KEY, MODELO VARCHAR, MATRICULADONO INTEGER REFERENCES User (MATRICULA), TIPO VARCHAR DEFAULT ALUNO NOT NULL);

-- Table: EstacionamentoProf
CREATE TABLE EstacionamentoProf (PLACA VARCHAR PRIMARY KEY, MODELO VARCHAR, MATRICULADONO INTEGER REFERENCES Professor (MATRICULA), TIPO VARCHAR DEFAULT PROFESSOR NOT NULL);

-- Table: IniciacaoCientifica
CREATE TABLE IniciacaoCientifica (RESPONSAVEL INTEGER REFERENCES Professor (MATRICULA) PRIMARY KEY, TEMA VARCHAR, OBJETIVO VARCHAR);

-- Table: Materias
CREATE TABLE Materias (CODMATERIA INTEGER PRIMARY KEY AUTOINCREMENT, IDCURSO INTEGER REFERENCES Curso (IDCURSO), NOMEMAT VARCHAR, PERIODOSUG INTEGER, CREDITOS INTEGER);

-- Table: Professor
CREATE TABLE Professor (MATRICULA INTEGER PRIMARY KEY AUTOINCREMENT, NOMEPROF VARCHAR, ENDERECOPROF VARCHAR);

-- Table: ProfessorTel
CREATE TABLE ProfessorTel (IDTELPROF INTEGER PRIMARY KEY AUTOINCREMENT, MATRICULA INTEGER REFERENCES Professor (MATRICULA), TELPROF VARCHAR, TIPO VARHAR DEFAULT PROFESSOR);

-- Table: Result
CREATE TABLE Result (NOMEUSER TEXT, NOMEMAT TEXT, NOMEPROF TEXT, PERIODOSUG INT, DIASEM TEXT, DIASEM2 TEXT, VAGAS INT);

-- Table: Turmas
CREATE TABLE Turmas (IDTURMA INTEGER PRIMARY KEY AUTOINCREMENT, CODMATERIA INTEGER REFERENCES Materias (CODMATERIA), NUMEROTURMA INTEGER, NOMEPROF VARCHAR, DIASEM VARCHAR, HORARIO VARCHAR, DIASEM2 VARCHAR, HORARIO2 VARCHAR, VAGAS INTEGER);

-- Table: User
CREATE TABLE User (MATRICULA INTEGER PRIMARY KEY AUTOINCREMENT, IDCURSO INTEGER REFERENCES Curso (IDCURSO), NOMEUSER VARCHAR, PERIODO INTEGER, CREDITOS INTEGER, ENDERECOUSER VARCHAR, RESPONSAVELINICIACAO INTEGER REFERENCES IniciacaoCientifica (RESPONSAVEL));

-- Table: UserTel
CREATE TABLE UserTel (IDTEL INTEGER PRIMARY KEY AUTOINCREMENT, MATRICULA INTEGER REFERENCES User (MATRICULA), TELALUNO VARCHAR, TIPO VARCHAR DEFAULT ALUNO);

-- Table: Verif
CREATE TABLE Verif (IDVERIF INTEGER PRIMARY KEY AUTOINCREMENT, MATRICULA INTEGER REFERENCES User (MATRICULA), CODMATERIA INTEGER REFERENCES Materias (CODMATERIA), JAFEZ BOOLEAN);

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

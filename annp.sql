DROP TABLE IF EXISTS RAN_IN, POOL, COMPETITION, TEAM, EMPLOYEE, PERSONAL_BEST, ATHLETE

CREATE TABLE IF NOT EXISTS
ATHLETE
(
	Num 			INT PRIMARY KEY AUTO_INCREMENT,
	Name 			VARCHAR(128) NOT NULL,
	Sex 			ENUM('M', 'F') NOT NULL,
	BirthDate 		DATE NOT NULL,
	Phone 			INT DEFAULT NULL,
  	Email 			VARCHAR(64) NOT NULL,
  	Team   			INT NOT NULL,
  	JoinDate		DATE NOT NULL,
  	FOREIGN KEY(Team) REFERENCES CLUB(Num) ON DELETE CASCADE
);

INSERT INTO
	ATHLETE(Num,Name, Sex, BirthDate, Phone, Email, Team, JoinDate)
VALUES
(1,'Pedro Miguel Ribeiro Carvalho','M','1999-04-17', '913456222', 'pedrocarvalhoAACL@gmail.com', 1, '2014-01-01'),
(2,'Rui Pedro Sousa Carvalho','M','1997-08-12', '923466355', 'ruisousaAACL@gmail.com', 1, '2016-01-01'),
(3,'Marta Maria Ribeiro Flor','F','2000-02-01', '912345666', 'martarflorAACL@gmail.com', 1, '2013-01-01')

CREATE TABLE IF NOT EXISTS
PERSONAL_BEST
(
	AthleteNum 		INT NOT NULL,
	Race 			VARCHAR(64) NOT NULL,
	PoolDistance 	INT NOT NULL,
	RaceTime		TIME NOT NULL,
	RaceDate 		DATE NOT NULL,
	City 			VARCHAR(64) NOT NULL,
	Competition 	VARCHAR(128) NOT NULL,
	PRIMARY KEY(AthleteNum,Race,PoolDistance,RaceTime,RaceDate,City,Competition),
	FOREIGN KEY(AthleteNum) REFERENCES ATHLETE(Num) ON DELETE CASCADE
);

INSERT INTO
	PERSONAL_BEST(AthleteNum, Race, PoolDistance, RaceTime, RaceDate, City, Competition)
VALUES
(1, '100 FREESTYLE', '50 m', '0:0:52.52', '2019-06-10', 'Amarante', 'Campeonato Regional de Verão'),
(2, '100 BUTTERFLY', '50 m', '0:0:50.52', '2019-12-10', 'Amarante', 'Campeonato Regional de Inverno')

CREATE TABLE IF NOT EXISTS
EMPLOYEE
(
	Num 		INT PRIMARY KEY AUTO_INCREMENT,
	Name 		VARCHAR(128) NOT NULL,
	Sex 		ENUM('M', 'F') NOT NULL,
	BirthDate 	DATE NOT NULL,
	Phone 		INT DEFAULT NULL,
  	Email 		VARCHAR(64) NOT NULL,
  	Team    	INT NOT NULL,
  	JoinDate 	DATE NOT NULL,
  	FOREIGN KEY(Team) REFERENCES CLUB(Num) ON DELETE CASCADE
);

INSERT INTO
	EMPLOYEE(Num, Name, Sex, BirthDate, Phone, Email, Team, JoinDate)
VALUES
(1, 'José Carlos Pinto', 'M', '1982-02-02', '919233428', 'zepintoAACL@gmail.com', 1, '2010-02-10'),
(2, 'Sérgio Moreira', 'M', '1977-06-10', '929632998', 'directorAACL@gmail.com', 1, '2014-07-20'),
(3, 'Carla Sousa', 'F', '1981-02-25', '915635597', 'directorfcpnat@fcp.pt', 2, '2010-10-11')

CREATE TABLE IF NOT EXISTS
TEAM
(
	Num 		INT PRIMARY KEY AUTO_INCREMENT,
	Name 		VARCHAR(128) NOT NULL,
	Email 		VARCHAR(64) NOT NULL,
	Director	INT NOT NULL,
	ClubPool	INT NOT NULL,
	FOREIGN KEY(Director) REFERENCES EMPLOYEE(Num) ON DELETE CASCADE,
	FOREIGN KEY(ClubPool) REFERENCES POOL(Num) ON DELETE CASCADE
);

INSERT INTO
	TEAM(Num,Name,Email,Director,ClubPool)
VALUES
(1, 'Amarantus Aquatic Club', 'aacl@gmail.com', 2, 1),
(2, 'Futebol Clube do Porto', 'fcp@fcp.pt', 3, 3)


CREATE TABLE IF NOT EXISTS
COMPETITION
(
	Num 		INT PRIMARY KEY AUTO_INCREMENT,
	Name 		VARCHAR(128) NOT NULL
	PoolNum 	INT NOT NULL,
	CompDate	DATE NOT NULL,
	FOREIGN KEY(PoolNum) REFERENCES POOL(Num) ON DELETE CASCADE
);

INSERT INTO
	COMPETITION(Num,Name,PoolNum,CompDate)
VALUES
(1, 'Campeonato Regional de Inverno',1, '2019-12-10'),
(2, 'Campeonato Regional de Verão',2,'2019-06-10')

CREATE TABLE IF NOT EXISTS
POOL
(
	Num 			INT PRIMARY KEY AUTO_INCREMENT,
	Name 			VARCHAR(128) NOT NULL,
	AddStreet		VARCHAR(64) NOT NULL,
  	AddNum			VARCHAR(3) NOT NULL,
  	AddPostalCode 	VARCHAR(8) NOT NULL,
  	AddTown			VARCHAR(64) NOT NULL,
);

INSERT INTO
	POOL(Num,Name,AddStreet,AddNum,AddPostalCode,AddTown)
VALUES
(1, 'Piscina Municial de Vila Meã', 'Rua da Vila', 210, '4605-900', 'Amarante'),
(2, 'Piscina Municial de Amarante', 'Rua do Parque Florestal', 20, '4605-900', 'Amarante'),
(3, 'Piscina Municial de Campanhã', 'Rua de Campanhã', 15, '4500-050', 'Porto')

CREATE TABLE IF NOT EXISTS
RAN_IN
(
	AthleteNum		INT NOT NULL,
	CompetitionNum 	INT NOT NULL,
	CompDate		DATE NOT NULL,
	PoolName		VARCHAR(128) NOT NULL,
	PRIMARY KEY(AthleteNum,CompetitionNum),
	FOREIGN KEY(AthleteNum) REFERENCES ATHLETE(Num) ON DELETE CASCADE,
	FOREIGN KEY(CompetitionNum) REFERENCES COMPETITION(Num) ON DELETE CASCADE
);

INSERT INTO
	RAN_IN(AthleteNum,CompetitionNum,CompDate,PoolName)
VALUES
(1, 2, '2019-06-10','Piscina Municial de Amarante'),
(2, 1, '2019-12-10','Piscina Municial de Amarante')
-- Make sure you import all dataframes from the folder 
-- cleaned_dataframes before running the code below

ALTER TABLE merged_ 
MODIFY Team VARCHAR(30),
MODIFY Player VARCHAR(30);

ALTER TABLE playoffs MODIFY Team VARCHAR(30);

ALTER TABLE playoffs
ADD PRIMARY KEY (Team);



ALTER TABLE blazers_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE blazers_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE blazers_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE clippers_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE clippers_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE clippers_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE grizzlies_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE grizzlies_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE grizzlies_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE jazz_rank
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE jazz_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE jazz_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE kings_rank
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE kings_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE kings_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE lakers_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE lakers_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE lakers_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE mavericks_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE mavericks_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE mavericks_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE nuggets_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE nuggets_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE nuggets_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE pelicans_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE pelicans_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE pelicans_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE rockets_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE rockets_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE rockets_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE spurs_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE spurs_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE spurs_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE suns_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE suns_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE suns_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE thunder_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE thunder_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE thunder_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE timberwolves_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE timberwolves_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE timberwolves_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



ALTER TABLE warriors_rank 
MODIFY Team VARCHAR(30),
MODIFY Season VARCHAR(30);

ALTER TABLE warriors_rank
ADD PRIMARY KEY (Season, Team);

ALTER TABLE warriors_rank 
ADD FOREIGN KEY (Team) REFERENCES playoffs(Team);



CREATE TABLE New_Orleans_Pelicans AS 
SELECT * FROM merged_ 
WHERE Team = 'New Orleans Pelicans';

ALTER TABLE New_Orleans_Pelicans
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE New_Orleans_Pelicans 
ADD FOREIGN KEY (Team) REFERENCES pelicans_rank(Team);



CREATE TABLE Oklahoma_City_Thunder AS 
SELECT * FROM merged_ 
WHERE Team = 'Oklahoma City Thunder';

ALTER TABLE Oklahoma_City_Thunder
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE Oklahoma_City_Thunder 
ADD FOREIGN KEY (Team) REFERENCES thunder_rank(Team);



CREATE TABLE Denver_Nuggets AS 
SELECT * FROM merged_ 
WHERE Team = 'Denver Nuggets';

ALTER TABLE Denver_Nuggets
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE Denver_Nuggets 
ADD FOREIGN KEY (Team) REFERENCES nuggets_rank(Team);
    


CREATE TABLE Dallas_Mavericks AS 
SELECT * FROM merged_ 
WHERE Team = 'Dallas Mavericks';

ALTER TABLE Dallas_Mavericks
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE Dallas_Mavericks 
ADD FOREIGN KEY (Team) REFERENCES mavericks_rank(Team);
    


CREATE TABLE Phoenix_Suns AS 
SELECT * FROM merged_ 
WHERE Team = 'Phoenix Suns';

ALTER TABLE Phoenix_Suns
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE Phoenix_Suns 
ADD FOREIGN KEY (Team) REFERENCES suns_rank(Team);



CREATE TABLE Minnesota_Timberwolves AS 
SELECT * FROM merged_ 
WHERE Team = 'Minnesota Timberwolves';

ALTER TABLE Minnesota_Timberwolves
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE Minnesota_Timberwolves 
ADD FOREIGN KEY (Team) REFERENCES timberwolves_rank(Team);
    
    

CREATE TABLE Los_Angeles_Lakers AS 
SELECT * FROM merged_ 
WHERE Team = 'Los Angeles Lakers';

ALTER TABLE Los_Angeles_Lakers
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE Los_Angeles_Lakers 
ADD FOREIGN KEY (Team) REFERENCES lakers_rank(Team);
    


CREATE TABLE LA_Clippers AS 
SELECT * FROM merged_ 
WHERE Team = 'LA Clippers';

ALTER TABLE LA_Clippers
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE LA_Clippers 
ADD FOREIGN KEY (Team) REFERENCES clippers_rank(Team);

    

CREATE TABLE Sacramento_Kings AS 
SELECT * FROM merged_ 
WHERE Team = 'Sacramento Kings';

ALTER TABLE Sacramento_Kings
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE Sacramento_Kings 
ADD FOREIGN KEY (Team) REFERENCES kings_rank(Team);
    


CREATE TABLE San_Antonio_Spurs AS 
SELECT * FROM merged_ 
WHERE Team = 'San Antonio Spurs';

ALTER TABLE San_Antonio_Spurs
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE San_Antonio_Spurs 
ADD FOREIGN KEY (Team) REFERENCES spurs_rank(Team);
    
    

CREATE TABLE Golden_State_Warriors AS 
SELECT * FROM merged_ 
WHERE Team = 'Golden State Warriors';

ALTER TABLE Golden_State_Warriors
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE Golden_State_Warriors 
ADD FOREIGN KEY (Team) REFERENCES warriors_rank(Team);
    
    

CREATE TABLE Utah_Jazz AS 
SELECT * FROM merged_ 
WHERE Team = 'Utah Jazz';

ALTER TABLE Utah_Jazz
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE Utah_Jazz 
ADD FOREIGN KEY (Team) REFERENCES jazz_rank(Team);
    


CREATE TABLE Houston_Rockets AS
SELECT * FROM merged_ 
WHERE Team = 'Houston Rockets';

ALTER TABLE Houston_Rockets
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE Houston_Rockets 
ADD FOREIGN KEY (Team) REFERENCES rockets_rank(Team);



CREATE TABLE Portland_Trail_Blazers AS 
SELECT * FROM merged_ 
WHERE Team = 'Portland Trail Blazers';

ALTER TABLE Portland_Trail_Blazers
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE Portland_Trail_Blazers 
ADD FOREIGN KEY (Team) REFERENCES blazers_rank(Team);
    
    

CREATE TABLE Memphis_Grizzlies AS 
SELECT * FROM merged_ 
WHERE Team = 'Memphis Grizzlies';

ALTER TABLE Memphis_Grizzlies
ADD PRIMARY KEY (Team, New_Rk);

ALTER TABLE Memphis_Grizzlies 
ADD FOREIGN KEY (Team) REFERENCES grizzlies_rank(Team);



DROP TABLE merged_;
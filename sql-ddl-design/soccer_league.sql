DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE Team (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(100),
    home_stadium VARCHAR(100)
);

CREATE TABLE Player (
    player_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

CREATE TABLE Referee (
    referee_id INT PRIMARY KEY,
    name VARCHAR(100),
    experience_level VARCHAR(50)
);

CREATE TABLE Season (
    season_id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE Match (
    match_id INT PRIMARY KEY,
    team1_id INT,
    team2_id INT,
    match_date DATE,
    stadium VARCHAR(100),
    season_id INT,
    FOREIGN KEY (team1_id) REFERENCES Team(team_id),
    FOREIGN KEY (team2_id) REFERENCES Team(team_id),
    FOREIGN KEY (season_id) REFERENCES Season(season_id)
);

CREATE TABLE Goal (
    goal_id INT PRIMARY KEY,
    match_id INT,
    player_id INT,
    team_id INT,
    minute_scored INT,
    FOREIGN KEY (match_id) REFERENCES Match(match_id),
    FOREIGN KEY (player_id) REFERENCES Player(player_id),
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

CREATE TABLE MatchReferee (
    match_id INT,
    referee_id INT,
    PRIMARY KEY (match_id, referee_id),
    FOREIGN KEY (match_id) REFERENCES Match(match_id),
    FOREIGN KEY (referee_id) REFERENCES Referee(referee_id)
);

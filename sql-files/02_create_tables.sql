-- =========================================================
-- Football Club Management System
-- File 2: Table Creation
-- Tables included:
--   Core:            Clubs, Teams, Players, Coaches_Staff, Stadiums
--   Match-related:   Matches
--   Supporting:      Transfers, Sponsors, Payments
-- =========================================================

USE football_club_management;

-- ---------------------------------------------------------
-- 1. STADIUMS
-- ---------------------------------------------------------
CREATE TABLE Stadiums (
    stadium_id      INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    location        VARCHAR(100) NOT NULL,
    capacity        INT NOT NULL
);

-- ---------------------------------------------------------
-- 2. CLUBS
-- ---------------------------------------------------------
CREATE TABLE Clubs (
    club_id         INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    founded_date    DATE NOT NULL,
    city            VARCHAR(100) NOT NULL,
    country         VARCHAR(100) NOT NULL,
    stadium_id      INT,
    phone           VARCHAR(20),
    email           VARCHAR(100),
    FOREIGN KEY (stadium_id) REFERENCES Stadiums(stadium_id)
        ON DELETE SET NULL
);

-- ---------------------------------------------------------
-- 3. TEAMS
-- ---------------------------------------------------------
CREATE TABLE Teams (
    team_id         INT AUTO_INCREMENT PRIMARY KEY,
    club_id         INT NOT NULL,
    team_name       VARCHAR(100) NOT NULL,
    category        VARCHAR(50) NOT NULL,   -- e.g. Senior, Youth, Reserve
    FOREIGN KEY (club_id) REFERENCES Clubs(club_id)
        ON DELETE CASCADE
);

-- ---------------------------------------------------------
-- 4. COACHES_STAFF
-- ---------------------------------------------------------
CREATE TABLE Coaches_Staff (
    staff_id        INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    role            VARCHAR(50) NOT NULL,   -- e.g. Head Coach, Assistant, Physio
    team_id         INT,
    phone           VARCHAR(20),
    salary          DECIMAL(12,2),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
        ON DELETE SET NULL
);

-- ---------------------------------------------------------
-- 5. PLAYERS
-- ---------------------------------------------------------
CREATE TABLE Players (
    player_id       INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    dob             DATE NOT NULL,
    nationality     VARCHAR(50) NOT NULL,
    position        VARCHAR(30) NOT NULL,
    jersey_number   INT NOT NULL,
    team_id         INT,
    contract_start  DATE,
    contract_end    DATE,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
        ON DELETE SET NULL
);

-- ---------------------------------------------------------
-- 6. MATCHES
-- ---------------------------------------------------------
CREATE TABLE Matches (
    match_id        INT AUTO_INCREMENT PRIMARY KEY,
    home_team_id    INT NOT NULL,
    away_team_id    INT NOT NULL,
    stadium_id      INT,
    match_date      DATETIME NOT NULL,
    competition     VARCHAR(100),
    home_score      INT DEFAULT 0,
    away_score      INT DEFAULT 0,
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (stadium_id) REFERENCES Stadiums(stadium_id)
        ON DELETE SET NULL
);

-- ---------------------------------------------------------
-- 7. TRANSFERS
-- ---------------------------------------------------------
CREATE TABLE Transfers (
    transfer_id     INT AUTO_INCREMENT PRIMARY KEY,
    player_id       INT NOT NULL,
    from_club       VARCHAR(100) NOT NULL,
    to_club         VARCHAR(100) NOT NULL,
    transfer_date   DATE NOT NULL,
    fee             DECIMAL(12,2),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
        ON DELETE CASCADE
);

-- ---------------------------------------------------------
-- 8. SPONSORS
-- ---------------------------------------------------------
CREATE TABLE Sponsors (
    sponsor_id      INT AUTO_INCREMENT PRIMARY KEY,
    club_id         INT NOT NULL,
    name            VARCHAR(100) NOT NULL,
    contract_amount DECIMAL(14,2),
    start_date      DATE,
    end_date        DATE,
    FOREIGN KEY (club_id) REFERENCES Clubs(club_id)
        ON DELETE CASCADE
);

-- ---------------------------------------------------------
-- 9. PAYMENTS
-- ---------------------------------------------------------
CREATE TABLE Payments (
    payment_id      INT AUTO_INCREMENT PRIMARY KEY,
    player_id       INT,
    staff_id        INT,
    amount          DECIMAL(12,2) NOT NULL,
    payment_date    DATE NOT NULL,
    payment_type    VARCHAR(50) NOT NULL,   -- e.g. Salary, Bonus
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
        ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES Coaches_Staff(staff_id)
        ON DELETE CASCADE
);

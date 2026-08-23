-- =========================================================
-- Football Club Management System
-- File 3: Sample Data Insertion
-- Note: Club/stadium/player names are based on real clubs;
-- some operational data (staff salaries, payments, some
-- transfer fees/dates) is fictional for demo purposes.
-- =========================================================

USE football_club_management;

-- ---------------------------------------------------------
-- STADIUMS
-- ---------------------------------------------------------
INSERT INTO Stadiums (name, location, capacity) VALUES
('Santiago Bernabeu', 'Madrid, Spain', 78297),
('Camp Nou', 'Barcelona, Spain', 99354),
('Old Trafford', 'Manchester, England', 74310),
('Allianz Arena', 'Munich, Germany', 75000),
('Juventus Stadium', 'Turin, Italy', 41507);

-- ---------------------------------------------------------
-- CLUBS
-- ---------------------------------------------------------
INSERT INTO Clubs (name, founded_date, city, country, stadium_id, phone, email) VALUES
('Real Madrid CF', '1902-03-06', 'Madrid', 'Spain', 1, '+34-913-984-300', 'contact@realmadrid.com'),
('FC Barcelona', '1899-11-29', 'Barcelona', 'Spain', 2, '+34-902-189-900', 'contact@fcbarcelona.com'),
('Manchester United FC', '1878-01-01', 'Manchester', 'England', 3, '+44-161-868-8000', 'contact@manutd.com'),
('FC Bayern Munich', '1900-02-27', 'Munich', 'Germany', 4, '+49-89-699-31-0', 'contact@fcbayern.com'),
('Juventus FC', '1897-11-01', 'Turin', 'Italy', 5, '+39-011-65631', 'contact@juventus.com');

-- ---------------------------------------------------------
-- TEAMS
-- ---------------------------------------------------------
INSERT INTO Teams (club_id, team_name, category) VALUES
(1, 'Real Madrid Senior Team', 'Senior'),
(2, 'FC Barcelona Senior Team', 'Senior'),
(3, 'Manchester United Senior Team', 'Senior'),
(4, 'Bayern Munich Senior Team', 'Senior'),
(5, 'Juventus Senior Team', 'Senior');

-- ---------------------------------------------------------
-- COACHES_STAFF
-- ---------------------------------------------------------
INSERT INTO Coaches_Staff (name, role, team_id, phone, salary) VALUES
('Carlo Ancelotti', 'Head Coach', 1, '+34-600-111-222', 12000000.00),
('Hansi Flick', 'Head Coach', 2, '+34-600-333-444', 9000000.00),
('Ruben Amorim', 'Head Coach', 3, '+44-700-555-666', 8500000.00),
('Vincent Kompany', 'Head Coach', 4, '+49-160-777-888', 7000000.00),
('Thiago Motta', 'Head Coach', 5, '+39-320-999-000', 6500000.00);

-- ---------------------------------------------------------
-- PLAYERS
-- ---------------------------------------------------------
INSERT INTO Players (name, dob, nationality, position, jersey_number, team_id, contract_start, contract_end) VALUES
('Jude Bellingham', '2003-06-29', 'England', 'Midfielder', 5, 1, '2023-07-01', '2029-06-30'),
('Robert Lewandowski', '1988-08-21', 'Poland', 'Forward', 9, 2, '2022-07-01', '2026-06-30'),
('Bruno Fernandes', '1994-09-08', 'Portugal', 'Midfielder', 8, 3, '2020-01-30', '2027-06-30'),
('Harry Kane', '1993-07-28', 'England', 'Forward', 9, 4, '2023-08-19', '2027-06-30'),
('Dusan Vlahovic', '2000-01-28', 'Serbia', 'Forward', 9, 5, '2022-01-28', '2026-06-30');

-- ---------------------------------------------------------
-- MATCHES
-- ---------------------------------------------------------
INSERT INTO Matches (home_team_id, away_team_id, stadium_id, match_date, competition, home_score, away_score) VALUES
(1, 2, 1, '2025-10-25 20:00:00', 'La Liga', 2, 1),
(3, 4, 3, '2025-11-05 20:00:00', 'UEFA Champions League', 1, 1),
(5, 1, 5, '2025-11-20 19:45:00', 'UEFA Champions League', 0, 2),
(2, 5, 2, '2025-12-03 21:00:00', 'UEFA Champions League', 3, 0),
(4, 3, 4, '2025-12-10 20:30:00', 'UEFA Champions League', 2, 2);

-- ---------------------------------------------------------
-- TRANSFERS
-- ---------------------------------------------------------
INSERT INTO Transfers (player_id, from_club, to_club, transfer_date, fee) VALUES
(1, 'Borussia Dortmund', 'Real Madrid CF', '2023-07-01', 103000000.00),
(2, 'Bayern Munich', 'FC Barcelona', '2022-07-01', 0.00),
(4, 'Tottenham Hotspur', 'FC Bayern Munich', '2023-08-19', 100000000.00),
(5, 'ACF Fiorentina', 'Juventus FC', '2022-01-28', 81600000.00),
(3, 'Sporting CP', 'Manchester United FC', '2020-01-30', 55000000.00);

-- ---------------------------------------------------------
-- SPONSORS
-- ---------------------------------------------------------
INSERT INTO Sponsors (club_id, name, contract_amount, start_date, end_date) VALUES
(1, 'Emirates Airline', 70000000.00, '2023-07-01', '2028-06-30'),
(2, 'Spotify', 65000000.00, '2022-07-01', '2027-06-30'),
(3, 'TeamViewer', 55000000.00, '2021-07-01', '2026-06-30'),
(4, 'Deutsche Telekom', 45000000.00, '2020-07-01', '2027-06-30'),
(5, 'Jeep', 42000000.00, '2019-07-01', '2026-06-30');

-- ---------------------------------------------------------
-- PAYMENTS
-- ---------------------------------------------------------
INSERT INTO Payments (player_id, staff_id, amount, payment_date, payment_type) VALUES
(1, NULL, 1500000.00, '2025-11-01', 'Salary'),
(2, NULL, 1200000.00, '2025-11-01', 'Salary'),
(NULL, 1, 1000000.00, '2025-11-01', 'Salary'),
(4, NULL, 1400000.00, '2025-11-01', 'Salary'),
(NULL, 4, 600000.00, '2025-11-01', 'Salary');

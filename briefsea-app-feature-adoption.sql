/* This query is to create tables only

CREATE TABLE Users (
    user_id VARCHAR(10) PRIMARY KEY,
    signup_date DATE,
    device_type VARCHAR(10),
    location VARCHAR(50)
);

CREATE TABLE Feature_Usage (
    session_id VARCHAR(10) PRIMARY KEY,
    user_id VARCHAR(10),
    feature_name VARCHAR(50),
    screen_name VARCHAR(50),
    timestamp DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Screens (
    screen_name VARCHAR(50) PRIMARY KEY,
    screen_order INT,
    section VARCHAR(50)
);



/* This query is for analyzing the data for briefsea app functions usage

-- Most Used Features
SELECT feature_name, COUNT(*) AS usage_count
FROM Feature_Usage
GROUP BY feature_name
ORDER BY usage_count DESC;

-- Drop-off Analysis (users who used only 1 feature after signup)
SELECT user_id, COUNT(DISTINCT feature_name) AS features_used
FROM Feature_Usage
GROUP BY user_id
HAVING features_used = 1;

-- Day 1 vs Day 7 Retention
-- Day 1
SELECT COUNT(DISTINCT user_id) AS day1_users
FROM Feature_Usage
WHERE DATE(timestamp) = DATE(signup_date);

-- Day 7
SELECT COUNT(DISTINCT user_id) AS day7_users
FROM Feature_Usage
WHERE DATE(timestamp) = DATE(signup_date) + INTERVAL 7 DAY;



CREATE TABLE freelancers (
    freelancer_id SERIAL PRIMARY KEY,
    country VARCHAR(50),
    region VARCHAR(50),
    primary_skill_category VARCHAR(50),
    experience_level VARCHAR(20),
    hourly_rate NUMERIC,
    join_date DATE,
    subscription_type VARCHAR(20),
    rating NUMERIC,
    total_projects_completed INT
);

CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    country VARCHAR(50),
    industry VARCHAR(50),
    company_size VARCHAR(20),
    join_date DATE,
    avg_project_budget NUMERIC,
    repeat_client_flag BOOLEAN
);

CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    client_id INT,
    skill_category VARCHAR(50),
    project_budget NUMERIC,
    project_post_date DATE,
    project_status VARCHAR(20),
    num_bids INT,
    assigned_freelancer_id INT,
    completion_date DATE
);

CREATE TABLE bids (
    bid_id SERIAL PRIMARY KEY,
    project_id INT,
    freelancer_id INT,
    bid_amount NUMERIC,
    bid_date DATE,
    bid_status VARCHAR(20)
);

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    project_id INT,
    freelancer_id INT,
    client_id INT,
    project_value NUMERIC,
    platform_commission NUMERIC,
    transaction_date DATE,
    payment_status VARCHAR(20)
);

CREATE TABLE subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    freelancer_id INT,
    subscription_plan VARCHAR(20),
    start_date DATE,
    monthly_fee NUMERIC,
    status VARCHAR(20)
);
INSERT INTO freelancers (country, region, primary_skill_category, experience_level, hourly_rate, join_date, subscription_type, rating, total_projects_completed)
SELECT
    (ARRAY['USA','India','UK','Germany','Canada','Australia','Singapore','Brazil'])[floor(random()*8)+1],
    (ARRAY['North America','Asia','Europe','South America'])[floor(random()*4)+1],
    (ARRAY['Web Development','Data & AI','UI/UX','Cloud','Marketing','Content'])[floor(random()*6)+1],
    (ARRAY['Beginner','Intermediate','Expert'])[floor(random()*3)+1],
    round((20 + random()*80)::numeric,2),
    CURRENT_DATE - (random()*1000)::int,
    (ARRAY['Free','Pro','Elite'])[floor(random()*3)+1],
    round((3 + random()*2)::numeric,1),
    (random()*50)::int
FROM generate_series(1, 3000);INSERT INTO freelancers (country, region, primary_skill_category, experience_level, hourly_rate, join_date, subscription_type, rating, total_projects_completed)
SELECT
    (ARRAY['USA','India','UK','Germany','Canada','Australia','Singapore','Brazil'])[floor(random()*8)+1],
    (ARRAY['North America','Asia','Europe','South America'])[floor(random()*4)+1],
    (ARRAY['Web Development','Data & AI','UI/UX','Cloud','Marketing','Content'])[floor(random()*6)+1],
    (ARRAY['Beginner','Intermediate','Expert'])[floor(random()*3)+1],
    round((20 + random()*80)::numeric,2),
    CURRENT_DATE - (random()*1000)::int,
    (ARRAY['Free','Pro','Elite'])[floor(random()*3)+1],
    round((3 + random()*2)::numeric,1),
    (random()*50)::int
FROM generate_series(1, 3000);INSERT INTO freelancers (country, region, primary_skill_category, experience_level, hourly_rate, join_date, subscription_type, rating, total_projects_completed)
SELECT
    (ARRAY['USA','India','UK','Germany','Canada','Australia','Singapore','Brazil'])[floor(random()*8)+1],
    (ARRAY['North America','Asia','Europe','South America'])[floor(random()*4)+1],
    (ARRAY['Web Development','Data & AI','UI/UX','Cloud','Marketing','Content'])[floor(random()*6)+1],
    (ARRAY['Beginner','Intermediate','Expert'])[floor(random()*3)+1],
    round((20 + random()*80)::numeric,2),
    CURRENT_DATE - (random()*1000)::int,
    (ARRAY['Free','Pro','Elite'])[floor(random()*3)+1],
    round((3 + random()*2)::numeric,1),
    (random()*50)::int
FROM generate_series(1, 3000);
INSERT INTO clients (country, industry, company_size, join_date, avg_project_budget, repeat_client_flag)
SELECT
    (ARRAY['USA','India','UK','Germany','Canada','Australia','Singapore','Brazil'])[floor(random()*8)+1],
    (ARRAY['Tech','Finance','Healthcare','Retail','Education'])[floor(random()*5)+1],
    (ARRAY['Startup','SME','Enterprise'])[floor(random()*3)+1],
    CURRENT_DATE - (random()*900)::int,
    round((200 + random()*2000)::numeric,2),
    random() > 0.5
FROM generate_series(1, 1200);
INSERT INTO projects (client_id, skill_category, project_budget, project_post_date, project_status, num_bids, assigned_freelancer_id, completion_date)
SELECT
floor(random()*1200 + 1)::int,
(ARRAY['Web Development','Data & AI','UI/UX','Cloud','Marketing','Content'])[floor(random()*6)+1],
round((100 + random()*3000)::numeric,2),
CURRENT_DATE - (random()*700)::int,
(ARRAY['Open','Completed','Cancelled'])[floor(random()*3)+1],
floor(random()*15 + 1)::int,
floor(random()*3000 + 1)::int,
CURRENT_DATE - (random()*600)::int
FROM generate_series(1, 6000);
INSERT INTO bids (project_id, freelancer_id, bid_amount, bid_date, bid_status)
SELECT
floor(random()*6000 + 1)::int,
floor(random()*3000 + 1)::int,
round((80 + random()*2500)::numeric,2),
CURRENT_DATE - (random()*650)::int,
(ARRAY['Pending','Accepted','Rejected'])[floor(random()*3)+1]
FROM generate_series(1, 18000);

INSERT INTO transactions (project_id, freelancer_id, client_id, project_value, platform_commission, transaction_date, payment_status)
SELECT
floor(random()*6000 + 1)::int,
floor(random()*3000 + 1)::int,
floor(random()*1200 + 1)::int,
round((100 + random()*3000)::numeric,2),
round((20 + random()*300)::numeric,2),
CURRENT_DATE - (random()*600)::int,
(ARRAY['Paid','Pending'])[floor(random()*2)+1]
FROM generate_series(1, 3500);
INSERT INTO subscriptions (freelancer_id, subscription_plan, start_date, monthly_fee, status)
SELECT
floor(random()*3000 + 1)::int,
(ARRAY['Pro','Elite'])[floor(random()*2)+1],
CURRENT_DATE - (random()*400)::int,
round((10 + random()*40)::numeric,2),
(ARRAY['Active','Cancelled'])[floor(random()*2)+1]
FROM generate_series(1, 800);
SELECT 
(SELECT COUNT(*) FROM freelancers) AS freelancers,
(SELECT COUNT(*) FROM clients) AS clients,
(SELECT COUNT(*) FROM projects) AS projects,
(SELECT COUNT(*) FROM bids) AS bids,
(SELECT COUNT(*) FROM transactions) AS transactions,
(SELECT COUNT(*) FROM subscriptions) AS subscriptions;
SELECT 
date_trunc('month', join_date) AS month,
COUNT(*) AS new_freelancers
FROM freelancers
GROUP BY month
ORDER BY month;
SELECT 
date_trunc('month', join_date) AS month,
COUNT(*) AS new_clients
FROM clients
GROUP BY month
ORDER BY month;
SELECT 
date_trunc('month', transaction_date) AS month,
SUM(platform_commission) AS monthly_revenue
FROM transactions
GROUP BY month
ORDER BY month;
SELECT 
COUNT(DISTINCT freelancer_id) AS active_freelancers,
COUNT(DISTINCT client_id) AS active_clients,
SUM(platform_commission) AS total_revenue,
SUM(platform_commission)/COUNT(DISTINCT client_id) AS revenue_per_client,
SUM(platform_commission)/COUNT(DISTINCT freelancer_id) AS revenue_per_freelancer
FROM transactions;
SELECT 
skill_category,
COUNT(DISTINCT assigned_freelancer_id) AS freelancers,
COUNT(*) AS projects
FROM projects
GROUP BY skill_category;
SELECT 
date_trunc('month', transaction_date) AS month,
AVG(project_value) AS avg_project_value,
SUM(platform_commission) AS total_revenue
FROM transactions
GROUP BY month
ORDER BY month;
SELECT 
company_size,
COUNT(*) AS total_projects,
AVG(project_value) AS avg_project_value,
SUM(platform_commission) AS revenue
FROM transactions t
JOIN clients c ON t.client_id = c.client_id
GROUP BY company_size
ORDER BY revenue DESC;
SELECT 
primary_skill_category,
COUNT(*) AS freelancers,
AVG(hourly_rate) AS avg_rate
FROM freelancers
GROUP BY primary_skill_category
ORDER BY freelancers DESC;
SELECT 
repeat_client_flag,
COUNT(*) AS total_transactions,
SUM(platform_commission) AS revenue,
AVG(project_value) AS avg_value
FROM transactions t
JOIN clients c ON t.client_id = c.client_id
GROUP BY repeat_client_flag;
SELECT 
project_id,
COUNT(*) AS bids_per_project
FROM bids
GROUP BY project_id
ORDER BY bids_per_project DESC
LIMIT 20;
SELECT 
primary_skill_category,
SUM(platform_commission) AS revenue
FROM transactions t
JOIN freelancers f ON t.freelancer_id = f.freelancer_id
GROUP BY primary_skill_category
ORDER BY revenue DESC;
SELECT 
COUNT(DISTINCT freelancer_id) AS freelancers,
COUNT(DISTINCT project_id) AS projects,
SUM(platform_commission) AS revenue,
SUM(platform_commission) / COUNT(DISTINCT project_id) AS revenue_per_project,
COUNT(DISTINCT freelancer_id) * 1.0 / COUNT(DISTINCT project_id) AS supply_demand_ratio
FROM transactions;
SELECT 
date_trunc('month', transaction_date) AS month,
SUM(platform_commission) AS revenue,
COUNT(DISTINCT freelancer_id) AS freelancers,
SUM(platform_commission)/COUNT(DISTINCT freelancer_id) AS revenue_efficiency
FROM transactions
GROUP BY month
ORDER BY month;
COPY freelancers TO 'C:\freelance_data\freelancers.csv' CSV HEADER;
COPY clients TO 'C:\freelance_data\clients.csv' CSV HEADER;
COPY projects TO 'C:\freelance_data\projects.csv' CSV HEADER;
COPY bids TO 'C:\freelance_data\bids.csv' CSV HEADER;
COPY transactions TO 'C:\freelance_data\transactions.csv' CSV HEADER;
COPY subscriptions TO 'C:\freelance_data\subscriptions.csv' CSV HEADER;
COPY subscriptions TO 'C:\freelance_data\subscriptions.csv' CSV HEADER;
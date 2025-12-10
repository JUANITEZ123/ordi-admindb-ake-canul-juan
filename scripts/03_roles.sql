


CREATE USER IF NOT EXISTS 'admin_role'@'%' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON ake_canul_juan.* TO 'admin_role'@'%';


CREATE USER IF NOT EXISTS 'auditor_role'@'%' IDENTIFIED BY 'auditor123';
GRANT SELECT, INSERT, UPDATE ON ake_canul_juan.* TO 'auditor_role'@'%';


CREATE USER IF NOT EXISTS 'dev_role'@'%' IDENTIFIED BY 'dev123';
GRANT SELECT ON ake_canul_juan.* TO 'dev_role'@'%';

FLUSH PRIVILEGES;

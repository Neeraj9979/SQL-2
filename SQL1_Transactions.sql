SELECT @@autocommit; 

SET autocommit = 0;

CREATE DATABASE Prime;

USE Prime;

CREATE TABLE Accounts(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Balance DECIMAL(10,2)
);
    
INSERT INTO Accounts
(Name,Balance)
VALUES
("Bob", 500.0),
("Eve", 300.0),
("Charlie",1000.00);    

START TRANSACTION;

UPDATE Accounts SET Balance = Balance - 50 WHERE Id = 1;
UPDATE Accounts SET Balance = Balance + 50 WHERE Id = 2;

COMMIT;

SELECT * FROM Accounts;

START TRANSACTION;

UPDATE Accounts SET Balance = Balance + 1000 WHERE Id = 1;
SAVEPOINT Wallet_Topup;

UPDATE Accounts SET Balance = Balance + 10 WHERE Id = 1;
-- Error Occured So RollBack is performed

ROLLBACK TO Wallet_Topup;

COMMIT;

SELECT * FROM Accounts;

START TRANSACTION;

UPDATE Accounts SET Balance = Balance + 1000 WHERE Id = 3;
SAVEPOINT Wallet_Topup;

UPDATE Accounts SET Balance = Balance + 10 WHERE Id = 3;
-- Error Occured So RollBack is Performed

ROLLBACK TO Wallet_Topup;

COMMIT;

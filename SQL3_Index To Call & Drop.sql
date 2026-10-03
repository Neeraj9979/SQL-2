CREATE TABLE accounts1 (
    account_id INT PRIMARY KEY,
    name VARCHAR(50),
    balance DECIMAL(10, 2),
    branch VARCHAR(50)
);

INSERT INTO accounts1 VALUES
(1, 'Adam', 500.00, 'Mumbai'),
(2, 'Bob', 300.00, 'Delhi'),
(3, 'Charlie', 700.00, 'Bangalore'),
(4, 'David', 1000.00, 'Noida');

CREATE INDEX Idx_Branch ON accounts1(branch);

SHOW INDEX FROM accounts1;

SELECT * 
FROM accounts1
WHERE branch = "Noida";

CREATE INDEX Idx2 ON accounts1(balance,branch);

SHOW INDEX FROM accounts1;

DROP INDEX Idx2 ON accounts1;

DELIMITER //
CREATE PROCEDURE Check_Balance(IN Acc_id INT,OUT bal DECIMAL(10,2))
BEGIN
	SELECT balance INTO bal
    FROM accounts1
    WHERE account_id = Acc_id;
END //

DELIMITER ;

CALL Check_Balance(1,@balance);
SELECT @balance;


DROP PROCEDURE IF EXISTS Check_Balance;
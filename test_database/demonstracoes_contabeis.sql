USE ans_operadoras;

CREATE TABLE demonstracoes_contabeis (
    data DATE NOT NULL,
    reg_ans INTEGER NOT NULL,
    cd_conta_contabil INTEGER NOT NULL,
    descricao VARCHAR(150),
    vl_saldo_inicial DECIMAL(15,2) NOT NULL,
    vl_saldo_final DECIMAL(15,2) NOT NULL
);


# ARQUIVO CSV: 1T2023.csv
LOAD DATA INFILE '/var/lib/mysql-files/1T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, @reg_ans, @cd_conta_contabil, @descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(TRIM(BOTH '"' FROM @data), '%Y-%m-%d'),
    reg_ans = TRIM(@reg_ans),
    cd_conta_contabil = TRIM(@cd_conta_contabil),
    descricao = TRIM(@descricao),
    vl_saldo_inicial = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_inicial), ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_final), ',', '.'), '');
    
    
# ARQUIVO CSV: 2t2023.csv
LOAD DATA INFILE '/var/lib/mysql-files/2t2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, @reg_ans, @cd_conta_contabil, @descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(TRIM(BOTH '"' FROM @data), '%Y-%m-%d'),
    reg_ans = TRIM(@reg_ans),
    cd_conta_contabil = TRIM(@cd_conta_contabil),
    descricao = TRIM(@descricao),
    vl_saldo_inicial = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_inicial), ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_final), ',', '.'), '');
   
   
# ARQUIVO CSV: 3T2023.csv
LOAD DATA INFILE '/var/lib/mysql-files/3T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, @reg_ans, @cd_conta_contabil, @descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(TRIM(BOTH '"' FROM @data), '%Y-%m-%d'),
    reg_ans = TRIM(@reg_ans),
    cd_conta_contabil = TRIM(@cd_conta_contabil),
    descricao = TRIM(@descricao),
    vl_saldo_inicial = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_inicial), ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_final), ',', '.'), '');
    

# ARQUIVO CSV: 4T2023.csv
LOAD DATA INFILE '/var/lib/mysql-files/4T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, @reg_ans, @cd_conta_contabil, @descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(TRIM(BOTH '"' FROM @data), '%d/%m/%Y'),
    reg_ans = TRIM(@reg_ans),
    cd_conta_contabil = TRIM(@cd_conta_contabil),
    descricao = TRIM(@descricao),
    vl_saldo_inicial = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_inicial), ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_final), ',', '.'), '');
    
    
# ARQUIVO CSV: 1T2024.csv
LOAD DATA INFILE '/var/lib/mysql-files/1T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, @reg_ans, @cd_conta_contabil, @descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(TRIM(BOTH '"' FROM @data), '%Y-%m-%d'),
    reg_ans = TRIM(@reg_ans),
    cd_conta_contabil = TRIM(@cd_conta_contabil),
    descricao = TRIM(@descricao),
    vl_saldo_inicial = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_inicial), ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_final), ',', '.'), '');    

		
# ARQUIVO CSV: 2T2024.csv
LOAD DATA INFILE '/var/lib/mysql-files/2T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, @reg_ans, @cd_conta_contabil, @descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(TRIM(BOTH '"' FROM @data), '%Y-%m-%d'),
    reg_ans = TRIM(@reg_ans),
    cd_conta_contabil = TRIM(@cd_conta_contabil),
    descricao = TRIM(@descricao),
    vl_saldo_inicial = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_inicial), ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_final), ',', '.'), '');
    

# ARQUIVO CSV: 3T2024.csv
LOAD DATA INFILE '/var/lib/mysql-files/3T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, @reg_ans, @cd_conta_contabil, @descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(TRIM(BOTH '"' FROM @data), '%Y-%m-%d'),
    reg_ans = TRIM(@reg_ans),
    cd_conta_contabil = TRIM(@cd_conta_contabil),
    descricao = TRIM(@descricao),
    vl_saldo_inicial = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_inicial), ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_final), ',', '.'), '');


# ARQUIVO CSV: 4T2024.csv
LOAD DATA INFILE '/var/lib/mysql-files/4T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@data, @reg_ans, @cd_conta_contabil, @descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(TRIM(BOTH '"' FROM @data), '%Y-%m-%d'),
    reg_ans = TRIM(@reg_ans),
    cd_conta_contabil = TRIM(@cd_conta_contabil),
    descricao = TRIM(@descricao),
    vl_saldo_inicial = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_inicial), ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(TRIM(BOTH '"' FROM @vl_saldo_final), ',', '.'), '');
    
#1 - 10 operadoras com maiores despesas no último trimestre
CREATE INDEX idx_filtro_principal ON demonstracoes_contabeis(descricao, data);

SELECT 
	d.reg_ans,
	o.razao_social, 
    SUM(vl_saldo_final - vl_saldo_inicial) AS total_despesas
FROM demonstracoes_contabeis d
INNER JOIN operadoras_ativas o ON o.registro_ans = d.reg_ans
WHERE descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
	AND data BETWEEN '2024-10-01' AND '2024-12-31'
GROUP BY d.reg_ans, o.razao_social
ORDER BY total_despesas DESC 
LIMIT 10;

#2 - 10 operadoras com maiores despesas no último ano
SELECT 
	d.reg_ans,
	o.razao_social, 
    SUM(vl_saldo_final - vl_saldo_inicial) AS total_despesas
FROM demonstracoes_contabeis d
INNER JOIN operadoras_ativas o ON o.registro_ans = d.reg_ans
WHERE descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
	AND data BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY d.reg_ans, o.razao_social
ORDER BY total_despesas DESC 
LIMIT 10;

        

CREATE DATABASE ans_operadoras;

USE ans_operadoras;

CREATE TABLE operadoras_ativas (
	registro_ans INTEGER PRIMARY KEY,
    cnpj VARCHAR(14) NOT NULL,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(50),
    logradouro VARCHAR(255),
    numero VARCHAR(20),
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf VARCHAR(2),
    cep VARCHAR(8),
    ddd VARCHAR(2),
    telefone VARCHAR(18),
    fax VARCHAR(11),
    endereco_eletronico VARCHAR(255),
    representante VARCHAR(255),
    cargo_representante VARCHAR(100),
    regiao_de_comercializacao INTEGER,
    data_registro_ans DATE
);

LOAD DATA INFILE '/var/lib/mysql-files/Relatorio_cadop.csv'
INTO TABLE operadoras_ativas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (
	@registro_ans, 
    @cnpj, 
    @razao_social, 
    @nome_fantasia, 
    @modalidade, 
    @logradouro, 
    @numero, 
    @complemento, 
    @bairro, 
    @cidade, 
    @uf, 
    @cep, 
    @ddd, 
    @telefone, 
    @fax, 
    @endereco_eletronico, 
    @representante, 
    @cargo_representante, 
    @regiao_de_comercializacao, 
    @data_registro_ans)
	SET 
		registro_ans = TRIM(BOTH '"' FROM @registro_ans),
		cnpj = TRIM(@cnpj),
		razao_social = TRIM(@razao_social),
		nome_fantasia = NULLIF(TRIM(@nome_fantasia), ''),
		modalidade = TRIM(@modalidade),
		logradouro = TRIM(@logradouro),
		numero = TRIM(@numero),
		complemento = NULLIF(TRIM(@complemento), ''),
		bairro = TRIM(@bairro),
		cidade = TRIM(@cidade),
		uf = TRIM(@uf),
		cep = TRIM(@cep),
		ddd = NULLIF(TRIM(@ddd), ''),
		telefone = TRIM(@telefone),
		fax = NULLIF(TRIM(@fax), ''),
		endereco_eletronico = NULLIF(TRIM(@endereco_eletronico), ''),
		representante = TRIM(@representante),
		cargo_representante = TRIM(@cargo_representante),
		data_registro_ans = STR_TO_DATE(TRIM(BOTH '"' FROM @data_registro_ans), '%Y-%m-%d'),
		regiao_de_comercializacao = NULLIF(TRIM(BOTH '"' FROM @regiao_de_comercializacao), '');
        
        
        
        
        
        
        
        
        
        

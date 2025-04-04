# Selection Process

Este repositório contém os desafios técnicos organizados por etapa.

## Estrutura

- `/web_scraping/`
  - Primeiro teste. Extrai dados dos anexos.
  - Caso queira rodar, **deletar os arquivos `attachment1`, `attachment2` e o zip `attachments.zip`** para gerar novamente.
  - O script irá baixar, extrair e tratar os dados automaticamente.

- `/data_transformation/`
  - Segundo teste. Utiliza o `attachment1` gerado no teste anterior.
  - Os caminhos estão configurados com `os.path.join`, então devem funcionar normalmente clonando o repositório.
  - O script extrai tabelas e cria um `.csv` final zipado.

- `/test_database/`
  - Dois scripts SQL simples. Executar diretamente no banco de dados.

- `/api_health/`
  - API simples para health check.
  - Contém:
    - `.env-example` (preencher com as informações do usuário, dados sensíveis foram omitidos).
    - `requirements.txt` para instalar as dependências.
    - `run.py` para rodar o servidor.
    - `postman_collection.json` com o endpoint de teste.
    - Estrutura com: `configs/`, `models/`, `routes/`.


# Automação de Testes com Robot Framework - Nível Avançado

Este repositório contém os arquivos de exemplos e desafio de exercícios, desenvolvidos durante o curso de [Automação de Testes com Robot Framework - Nível Avançado da Udemy](https://www.udemy.com/course/automacao-de-testes-com-robot-framework-avancado), ministrado por Mayara "May" Fernandes. 

## 📚 Sobre o Curso

Este curso é destinado a profissionais que já possuem conhecimentos básicos em Robot Framework e desejam aprimorar suas habilidades na automação de testes. Durante as aulas, são abordados técnicas avançadas para potencializar os testes automatizados, incluindo fluxos avançados de execução, libraries auxiliares, criação de libraries customizadas, testes web e API avançados, execução headless, execução em Docker e integração contínua (CI/CD).

### Conteúdo do Curso:
- **Preparação**: (atualização do ambiente de desenvolvimento)
- **Execução avançada de testes**: Fluxos complexos e utilização de keywords avançadas da Biblioteca BuiltIn.
- **Uso de bibliotecas auxiliares**: Como **DateTime, OperatingSystem, String, Process, DataBase Library e Banco de Dados PostgreSQL e DiffLibrary**.  
- **Criação de bibliotecas personalizadas**: Estendendo o Robot Framework com Python.  
- **Automação Web Avançada**: Page Objects, execução headless e manipulação de elementos dinâmicos.  
- **Testes de API Avançados**: Headers, autenticação, templates JSON e navegação avançada.  
- **Execução em Docker**: Rodando testes em contêineres.  
- **Integração Contínua (CI/CD)**: Automação de testes em pipelines do GitLab.

---

## 🛠️ Tecnologias Utilizadas

- **Python** → Linguagem de programação base para o Robot Framework.  
- **Git e GitHub** → Controle de versão e compartilhamento de código.  
- **Visual Studio Code** → IDE utilizada para desenvolvimento.  
- **Robot Framework** → Framework de automação de testes.  
- **SeleniumLibrary** → Biblioteca para automação de testes web.  
- **RequestsLibrary** → Biblioteca para automação de testes de API.  
- **Docker** → Execução de testes em contêineres.  
- **GitLab CI/CD** → Integração contínua para automação de testes em pipelines.

---

## 📁 Conteúdo do Repositório  
1. **Estrutura do Repositório e Descrição das Pastas:**

- **`bibliotecas_auxiliares/`** → Bibliotecas externas e utilitárias para complementar os testes automatizados.  

- **`bibliotecas_customizadas/`** → Contém bibliotecas personalizadas desenvolvidas durante o curso para estender as funcionalidades do Robot Framework.  

- **`biblioteca_builtin_avancado/`** → Exemplos e exercícios utilizando keywords avançadas da biblioteca built-in do Robot Framework.  

- **`execucao_docker/`** → Configurações e arquivos necessários para executar testes em ambientes Docker, permitindo a automação em contêineres.  

- **`integracao_continua/`** → Configuração e exemplos de integração contínua (CI/CD) para rodar testes automatizados em pipelines.  

- **`testes_API_avancado/`** → Scripts avançados para automação de testes de API REST utilizando RequestsLibrary e outras ferramentas.  

- **`testes_web_avancado/`** → Automação avançada de testes web com SeleniumLibrary, incluindo execução headless e uso de Page Object Model.  

- **`Outros Arquivos Importantes:`**  
  - **`requirements.txt`** → Lista de dependências do projeto para instalação rápida.  
  - **`.gitignore`** → Lista de arquivos e diretórios que devem ser ignorados pelo Git.  
  - **`README.md`** → Documentação do projeto, incluindo instruções de instalação e execução dos testes.  

---

## 🤖 Como Executar os Testes
### 🔧 Pré-requisitos (Configuração do Ambiente)
  1. **Instalação do Python:**
     - Certifique-se de ter o Python instalado (versão 3.7 ou superior). [Download do Python](https://www.python.org/downloads/)
  2. **Instalação do WebDriver:**
     - Baixe o WebDriver correspondente ao seu navegador (ex: [ChromeDriver para Google Chrome](https://googlechromelabs.github.io/chrome-for-testing/) ou [EdgeDriver para o Microsoft Edge](https://developer.microsoft.com/pt-br/microsoft-edge/tools/webdriver)).
     - Certifique-se de que o caminho para as pastas e/ou arquivos do WebDriver, esteja no PATH do sistema. 
  3. **Instalação das dependências do projeto:**
     - Abra o terminal na raiz do projeto e execute o seguinte comando:
       ```bash
       pip install -r requirements.txt
       ```
       Isso instalará todas as dependências listadas no arquivo.
     - **Verifique a instalação:**
       Após a instalação, você pode verificar se tudo está funcionando corretamente executando um dos testes do seu projeto.

### 📊 Executando os Testes
1. Clone o repositório:
```bash
   git clone https://github.com/sthefanyricardo/curso-robot-framework-avancado-may.git
```
2. Pelo terminal ou IDE, navegue até a pasta desejada do projeto, como no exemplo abaixo:
```bash
   cd curso-robot-framework-avancado-may/testes_API_avancado
```
3. Execute os testes, com os exemplos de comandos a seguir:
- Dentro da pasta: testes_API_avancado/tests
```bash
   robot -d ../resultados -i CT01ORCT04 tests/
```
```bash
   robot -d ../resultados nome_arquivo_teste.robot
```
```bash
   robot -d ../resultados e- CT02ORCT03 tests/
```
- Apenas dentro da pasta: testes_API_avancado
```bash
   robot -d ../resultados tests/
```
4. Verifique os resultados:
  Os relatórios e logs serão gerados na pasta ```resultados```.

--- 

## 📌 Agradecimentos
- À instrutora May Fernandes pelo curso incrível e pelo compartilhamento de conhecimento.
- À comunidade de automação de testes por todo o suporte e inspiração.
- **Observações**
  - Este repositório é destinado a fins educacionais, para demonstrar os conceitos básicos de automação de testes com Robot Framework.
  - Sinta-se à vontade para clonar, modificar e utilizar este código como base para seus próprios projetos de automação de testes.

## 🙋‍♀️ Autora
Feito com ❤️ por Sthefany A. Ricardo.

![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)

📅 Última atualização: Março de 2025.
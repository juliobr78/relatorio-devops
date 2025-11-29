# 🏋️ Academia FitMax - Banco de Dados Completo

## 📋 Sobre o Projeto

Este repositório contém a implementação completa do banco de dados da **Academia FitMax**, desenvolvido como parte da **Experiência Prática IV** da disciplina de Modelagem de Banco de Dados.

O projeto abrange desde a criação da estrutura do banco de dados até a manipulação completa de dados usando SQL (DML - Data Manipulation Language).

---

## 👨‍💻 Autor

**Julio Cesar Vieira Magalhães**  
Curso: Análise e Desenvolvimento de Sistemas  
Instituição: Cruzeiro do Sul Virtual  
Disciplina: Modelagem de Banco de Dados  
Data: Novembro de 2025

---

## 🎯 Objetivos do Projeto

- ✅ Implementar banco de dados relacional completo
- ✅ Aplicar conceitos de modelagem, normalização e integridade
- ✅ Executar comandos SQL (INSERT, SELECT, UPDATE, DELETE)
- ✅ Demonstrar manipulação avançada de dados com JOINs e subconsultas
- ✅ Utilizar boas práticas de desenvolvimento e documentação

---

## 🗂️ Estrutura do Repositório

```
📦 academia-fitmax-db/
├── 📄 README.md                    # Este arquivo
├── 📄 1_create_database.sql        # Criação do banco e tabelas
├── 📄 2_insert_data.sql            # Povoamento das tabelas
├── 📄 3_select_queries.sql         # Consultas SELECT complexas
├── 📄 4_update_delete.sql          # Comandos UPDATE e DELETE
└── 📄 modelo_logico.pdf            # Modelo lógico (opcional)
```

---

## 🗄️ Estrutura do Banco de Dados

O banco de dados **academia_fitmax** é composto por **12 tabelas principais**:

### Tabelas Principais

| Tabela | Descrição |
|--------|-----------|
| **ALUNO** | Cadastro de clientes da academia |
| **PLANO** | Planos de assinatura disponíveis |
| **MATRICULA** | Vínculo entre alunos e planos contratados |
| **PAGAMENTO** | Registro de pagamentos de mensalidades |
| **FUNCIONARIO** | Cadastro de colaboradores |
| **MODALIDADE** | Tipos de atividades oferecidas |
| **SALA** | Espaços físicos da academia |
| **AULA** | Aulas agendadas no cronograma |
| **AGENDAMENTO** | Reservas de alunos nas aulas |
| **EQUIPAMENTO** | Inventário de equipamentos |
| **AVALIACAO_FISICA** | Histórico de avaliações físicas |
| **ACESSO** | Log de entradas e saídas |

### Relacionamentos Principais

- ALUNO → MATRICULA (1:N)
- MATRICULA → PAGAMENTO (1:N)
- FUNCIONARIO → AULA (1:N)
- AULA → AGENDAMENTO (1:N)
- ALUNO → AGENDAMENTO (1:N)

---

## ⚙️ Tecnologias Utilizadas

- **SGBD:** MySQL 8.0+ / MariaDB 10.5+
- **SQL:** DDL (Data Definition Language) e DML (Data Manipulation Language)
- **Ferramenta:** MySQL Workbench / phpMyAdmin / DBeaver

---

## 🚀 Como Executar

### Pré-requisitos

- MySQL Server 8.0 ou superior instalado
- MySQL Workbench, phpMyAdmin ou linha de comando MySQL
- Acesso com privilégios de CREATE DATABASE

### Passo 1: Clonar o Repositório

```bash
git clone https://github.com/juliobr78/academia-fitmax-db.git
cd academia-fitmax-db
```

### Passo 2: Executar os Scripts na Ordem

#### 2.1 Criar o Banco de Dados

```bash
mysql -u root -p < 1_create_database.sql
```

Ou no MySQL Workbench:
1. Abra o arquivo `1_create_database.sql`
2. Execute o script completo (Ctrl+Shift+Enter)

#### 2.2 Inserir Dados

```bash
mysql -u root -p < 2_insert_data.sql
```

#### 2.3 Executar Consultas

```bash
mysql -u root -p < 3_select_queries.sql
```

#### 2.4 Executar UPDATE e DELETE

```bash
mysql -u root -p < 4_update_delete.sql
```

---

## 📊 Consultas Disponíveis

### 1. Alunos com Matrículas Ativas
Lista todos os alunos ativos com seus planos vigentes

### 2. Aulas Mais Populares
Ranking das modalidades com mais agendamentos

### 3. Evolução Física dos Alunos
Comparativo de avaliações físicas ao longo do tempo

### 4. Relatório Financeiro Mensal
Análise de receitas e pagamentos por mês

### 5. Frequência dos Alunos
Análise de uso da academia nos últimos 30 dias

### 6. Equipamentos para Manutenção
Lista de equipamentos que precisam de manutenção

---

## 🔄 Operações Implementadas

### Comandos INSERT
- ✅ Inserção de 10 alunos
- ✅ Inserção de 4 planos
- ✅ Inserção de 6 funcionários
- ✅ Inserção de 7 modalidades
- ✅ Inserção de 5 salas
- ✅ Inserção de 12 aulas
- ✅ Inserção de 11 agendamentos
- ✅ Inserção de 10 equipamentos
- ✅ Inserção de 8 avaliações físicas
- ✅ Inserção de 11 registros de acesso

### Comandos SELECT
- ✅ 5 consultas complexas com JOIN
- ✅ Uso de WHERE, ORDER BY, LIMIT
- ✅ Funções agregadas (COUNT, SUM, AVG, MIN, MAX)
- ✅ GROUP BY e HAVING
- ✅ Subconsultas

### Comandos UPDATE
- ✅ Atualizar status de matrículas vencidas
- ✅ Aumentar salário de funcionários antigos
- ✅ Marcar pagamentos atrasados
- ✅ Atualizar telefone de aluno
- ✅ Marcar agendamentos como "Faltou"

### Comandos DELETE
- ✅ Remover agendamentos cancelados antigos
- ✅ Excluir acessos com mais de 90 dias
- ✅ Remover alunos inativos sem vínculo
- ✅ Limpar pagamentos duplicados
- ✅ Excluir equipamentos quebrados antigos

---

## 🛡️ Integridade Referencial

O banco implementa:

- **Chaves Primárias (PK):** Todas as tabelas possuem
- **Chaves Estrangeiras (FK):** Relacionamentos garantidos
- **Constraints CHECK:** Validação de domínio
- **Constraints UNIQUE:** Evita duplicação (CPF, email)
- **ON DELETE CASCADE:** Em relacionamentos apropriados
- **ON UPDATE CASCADE:** Propagação de atualizações

---

## 📈 Normalização

O modelo está em **Terceira Forma Normal (3FN)**:

- ✅ 1FN: Valores atômicos, sem grupos repetitivos
- ✅ 2FN: Sem dependências parciais
- ✅ 3FN: Sem dependências transitivas

---

## 🎓 Conceitos Aplicados

- Modelagem Conceitual (DER)
- Modelagem Lógica
- Normalização de Dados
- Integridade Referencial
- Consultas com JOIN (INNER, LEFT)
- Funções Agregadas
- Subconsultas
- Índices para Otimização
- Boas Práticas SQL

---

## 📝 Observações Importantes

### Dados de Teste
- Todos os dados inseridos são fictícios
- CPFs, telefones e emails são exemplos
- Datas estão no formato YYYY-MM-DD

### Segurança
- Em produção, implementar controle de acesso (GRANT/REVOKE)
- Utilizar prepared statements em aplicações
- Fazer backup regular dos dados
- Criptografar dados sensíveis

### Performance
- Índices criados em campos frequentemente consultados
- Estrutura otimizada para consultas comuns
- Possibilidade de adicionar mais índices conforme necessidade

---

## 🔮 Próximos Passos

- [ ] Criar views para consultas frequentes
- [ ] Implementar triggers para auditoria
- [ ] Desenvolver stored procedures para lógica de negócio
- [ ] Adicionar sistema de backup automatizado
- [ ] Criar API REST para integração
- [ ] Desenvolver interface web/mobile

---

## 📞 Contato

**Julio Cesar Vieira Magalhães**  
Email: [seu-email@exemplo.com]  
GitHub: [@juliobr78](https://github.com/juliobr78)  
LinkedIn: [Julio Magalhães](https://linkedin.com/in/seu-perfil)

---

## 📄 Licença

Este projeto foi desenvolvido para fins educacionais como parte do curso de Análise e Desenvolvimento de Sistemas.

---

## ⭐ Agradecimentos

- Professor Douglas Almendro
- Cruzeiro do Sul Virtual
- Colegas de turma

---

**Última atualização:** Novembro 2025  
**Versão:** 1.0.0

---

## 🎯 Como Submeter no Ambiente Virtual

1. Acesse o ambiente virtual da disciplina
2. Vá em "Experiências Práticas > Experiência Prática IV"
3. Cole o link do repositório GitHub: `https://github.com/juliobr78/academia-fitmax-db`
4. Verifique se o repositório está **PÚBLICO**
5. Clique em "Enviar"

---

✅ **Projeto completo e pronto para avaliação!**
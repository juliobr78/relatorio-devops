-- ============================================
-- EXPERIÊNCIA PRÁTICA IV
-- Implementação e Manipulação de Dados com SQL
-- Academia FitMax - Banco de Dados Completo
-- 
-- Autor: Julio Cesar Vieira Magalhães
-- Curso: Análise e Desenvolvimento de Sistemas
-- Disciplina: Modelagem de Banco de Dados
-- Data: Novembro 2025
-- ============================================

-- Criar banco de dados
DROP DATABASE IF EXISTS academia_fitmax;
CREATE DATABASE academia_fitmax;
USE academia_fitmax;

-- ============================================
-- CRIAÇÃO DAS TABELAS
-- ============================================

-- Tabela: ALUNO
CREATE TABLE ALUNO (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    endereco VARCHAR(200),
    data_matricula DATE NOT NULL DEFAULT (CURRENT_DATE),
    status ENUM('Ativo', 'Inativo') NOT NULL DEFAULT 'Ativo'
);

-- Tabela: PLANO
CREATE TABLE PLANO (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(50) NOT NULL,
    valor_mensal DECIMAL(10,2) NOT NULL CHECK (valor_mensal > 0),
    duracao_meses INT NOT NULL CHECK (duracao_meses > 0),
    descricao TEXT
);

-- Tabela: MATRICULA
CREATE TABLE MATRICULA (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_plano INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL CHECK (valor_pago >= 0),
    status ENUM('Ativo', 'Vencido', 'Cancelado') NOT NULL DEFAULT 'Ativo',
    FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno) ON UPDATE CASCADE,
    FOREIGN KEY (id_plano) REFERENCES PLANO(id_plano) ON UPDATE CASCADE,
    CHECK (data_fim > data_inicio)
);

-- Tabela: PAGAMENTO
CREATE TABLE PAGAMENTO (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL,
    data_pagamento DATE,
    data_vencimento DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL CHECK (valor > 0),
    metodo_pagamento ENUM('Cartão de Crédito', 'Cartão de Débito', 'Dinheiro', 'PIX', 'Boleto'),
    status ENUM('Pago', 'Pendente', 'Atrasado') NOT NULL DEFAULT 'Pendente',
    FOREIGN KEY (id_matricula) REFERENCES MATRICULA(id_matricula) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela: FUNCIONARIO
CREATE TABLE FUNCIONARIO (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cargo ENUM('Educador Físico', 'Personal Trainer', 'Nutricionista', 'Recepcionista', 'Gerente') NOT NULL,
    salario DECIMAL(10,2) NOT NULL CHECK (salario > 0),
    data_admissao DATE NOT NULL,
    cref VARCHAR(20)
);

-- Tabela: MODALIDADE
CREATE TABLE MODALIDADE (
    id_modalidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_modalidade VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT,
    duracao_minutos INT NOT NULL CHECK (duracao_minutos > 0)
);

-- Tabela: SALA
CREATE TABLE SALA (
    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    nome_sala VARCHAR(50) NOT NULL,
    tipo_sala ENUM('Musculação', 'Aeróbica', 'Piscina') NOT NULL,
    capacidade INT NOT NULL CHECK (capacidade > 0)
);

-- Tabela: AULA
CREATE TABLE AULA (
    id_aula INT AUTO_INCREMENT PRIMARY KEY,
    id_modalidade INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_sala INT NOT NULL,
    dia_semana ENUM('Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado') NOT NULL,
    horario_inicio TIME NOT NULL,
    horario_fim TIME NOT NULL,
    vagas_totais INT NOT NULL CHECK (vagas_totais > 0),
    FOREIGN KEY (id_modalidade) REFERENCES MODALIDADE(id_modalidade) ON UPDATE CASCADE,
    FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIO(id_funcionario) ON UPDATE CASCADE,
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala) ON UPDATE CASCADE,
    CHECK (horario_fim > horario_inicio)
);

-- Tabela: AGENDAMENTO
CREATE TABLE AGENDAMENTO (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_aula INT NOT NULL,
    data_agendamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Confirmado', 'Cancelado', 'Compareceu', 'Faltou') NOT NULL DEFAULT 'Confirmado',
    FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_aula) REFERENCES AULA(id_aula) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE KEY unique_agendamento (id_aluno, id_aula)
);

-- Tabela: EQUIPAMENTO
CREATE TABLE EQUIPAMENTO (
    id_equipamento INT AUTO_INCREMENT PRIMARY KEY,
    id_sala INT NOT NULL,
    nome_equipamento VARCHAR(100) NOT NULL,
    codigo_patrimonio VARCHAR(50) UNIQUE NOT NULL,
    data_aquisicao DATE NOT NULL,
    data_ultima_manutencao DATE,
    status ENUM('Disponível', 'Manutenção', 'Quebrado') NOT NULL DEFAULT 'Disponível',
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala) ON UPDATE CASCADE
);

-- Tabela: AVALIACAO_FISICA
CREATE TABLE AVALIACAO_FISICA (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_avaliacao DATE NOT NULL DEFAULT (CURRENT_DATE),
    peso DECIMAL(5,2) NOT NULL CHECK (peso > 0),
    altura DECIMAL(3,2) NOT NULL CHECK (altura > 0),
    imc DECIMAL(4,2) NOT NULL,
    percentual_gordura DECIMAL(4,2) CHECK (percentual_gordura >= 0 AND percentual_gordura <= 100),
    massa_magra DECIMAL(5,2),
    observacoes TEXT,
    FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIO(id_funcionario) ON UPDATE CASCADE
);

-- Tabela: ACESSO
CREATE TABLE ACESSO (
    id_acesso INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    data_acesso DATE NOT NULL DEFAULT (CURRENT_DATE),
    hora_entrada TIME NOT NULL,
    hora_saida TIME,
    catraca INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (hora_saida IS NULL OR hora_saida > hora_entrada)
);

-- ============================================
-- CRIAÇÃO DE ÍNDICES PARA OTIMIZAÇÃO
-- ============================================

CREATE INDEX idx_aluno_cpf ON ALUNO(cpf);
CREATE INDEX idx_aluno_email ON ALUNO(email);
CREATE INDEX idx_matricula_status ON MATRICULA(status);
CREATE INDEX idx_pagamento_status ON PAGAMENTO(status);
CREATE INDEX idx_aula_dia_horario ON AULA(dia_semana, horario_inicio);
CREATE INDEX idx_acesso_data ON ACESSO(data_acesso);

-- ============================================
-- MENSAGEM DE SUCESSO
-- ============================================

SELECT 'Banco de dados ACADEMIA_FITMAX criado com sucesso!' AS Mensagem;
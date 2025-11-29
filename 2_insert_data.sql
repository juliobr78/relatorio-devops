-- ============================================
-- SCRIPT DE INSERÇÃO DE DADOS
-- Povoamento das tabelas da Academia FitMax
-- ============================================

USE academia_fitmax;

-- ============================================
-- INSERÇÃO: PLANO
-- ============================================

INSERT INTO PLANO (nome_plano, valor_mensal, duracao_meses, descricao) VALUES
('Mensal', 150.00, 1, 'Plano mensal com acesso ilimitado a todas as modalidades'),
('Trimestral', 135.00, 3, 'Plano de 3 meses com 10% de desconto'),
('Semestral', 120.00, 6, 'Plano de 6 meses com 20% de desconto'),
('Anual', 100.00, 12, 'Plano de 12 meses com 33% de desconto e avaliação física gratuita');

-- ============================================
-- INSERÇÃO: ALUNO
-- ============================================

INSERT INTO ALUNO (cpf, nome, data_nascimento, telefone, email, endereco, data_matricula, status) VALUES
('12345678901', 'João Silva Santos', '1990-03-15', '(11) 98765-4321', 'joao.silva@email.com', 'Rua das Flores, 123 - São Paulo/SP', '2024-01-10', 'Ativo'),
('23456789012', 'Maria Oliveira Costa', '1985-07-22', '(11) 97654-3210', 'maria.oliveira@email.com', 'Av. Paulista, 456 - São Paulo/SP', '2024-01-15', 'Ativo'),
('34567890123', 'Pedro Henrique Souza', '1992-11-08', '(11) 96543-2109', 'pedro.souza@email.com', 'Rua Augusta, 789 - São Paulo/SP', '2024-02-20', 'Ativo'),
('45678901234', 'Ana Carolina Lima', '1988-05-30', '(11) 95432-1098', 'ana.lima@email.com', 'Rua Oscar Freire, 321 - São Paulo/SP', '2024-03-05', 'Ativo'),
('56789012345', 'Carlos Eduardo Ferreira', '1995-09-12', '(11) 94321-0987', 'carlos.ferreira@email.com', 'Av. Faria Lima, 654 - São Paulo/SP', '2024-03-10', 'Ativo'),
('67890123456', 'Juliana Martins Alves', '1991-12-25', '(11) 93210-9876', 'juliana.alves@email.com', 'Rua Haddock Lobo, 987 - São Paulo/SP', '2024-04-01', 'Ativo'),
('78901234567', 'Rafael Santos Pereira', '1987-04-18', '(11) 92109-8765', 'rafael.pereira@email.com', 'Rua da Consolação, 147 - São Paulo/SP', '2024-04-15', 'Ativo'),
('89012345678', 'Fernanda Costa Ribeiro', '1993-08-07', '(11) 91098-7654', 'fernanda.ribeiro@email.com', 'Av. Rebouças, 258 - São Paulo/SP', '2024-05-01', 'Inativo'),
('90123456789', 'Lucas Mendes Rocha', '1989-02-14', '(11) 90987-6543', 'lucas.rocha@email.com', 'Rua Pamplona, 369 - São Paulo/SP', '2024-05-10', 'Ativo'),
('01234567890', 'Patricia Gomes Silva', '1994-06-20', '(11) 89876-5432', 'patricia.silva@email.com', 'Av. Ibirapuera, 741 - São Paulo/SP', '2024-06-01', 'Ativo');

-- ============================================
-- INSERÇÃO: FUNCIONARIO
-- ============================================

INSERT INTO FUNCIONARIO (cpf, nome, data_nascimento, telefone, email, cargo, salario, data_admissao, cref) VALUES
('11111111111', 'Carlos Mendes Silva', '1985-05-10', '(11) 99111-1111', 'carlos.mendes@fitmax.com', 'Educador Físico', 4500.00, '2020-01-10', 'CREF 123456'),
('22222222222', 'Ana Paula Costa', '1988-09-15', '(11) 99222-2222', 'ana.costa@fitmax.com', 'Personal Trainer', 5000.00, '2020-03-15', 'CREF 234567'),
('33333333333', 'Roberto Lima Santos', '1990-02-20', '(11) 99333-3333', 'roberto.santos@fitmax.com', 'Educador Físico', 4200.00, '2021-06-01', 'CREF 345678'),
('44444444444', 'Mariana Souza Oliveira', '1992-11-25', '(11) 99444-4444', 'mariana.oliveira@fitmax.com', 'Nutricionista', 4800.00, '2021-08-10', 'CRN 456789'),
('55555555555', 'Fernando Alves Pereira', '1986-07-30', '(11) 99555-5555', 'fernando.pereira@fitmax.com', 'Gerente', 6500.00, '2019-05-01', NULL),
('66666666666', 'Julia Ferreira Costa', '1995-03-12', '(11) 99666-6666', 'julia.costa@fitmax.com', 'Recepcionista', 2800.00, '2022-01-15', NULL);

-- ============================================
-- INSERÇÃO: MATRICULA
-- ============================================

INSERT INTO MATRICULA (id_aluno, id_plano, data_inicio, data_fim, valor_pago, status) VALUES
(1, 4, '2024-01-10', '2025-01-10', 1200.00, 'Ativo'),
(2, 3, '2024-01-15', '2024-07-15', 720.00, 'Ativo'),
(3, 2, '2024-02-20', '2024-05-20', 405.00, 'Vencido'),
(4, 4, '2024-03-05', '2025-03-05', 1200.00, 'Ativo'),
(5, 1, '2024-03-10', '2024-04-10', 150.00, 'Vencido'),
(6, 3, '2024-04-01', '2024-10-01', 720.00, 'Ativo'),
(7, 4, '2024-04-15', '2025-04-15', 1200.00, 'Ativo'),
(8, 2, '2024-05-01', '2024-08-01', 405.00, 'Cancelado'),
(9, 3, '2024-05-10', '2024-11-10', 720.00, 'Ativo'),
(10, 1, '2024-06-01', '2024-07-01', 150.00, 'Ativo');

-- ============================================
-- INSERÇÃO: PAGAMENTO
-- ============================================

INSERT INTO PAGAMENTO (id_matricula, data_pagamento, data_vencimento, valor, metodo_pagamento, status) VALUES
(1, '2024-01-10', '2024-01-10', 1200.00, 'Cartão de Crédito', 'Pago'),
(2, '2024-01-15', '2024-01-15', 720.00, 'PIX', 'Pago'),
(3, '2024-02-20', '2024-02-20', 405.00, 'Boleto', 'Pago'),
(4, '2024-03-05', '2024-03-05', 1200.00, 'Cartão de Débito', 'Pago'),
(5, NULL, '2024-03-10', 150.00, NULL, 'Atrasado'),
(6, '2024-04-01', '2024-04-01', 720.00, 'PIX', 'Pago'),
(7, '2024-04-15', '2024-04-15', 1200.00, 'Cartão de Crédito', 'Pago'),
(9, '2024-05-10', '2024-05-10', 720.00, 'Dinheiro', 'Pago'),
(10, NULL, '2024-06-01', 150.00, NULL, 'Pendente');

-- ============================================
-- INSERÇÃO: MODALIDADE
-- ============================================

INSERT INTO MODALIDADE (nome_modalidade, descricao, duracao_minutos) VALUES
('Musculação', 'Treinamento com pesos e aparelhos de musculação', 60),
('Spinning', 'Aula de ciclismo indoor com música e coreografia', 45),
('Yoga', 'Prática de posturas, respiração e meditação', 60),
('Pilates', 'Exercícios de fortalecimento e alongamento', 50),
('Funcional', 'Treino funcional com movimentos do dia a dia', 45),
('Natação', 'Aulas de natação para todos os níveis', 45),
('Jump', 'Exercícios aeróbicos em mini trampolim', 40);

-- ============================================
-- INSERÇÃO: SALA
-- ============================================

INSERT INTO SALA (nome_sala, tipo_sala, capacidade) VALUES
('Sala de Musculação 1', 'Musculação', 40),
('Sala de Musculação 2', 'Musculação', 30),
('Sala Aeróbica 1', 'Aeróbica', 25),
('Sala Aeróbica 2', 'Aeróbica', 20),
('Piscina', 'Piscina', 15);

-- ============================================
-- INSERÇÃO: AULA
-- ============================================

INSERT INTO AULA (id_modalidade, id_funcionario, id_sala, dia_semana, horario_inicio, horario_fim, vagas_totais) VALUES
(2, 1, 3, 'Segunda', '07:00:00', '07:45:00', 25),
(2, 1, 3, 'Quarta', '07:00:00', '07:45:00', 25),
(2, 1, 3, 'Sexta', '07:00:00', '07:45:00', 25),
(3, 2, 4, 'Terça', '18:00:00', '19:00:00', 20),
(3, 2, 4, 'Quinta', '18:00:00', '19:00:00', 20),
(4, 2, 4, 'Segunda', '19:00:00', '19:50:00', 20),
(4, 2, 4, 'Quarta', '19:00:00', '19:50:00', 20),
(5, 3, 3, 'Terça', '06:00:00', '06:45:00', 25),
(5, 3, 3, 'Quinta', '06:00:00', '06:45:00', 25),
(6, 3, 5, 'Segunda', '08:00:00', '08:45:00', 15),
(6, 3, 5, 'Quarta', '08:00:00', '08:45:00', 15),
(7, 1, 3, 'Sexta', '19:00:00', '19:40:00', 25);

-- ============================================
-- INSERÇÃO: AGENDAMENTO
-- ============================================

INSERT INTO AGENDAMENTO (id_aluno, id_aula, data_agendamento, status) VALUES
(1, 1, '2024-06-10 10:30:00', 'Confirmado'),
(1, 3, '2024-06-10 10:35:00', 'Confirmado'),
(2, 4, '2024-06-11 14:20:00', 'Compareceu'),
(2, 5, '2024-06-11 14:25:00', 'Confirmado'),
(3, 6, '2024-06-12 09:15:00', 'Compareceu'),
(4, 8, '2024-06-13 07:45:00', 'Confirmado'),
(5, 9, '2024-06-13 08:00:00', 'Faltou'),
(6, 10, '2024-06-14 11:30:00', 'Confirmado'),
(7, 2, '2024-06-15 16:20:00', 'Compareceu'),
(9, 4, '2024-06-16 10:10:00', 'Confirmado'),
(10, 12, '2024-06-17 13:45:00', 'Cancelado');

-- ============================================
-- INSERÇÃO: EQUIPAMENTO
-- ============================================

INSERT INTO EQUIPAMENTO (id_sala, nome_equipamento, codigo_patrimonio, data_aquisicao, data_ultima_manutencao, status) VALUES
(1, 'Esteira Ergométrica', 'EST-001', '2020-01-15', '2024-06-01', 'Disponível'),
(1, 'Bicicleta Ergométrica', 'BIC-001', '2020-01-15', '2024-05-15', 'Disponível'),
(1, 'Supino Reto', 'SUP-001', '2020-02-10', '2024-06-10', 'Disponível'),
(1, 'Leg Press 45º', 'LEG-001', '2020-02-10', '2024-05-20', 'Disponível'),
(2, 'Crossover', 'CRO-001', '2020-03-05', '2024-06-05', 'Disponível'),
(2, 'Remada Baixa', 'REM-001', '2020-03-05', NULL, 'Manutenção'),
(3, 'Colchonetes', 'COL-001', '2020-01-20', NULL, 'Disponível'),
(3, 'Bolas de Pilates', 'BOL-001', '2020-01-20', NULL, 'Disponível'),
(4, 'Espelhos', 'ESP-001', '2019-12-10', NULL, 'Disponível'),
(5, 'Aquecedor de Piscina', 'AQU-001', '2019-11-15', '2024-04-10', 'Disponível');

-- ============================================
-- INSERÇÃO: AVALIACAO_FISICA
-- ============================================

INSERT INTO AVALIACAO_FISICA (id_aluno, id_funcionario, data_avaliacao, peso, altura, imc, percentual_gordura, massa_magra, observacoes) VALUES
(1, 2, '2024-01-10', 85.00, 1.75, 27.76, 22.50, 65.88, 'Aluno iniciante, foco em emagrecimento'),
(2, 2, '2024-01-15', 68.00, 1.62, 25.91, 28.00, 48.96, 'Boa disposição, recomendado aeróbico'),
(3, 4, '2024-02-20', 92.00, 1.80, 28.40, 25.00, 69.00, 'Foco em hipertrofia e redução de gordura'),
(4, 2, '2024-03-05', 60.00, 1.68, 21.26, 20.00, 48.00, 'Aluna em boa forma, manutenção'),
(5, 4, '2024-03-10', 78.00, 1.70, 26.99, 18.50, 63.57, 'Atleta amador, treino avançado'),
(1, 2, '2024-04-10', 82.00, 1.75, 26.78, 20.00, 65.60, 'Perda de 3kg, ótima evolução'),
(2, 2, '2024-04-15', 65.50, 1.62, 24.97, 25.00, 49.12, 'Redução de 2.5kg, continuar aeróbico'),
(6, 2, '2024-04-20', 71.00, 1.65, 26.08, 30.00, 49.70, 'Primeira avaliação, iniciante');

-- ============================================
-- INSERÇÃO: ACESSO
-- ============================================

INSERT INTO ACESSO (id_aluno, data_acesso, hora_entrada, hora_saida, catraca) VALUES
(1, '2024-06-17', '06:30:00', '08:15:00', 1),
(1, '2024-06-18', '06:35:00', '08:20:00', 1),
(2, '2024-06-17', '17:45:00', '19:30:00', 2),
(2, '2024-06-18', '17:50:00', '19:35:00', 2),
(3, '2024-06-17', '18:45:00', '20:15:00', 1),
(4, '2024-06-17', '05:50:00', '07:20:00', 2),
(5, '2024-06-17', '05:45:00', '07:30:00', 1),
(6, '2024-06-17', '07:50:00', '09:10:00', 2),
(7, '2024-06-18', '06:25:00', '08:00:00', 1),
(9, '2024-06-18', '17:30:00', NULL, 2),
(10, '2024-06-18', '18:45:00', '20:00:00', 1);

-- ============================================
-- MENSAGEM DE SUCESSO
-- ============================================

SELECT 'Dados inseridos com sucesso em todas as tabelas!' AS Mensagem;
-- ============================================
-- SCRIPT DE UPDATE E DELETE
-- Comandos de atualização e exclusão com condições
-- ============================================

USE academia_fitmax;

-- ============================================
-- COMANDOS UPDATE
-- ============================================

-- UPDATE 1: Atualizar status de matrículas vencidas
-- Objetivo: Marcar como "Vencido" todas as matrículas cuja data_fim já passou

UPDATE MATRICULA
SET status = 'Vencido'
WHERE data_fim < CURDATE() AND status = 'Ativo';

SELECT 'UPDATE 1: Matrículas vencidas atualizadas' AS Acao, ROW_COUNT() AS Registros_Afetados;

-- ============================================

-- UPDATE 2: Aumentar salário dos funcionários com mais de 3 anos de empresa
-- Objetivo: Dar aumento de 10% para funcionários antigos

UPDATE FUNCIONARIO
SET salario = salario * 1.10
WHERE DATEDIFF(CURDATE(), data_admissao) > 1095;  -- 1095 dias = 3 anos

SELECT 'UPDATE 2: Salários aumentados em 10%' AS Acao, ROW_COUNT() AS Registros_Afetados;

-- ============================================

-- UPDATE 3: Marcar pagamentos atrasados
-- Objetivo: Atualizar status de pagamentos pendentes com vencimento passado

UPDATE PAGAMENTO
SET status = 'Atrasado'
WHERE status = 'Pendente' AND data_vencimento < CURDATE();

SELECT 'UPDATE 3: Pagamentos marcados como atrasados' AS Acao, ROW_COUNT() AS Registros_Afetados;

-- ============================================

-- UPDATE EXTRA 1: Atualizar telefone de um aluno específico
-- Objetivo: Corrigir telefone do aluno João Silva

UPDATE ALUNO
SET telefone = '(11) 98765-9999'
WHERE cpf = '12345678901';

SELECT 'UPDATE EXTRA 1: Telefone do aluno atualizado' AS Acao, ROW_COUNT() AS Registros_Afetados;

-- ============================================

-- UPDATE EXTRA 2: Marcar agendamentos passados como "Faltou" se não compareceram
-- Objetivo: Atualizar automaticamente status de agendamentos antigos

UPDATE AGENDAMENTO ag
INNER JOIN AULA au ON ag.id_aula = au.id_aula
SET ag.status = 'Faltou'
WHERE ag.status = 'Confirmado' 
  AND DATE(ag.data_agendamento) < DATE_SUB(CURDATE(), INTERVAL 7 DAY);

SELECT 'UPDATE EXTRA 2: Agendamentos antigos marcados como falta' AS Acao, ROW_COUNT() AS Registros_Afetados;

-- ============================================
-- COMANDOS DELETE
-- ============================================

-- DELETE 1: Remover agendamentos cancelados antigos (mais de 30 dias)
-- Objetivo: Limpar histórico de agendamentos cancelados para liberar espaço

DELETE FROM AGENDAMENTO
WHERE status = 'Cancelado' 
  AND data_agendamento < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT 'DELETE 1: Agendamentos cancelados antigos removidos' AS Acao, ROW_COUNT() AS Registros_Afetados;

-- ============================================

-- DELETE 2: Excluir acessos com mais de 90 dias (limpeza de logs)
-- Objetivo: Manter apenas os últimos 90 dias de histórico de acesso

DELETE FROM ACESSO
WHERE data_acesso < DATE_SUB(CURDATE(), INTERVAL 90 DAY);

SELECT 'DELETE 2: Registros de acesso antigos removidos' AS Acao, ROW_COUNT() AS Registros_Afetados;

-- ============================================

-- DELETE 3: Remover alunos inativos sem matrículas há mais de 1 ano
-- Objetivo: Limpar cadastro de alunos inativos sem vínculo

DELETE a
FROM ALUNO a
LEFT JOIN MATRICULA m ON a.id_aluno = m.id_aluno
WHERE a.status = 'Inativo'
  AND (m.id_matricula IS NULL OR m.data_fim < DATE_SUB(CURDATE(), INTERVAL 365 DAY));

SELECT 'DELETE 3: Alunos inativos sem vínculo removidos' AS Acao, ROW_COUNT() AS Registros_Afetados;

-- ============================================

-- DELETE EXTRA 1: Remover pagamentos duplicados (se existirem)
-- Objetivo: Garantir integridade removendo duplicatas

DELETE p1
FROM PAGAMENTO p1
INNER JOIN PAGAMENTO p2
WHERE p1.id_pagamento > p2.id_pagamento
  AND p1.id_matricula = p2.id_matricula
  AND p1.data_vencimento = p2.data_vencimento;

SELECT 'DELETE EXTRA 1: Pagamentos duplicados removidos' AS Acao, ROW_COUNT() AS Registros_Afetados;

-- ============================================

-- DELETE EXTRA 2: Excluir equipamentos marcados como "Quebrado" há mais de 6 meses
-- Objetivo: Limpar equipamentos irrecuperáveis do inventário

DELETE FROM EQUIPAMENTO
WHERE status = 'Quebrado'
  AND data_ultima_manutencao < DATE_SUB(CURDATE(), INTERVAL 180 DAY);

SELECT 'DELETE EXTRA 2: Equipamentos quebrados antigos removidos' AS Acao, ROW_COUNT() AS Registros_Afetados;

-- ============================================
-- VERIFICAÇÕES PÓS-OPERAÇÃO
-- ============================================

-- Verificar matrículas vencidas
SELECT 'Matrículas Vencidas' AS Categoria, COUNT(*) AS Total
FROM MATRICULA WHERE status = 'Vencido';

-- Verificar pagamentos atrasados
SELECT 'Pagamentos Atrasados' AS Categoria, COUNT(*) AS Total
FROM PAGAMENTO WHERE status = 'Atrasado';

-- Verificar total de alunos ativos
SELECT 'Alunos Ativos' AS Categoria, COUNT(*) AS Total
FROM ALUNO WHERE status = 'Ativo';

-- ============================================
-- MENSAGEM DE CONCLUSÃO
-- ============================================

SELECT '✅ Todos os comandos UPDATE e DELETE foram executados com sucesso!' AS Resultado;
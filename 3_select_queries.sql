-- ============================================
-- SCRIPT DE CONSULTAS SELECT
-- Consultas complexas com JOIN, WHERE, ORDER BY, LIMIT
-- ============================================

USE academia_fitmax;

-- ============================================
-- CONSULTA 1: Alunos com matrículas ativas e seus planos
-- ============================================
-- Objetivo: Listar todos os alunos ativos com seus planos vigentes

SELECT 
    a.nome AS Nome_Aluno,
    a.telefone AS Telefone,
    a.email AS Email,
    p.nome_plano AS Plano,
    m.data_inicio AS Inicio_Vigencia,
    m.data_fim AS Fim_Vigencia,
    m.valor_pago AS Valor_Pago,
    m.status AS Status_Matricula
FROM 
    ALUNO a
INNER JOIN MATRICULA m ON a.id_aluno = m.id_aluno
INNER JOIN PLANO p ON m.id_plano = p.id_plano
WHERE 
    m.status = 'Ativo'
    AND a.status = 'Ativo'
ORDER BY 
    a.nome;

-- ============================================
-- CONSULTA 2: Aulas mais populares (com mais agendamentos)
-- ============================================
-- Objetivo: Mostrar ranking das modalidades com mais agendamentos

SELECT 
    mo.nome_modalidade AS Modalidade,
    COUNT(ag.id_agendamento) AS Total_Agendamentos,
    au.dia_semana AS Dia,
    au.horario_inicio AS Horario,
    f.nome AS Professor,
    s.nome_sala AS Sala,
    au.vagas_totais AS Vagas_Totais,
    (au.vagas_totais - COUNT(ag.id_agendamento)) AS Vagas_Disponiveis
FROM 
    MODALIDADE mo
INNER JOIN AULA au ON mo.id_modalidade = au.id_modalidade
INNER JOIN FUNCIONARIO f ON au.id_funcionario = f.id_funcionario
INNER JOIN SALA s ON au.id_sala = s.id_sala
LEFT JOIN AGENDAMENTO ag ON au.id_aula = ag.id_aula AND ag.status = 'Confirmado'
GROUP BY 
    mo.nome_modalidade, au.id_aula, au.dia_semana, au.horario_inicio, f.nome, s.nome_sala, au.vagas_totais
ORDER BY 
    Total_Agendamentos DESC, mo.nome_modalidade
LIMIT 10;

-- ============================================
-- CONSULTA 3: Evolução física dos alunos (comparativo de avaliações)
-- ============================================
-- Objetivo: Mostrar a evolução de peso e IMC dos alunos com mais de uma avaliação

SELECT 
    a.nome AS Nome_Aluno,
    COUNT(af.id_avaliacao) AS Total_Avaliacoes,
    MIN(af.peso) AS Peso_Minimo,
    MAX(af.peso) AS Peso_Maximo,
    (MAX(af.peso) - MIN(af.peso)) AS Variacao_Peso,
    MIN(af.imc) AS IMC_Minimo,
    MAX(af.imc) AS IMC_Maximo,
    MIN(af.data_avaliacao) AS Primeira_Avaliacao,
    MAX(af.data_avaliacao) AS Ultima_Avaliacao
FROM 
    ALUNO a
INNER JOIN AVALIACAO_FISICA af ON a.id_aluno = af.id_aluno
GROUP BY 
    a.id_aluno, a.nome
HAVING 
    COUNT(af.id_avaliacao) > 1
ORDER BY 
    Variacao_Peso DESC;

-- ============================================
-- CONSULTA 4: Relatório financeiro - Pagamentos por mês
-- ============================================
-- Objetivo: Analisar receita mensal com detalhes de pagamentos

SELECT 
    DATE_FORMAT(p.data_vencimento, '%Y-%m') AS Mes_Referencia,
    COUNT(p.id_pagamento) AS Total_Pagamentos,
    COUNT(CASE WHEN p.status = 'Pago' THEN 1 END) AS Pagamentos_Realizados,
    COUNT(CASE WHEN p.status = 'Pendente' THEN 1 END) AS Pagamentos_Pendentes,
    COUNT(CASE WHEN p.status = 'Atrasado' THEN 1 END) AS Pagamentos_Atrasados,
    SUM(CASE WHEN p.status = 'Pago' THEN p.valor ELSE 0 END) AS Receita_Recebida,
    SUM(CASE WHEN p.status != 'Pago' THEN p.valor ELSE 0 END) AS Receita_Pendente,
    SUM(p.valor) AS Receita_Total
FROM 
    PAGAMENTO p
GROUP BY 
    DATE_FORMAT(p.data_vencimento, '%Y-%m')
ORDER BY 
    Mes_Referencia DESC;

-- ============================================
-- CONSULTA 5: Frequência dos alunos na academia (últimos 30 dias)
-- ============================================
-- Objetivo: Análise de frequência de uso da academia

SELECT 
    a.nome AS Nome_Aluno,
    a.telefone AS Telefone,
    COUNT(ac.id_acesso) AS Total_Visitas,
    MIN(ac.data_acesso) AS Primeira_Visita,
    MAX(ac.data_acesso) AS Ultima_Visita,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, ac.hora_entrada, ac.hora_saida)), 0) AS Tempo_Medio_Minutos,
    m.status AS Status_Matricula
FROM 
    ALUNO a
INNER JOIN MATRICULA m ON a.id_aluno = m.id_aluno AND m.status = 'Ativo'
LEFT JOIN ACESSO ac ON a.id_aluno = ac.id_aluno 
    AND ac.data_acesso >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY 
    a.id_aluno, a.nome, a.telefone, m.status
ORDER BY 
    Total_Visitas DESC, a.nome;

-- ============================================
-- CONSULTA EXTRA: Equipamentos que precisam de manutenção
-- ============================================
-- Objetivo: Listar equipamentos com status de manutenção ou sem manutenção há mais de 90 dias

SELECT 
    e.codigo_patrimonio AS Codigo,
    e.nome_equipamento AS Equipamento,
    s.nome_sala AS Sala,
    e.data_aquisicao AS Data_Compra,
    e.data_ultima_manutencao AS Ultima_Manutencao,
    DATEDIFF(CURDATE(), e.data_ultima_manutencao) AS Dias_Sem_Manutencao,
    e.status AS Status_Atual
FROM 
    EQUIPAMENTO e
INNER JOIN SALA s ON e.id_sala = s.id_sala
WHERE 
    e.status = 'Manutenção' 
    OR e.data_ultima_manutencao IS NULL
    OR DATEDIFF(CURDATE(), e.data_ultima_manutencao) > 90
ORDER BY 
    Dias_Sem_Manutencao DESC NULLS FIRST;

-- ============================================
-- MENSAGEM DE CONCLUSÃO
-- ============================================

SELECT '✅ Todas as consultas SELECT foram executadas com sucesso!' AS Resultado;
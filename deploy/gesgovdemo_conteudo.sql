-- ============================================================
-- GesGov Demo — marca e conteúdo
-- ============================================================
-- Site de demonstração da GesGov para mostrar às Juntas de Freguesia
-- o site que a empresa entrega (mesmo CORE dos sites das freguesias).
-- Corre sobre uma BD criada a partir do dump da Atalaia (esquema
-- completo, migrações 001–032). Substitui todo o conteúdo da Atalaia.
--
-- Fonte de TODO o conteúdo: gesgov.pt (Sobre Nós, Diretor Executivo,
-- A Nossa Equipa, Info/notícias, Agenda/eventos, Serviços, Parceiros,
-- Links Úteis, Contactos), recolhido a 30/09/2026. Logótipo e cores do
-- modelo antigo (granho.185.205.244.198.nip.io): #01478E e #A2A1A0.
-- Mapeamento: Executivo = equipa GesGov; Mensagem do presidente = texto
-- do Diretor Executivo; História = Sobre Nós; Heráldica = identidade
-- GesGov; Associações = autarquias parceiras; Comércio local = serviços
-- GesGov; Pontos de interesse = sede e escritório. Ver CLAUDE.md.
-- ============================================================

SET NAMES utf8mb4;

-- ------------------------------------------------------------
-- 1. Limpar o conteúdo herdado da Atalaia
-- ------------------------------------------------------------
DELETE FROM galeria_imagens;
DELETE FROM galeria_albuns;
DELETE FROM noticias_imagens;
DELETE FROM noticias;
DELETE FROM eventos;
DELETE FROM pontos_interesse;
DELETE FROM associacoes;
DELETE FROM comercio_local;
DELETE FROM contactos_uteis;
DELETE FROM documentos;
DELETE FROM executivo_membros;
DELETE FROM assembleia_composicao;
DELETE FROM heraldica_elementos;
DELETE FROM slides_homepage;
DELETE FROM requerimentos_ficheiros;
DELETE FROM requerimentos;
DELETE FROM separadores_fundo;

-- ------------------------------------------------------------
-- 2. Marca (logótipo e cores do modelo antigo)
-- ------------------------------------------------------------
-- Logótipo: o do modelo antigo, recortado (sem a marca de água que
-- trazia no canto). Favicon: o «G» do gesgov.pt.
UPDATE configuracoes_site SET
    nome_site          = 'GesGov - Soluções Integradas para Autarquias',
    municipio          = 'Site de demonstração',
    slogan             = 'Ao lado das Freguesias',
    email              = 'geral@gesgov.pt',
    dominio            = 'https://demo.gesgov.pt',
    telefone           = '966 234 640',
    morada             = 'Rua 5 de Outubro, n.º 8, 7470-118 Casa Branca',
    logo               = 'logo-gesgov.png',
    cor_principal      = '#01478E',
    cor_secundaria     = '#A2A1A0',
    footer             = '© 2026 GesGov - Soluções Integradas para Autarquias • Site de demonstração',
    facebook           = 'https://www.facebook.com/gesgov',
    instagram          = 'https://www.instagram.com/ges_gov/',
    horario            = 'Contacte-nos pelo 966 234 640 ou geral@gesgov.pt',
    email_notificacoes = 'geral@gesgov.pt';

-- Barra de topo cinzenta (secundária) com texto escuro (≈ 6:1) e a
-- linha azul por baixo; acentos nos dois azuis do logótipo.
UPDATE tema_config SET valor = '#F6F8FB' WHERE chave = 'fundo';
UPDATE tema_config SET valor = 'var(--cor-secundaria)' WHERE chave = 'topbar_bg';
UPDATE tema_config SET valor = '#1E2329' WHERE chave = 'topbar_texto';
UPDATE tema_config SET valor = 'var(--cor-principal)' WHERE chave = 'topbar_borda';
UPDATE tema_config SET valor = '#F6F8FB' WHERE chave = 'hero_1';
UPDATE tema_config SET valor = '#DCE7F3' WHERE chave = 'hero_2';
UPDATE tema_config SET valor = '#1E2329' WHERE chave = 'hero_texto';
UPDATE tema_config SET valor = '#2A8BC9' WHERE chave = 'acento';
UPDATE tema_config SET valor = '#01478E' WHERE chave = 'acento_escuro';
UPDATE tema_config SET valor = '#EEF2F7' WHERE chave = 'footer_bg';
UPDATE tema_config SET valor = '#CFE6F7' WHERE chave = 'kicker_img_texto';
UPDATE tema_config SET valor = 'GG'      WHERE chave = 'logo_iniciais';
UPDATE tema_config SET valor = 'favicon-gesgov.png' WHERE chave = 'favicon';

-- ------------------------------------------------------------
-- 3. Páginas de configuração
-- ------------------------------------------------------------
DELETE FROM pagina_freguesia;
INSERT INTO pagina_freguesia
(id, hero_kicker, hero_titulo, hero_subtitulo, hero_imagem, intro_titulo, intro_texto,
 historia_titulo, historia_texto, identidade_titulo, identidade_texto,
 patrimonio_titulo, patrimonio_texto, localidades_titulo, localidades_texto,
 galeria_titulo, botao1_texto, botao1_link, botao2_texto, botao2_link)
VALUES
(1, 'Sobre Nós', 'GesGov',
 'Empresa especializada em consultoria autárquica — este é o site que entregamos às Juntas de Freguesia.',
 'hero-escritorio.jpg',
 'Quem somos',
 'A GesGov é uma empresa especializada em consultoria autárquica, fundada em 2024 por Pedro Miguel Ourives Prates, Licenciado em Gestão Autárquica, com experiência em autarquias acumulada ao longo de 25 anos em funções técnicas e de coordenação em formação e implementação de sistemas informáticos.',
 'Porque existimos',
 'Desta experiência e da necessidade de mercado em recursos humanos qualificados, conhecedores de legislação específica para autarquias em áreas como contratação pública, procedimentos concursais, RGPD, SNC-AP ou SIADAP, e ainda de constantes desafios colocados ao funcionalismo público para desmaterialização de processos, automatização, sustentabilidade, eficiência e eficácia, surge a GesGov como resposta.',
 'Missão',
 'Prestar serviços de qualidade, cimentados em conhecimentos especializados em autarquias locais, trabalhando em prol das entidades políticas mais próximas da população, dotando os executivos e colaboradores de conhecimento e aptidão na gestão de uma autarquia.',
 'O que fazemos',
 'A GesGov tem serviços para autarquias em áreas como a informática, contabilidade, gestão de património, contratação pública, gestão de recursos humanos, avaliação de desempenho (SIADAP), licenciamentos, procedimentos concursais, RGPD, produção de sites para autarquias e elaboração de regulamentos internos e externos, e disponibiliza uma rede de parceiros com respostas concretas para as necessidades das autarquias.',
 'Onde estamos',
 'Casa Branca|Sede — Rua 5 de Outubro, n.º 8, 7470-118 Casa Branca\nSousel|Escritório — Zona Industrial de Sousel, Lote 5, Edifício CAME, 7470-200 Sousel',
 'A GesGov em imagens',
 'Conhecer a equipa', '/executivo.php', 'Ver no mapa', '/mapa.php');

DELETE FROM pagina_historia;
INSERT INTO pagina_historia
(id, hero_kicker, hero_titulo, hero_subtitulo, hero_imagem, intro_titulo, intro_texto,
 bloco1_titulo, bloco1_texto, bloco2_titulo, bloco2_texto, timeline_titulo, timeline_texto,
 galeria_titulo)
VALUES
(1, 'História', 'A história da GesGov',
 'Da experiência de 25 anos nas autarquias a uma equipa multidisciplinar ao lado das Freguesias.',
 'noticia-inauguracao-escritorio-gesgov.jpg',
 'Quem somos',
 'A GesGov é uma empresa especializada em consultoria autárquica, fundada em 2024 por Pedro Miguel Ourives Prates, Licenciado em Gestão Autárquica, com experiência em autarquias acumulada ao longo de 25 anos em funções técnicas e de coordenação em formação e implementação de sistemas informáticos.\n\nDesta experiência e da necessidade de mercado em recursos humanos qualificados, conhecedores de legislação específica para autarquias em áreas como contratação pública, procedimentos concursais, RGPD, SNC-AP ou SIADAP, e ainda de constantes desafios colocados ao funcionalismo público para desmaterialização de processos, automatização, sustentabilidade, eficiência e eficácia, surge a GesGov como resposta.',
 'Visão e valores',
 'Visão: criar e prestar serviços de excelência para autarquias, criando espaços de conhecimento e formação direcionado a autarcas e colaboradores, com o objetivo de promover políticas planeadas na utilização de recursos de uma autarquia, cumprindo todos os requisitos legais, fomentando a transparência, eficiência e eficácia.\n\nValores: compromisso com as autarquias baseado em experiência profissional, transparência, conhecimento, e em princípios como a legalidade, prossecução do interesse público e boa administração.',
 'Porque optar por apoio externo',
 'As constantes alterações de legislação e a exigência crescente para com as autarquias locais, assim como a necessidade de acesso a informação fidedigna para a tomada de decisão, trouxe-nos novos desafios. Qualificar recursos humanos é um processo que requer conhecimentos e experiência. Recorrer a quadros técnicos qualificados e especializados externos é a opção financeiramente mais acessível, vantajosa, imediata e garante de eficiência e eficácia na gestão de recursos públicos.',
 'Principais datas',
 '2000|Pedro Prates começa a trabalhar junto das autarquias locais.\n2024|Fundação da GesGov, com sede em Casa Branca (Sousel).\nagosto de 2026|A GesGov apoia as Festas Populares de Casa Branca (14 a 16 de agosto).\nsetembro de 2026|Lançamento da newsletter GesGov para as freguesias.\n7 de setembro de 2026|Inauguração do escritório no CAME – Centro de Apoio às Microempresas, em Sousel, com o Presidente da Câmara Municipal de Sousel.\nsetembro de 2026|Reforço da equipa multidisciplinar: seis colaboradores e 50 autarquias parceiras.\noutubro–novembro de 2026|Plano de Formação GesGov: Montemor-o-Novo, Sesimbra, Samora Correia e Campo Maior.',
 'A GesGov em imagens');

-- Heráldica = identidade da GesGov (não há brasão: é uma empresa).
DELETE FROM heraldica_pagina;
INSERT INTO heraldica_pagina
(id, hero_kicker, hero_titulo, hero_subtitulo, titulo, texto_intro, imagem, fonte_texto, fonte_url, ativo)
VALUES
(1, 'Identidade', 'Identidade GesGov',
 'Logótipo, cores e valores da GesGov — Soluções Integradas para Autarquias.',
 'O logótipo GesGov',
 'Numa Junta de Freguesia, esta página mostra o brasão, a bandeira e o selo, com a ordenação heráldica publicada em Diário da República. No site de demonstração mostra a identidade da GesGov: o logótipo, as cores institucionais e os valores da empresa.',
 'logo-gesgov.png',
 'gesgov.pt — Sobre Nós',
 'https://gesgov.pt/sobre-nos',
 1);

INSERT INTO heraldica_elementos (titulo, descricao, icone, ordem, ativo) VALUES
('Azul GesGov', 'A cor principal, #01478E — a palavra «Ges» do logótipo, em gradiente para um azul mais claro, e a barra inclinada por baixo.', 'bi-palette', 1, 1),
('Cinzento', 'A cor secundária, #A2A1A0, que acompanha o azul nas peças da marca.', 'bi-palette2', 2, 1),
('Braille', 'A linha em pontos de Braille sob a palavra «Gov» lembra que um serviço público tem de ser acessível a todos.', 'bi-universal-access', 3, 1),
('Missão', 'Prestar serviços de qualidade, cimentados em conhecimentos especializados em autarquias locais, trabalhando em prol das entidades políticas mais próximas da população.', 'bi-bullseye', 4, 1),
('Valores', 'Experiência profissional, transparência, conhecimento, legalidade, prossecução do interesse público e boa administração.', 'bi-shield-check', 5, 1);

DELETE FROM contactos_pagina_config;
INSERT INTO contactos_pagina_config
(id, hero_kicker, hero_titulo, hero_subtitulo, bloco_titulo, bloco_texto, horario_titulo, horario_texto, ativo)
VALUES
(1, 'Contactos', 'Contactos', 'Fale connosco: estamos em Casa Branca e no CAME, em Sousel.',
 'GesGov - Soluções Integradas para Autarquias',
 'Sede: Rua 5 de Outubro, n.º 8, 7470-118 Casa Branca\nEscritório: Zona Industrial de Sousel, Lote 5, Edifício CAME, 7470-200 Sousel\nTel. 966 234 640 · geral@gesgov.pt',
 'Site de demonstração',
 'Este é o site de demonstração da GesGov: o mesmo site, com o mesmo backoffice, que entregamos às Juntas de Freguesia. Os pedidos e formulários de teste chegam à GesGov.', 1);

UPDATE homepage_config SET
    hero_titulo       = 'GesGov — o site da sua Junta de Freguesia',
    hero_subtitulo    = 'Site de demonstração: notícias, agenda, serviços online, transparência e backoffice, com o conteúdo real da GesGov.',
    boasvindas_titulo = 'Bem-vindo ao site de demonstração da GesGov',
    boasvindas_texto  = 'Este é o site que a GesGov entrega às Juntas de Freguesia, preenchido com a informação da própria GesGov: a equipa no lugar do executivo, as notícias e a agenda da empresa, e as 50 autarquias parceiras. Explore as páginas e o backoffice.',
    cta_titulo        = 'Quer um site assim para a sua Junta?',
    cta_texto         = 'Fale com a GesGov: 966 234 640 · geral@gesgov.pt',
    cta_botao_texto   = 'Contactar a GesGov',
    cta_botao_link    = 'contactos.php',
    galeria_kicker    = 'A GesGov em imagens',
    galeria_titulo    = 'A GesGov em imagens',
    presidente_titulo = 'Mensagem do Diretor Executivo',
    presidente_nome   = 'Pedro Miguel Ourives Prates',
    presidente_cargo  = 'Diretor Executivo e fundador da GesGov',
    presidente_foto   = 'equipa-0.jpg',
    presidente_mensagem = 'Pedro Miguel Ourives Prates é Licenciado em Gestão Autárquica e possui mais de 25 anos de experiência profissional junto de autarquias locais. Ao longo do seu percurso, desenvolveu competências em áreas centrais da administração pública, nomeadamente informática, contabilidade autárquica, gestão de património, contratação pública, gestão de recursos humanos, avaliação de desempenho de funcionários públicos (SIADAP), RGPD, licenciamentos no âmbito do regime jurídico das autarquias locais, análise e implementação de processos e procedimentos concursais.\n\nCom uma sólida formação académica em Gestão Autárquica e um profundo conhecimento da legislação aplicável às autarquias locais, especializou-se na análise, planeamento e implementação de soluções que visam aumentar a eficiência e transparência da administração pública.\n\n«É um passo importante no crescimento da GesGov, mas sobretudo um compromisso renovado com os nossos clientes. Queremos continuar a crescer com uma equipa especializada, disponível e próxima das Autarquias, contribuindo diariamente para uma gestão pública local mais eficiente.» — na inauguração do escritório no CAME, a 7 de setembro de 2026.',
    mostrar_mensagem_presidente = 1;

UPDATE recursos_humanos_config SET
    intro_texto = REPLACE(intro_texto, 'Junta de Freguesia de Atalaia e Alto Estanqueiro-Jardia', 'Junta de Freguesia');

-- As FAQs ficam as de uma Junta (é isso que o site demonstra), sem nome.
UPDATE faqs SET
    pergunta = REPLACE(pergunta, 'Junta de Freguesia de Atalaia e Alto Estanqueiro-Jardia', 'Junta de Freguesia'),
    resposta = REPLACE(REPLACE(resposta, 'Atalaia e Alto Estanqueiro-Jardia', 'da freguesia'), 'de da freguesia', 'da freguesia');

-- ------------------------------------------------------------
-- 4. Executivo = equipa GesGov (gesgov.pt › Sobre Nós › A Nossa Equipa)
-- ------------------------------------------------------------
-- Fotos: as da página da equipa, pela mesma ordem (vistas uma a uma).
INSERT INTO executivo_membros (nome, cargo, pelouros, biografia, email, foto, ordem, ativo) VALUES
('Pedro Miguel Ourives Prates', 'Diretor Executivo', 'Contabilidade\nRecursos Humanos\nSIADAP\nAcompanhamento presencial dos clientes',
 'Licenciado em Gestão Autárquica. Desempenha funções junto das autarquias locais desde 2000, em informática, contabilidade, património, contratação pública, recursos humanos, SIADAP, licenciamentos e legislação autárquica. Na GesGov acompanha presencialmente os clientes e lidera a contabilidade, os recursos humanos e o SIADAP.',
 'geral@gesgov.pt', 'equipa-0.jpg', 1, 1),
('Daniela Pegacho', 'Jurista', 'Contratação Pública\nRegulamentos\nPareceres jurídicos',
 'Licenciada em Direito e Mestre em Ciências Jurídico-Criminais. Experiência em contratação pública em projetos de grande dimensão; desempenhou funções na Comunidade Intermunicipal do Alto Alentejo e na Câmara Municipal de Sousel. Projeto de referência: Barragem do Pisão (procedimentos de concursos públicos e pareceres jurídicos). Na GesGov é responsável pela contratação pública, regulamentos e pareceres.',
 NULL, 'equipa-1.jpg', 2, 1),
('João Pinto', 'Técnico Oficial de Contas', 'Área financeira\nRelatórios financeiros\nSubmissão de mapas',
 'Licenciado em Gestão, pós-graduado em Contabilidade Pública (SNC-AP) e Técnico Oficial de Contas. Nove anos de experiência com autarquias, em empresas de contabilidade e de produção de software. Na GesGov acompanha pessoalmente os clientes na área financeira das freguesias.',
 NULL, 'equipa-2.jpg', 3, 1),
('Carlos Baptista', 'Consultor Informático', 'Redes e sistemas\nSegurança informática\nContinuidade de negócio',
 'Formação especializada em informática, redes e sistemas, com 40 anos de atividade profissional em tecnologias de informação. Na GesGov lidera a consultoria informática prestada às autarquias locais.',
 NULL, 'equipa-3.jpg', 4, 1),
('Filipe Dordio', 'Engenheiro Informático', 'Plataformas digitais\nSites das autarquias',
 'Licenciado em Engenharia Informática – Engenharia de Software. Desenvolve plataformas digitais simples, intuitivas e diferenciadoras, desenhadas a partir das necessidades reais das autarquias.',
 NULL, 'equipa-4.jpg', 5, 1),
('João Pereira', 'Consultor de Marketing Digital', 'Comunicação digital\nFotografia e vídeo\nBoletins e visualização 3D',
 'Licenciado em Marketing Digital. Trabalha em fotografia, vídeo, redes sociais, mailings, boletins de freguesia e visualização 3D, transformando informação institucional em comunicação próxima e consistente.',
 NULL, 'equipa-5.jpg', 6, 1);

-- Assembleia: sem equivalente numa empresa — fica vazia (o site mostra
-- o estado vazio). Pode ser preenchida no backoffice para demonstração.

-- ------------------------------------------------------------
-- 5. Contactos úteis = sede, escritório e Links Úteis do gesgov.pt
-- ------------------------------------------------------------
INSERT INTO contactos_uteis (nome, categoria, telefone, email, morada, horario, descricao, ordem, destaque, ativo) VALUES
('GesGov — Sede', 'GesGov', '966 234 640', 'geral@gesgov.pt', 'Rua 5 de Outubro, n.º 8, 7470-118 Casa Branca', NULL, NULL, 1, 1, 1),
('GesGov — Escritório CAME', 'GesGov', '966 234 640', 'geral@gesgov.pt', 'Zona Industrial de Sousel, Lote 5, Edifício CAME, 7470-200 Sousel', NULL, NULL, 2, 1, 1),
('DGAL — Direção-Geral das Autarquias Locais', 'Links úteis', NULL, NULL, NULL, NULL, 'https://www.portalautarquico.dgal.gov.pt', 3, 0, 1),
('ANAFRE — Associação Nacional de Freguesias', 'Links úteis', NULL, NULL, NULL, NULL, 'https://www.anafre.pt', 4, 0, 1),
('Tribunal de Contas', 'Links úteis', NULL, NULL, NULL, NULL, 'https://www.tcontas.pt', 5, 0, 1),
('Portal das Finanças', 'Links úteis', NULL, NULL, NULL, NULL, 'https://www.portaldasfinancas.gov.pt', 6, 0, 1),
('Segurança Social Direta', 'Links úteis', NULL, NULL, NULL, NULL, 'https://app.seg-social.pt', 7, 0, 1),
('Caixa Geral de Aposentações', 'Links úteis', NULL, NULL, NULL, NULL, 'https://www.cga.pt', 8, 0, 1);

-- ------------------------------------------------------------
-- 6. Pontos de interesse = onde está a GesGov
-- ------------------------------------------------------------
-- CAME: coordenadas do próprio convite da inauguração (gesgov.pt ›
-- Agenda). Sede: rua geocodificada no Nominatim (aproximada). As duas
-- DENTRO do freguesia.geojson (concelho de Sousel, relação OSM 5397427).
INSERT INTO pontos_interesse (nome, descricao, imagem, localizacao, latitude, longitude) VALUES
('Escritório GesGov — CAME, Sousel', 'Inaugurado a 7 de setembro de 2026 no CAME – Centro de Apoio às Microempresas, na Zona Industrial de Sousel. Conta com uma equipa de cerca de seis colaboradores, de diferentes áreas de especialização.', 'evento-convite-inauguracao-do-escritorio-gesgov-came-sousel.jpg', 'Zona Industrial de Sousel, Lote 5, Edifício CAME, 7470-200 Sousel', '38.952806', '-7.684907'),
('Sede GesGov — Casa Branca', 'A sede da GesGov fica em Casa Branca, no concelho de Sousel. «É em Casa Branca que temos a nossa sede» — da notícia do apoio às Festas Populares de Casa Branca.', 'noticia-gesgov-apoia-as-festas-de-casa-branca.jpg', 'Rua 5 de Outubro, n.º 8, 7470-118 Casa Branca', '38.9480072', '-7.8109961');

INSERT INTO galeria_albuns (nome, descricao, capa, origem, origem_id, ordem, ativo)
SELECT nome, NULL, imagem, 'ponto', id, id, 1 FROM pontos_interesse WHERE imagem IS NOT NULL;
INSERT INTO galeria_imagens (album_id, ficheiro, titulo, ordem, ativo)
SELECT a.id, a.capa, a.nome, 1, 1 FROM galeria_albuns a;
INSERT INTO galeria_imagens (album_id, ficheiro, titulo, ordem, ativo)
SELECT a.id, x.f, x.t, x.o, 1 FROM galeria_albuns a
JOIN (SELECT 'Escritório GesGov — CAME, Sousel' n, 'noticia-inauguracao-escritorio-gesgov.jpg' f, 'A equipa GesGov no CAME' t, 2 o
      UNION ALL SELECT 'Escritório GesGov — CAME, Sousel', 'noticia-gesgov-inaugura-novo-escritorio-no-came-em-sousel.jpg', 'Inauguração, com o Presidente da Câmara Municipal de Sousel', 3) x
  ON CONVERT(x.n USING utf8mb4) COLLATE utf8mb4_bin = CONVERT(a.nome USING utf8mb4) COLLATE utf8mb4_bin;

INSERT INTO slides_homepage (titulo, subtitulo, imagem, link_destino, ativo) VALUES
('GesGov — Soluções Integradas para Autarquias', 'O site que entregamos às Juntas de Freguesia, com o conteúdo real da GesGov.', 'noticia-inauguracao-escritorio-gesgov.jpg', 'freguesia.php', 1),
('Uma equipa ao lado das Freguesias', 'Contabilidade, contratação pública, jurídico, informática e comunicação.', 'noticia-gesgov-reforca-equipa-multidisciplinar-e-amplia-servicos-especializados-as-autarquias.jpg', 'executivo.php', 1),
('Plano de Formação GesGov', 'Alterações ao CCP, LCPA e procedimentos de despesa pública — outubro e novembro de 2026.', 'evento-plano-de-formacao-gesgov-montemor-o-novo-alteracoes-ao-ccp-lcpa-e-procedimentos-de-despesa-publica.jpg', 'eventos.php', 1);

-- ------------------------------------------------------------
-- 7. Comércio local = serviços GesGov (gesgov.pt › Serviços)
-- ------------------------------------------------------------
-- Numa Junta, esta página lista o comércio da freguesia. Aqui lista os
-- nove serviços da GesGov (textos da página de serviços), sem mapa.
INSERT INTO comercio_local (nome, tipo, telefone, email, morada, website, outros_contactos, latitude, longitude, imagem) VALUES
('Construção de WebSite e Ferramentas Digitais', 'Serviço GesGov', '966 234 640', 'geral@gesgov.pt', NULL, 'https://gesgov.pt/servicos', 'Construímos plataformas digitais — como este site.', NULL, NULL, NULL),
('Contabilidade Pública (SNC-AP)', 'Serviço GesGov', '966 234 640', 'geral@gesgov.pt', NULL, 'https://gesgov.pt/servicos', 'SNC-AP – Sistema de Normalização Contabilística para as Administrações Públicas.', NULL, NULL, NULL),
('RGPD - Regulamento Geral de Proteção de Dados', 'Serviço GesGov', '966 234 640', 'geral@gesgov.pt', NULL, 'https://gesgov.pt/servicos', 'Lei n.º 58/2019, de 8 de agosto.', NULL, NULL, NULL),
('Procedimentos Concursais', 'Serviço GesGov', '966 234 640', 'geral@gesgov.pt', NULL, 'https://gesgov.pt/servicos', 'Elaboração completa de processos de contratação de funcionários públicos, acompanhando todas as fases do procedimento concursal.', NULL, NULL, NULL),
('Consultoria Jurídica', 'Serviço GesGov', '966 234 640', 'geral@gesgov.pt', NULL, 'https://gesgov.pt/servicos', 'Consultoria jurídica especializada para autarquias locais.', NULL, NULL, NULL),
('Gestão de Inventário', 'Serviço GesGov', '966 234 640', 'geral@gesgov.pt', NULL, 'https://gesgov.pt/servicos', 'Implementação de processos para manter o inventário sempre atualizado, em conformidade com as exigências legais.', NULL, NULL, NULL),
('Contratação Pública (Código dos Contratos Públicos)', 'Serviço GesGov', '966 234 640', 'geral@gesgov.pt', NULL, 'https://gesgov.pt/servicos', 'Decreto-Lei n.º 18/2008.', NULL, NULL, NULL),
('SIADAP — Avaliação de Desempenho', 'Serviço GesGov', '966 234 640', 'geral@gesgov.pt', NULL, 'https://gesgov.pt/servicos', 'Apoio técnico e administrativo ao SIADAP, desde a elaboração do regulamento até às atas e fichas de avaliação.', NULL, NULL, NULL),
('Recursos Humanos', 'Serviço GesGov', '966 234 640', 'geral@gesgov.pt', NULL, 'https://gesgov.pt/servicos', 'Processamento salarial e elaboração dos mapas obrigatórios, mensais e anuais, exigidos às autarquias locais.', NULL, NULL, NULL);

-- ------------------------------------------------------------
-- 8. Notícias, eventos e parceiros (gerado a partir do gesgov.pt)
-- ------------------------------------------------------------
-- Notícias: gesgov.pt › Info, texto integral (sem a navegação, o botão
-- «Descarregar», os nomes de anexos e o bloco «Partilhar»). Datas do
-- próprio site. Imagem = a imagem de partilha (og:image) de cada notícia.
-- Eventos: gesgov.pt › Agenda. Horas: as do texto de cada evento
-- (as formações dizem «Das 09h30 às 17h00»; Montemor-o-Novo 09h30–19h00
-- no cabeçalho). Só o CAME tem coordenadas (as do convite).
-- Associações = autarquias parceiras (gesgov.pt › Parceiros), 50, com
-- o logótipo/brasão que o gesgov.pt mostra. Sem coordenadas.
INSERT INTO noticias (titulo, descricao, imagem, data, categoria) VALUES
('Conflitos de interesses: entrada em vigor do modelo oficial adiada para 2027', 'A Portaria n.º 345-B/2026/1, de 14 de agosto, altera a Portaria n.º 185/2024/1 e adia para 31 de julho de 2027 a entrada em vigor do modelo de declaração de inexistência de conflitos de interesses aplicável às entidades públicas abrangidas pelo Regime Geral da Prevenção da Corrupção (RGPC).\n\nNa prática, esta alteração não cria um novo modelo nem elimina os deveres de isenção, imparcialidade e prevenção de favorecimento. O seu efeito é adiar a aplicação obrigatória do modelo de declaração aprovado pela Portaria n.º 185/2024/1, concedendo mais tempo às entidades para prepararem procedimentos, sistemas internos e ações de sensibilização.\n\nQuem está abrangido?\n\nMembros dos órgãos de administração, dirigentes e trabalhadores das entidades públicas abrangidas pelo RGPC.\n\nEm que situações se aplica a declaração?\n\nO modelo previsto destina-se aos procedimentos em que estas pessoas intervenham nas seguintes áreas:\n\ncontratação pública;\n\nconcessão de subsídios, subvenções ou benefícios;\n\nlicenciamentos urbanísticos, ambientais, comerciais e industriais;\n\nprocedimentos sancionatórios.\n\nObrigações a reter\n\nAté à entrada em vigor do modelo, as entidades devem manter e reforçar as medidas internas de prevenção de conflitos de interesses, assegurando a isenção e a imparcialidade de quem participa em decisões ou procedimentos.\n\nQuando exista, ou seja previsível, uma situação suscetível de comprometer a imparcialidade, a pessoa interveniente deve comunicá-la ao superior hierárquico ou, na sua ausência, ao responsável pelo cumprimento normativo, nos termos aplicáveis.\n\nO adiamento deve ser aproveitado para rever circuitos de decisão, definir responsáveis, preparar modelos e registos internos, formar as equipas e garantir que os processos estarão prontos para cumprir o regime a partir de 31 de julho de 2027.\n\nA Portaria n.º 345-B/2026/1 entrou em vigor em 15 de agosto de 2026 e produz efeitos desde 14 de agosto de 2024.', 'noticia-conflitos-de-interesses-entrada-em-vigor-do-modelo-oficial-adiada-para-2027.jpg', '2026-08-14', 'Institucional'),
('GesGov Apoia as Festas de Casa Branca', 'A GesGov orgulha-se de ter apoiado as Festas Populares de Casa Branca, realizadas nos dias 14, 15 e 16 de agosto.\n\nEnquanto consultora dedicada às autarquias, acreditamos no potencial do interior, na proximidade às comunidades e na valorização das nossas raízes. É em Casa Branca que temos a nossa sede e é no concelho de Sousel, no CAME — Centro de Apoio ao Mundo Empresarial — que mantemos também o nosso escritório.\n\nApoiar estas festas foi, para nós, uma forma de celebrar a nossa terra, as suas tradições e todas as pessoas que a fazem crescer.\n\nDa nossa terra, para as autarquias de todo o país.', 'noticia-gesgov-apoia-as-festas-de-casa-branca.jpg', '2026-08-15', 'Eventos e Festividades'),
('Código dos Contratos Públicos vai mudar: o que sabemos até agora', 'O Governo aprovou, em Conselho de Ministros, uma proposta de revisão do Código dos Contratos Públicos (CCP) — a maior reforma das regras da contratação pública desde 2017. A proposta esteve em consulta pública entre 8 e 21 de maio de 2026 e promete alterar de forma significativa a forma como municípios e freguesias contratam bens, serviços e empreitadas. Aguarda-se agora a publicação da versão final em Diário da República para que o novo regime entre em vigor.\n\nAinda antes dessa publicação, já é possível identificar as principais linhas da reforma:\n\n• Limiares mais altos para ajuste direto e consulta prévia — no ajuste direto, o limite para bens e serviços sobe de 20.000 € para 75.000 €, e para empreitadas sobe de 30.000 € para 150.000 € (mais do quíntuplo). Na consulta prévia, o limite para bens e serviços passa de 75.000 € para 130.000 €, e para empreitadas sobe de 150.000 € para 1.000.000 €. Na prática, muitas freguesias vão poder recorrer a procedimentos mais simples e rápidos num número bastante maior de contratações.\n\n• Princípio do "só uma vez" — as entidades e os operadores económicos deixam de ter de voltar a entregar documentos que já estejam na posse da Administração Pública, reduzindo a burocracia (o Governo estima uma poupança de mais de 3 milhões de documentos por ano).\n\n• Critérios de adjudicação mais amplos — além do preço, ganham peso critérios como a qualidade, a inovação e a sustentabilidade das propostas.\n\n• Digitalização e Inteligência Artificial — os procedimentos passam a poder integrar ferramentas digitais e de IA de apoio à análise e tramitação, mantendo garantias de transparência nas decisões.\n\n• "Iniciativa espontânea" — uma nova figura que permite a empresas e entidades apresentar à Administração soluções para necessidades públicas, ainda antes de existir um procedimento formal.\n\n• Revisão de preços obrigatória — passa a ser exigida em contratos de longa duração (superiores a três anos), para acautelar desequilíbrios financeiros supervenientes.\n\n• Reforço da resolução alternativa de litígios — com o objetivo de desbloquear processos com maior rapidez e menor custo.\n\nPara as freguesias, esta reforma representa uma oportunidade real de simplificar processos de contratação — mas exige também uma preparação atempada das equipas responsáveis, para que as novas regras sejam aplicadas com segurança desde o primeiro dia.\n\nSessões de esclarecimento GesGov\n\nPara apoiar os seus clientes e parceiros na compreensão e preparação para estas alterações, a GesGov irá realizar sessões de esclarecimento dedicadas às Alterações ao Código dos Contratos Públicos.\n\nConsulte a proposta\n\nO texto da proposta pode ser consultado na página oficial da consulta pública, em consultalex.gov.pt (ver também o comunicado do Portal BASE).\n\nSessões de esclarecimento GesGov\n\n- Comunicado do Conselho de Ministros de 16 de abril de 2026 (aprovação na generalidade) — portugal.gov.pt\n\n- Comunicado do Conselho de Ministros de 25 de junho de 2026 (Decreto-Lei aprovado) — portugal.gov.pt\n\n- Consulta Pública "Alteração do Código dos Contratos Públicos" (8–21 mai. 2026) — base.gov.pt e consultalex.gov.pt', 'noticia-reforma-do-codigo-dos-contratos-publicos.jpg', '2026-08-28', 'Institucional'),
('Nova Newsletter GesGov: mais perto das Freguesias', 'A GesGov lança uma nova newsletter dedicada às freguesias — mais uma ferramenta pensada para aproximar a GesGov dos seus clientes e parceiros, mantendo-os informados, organizados e preparados para o dia a dia da gestão autárquica.\n\nSabemos que o quotidiano de uma freguesia é feito de prazos, novidades legislativas e desafios que exigem resposta rápida. Foi a pensar nisso que criámos uma newsletter simples e direta, com informação relevante entregue diretamente na caixa de correio dos nossos clientes e potenciais clientes.\n\nO que vai encontrar na newsletter GesGov\n\n• Notícias — acompanhamento das principais novidades legislativas e institucionais com impacto direto na atividade das freguesias (por exemplo, alterações ao Código dos Contratos Públicos, ao RGPD ou à contabilidade pública), explicadas em linguagem clara e acessível.\n\n• Eventos — informação sobre sessões de esclarecimento, webinars e formações organizadas pela GesGov e por outras entidades relevantes para o setor autárquico, para que nunca perca uma oportunidade de se atualizar.\n\n• Agenda de Obrigações Legais — um calendário prático com os principais prazos recorrentes que as freguesias têm de cumprir — como submissões à CGA, Segurança Social, Finanças, DGAL ou Tribunal de Contas — para que nenhuma data importante passe despercebida.\n\nCom esta newsletter, a GesGov reforça o seu compromisso de ser um parceiro próximo e atento às necessidades reais das freguesias, simplificando o acesso à informação que faz a diferença na gestão autárquica do dia a dia.\n\nSubscreva já\n\nA newsletter GesGov está disponível para clientes e potenciais clientes. Subscreva e comece a receber notícias, eventos e a agenda de obrigações legais diretamente no seu email.', 'noticia-nova-newsletter-gesgov-mais-perto-das-freguesias.jpg', '2026-09-01', 'Institucional'),
('Setembro é mês de Assembleia de Freguesia Ordinária', 'Setembro é um dos meses em que se realiza, na generalidade das freguesias, uma sessão ordinária da Assembleia de Freguesia. Nos termos do artigo 9.º da Lei n.º 75/2013, de 12 de setembro (Regime Jurídico das Autarquias Locais), a Assembleia de Freguesia reúne várias vezes por ano em sessão ordinária, sendo esta uma das sessões-chave do calendário autárquico — momento em que se presta contas da atividade e situação financeira da freguesia e se decidem assuntos estruturantes para o mandato.\n\nA GesGov deixa aqui um alerta e um resumo dos pontos que, com maior frequência, integram a ordem de trabalhos destas sessões, para que juntas e assembleias de freguesia possam preparar a documentação com a devida antecedência.\n\nPontos mais comuns na ordem de trabalhos\n\n• Situação financeira e atividade da junta — apreciação da informação escrita do presidente da junta sobre a atividade e a situação financeira da freguesia, obrigatória em cada sessão ordinária (art. 9.º, n.º 2, alínea e) da Lei n.º 75/2013), devendo ser remetida aos membros da assembleia com, pelo menos, cinco dias de antecedência.\n\n• Revisões orçamentais — apreciação e votação de alterações às Grandes Opções do Plano e ao Orçamento da freguesia (art. 9.º, n.º 1, alínea a)).\n\n• Propostas de regulamentos — aprovação ou alteração de regulamentos externos da freguesia, como regulamentos de tarifas e taxas, de cemitérios ou de utilização de equipamentos e espaços públicos (art. 9.º, n.º 1, alínea f)).\n\n• Contratos de delegação de competências — autorização para a celebração, revisão ou cessação de contratos de delegação de competências e acordos de execução com a câmara municipal (art. 9.º, n.º 1, alínea g)).\n\n• Protocolos e acordos de colaboração — autorização para a celebração de protocolos com associações, IPSS, escolas ou outras entidades públicas e privadas que desenvolvam atividade na freguesia (art. 9.º, n.º 1, alíneas h), i) e j)).\n\nA composição concreta da ordem de trabalhos varia de freguesia para freguesia, consoante os assuntos pendentes em cada momento — a lista acima reúne os pontos que, na prática, surgem com maior regularidade nas convocatórias de sessões ordinárias consultadas pela GesGov.\n\nComo preparar a sessão\n\nRecomenda-se que a junta de freguesia reúna com antecedência toda a documentação de suporte (informação financeira, propostas de regulamento, minutas de contratos e protocolos), publicite atempadamente o edital e a convocatória e disponibilize os documentos aos membros da assembleia dentro dos prazos legais, de forma a permitir uma discussão informada em sessão.', 'noticia-setembro-e-mes-de-assembleia-de-freguesia-ordinaria.jpg', '2026-09-01', 'Institucional'),
('Inauguração Escritório GesGov', 'A GesGov inicia uma nova etapa em Sousel!\n\nOntem foi um dia muito especial para toda a equipa GesGov: inaugurámos oficialmente o nosso novo escritório no CAME – Centro de Apoio às Microempresas, em Sousel.\n\nMais do que a abertura de um novo espaço, este momento representa a concretização de um projeto e, sobretudo, o reforço de um compromisso: estar cada vez mais próximos das autarquias, dos seus eleitos, trabalhadores e territórios.\n\nTivemos a honra de contar com a presença do Presidente do Município de Sousel, Eng.º Manuel Valério, bem como de autarcas da Junta de Freguesia de Casa Branca, Junta de Freguesia de Cano, Junta de Freguesia de Sousel, Junta de Freguesia de Fronteira, Freguesia Nª Srª Expectação Campo Maior, Freguesia São João Baptista, Junta de Freguesia de Vila Boim, Freguesia Avis, Freguesia de Ervedal, União das Freguesias de Benavila e Valongo e Freguesia de Rio de Moinhos - Borba.\n\nA todos os que estiveram connosco, e também aos muitos clientes, parceiros e amigos que nos fizeram chegar mensagens de felicitações e incentivo, deixamos o nosso sincero agradecimento. A vossa presença e as vossas palavras tornaram este momento ainda mais especial.\n\nFoi também a oportunidade de apresentarmos a equipa multidisciplinar que dá corpo a este projeto:\n\n• Pedro Prates — Gestor Autárquico\n\n• João Pinto — Técnico Oficial de Contas\n\n• Daniela Pegacho — Jurista\n\n• Carlos Baptista — Consultor Informático\n\n• Filipe Dordio — Engenheiro Informático\n\n• João Pereira — Marketing Digital e 3D\n\nÁreas diferentes, conhecimento especializado e um propósito comum.\n\nEsta é a equipa que estará sempre ao lado das autarquias, disponível para acrescentar e partilhar conhecimento, compreender desafios e encontrar soluções eficientes, eficazes e especializadas.\n\nAbrimos uma nova porta em Sousel, mas queremos, acima de tudo, abrir novas oportunidades de colaboração, proximidade e partilha com o Poder Local.\n\nObrigado a todos os que fizeram parte deste primeiro dia.\n\nContinuamos juntos. Continuamos próximos. Continuamos a construir a GesGov.', 'noticia-inauguracao-escritorio-gesgov.jpg', '2026-09-07', 'Institucional'),
('GesGov inaugura novo escritório no CAME, em Sousel', 'A GesGov – Soluções Integradas para Autarquias inaugurou, no passado dia 7 de setembro, o seu novo escritório no CAME – Centro de Apoio às Microempresas, em Sousel, assinalando uma nova etapa no crescimento e consolidação da empresa.\n\nA inauguração contou com a presença do Presidente da Câmara Municipal de Sousel, Eng.º Manuel Valério, bem como de clientes, parceiros, colaboradores, amigos e convidados da GesGov, que se associaram a este momento particularmente importante para toda a equipa.\n\nAtualmente, a GesGov presta serviços de consultoria e apoio especializado a autarquias em diversas áreas da gestão pública local, designadamente contabilidade e gestão financeira, contratação pública, recursos humanos, SIADAP, RGPD, procedimentos concursais, consultoria jurídica e soluções de apoio administrativo e digital.\n\nO escritório de Sousel conta já com uma equipa de cerca de seis colaboradores, reunindo diferentes áreas de especialização e permitindo reforçar a capacidade de resposta e o acompanhamento próximo dos nossos clientes.\n\nA escolha do CAME para esta nova etapa permite igualmente à GesGov integrar um espaço vocacionado para o desenvolvimento da atividade empresarial, contribuindo simultaneamente para a criação de emprego qualificado e para a dinamização económica local.\n\nPara Pedro Prates, Diretor Executivo da GesGov, esta inauguração representa mais do que a abertura de um novo espaço físico:\n\n“É um passo importante no crescimento da GesGov, mas sobretudo um compromisso renovado com os nossos clientes. Queremos continuar a crescer com uma equipa especializada, disponível e próxima das Autarquias, contribuindo diariamente para uma gestão pública local mais eficiente.”\n\nA GesGov agradece, de forma especial, ao Exmo. Senhor Presidente da Câmara Municipal de Sousel, Eng.º Manuel Valério, a presença na inauguração e as palavras dirigidas à nossa equipa, bem como ao Município de Sousel pelo acolhimento e apoio nesta nova etapa.\n\nO nosso agradecimento estende-se igualmente a todos os clientes, parceiros, amigos e convidados que estiveram presentes e que tornaram este momento ainda mais especial.\n\nCrescemos, reforçamos a equipa e aumentamos a nossa capacidade de resposta, mantendo aquilo que está na origem da GesGov: estar próximos das Autarquias e das pessoas que todos os dias trabalham ao serviço das suas comunidades.\n\nA todos, o nosso muito obrigado por fazerem parte deste caminho.\n\nGesGov – Soluções Integradas para Autarquias', 'noticia-gesgov-inaugura-novo-escritorio-no-came-em-sousel.jpg', '2026-09-10', 'Institucional'),
('Alteração à Lei dos Compromissos e Pagamentos em Atraso', 'Foi publicado o Decreto-Lei n.º 180/2026, de 9 de setembro, que altera o Decreto-Lei n.º 127/2012 e atualiza as regras de aplicação da Lei dos Compromissos e dos Pagamentos em Atraso (LCPA).\n\nO que muda?\n\nEntre as principais alterações destacamos:\n\n🔹 Pagamentos em atraso – passam a ser consideradas em atraso as contas que permaneçam por pagar para além dos prazos legais de 30 ou 60 dias;\n\n🔹 Fundos disponíveis – são atualizadas as regras para o seu apuramento, considerando fatores como a receita disponível, execução orçamental e cumprimento das metas;\n\n🔹 Receita efetiva própria – são introduzidos ajustamentos à forma como a previsão da receita é considerada no cálculo dos fundos disponíveis;\n\n🔹 Juros de mora – terminado o prazo legal de pagamento, o credor passa a ter expressamente reconhecido o direito aos juros de mora legais, sem necessidade de interpelação.\n\nO novo regime encontra-se em vigor desde 10 de setembro de 2026.\n\nPara as Autarquias Locais, estas alterações reforçam a necessidade de um acompanhamento rigoroso dos compromissos, fundos disponíveis, execução financeira e prazos de pagamento.\n\nConsulte o Decreto-Lei n.º 180/2026, de 9 de setembro, e acompanhe no site da GesGov a informação detalhada sobre esta alteração legislativa.\n\nGesGov – Soluções Integradas para Autarquias\n\nAo lado das Autarquias, acompanhando a legislação e apoiando a sua aplicação prática.', 'noticia-alteracao-a-lei-dos-compromissos-e-pagamentos-em-atraso.jpg', '2026-09-14', 'Institucional'),
('GesGov reforça equipa multidisciplinar e amplia serviços especializados às Autarquias', 'Mais conhecimento. Mais especialização. Mais capacidade de resposta. Sempre próximos das Autarquias.\n\nA GesGov – Soluções Integradas para Autarquias reforçou a sua equipa multidisciplinar, reunindo profissionais de diferentes áreas de especialização com um objetivo comum: prestar às Autarquias Locais um serviço cada vez mais completo, próximo, especializado e orientado para a resolução dos seus desafios diários.\n\nEste reforço permite-nos aumentar a capacidade de resposta e consolidar um modelo de acompanhamento em que cada Autarquia pode contar com profissionais especializados nas diferentes áreas da gestão pública local.\n\nUma equipa multidisciplinar ao serviço das Autarquias\n\nPEDRO PRATES | CEO · GESTÃO AUTÁRQUICA\n\nLicenciado em Gestão Autárquica, desempenha funções junto das Autarquias Locais desde 2000.\n\nA sua experiência abrange áreas como informática, contabilidade, património, contratação pública, recursos humanos, SIADAP, licenciamentos e legislação autárquica.\n\nNa GesGov, assegura o acompanhamento presencial dos clientes, liderando particularmente as áreas de Contabilidade, Recursos Humanos e SIADAP.\n\nJOÃO PINTO | TÉCNICO OFICIAL DE CONTAS · ÁREA FINANCEIRA\n\nLicenciado em Gestão, Pós-Graduado em Contabilidade Pública – SNC-AP e Técnico Oficial de Contas, conta com 9 anos de experiência de trabalho com Autarquias, em empresas de contabilidade e de produção de software.\n\nÉ especializado na elaboração de relatórios financeiros, validação da situação financeira e preparação e submissão de mapas, assegurando na GesGov o acompanhamento personalizado dos clientes na área financeira das Freguesias.\n\nDANIELA PEGACHO | JURISTA · CONTRATAÇÃO PÚBLICA\n\nLicenciada em Direito e Mestre em Ciências Jurídico-Criminais, possui experiência em contratação pública, incluindo projetos de grande dimensão, tendo desempenhado funções na Comunidade Intermunicipal do Alto Alentejo e na Câmara Municipal de Sousel.\n\nEntre os projetos em que participou destaca-se a Barragem do Pisão, nomeadamente ao nível dos procedimentos de concursos públicos e pareceres jurídicos.\n\nNa GesGov, é responsável pelas áreas de Contratação Pública, Consultoria Jurídica, Regulamentos e Pareceres.\n\nCARLOS BAPTISTA | CONSULTORIA INFORMÁTICA · REDES E SISTEMAS\n\nCom formação especializada em informática, redes e sistemas e cerca de 40 anos de atividade profissional nas Tecnologias de Informação, possui uma vasta experiência em gestão de redes, sistemas, continuidade, segurança e organização tecnológica.\n\nNa GesGov, lidera a área de Consultoria Informática, apoiando as Autarquias na gestão, organização e segurança das suas infraestruturas tecnológicas.\n\nFILIPE DORDIO | ENGENHARIA INFORMÁTICA · PLATAFORMAS DIGITAIS\n\nLicenciado em Engenharia Informática – Engenharia de Software, desenvolve plataformas digitais simples, intuitivas e diferenciadoras, concebidas a partir das necessidades concretas dos seus utilizadores.\n\nNa GesGov, contribui para transformar a nossa ambição tecnológica em ferramentas digitais úteis, acessíveis e adaptadas à realidade das Autarquias.\n\nJOÃO PEREIRA | MARKETING DIGITAL · CONTEÚDOS\n\nLicenciado em Marketing Digital, desenvolve trabalho nas áreas de fotografia, vídeo, redes sociais, mailings, boletins de freguesia e visualização 3D.\n\nNa GesGov, trabalha a comunicação em articulação com as plataformas digitais, contribuindo para transformar informação institucional em conteúdos claros, próximos e consistentes, facilitando a comunicação das Autarquias com os seus cidadãos.\n\nSoluções integradas para a gestão autárquica\n\nCom esta equipa, a GesGov reforça a sua capacidade para disponibilizar um conjunto integrado de serviços especializados:\n\nContabilidade Pública · SNC-AP\n\nProcedimentos de Contratação Pública\n\nSIADAP\n\nProcessamento de Salários\n\nGestão e Registo de Inventário\n\nApoio Administrativo\n\nProcedimentos Concursais\n\nPlataformas Digitais\n\nRGPD\n\nConsultoria Jurídica\n\nConsultoria Informática\n\nFormação\n\nÁreas diferentes. Conhecimento especializado. Um propósito comum.\n\nEsta é a equipa que estará ao lado das Autarquias, disponível para acrescentar e partilhar conhecimento, compreender desafios e encontrar soluções eficientes, eficazes e especializadas.\n\nPorque acreditamos que uma Autarquia bem apoiada tem mais capacidade para se concentrar no que verdadeiramente importa: servir melhor a sua população.\n\nGesGov – Soluções Integradas para Autarquias\n\n🌐 www.gesgov.pt\n\nConhecimento especializado. Soluções integradas. Proximidade com as Autarquias.', 'noticia-gesgov-reforca-equipa-multidisciplinar-e-amplia-servicos-especializados-as-autarquias.jpg', '2026-09-21', 'Institucional');

INSERT INTO eventos (titulo, descricao, data_evento, data_fim, imagem, latitude, longitude, local, categoria) VALUES
('CGA – Validação', 'Caixa Geral de Aposentações deve ser feita pelas entidades empregadoras até ao dia 6 do mês seguinte àquele em que foi disponibilizada.\n\nPrazos e Obrigações da Relação Contributiva\n\nDisponibilização: A CGA disponibiliza a RC previsional no dia 12 de cada mês na área reservada da plataforma CGA Directa.\n\nPrazo limite: Até ao dia 6 do mês seguinte, a entidade deve verificar, alterar, validar e confirmar os dados.\n\nValidação prévia: A confirmação exige que a declaração não apresente erros.\n\nAuto-confirmação: Se a entidade não realizar nenhuma ação até ao dia 6, ocorre a auto-confirmação automática dos valores disponibilizados.', '2026-09-06 00:00:00', NULL, 'evento-cga-validacao.jpg', NULL, NULL, 'Online — CGA Directa', 'Institucional'),
('Convite: Inauguração do Escritório GesGov – CAME, Sousel', 'CONVITE\n\nInauguração do Escritório GesGov – CAME, Sousel\n\n7 de setembro | 18h00\n\nA GesGov tem a honra de convidar V. Ex.ª para a inauguração do seu novo escritório no CAME – Centro de Apoio às Microempresas, na Zona Industrial de Sousel, que terá lugar no próximo dia 7 de setembro, pelas 18h00.\n\nEste momento assinala uma nova etapa no percurso da GesGov e será também uma oportunidade para dar a conhecer a equipa GesGov, apresentar os serviços atualmente disponibilizados e partilhar a nossa visão e os projetos que estamos a preparar para o futuro, reforçando a proximidade e a colaboração com as Autarquias.\n\nApós a sessão de apresentação e inauguração do espaço, teremos o gosto de receber os nossos convidados para um jantar de convívio.\n\nPrograma\n\n18h00 – Receção dos convidados\n\n18h15 – Inauguração do escritório GesGov\n\n18h30 – Apresentação da equipa, serviços e projetos futuros\n\n19h30 – Jantar de convívio\n\nLocal: CAME – Centro de Apoio às Microempresas\n\nZona Industrial de Sousel, Lote 5, Edifício CAME\n\n7470-200 Sousel\n\nAgradecemos a confirmação de presença, de forma a podermos assegurar atempadamente a organização e logística do evento.\n\nSerá uma honra contar com a presença de V. Ex.ª neste momento especial para a GesGov.\n\nGesGov', '2026-09-07 18:00:00', NULL, 'evento-convite-inauguracao-do-escritorio-gesgov-came-sousel.jpg', '38.952806', '-7.684907', 'CAME – Centro de Apoio às Microempresas, Zona Industrial de Sousel, Lote 5, 7470-200 Sousel', 'Institucional'),
('Inauguração Escritório GesGov', 'A GesGov inicia uma nova etapa em Sousel!\n\nOntem foi um dia muito especial para toda a equipa GesGov: inaugurámos oficialmente o nosso novo escritório no CAME – Centro de Apoio às Microempresas, em Sousel.\n\nMais do que a abertura de um novo espaço, este momento representa a concretização de um projeto e, sobretudo, o reforço de um compromisso: estar cada vez mais próximos das autarquias, dos seus eleitos, trabalhadores e territórios.\n\nTivemos a honra de contar com a presença do Presidente do Município de Sousel, Eng.º Manuel Valério, bem como de autarcas da Junta de Freguesia de Casa Branca, Junta de Freguesia de Cano, Junta de Freguesia de Sousel, Junta de Freguesia de Fronteira, Freguesia Nª Srª Expectação Campo Maior, Freguesia São João Baptista, Junta de Freguesia de Vila Boim, Freguesia Avis, Freguesia de Ervedal, União das Freguesias de Benavila e Valongo e Freguesia de Rio de Moinhos - Borba.\n\nA todos os que estiveram connosco, e também aos muitos clientes, parceiros e amigos que nos fizeram chegar mensagens de felicitações e incentivo, deixamos o nosso sincero agradecimento. A vossa presença e as vossas palavras tornaram este momento ainda mais especial.\n\nFoi também a oportunidade de apresentarmos a equipa multidisciplinar que dá corpo a este projeto:\n\n• Pedro Prates — Gestor Autárquico\n\n• João Pinto — Técnico Oficial de Contas\n\n• Daniela Pegacho — Jurista\n\n• Carlos Baptista — Consultor Informático\n\n• Filipe Dordio — Engenheiro Informático\n\n• João Pereira — Marketing Digital e 3D\n\nÁreas diferentes, conhecimento especializado e um propósito comum.\n\nEsta é a equipa que estará sempre ao lado das autarquias, disponível para acrescentar e partilhar conhecimento, compreender desafios e encontrar soluções eficientes, eficazes e especializadas.\n\nAbrimos uma nova porta em Sousel, mas queremos, acima de tudo, abrir novas oportunidades de colaboração, proximidade e partilha com o Poder Local.\n\nObrigado a todos os que fizeram parte deste primeiro dia.\n\nContinuamos juntos. Continuamos próximos. Continuamos a construir a GesGov.', '2026-09-07 18:00:00', NULL, 'evento-inauguracao-escritorio-gesgov.jpg', '38.952806', '-7.684907', 'CAME – Centro de Apoio às Microempresas, Zona Industrial de Sousel, Lote 5, 7470-200 Sousel', 'Institucional'),
('Entrega ficheiros SISAL', 'SISAL (Sistema de Informação para o Subsetor da Administração Local) é a plataforma da Direção-Geral das Autarquias Locais (DGAL) usada para recolher e validar a informação orçamental e económico-financeira das entidades públicas locais.', '2026-09-10 00:00:00', NULL, 'evento-entrega-ficheiros-sisal.jpg', NULL, NULL, 'Online — SISAL (DGAL)', 'Institucional'),
('Plano de Formação GesGov - Montemor-o-Novo - Alterações ao CCP, LCPA e Procedimentos de Despesa Pública', 'A GesGov tem o prazer de convidar os órgãos executivos e os trabalhadores das autarquias, em particular os profissionais com responsabilidades nas áreas financeira, administrativa, contratação pública e aprovisionamento, a participar num conjunto de ações de formação gratuitas, dedicadas a temas de especial relevância para a gestão autárquica.\n\nAo longo de um dia de trabalho, serão apresentadas, analisadas e debatidas as principais matérias relacionadas com:\n\n* Alterações ao Código dos Contratos Públicos – principais novidades e implicações práticas para as autarquias;\n\n* Alterações à Lei dos Compromissos e dos Pagamentos em Atraso (LCPA) – enquadramento e impacto na gestão financeira;\n\n* Elaboração de uma proposta – aspetos essenciais a considerar na preparação e análise de propostas no âmbito da contratação pública;\n\n* Ciclo do processo de despesa – abordagem prática a todo o circuito, desde a identificação da necessidade e cabimentação até à contratação, compromisso, processamento e pagamento.\n\nPretende-se que estas sessões constituam não apenas um momento de atualização de conhecimentos, mas também um espaço de partilha de experiências, esclarecimento de dúvidas e debate de situações práticas com que os eleitos e técnicos das autarquias se deparam no exercício das suas funções.\n\nDATAS E LOCAIS\n\n14 de outubro | Montemor-o-Novo\n\nAuditório da Junta de Freguesia de Nossa Senhora da Vila\n\nLargo Dr. Banha de Andrade, Montemor-o-Novo\n\nHORÁRIO\n\nDas 09h30 às 17h00\n\nPARTICIPAÇÃO GRATUITA | INSCRIÇÃO OBRIGATÓRIA\n\nA participação é gratuita, mas está sujeita a inscrição prévia obrigatória, através do seguinte formulário\n\nAtendendo à capacidade dos auditórios, o número de participantes é limitado aos lugares disponíveis em cada sessão, pelo que recomendamos a realização da inscrição com a maior brevidade possível.\n\nOs eventos vão estar disponíveis na nossa agenda, com inscrição individual por evento.\n\nA inscrição será considerada válida após confirmação pela GesGov.\n\nEsperamos contar com a sua presença neste espaço de atualização, reflexão e partilha sobre matérias essenciais à gestão financeira e à contratação pública nas autarquias.\n\nCom os melhores cumprimentos,\n\nGesGov', '2026-10-14 09:30:00', '2026-10-14 19:00:00', 'evento-plano-de-formacao-gesgov-montemor-o-novo-alteracoes-ao-ccp-lcpa-e-procedimentos-de-despesa-publica.jpg', NULL, NULL, 'Auditório da Junta de Freguesia de Nossa Senhora da Vila, Largo Dr. Banha de Andrade, Montemor-o-Novo', 'Educação'),
('Plano de Formação GesGov - Sesimbra - Alterações ao CCP, LCPA e Procedimentos de Despesa Pública', 'A GesGov tem o prazer de convidar os órgãos executivos e os trabalhadores das autarquias, em particular os profissionais com responsabilidades nas áreas financeira, administrativa, contratação pública e aprovisionamento, a participar num conjunto de ações de formação gratuitas, dedicadas a temas de especial relevância para a gestão autárquica.\n\nAo longo de um dia de trabalho, serão apresentadas, analisadas e debatidas as principais matérias relacionadas com:\n\n* Alterações ao Código dos Contratos Públicos – principais novidades e implicações práticas para as autarquias;\n\n* Alterações à Lei dos Compromissos e dos Pagamentos em Atraso (LCPA) – enquadramento e impacto na gestão financeira;\n\n* Elaboração de uma proposta – aspetos essenciais a considerar na preparação e análise de propostas no âmbito da contratação pública;\n\n* Ciclo do processo de despesa – abordagem prática a todo o circuito, desde a identificação da necessidade e cabimentação até à contratação, compromisso, processamento e pagamento.\n\nPretende-se que estas sessões constituam não apenas um momento de atualização de conhecimentos, mas também um espaço de partilha de experiências, esclarecimento de dúvidas e debate de situações práticas com que os eleitos e técnicos das autarquias se deparam no exercício das suas funções.\n\nDATAS E LOCAIS\n\n21 de outubro | Sampaio – Sesimbra\n\nAuditório do Centro de Estudos Culturais e de Ação Social Raio de Luz\n\nAvenida D. Manuel da Silva Martins, n.º 8, Sampaio, 2970-585 Sesimbra\n\nHORÁRIO\n\nDas 09h30 às 17h00\n\nPARTICIPAÇÃO GRATUITA | INSCRIÇÃO OBRIGATÓRIA\n\nA participação é gratuita, mas está sujeita a inscrição prévia obrigatória, através do seguinte formulário\n\nAtendendo à capacidade dos auditórios, o número de participantes é limitado aos lugares disponíveis em cada sessão, pelo que recomendamos a realização da inscrição com a maior brevidade possível.\n\nOs eventos vão estar disponíveis na nossa agenda, com inscrição individual por evento.\n\nA inscrição será considerada válida após confirmação pela GesGov.\n\nEsperamos contar com a sua presença neste espaço de atualização, reflexão e partilha sobre matérias essenciais à gestão financeira e à contratação pública nas autarquias.\n\nCom os melhores cumprimentos,\n\nGesGov', '2026-10-21 09:30:00', '2026-10-21 17:00:00', 'evento-plano-de-formacao-gesgov-sesimbra-alteracoes-ao-ccp-lcpa-e-procedimentos-de-despesa-publica.jpg', NULL, NULL, 'Auditório do Centro Raio de Luz, Av. D. Manuel da Silva Martins, n.º 8, Sampaio, 2970-585 Sesimbra', 'Educação'),
('Plano de Formação GesGov - Samora Correia - Alterações ao CCP, LCPA e Procedimentos de Despesa Pública', 'A GesGov tem o prazer de convidar os órgãos executivos e os trabalhadores das autarquias, em particular os profissionais com responsabilidades nas áreas financeira, administrativa, contratação pública e aprovisionamento, a participar num conjunto de ações de formação gratuitas, dedicadas a temas de especial relevância para a gestão autárquica.\n\nAo longo de um dia de trabalho, serão apresentadas, analisadas e debatidas as principais matérias relacionadas com:\n\n* Alterações ao Código dos Contratos Públicos – principais novidades e implicações práticas para as autarquias;\n\n* Alterações à Lei dos Compromissos e dos Pagamentos em Atraso (LCPA) – enquadramento e impacto na gestão financeira;\n\n* Elaboração de uma proposta – aspetos essenciais a considerar na preparação e análise de propostas no âmbito da contratação pública;\n\n* Ciclo do processo de despesa – abordagem prática a todo o circuito, desde a identificação da necessidade e cabimentação até à contratação, compromisso, processamento e pagamento.\n\nPretende-se que estas sessões constituam não apenas um momento de atualização de conhecimentos, mas também um espaço de partilha de experiências, esclarecimento de dúvidas e debate de situações práticas com que os eleitos e técnicos das autarquias se deparam no exercício das suas funções.\n\nDATAS E LOCAIS\n\n28 de outubro | Samora Correia\n\nAuditório do Palácio do Infantado\n\nPraça da República, Samora Correia\n\nHORÁRIO\n\nDas 09h30 às 17h00\n\nPARTICIPAÇÃO GRATUITA | INSCRIÇÃO OBRIGATÓRIA\n\nA participação é gratuita, mas está sujeita a inscrição prévia obrigatória, através do seguinte formulário\n\nAtendendo à capacidade dos auditórios, o número de participantes é limitado aos lugares disponíveis em cada sessão, pelo que recomendamos a realização da inscrição com a maior brevidade possível.\n\nOs eventos vão estar disponíveis na nossa agenda, com inscrição individual por evento.\n\nA inscrição será considerada válida após confirmação pela GesGov.\n\nEsperamos contar com a sua presença neste espaço de atualização, reflexão e partilha sobre matérias essenciais à gestão financeira e à contratação pública nas autarquias.\n\nCom os melhores cumprimentos,\n\nGesGov', '2026-10-28 09:30:00', '2026-10-28 17:00:00', 'evento-plano-de-formacao-gesgov-samora-correia-alteracoes-ao-ccp-lcpa-e-procedimentos-de-despesa-publica.jpg', NULL, NULL, 'Auditório do Palácio do Infantado, Samora Correia', 'Educação'),
('Plano de Formação GesGov - Campo Maior - Alterações ao CCP, LCPA e Procedimentos de Despesa Pública', 'A GesGov tem o prazer de convidar os órgãos executivos e os trabalhadores das autarquias, em particular os profissionais com responsabilidades nas áreas financeira, administrativa, contratação pública e aprovisionamento, a participar num conjunto de ações de formação gratuitas, dedicadas a temas de especial relevância para a gestão autárquica.\n\nAo longo de um dia de trabalho, serão apresentadas, analisadas e debatidas as principais matérias relacionadas com:\n\n* Alterações ao Código dos Contratos Públicos – principais novidades e implicações práticas para as autarquias;\n\n* Alterações à Lei dos Compromissos e dos Pagamentos em Atraso (LCPA) – enquadramento e impacto na gestão financeira;\n\n* Elaboração de uma proposta – aspetos essenciais a considerar na preparação e análise de propostas no âmbito da contratação pública;\n\n* Ciclo do processo de despesa – abordagem prática a todo o circuito, desde a identificação da necessidade e cabimentação até à contratação, compromisso, processamento e pagamento.\n\nPretende-se que estas sessões constituam não apenas um momento de atualização de conhecimentos, mas também um espaço de partilha de experiências, esclarecimento de dúvidas e debate de situações práticas com que os eleitos e técnicos das autarquias se deparam no exercício das suas funções.\n\nDATAS E LOCAIS\n\n5 de novembro | Campo Maior\n\nAuditório do CIFA – Centro Interpretativo da Fortificação Abaluartada\n\nPraça Velha, 1A, 7370-117 Campo Maior\n\nHORÁRIO\n\nDas 09h30 às 17h00\n\nPARTICIPAÇÃO GRATUITA | INSCRIÇÃO OBRIGATÓRIA\n\nA participação é gratuita, mas está sujeita a inscrição prévia obrigatória, através do seguinte formulário\n\nAtendendo à capacidade dos auditórios, o número de participantes é limitado aos lugares disponíveis em cada sessão, pelo que recomendamos a realização da inscrição com a maior brevidade possível.\n\nOs eventos vão estar disponíveis na nossa agenda, com inscrição individual por evento.\n\nA inscrição será considerada válida após confirmação pela GesGov.\n\nEsperamos contar com a sua presença neste espaço de atualização, reflexão e partilha sobre matérias essenciais à gestão financeira e à contratação pública nas autarquias.\n\nCom os melhores cumprimentos,\n\nGesGov', '2026-11-05 09:30:00', '2026-11-05 17:00:00', 'evento-plano-de-formacao-gesgov-campo-maior-alteracoes-ao-ccp-lcpa-e-procedimentos-de-despesa-publica.jpg', NULL, NULL, 'Auditório do CIFA – Centro Interpretativo da Fortificação Abaluartada, Praça Velha, 1A, 7370-117 Campo Maior', 'Educação');

INSERT INTO associacoes (nome, descricao, imagem) VALUES
('Freguesia de Santiago do Cacém, Santa Cruz e São Bartolomeu da Serra', 'Autarquia parceira da GesGov.', 'parceiro-00.png'),
('JF Alcácer do Sal (Santiago)', 'Autarquia parceira da GesGov.', 'parceiro-01.png'),
('Junta de Freguesia de Aldeia Velha', 'Autarquia parceira da GesGov.', 'parceiro-02.png'),
('Junta de Freguesia de Amora', 'Autarquia parceira da GesGov.', 'parceiro-03.png'),
('Junta de Freguesia de Arraiolos', 'Autarquia parceira da GesGov.', 'parceiro-04.png'),
('Junta de Freguesia de Caia, São Pedro e Alcáçova', 'Autarquia parceira da GesGov.', 'parceiro-05.png'),
('Junta de Freguesia de Carvalhal', 'Autarquia parceira da GesGov.', 'parceiro-06.png'),
('Junta de Freguesia de Castelo', 'Autarquia parceira da GesGov.', 'parceiro-07.png'),
('Junta de Freguesia de Comporta', 'Autarquia parceira da GesGov.', 'parceiro-08.png'),
('Junta de Freguesia de Figueira e Barros', 'Autarquia parceira da GesGov.', 'parceiro-09.png'),
('Junta de Freguesia de Foros de Salvaterra', 'Autarquia parceira da GesGov.', 'parceiro-10.png'),
('Junta de Freguesia de Grândola', 'Autarquia parceira da GesGov.', 'parceiro-11.png'),
('Junta de Freguesia de Nossa Senhora da Expectação', 'Autarquia parceira da GesGov.', 'parceiro-12.png'),
('Junta de Freguesia de Nossa Senhora da Vila', 'Autarquia parceira da GesGov.', 'parceiro-13.png'),
('Junta de Freguesia de Nossa Senhora do Bispo', 'Autarquia parceira da GesGov.', 'parceiro-14.png'),
('Junta de Freguesia de Pavia', 'Autarquia parceira da GesGov.', 'parceiro-15.png'),
('Junta de Freguesia de Rio Moinhos - Borba', 'Autarquia parceira da GesGov.', 'parceiro-16.png'),
('Junta de Freguesia de Samora Correia', 'Autarquia parceira da GesGov.', 'parceiro-17.png'),
('Junta de Freguesia de Santa Maria de Marvão', 'Autarquia parceira da GesGov.', 'parceiro-18.png'),
('Junta de Freguesia de Santiago - Sesimbra', 'Autarquia parceira da GesGov.', 'parceiro-19.png'),
('Junta de Freguesia de Santiago do Escoural', 'Autarquia parceira da GesGov.', 'parceiro-20.png'),
('Junta de Freguesia de São Domingos', 'Autarquia parceira da GesGov.', 'parceiro-21.png'),
('Junta de Freguesia de São João Baptista', 'Autarquia parceira da GesGov.', 'parceiro-22.png'),
('Junta de Freguesia de São Vicente e Ventosa', 'Autarquia parceira da GesGov.', 'parceiro-23.png'),
('Junta de Freguesia de Silveiras', 'Autarquia parceira da GesGov.', 'parceiro-24.png'),
('Junta de Freguesia de Sines', 'Autarquia parceira da GesGov.', 'parceiro-25.png'),
('Junta de Freguesia de Vale de Água', 'Autarquia parceira da GesGov.', 'parceiro-26.png'),
('Junta de Freguesia de Vila Boim', 'Autarquia parceira da GesGov.', 'parceiro-27.png'),
('Junta de Freguesia do Ciborro', 'Autarquia parceira da GesGov.', 'parceiro-28.png'),
('Junta de Freguesia do Ervedal', 'Autarquia parceira da GesGov.', 'parceiro-29.png'),
('Junta de Freguesia do Seixal', 'Autarquia parceira da GesGov.', 'parceiro-30.png'),
('Junta Freguesia do Vimieiro', 'Autarquia parceira da GesGov.', 'parceiro-31.png'),
('União de Freguesias de Ameixial, Santa Vitória e São Bento de Estremoz', 'Autarquia parceira da GesGov.', 'parceiro-32.png'),
('União de Freguesias de Atalaia e Alto Estanqueiro', 'Autarquia parceira da GesGov.', 'parceiro-33.png'),
('União de Freguesias de Benavila e Valongo', 'Autarquia parceira da GesGov.', 'parceiro-34.png'),
('União de Freguesias de Figueiró dos Vinhos e Bairradas', 'Autarquia parceira da GesGov.', 'parceiro-35.png'),
('União de Freguesias de Montijo e Afonsoeiro', 'Autarquia parceira da GesGov.', 'parceiro-36.png'),
('Junta de Freguesia de Quinta do Conde', 'Autarquia parceira da GesGov.', 'parceiro-37.png'),
('Junta de Freguesia de Paio Pires', 'Autarquia parceira da GesGov.', 'parceiro-38.png'),
('Junta de Freguesia de Sarilhos Grandes', 'Autarquia parceira da GesGov.', 'parceiro-39.png'),
('Junta de Freguesia de Portimão', 'Autarquia parceira da GesGov.', 'parceiro-40.png'),
('Freguesia de Sousel', 'Autarquia parceira da GesGov.', 'parceiro-41.png'),
('Junta de Freguesia do Granho', 'Autarquia parceira da GesGov.', 'parceiro-42.png'),
('Junta de Freguesia de Terrugem', 'Autarquia parceira da GesGov.', 'parceiro-43.png'),
('Torrão — Alcácer do Sal', 'Autarquia parceira da GesGov.', 'parceiro-44.png'),
('Junta de Freguesia de Cano — Sousel', 'Autarquia parceira da GesGov.', 'parceiro-45.png'),
('Junta de Freguesia de Casa Branca — Sousel', 'Autarquia parceira da GesGov.', 'parceiro-46.png'),
('Junta de Freguesia de Cabeção', 'Autarquia parceira da GesGov.', 'parceiro-47.png'),
('Junta de Freguesia de Brotas', 'Autarquia parceira da GesGov.', 'parceiro-48.png'),
('Freguesia de Avis', 'Autarquia parceira da GesGov.', 'parceiro-49.png');

-- Álbum do evento da inauguração (fotos da própria notícia).
INSERT INTO galeria_albuns (nome, descricao, capa, origem, origem_id, ordem, ativo)
SELECT titulo, NULL, imagem, 'evento', id, 10, 1 FROM eventos WHERE titulo = 'Inauguração Escritório GesGov';
INSERT INTO galeria_imagens (album_id, ficheiro, titulo, ordem, ativo)
SELECT id, capa, 'A equipa GesGov', 1, 1 FROM galeria_albuns WHERE origem = 'evento';
INSERT INTO galeria_imagens (album_id, ficheiro, titulo, ordem, ativo)
SELECT id, 'noticia-gesgov-inaugura-novo-escritorio-no-came-em-sousel.jpg', 'Com o Presidente da Câmara Municipal de Sousel', 2, 1 FROM galeria_albuns WHERE origem = 'evento';

-- ------------------------------------------------------------
-- 9. Imagens de fundo dos separadores (uploads/separadores/)
-- ------------------------------------------------------------
-- As três imagens de separador do gesgov.pt.
INSERT INTO separadores_fundo (chave, imagem) VALUES
('freguesia', 'sep-equipa.jpg'),
('historia', 'sep-equipa.jpg'),
('heraldica', 'sep-parceiros.jpg'),
('pontos', 'sep-equipa.jpg'),
('galeria', 'sep-equipa.jpg'),
('noticias', 'sep-noticias.jpg'),
('eventos', 'sep-noticias.jpg'),
('contactos', 'sep-parceiros.jpg'),
('executivo', 'sep-equipa.jpg'),
('associacoes', 'sep-parceiros.jpg');

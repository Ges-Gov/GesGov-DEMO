# CLAUDE.md — GesGov Demo

> **Lê primeiro o `c:\laragon\www\CLAUDE.md`** (há uma cópia neste repositório em `CLAUDE_GERAL.md`).
> Este ficheiro tem só o que é **específico deste site**.

## O que é

Site de **demonstração** da GesGov para mostrar às Juntas de Freguesia: o mesmo CORE (e o mesmo
backoffice) dos sites das freguesias, mas com a marca e o conteúdo **reais da própria GesGov**.
Substitui o antigo demo em `granho.185.205.244.198.nip.io`.

| | |
|---|---|
| **Domínio previsto** | `demo.gesgov.pt` (subdomínio; o gesgov.pt continua no OVH) |
| **BD local** | `gesgovdemo` |
| **Fonte do conteúdo** | gesgov.pt (recolhido a 30/09/2026) |
| **Prefixo de denúncias/pedidos** | `DEMO-` |
| **Cor principal** | `#01478E` (azul do modelo antigo) |
| **Cor secundária** | `#A2A1A0` (cinzento do modelo antigo — barra de topo e botões, com texto escuro) |
| **Iniciais do logótipo** | GG |
| **Logótipo** | `assets/img/logo-gesgov.png` (o do modelo antigo, recortado sem a marca de água do canto) |
| **Favicon** | `assets/img/favicon-gesgov.png` (o «G» do gesgov.pt) |

## Como foi criado (30/09/2026, sessão cloud)

1. Código copiado da **`atalaia`** com `git archive`, todo o conteúdo da Atalaia apagado. Sweep:
   "Atalaia e Alto Estanqueiro-Jardia" → "GesGov Demo" / "Freguesia Demo", `AAEJ-` → `DEMO-`,
   "concelho do Montijo" → "concelho de Sousel". Textos de fallback de `freguesia.php`,
   `admin/freguesia.php`, `admin/homepage.php`, `heraldica.php` e `historia.php` reescritos.
2. BD `gesgovdemo` = dump da Atalaia + `deploy/gesgovdemo_conteudo.sql`. **Lê esse ficheiro: tem o
   mapeamento e as fontes em comentário.**
3. `assets/geo/freguesia.geojson` = **concelho de Sousel** (relação OSM 5397427). Contém a sede
   (Casa Branca) e o escritório (CAME, Sousel) — testado ponto-no-polígono.

## Mapeamento (site de freguesia → GesGov)

| Página | Conteúdo |
|---|---|
| Executivo | A equipa (6), com fotos, funções e biografias de gesgov.pt › A Nossa Equipa |
| Mensagem do presidente | Diretor Executivo (texto de gesgov.pt › Diretor Executivo + citação da inauguração) |
| A Freguesia / História | Sobre Nós (quem somos, missão, visão, valores, porque apoio externo) + cronologia |
| Heráldica | Identidade GesGov: logótipo, cores, a linha em Braille, missão e valores |
| Notícias (9) | gesgov.pt › Info, texto integral, datas e imagens do site |
| Eventos (8) | gesgov.pt › Agenda (CGA, SISAL, inauguração do CAME, 4 formações CCP/LCPA) |
| Associações (50) | Autarquias parceiras, com o brasão/logótipo que o gesgov.pt mostra |
| Comércio local (9) | Os serviços GesGov (gesgov.pt › Serviços) |
| Pontos de interesse (2) | Escritório CAME (coordenadas do convite) e sede em Casa Branca (rua geocodificada) |
| Contactos úteis | Sede, escritório e os 6 Links Úteis do gesgov.pt |
| Assembleia, Documentos | Vazios — sem equivalente numa empresa |
| FAQs | As de uma Junta, sem nome de freguesia (é o que o site demonstra) |

## Alterações ao CORE (só aqui, por agora)

- **Dourado fixo → variáveis do tema.** O CORE tinha `#D4AA00`, `#F0D060` e `rgba(212,170,0,…)`
  escritos à mão em ~60 ficheiros (herança do Granho), o que deixava kickers e números dourados
  mesmo com outras cores na BD. Trocados por `var(--tema-acento, #D4AA00)`,
  `var(--tema-kicker-img-texto, #F0D060)` e `color-mix(... var(--tema-acento) ...)`. Os
  **fallbacks são os valores antigos**, por isso noutros sites nada muda — pode ser propagado.
  Excluído `admin/relatorio-pdf.php` (o dompdf não suporta variáveis CSS).
- `admin/login.php` passa a imprimir `temaVariaveisCss()` no `:root` (antes não tinha as
  variáveis do tema; o botão ficava sempre dourado).
- Bug conhecido do CORE mantido: `index.php:1283` `Undefined array key "imagem"` (ver Caia).

## Por fazer

- Registar o subdomínio e fazer o deploy (ver `deploy/LEIA-ME.md`).
- Documentos e assembleia de exemplo, se se quiser mostrar essas páginas preenchidas.

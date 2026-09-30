# Deploy — GesGov Demo (`demo.gesgov.pt`)

Pacote para a **primeira instalação** do site de demonstração no servidor (VPS Contabo
`185.205.244.198`, FastPanel). O `gesgov.pt` continua no OVH — só se acrescenta um registo DNS.

| Ficheiro | O que é |
|---|---|
| `gesgovdemo_deploy.zip` | O site completo: código, `vendor/`, `dompdf/`, imagens e uploads. **Sem** credenciais (`db_config.php`, `mail_config.php`, `ia_config.php`) e sem ficheiros de desenvolvimento (`.md`, `debug-config.php`). |
| `gesgovdemo_migracoes.sql` | A base de dados completa (esquema + migrações 001–032 + conteúdo da GesGov). Para importar numa **BD vazia**. |
| `gesgovdemo.sql` | O mesmo dump, sem o cabeçalho de aviso. É o que se importa no Laragon. |
| `gesgovdemo_conteudo.sql` | Só para referência: o script que gerou o conteúdo. **Não importar no servidor.** |

## Passos

### 1. DNS (OVH)

OVH → Web Cloud → Domínios → `gesgov.pt` → **Zona DNS** → Adicionar entrada:
- Tipo **A**, subdomínio `demo`, destino `185.205.244.198`.

Não mexer nos registos do `gesgov.pt` (site e email). A propagação costuma levar minutos a poucas horas.

### 2. Site no FastPanel

- Novo site `demo.gesgov.pt`, PHP 8.3.
- Criar a base de dados **`gesgovdemo`** (utf8mb4) com um utilizador próprio.
- Depois de o DNS propagar: certificado SSL Let's Encrypt para `demo.gesgov.pt`.

### 3. Base de dados

1. phpMyAdmin → **seleciona a BD `gesgovdemo`** e confirma que é esse o nome no topo.
2. Importar → `gesgovdemo_migracoes.sql` → Executar. Deve ficar com 82 tabelas.

⚠️ O SQL começa cada tabela com `DROP TABLE IF EXISTS`. **Nunca o importes na BD de outro site**
(é a armadilha do jf-granho.pt: corre sem erro nenhum e parte o site).

### 4. Código

1. File Manager → raiz do site → carregar `gesgovdemo_deploy.zip` → **Extract**.
2. Criar à mão as credenciais (nunca vão no ZIP):

`includes/db_config.php`
```php
<?php
return ['host' => 'localhost', 'db' => 'gesgovdemo', 'user' => '<utilizador_da_bd>', 'pass' => '<password>'];
```

`includes/mail_config.php`
```php
<?php
return ['pass' => '<app password do email>'];
```
Sem o `mail_config.php` as páginas de pedidos e requerimentos dão **HTTP 500**. Com `'pass' => ''`
o site funciona, só não envia emails.

### 5. Permissões

Pastas a **755**, ficheiros a **644**, dono = utilizador do site (não `root`):
```bash
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
```

### 6. Verificar

- Início, Executivo (equipa), História, Heráldica (identidade), Notícias, Eventos, Associações
  (parceiros), Comércio (serviços), Mapa, Contactos.
- Backoffice em `/admin/`, com o utilizador `admin` (o mesmo dos outros sites; veio do modelo).
- **Mudar a password do `admin`** antes de mostrar o backoffice a clientes.

## Alternativa: git

`git clone git@github.com:Ges-Gov/gesgov-demo.git` na pasta do site, criar as credenciais (passo 4)
e importar o SQL (passo 3) na mesma.

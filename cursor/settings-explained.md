# Configurações do Editor (Cursor e VS Code)

Explicação de cada configuração do `settings.json`. As mesmas opções funcionam em **Cursor**.

---

## Editor

### `editor.fontFamily`
**Valor:** `"JetBrains Mono"`

Define a fonte usada no editor. JetBrains Mono é uma fonte monoespaçada com bom suporte a ligaduras.

**Alternativas:** `Consolas`, `Fira Code`, `Cascadia Code`, `Source Code Pro`

---

### `editor.fontLigatures`
**Valor:** `true`

Ativa ligaduras tipográficas (combinações de caracteres como `=>`, `!=` renderizadas como um único glifo). Só funciona com fontes que suportam ligaduras (ex.: JetBrains Mono, Fira Code).

---

### `editor.minimap.enabled`
**Valor:** `false`

Mostra ou oculta o minimapa (visão em miniatura do código à direita). Desativado para interface mais limpa.

---

### `editor.breadcrumbs.enabled`
**Valor:** `false`

Mostra ou oculta o breadcrumb (caminho do arquivo/símbolo acima do editor). Desativado para interface minimalista.

---

### `editor.renderLineHighlight`
**Valor:** `"line"`

Destaca a linha onde o cursor está:
- `"none"` — nenhum destaque
- `"line"` — destaca a linha inteira
- `"all"` — destaca linha e borda

---

### `editor.scrollbar.vertical`
**Valor:** `"auto"`

Comportamento da barra de rolagem vertical:
- `"auto"` — aparece quando necessário
- `"hidden"` — sempre oculta
- `"visible"` — sempre visível

---

### `editor.scrollbar.horizontal`
**Valor:** `"auto"`

Comportamento da barra de rolagem horizontal (mesmas opções acima).

---

### `editor.scrollbar.verticalScrollbarSize`
**Valor:** `8`

Largura da barra de rolagem vertical em pixels.

---

### `editor.scrollbar.horizontalScrollbarSize`
**Valor:** `8`

Altura da barra de rolagem horizontal em pixels.

---

### `editor.overviewRulerBorder`
**Valor:** `false`

Remove a borda do ruler (barra à direita que mostra anotações como erros, breakpoints).

---

### `editor.hideCursorInOverviewRuler`
**Valor:** `true`

Esconde o indicador do cursor no overview ruler. Útil quando o minimapa está desativado.

---

## Workbench (Interface)

### `workbench.tree.renderIndentGuides`
**Valor:** `"none"`

Mostra ou oculta as guias de indentação na árvore de arquivos (Explorer):
- `"none"` — sem guias
- `"onHover"` — mostra ao passar o mouse
- `"always"` — sempre visíveis

---

### `workbench.list.rowHeight`
**Valor:** `30`

Altura de cada item nas listas (Explorer, busca etc.) em pixels.

---

### `workbench.activityBar.location`
**Valor:** `"hidden"`

Posição da barra de atividade (ícones à esquerda):
- `"side"` — lateral (padrão)
- `"hidden"` — oculta

---

### `workbench.statusBar.visible`
**Valor:** `true`

Mostra ou oculta a barra de status na parte inferior.

---

### `workbench.iconTheme`
**Valor:** `"symbols"`

Tema de ícones do Explorer. `"symbols"` é um tema minimalista. Outros: `"vs-seti"`, `"material-icon-theme"`.

---

### `workbench.colorTheme`
**Valor:** `"Bearded Theme Vivid Black"`

Tema de cores do editor. Requer extensão instalada.

---

## Janela

### `window.menuBarVisibility`
**Valor:** `"toggle"`

Comportamento da barra de menu:
- `"classic"` — sempre visível
- `"visible"` — sempre visível
- `"toggle"` — oculta; aparece ao pressionar Alt
- `"hidden"` — oculta

---

## Arquivos

### `files.autoSave`
**Valor:** `"afterDelay"`

Salva arquivos automaticamente:
- `"off"` — desativado
- `"afterDelay"` — salva após um tempo sem edição
- `"onFocusChange"` — salva ao trocar de aba/arquivo
- `"onWindowChange"` — salva ao trocar de janela

---

## GitHub Issues

### `githubIssues.queries`
**Valor:** Array de queries

Define queries padrão no painel de GitHub Issues:
- **My Issues** — issues atribuídas a você
- **Created Issues** — issues que você criou
- **Recent Issues** — issues recentes do repositório

Usa variáveis como `${user}`, `${owner}`, `${repository}`.

---

## Extensões

### `symbols.hidesExplorerArrows`
**Valor:** `false`

(Extensão Symbols) Mostra ou oculta setas nas pastas no Explorer.

---

### `redhat.telemetry.enabled`
**Valor:** `true`

(Extensões Red Hat, ex.: Java) Habilita ou desabilita telemetria.

---

### `git.autofetch`
**Valor:** `true`

Faz fetch automático do repositório remoto para manter as referências atualizadas.

---

## Como aplicar

```powershell
# Cursor
.\install.ps1

# VS Code - copiar manualmente ou ajustar o script
Copy-Item "vscode\settings.json" "$env:APPDATA\Code\User\settings.json"
```

# Minhas Configurações

Repositório com minhas configurações de editor de código (Cursor/VS Code).

## Estrutura

```
Config/
├── .gitignore
├── README.md
├── update.ps1                    # Aplica todas as configs
├── install.ps1                   # Aplica configs do Cursor
├── install-windows-shortcuts.ps1  # Cria atalhos do Windows
├── uninstall-windows-shortcuts.ps1 # Remove atalhos do Windows
├── cursor/
│   ├── settings.json
│   ├── keybindings.json
│   └── commands-reference.json   # Referencia de comandos e funcionalidades
├── vscode/
│   ├── settings.json
│   └── commands-reference.json   # Referencia de comandos e funcionalidades
└── windows/
    ├── create-shortcuts.ps1
    ├── commands-reference.json  # Referencia dos atalhos do Windows
    ├── launch-cursor.ps1
    ├── launch-terminal.ps1
    └── launch-warp.ps1

settings-explained.md           # Explicacao de cada config do settings.json
```

## Atualizar tudo

Para aplicar todas as configurações de uma vez:

```powershell
.\update.ps1
```

## Atalhos do Windows

Execute para criar atalhos globais (Ctrl+Alt + tecla):

```powershell
.\install-windows-shortcuts.ps1
```

| Atalho | Ação |
|--------|------|
| `Ctrl+Alt+C` | Cursor (janela 1200×800) |
| `Ctrl+Alt+B` | Chrome — nova janela |
| `Ctrl+Alt+I` | Chrome — janela anônima |
| `Ctrl+Alt+T` | Windows Terminal (janela 700×450) |
| `Ctrl+Alt+W` | Warp (janela 700×450) |
| `Ctrl+Alt+V` | VS Code |
| `Ctrl+Alt+E` | Explorador de Arquivos |

Os atalhos ficam no Menu Iniciar em **Atalhos**. Os launchers são copiados para `%LOCALAPPDATA%\Config\launchers\`.

Para desativar/remover todos os atalhos:

```powershell
.\uninstall-windows-shortcuts.ps1
```

## Como aplicar

### Cursor (Windows — rápido)

Execute o script na pasta do repositório:

```powershell
.\install.ps1
```

### Cursor (manual)

**Linux/macOS:**
```bash
# settings
cp cursor/settings.json ~/.config/Cursor/User/profiles/-590a8329/settings.json

# keybindings
cp cursor/keybindings.json ~/.config/Cursor/User/profiles/-590a8329/keybindings.json
```

### VS Code

**Windows:**
```powershell
Copy-Item "vscode\settings.json" "$env:APPDATA\Code\User\settings.json"
```

**Linux/macOS:**
```bash
cp vscode/settings.json ~/.config/Code/User/settings.json
```

Para entender cada configuracao do `settings.json`, veja [settings-explained.md](settings-explained.md).

## Extensões recomendadas

- **Bearded Theme Vivid Black** — tema de cores
- **Symbols** — ícones do explorer
- **JetBrains Mono** — fonte (instalar manualmente no sistema)

## Atalhos personalizados

| Atalho | Ação |
|--------|------|
| `Ctrl+I` | Composer/Agent |
| `Ctrl+Alt+S` | Alternar sidebar (quando unificada) |

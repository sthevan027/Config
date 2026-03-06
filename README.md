# Minhas Configurações

Repositório com minhas configurações de editor de código (Cursor/VS Code).

## Estrutura

```
Config/
├── .gitignore
├── README.md
├── install.ps1           # Script para aplicar no Cursor (Windows)
├── cursor/
│   ├── settings.json
│   └── keybindings.json
└── vscode/
    └── settings.json

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

## Extensões recomendadas

- **Bearded Theme Vivid Black** — tema de cores
- **Symbols** — ícones do explorer
- **JetBrains Mono** — fonte (instalar manualmente no sistema)

## Atalhos personalizados

| Atalho | Ação |
|--------|------|
| `Ctrl+Alt+Z` | Zen Mode |
| `Ctrl+I` | Composer/Agent |
| `Ctrl+Alt+S` | Alternar sidebar (quando unificada) |

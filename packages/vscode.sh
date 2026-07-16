#!/usr/bin/env bash

set -euo pipefail

echo "==> Criando diretório para chaves..."
sudo mkdir -p /etc/apt/keyrings

echo "==> Downloading Microsoft key..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | sudo tee /etc/apt/keyrings/packages.microsoft.gpg >/dev/null

echo "==> Adding VS Code repo..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
    | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null

sudo apt update && apt install -y code

echo "==> Verificando instalação..."
code --version

echo
echo "Visual Studio Code Successfully instaled."

mkdir -p ~/.config/Code/User
cat > ~/.config/Code/User/settings.json <<'EOF'
{
    // ========== Coding Settings ==========
    "files.autoSave": "afterDelay",
    "explorer.confirmDelete": false,
    "typescript.updateImportsOnFileMove.enabled": "always",
    "workbench.editorAssociations": {
        "*.svg": "default"
    },
    "gitlens.ai.model": "gitkraken",
    "gitlens.ai.gitkraken.model": "gemini:gemini-2.0-flash",
    "gitlens.ai.vscode.model": "copilot:gpt-4.1",
    "diffEditor.ignoreTrimWhitespace": false,
    "extensions.ignoreRecommendations": true,
    "GitCommitPlugin.ShowEmoji": true,
    "terminal.integrated.defaultProfile.linux": "zsh",
    "explorer.confirmDragAndDrop": false,
    "window.autoDetectColorScheme": true,
    "security.workspace.trust.untrustedFiles": "open",
    "workbench.navigationControl.enabled": false,
    "workbench.layoutControl.enabled": false,
    "git.confirmSync": false,
    "git.autofetch": true,
    "explorer.confirmPasteNative": false,
    "workbench.startupEditor": "none",
    "editor.stickyScroll.enabled": false,
    "workbench.editor.enablePreview": false,
    "editor.fontLigatures": true,
    "symbols.hidesExplorerArrows": true,
    "explorer.compactFolders": false,
    "explorer.decorations.colors": false,
    "explorer.excludeGitIgnore": true,
    "files.exclude": {
        "*.sln": true,
        // "**/.*": true,
        // "**/package*.json": true,
    },
    "editor.minimap.renderCharacters": false,
    "editor.minimap.enabled": false,
    "breadcrumbs.enabled": false,
    "editor.scrollbar.vertical": "hidden",
    // ========== Personalization ==========
    "workbench.preferredLightColorTheme": "Visual Studio Light",
    "terminal.integrated.fontFamily": "'FiraCode Nerd Font'",
    "editor.fontFamily": "'FiraCode Nerd Font'",
    "workbench.iconTheme": "symbols",
    "csharp.debug.hotReloadVerbosity": "detailed",
    "csharp.experimental.debug.hotReload": true,
    "terminal.integrated.smoothScrolling": true,
    "workbench.list.smoothScrolling": true,
    "GitCommitPlugin.MaxSubjectCharacters": 1000,
    "simpleBrowser.focusLockIndicator.enabled": false,
    "javascript.updateImportsOnFileMove.enabled": "always",
    "gitlens.advanced.messages": {
        "suppressGkRequestFailed500Warning": true
    },
    "window.menuBarVisibility": "toggle",
    "window.commandCenter": false,
    "workbench.browser.showInTitleBar": true,
    "chat.titleBar.openInAgentsWindow.enabled": false,
    "github.copilot.nextEditSuggestions.enabled": false,
    "github.copilot.enable": {
        "*": false,
        "plaintext": false,
        "markdown": false,
        "scminput": false,
        "csharp": false
    },
    "terminal.integrated.gpuAcceleration": "on",
    "gitlens.codeLens.authors.command": false,
    "gitlens.codeLens.recentChange.enabled": false,
    "gitlens.codeLens.recentChange.command": false,
    "gitlens.codeLens.scopes": [],
    "gitlens.showWhatsNewAfterUpgrades": false,
    "gitlens.plusFeatures.enabled": false,
    "gitlens.currentLine.enabled": true,
    "gitlens.currentLine.pullRequests.enabled": false,
    "gitlens.codeLens.enabled": false,
    "dotnet.preferVisualStudioCodeFileSystemWatcher": true,
    "workbench.activityBar.location": "hidden",
    "window.titleBarStyle": "custom",
    "window.customMenuBarAltFocus": false,
    "window.enableMenuBarMnemonics": false,
    "terminal.integrated.allowMnemonics": false,
    "editor.codeLens": false,
    "dotnet.codeLens.enableReferencesCodeLens": false,
    "dotnet.codeLens.enableTestsCodeLens": false
}
EOF
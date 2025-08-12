{ config, pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    vscode-langservers-extracted
    nil
    vim-language-server
    systemd-language-server
    yaml-language-server
    bash-language-server
    typescript-language-server
    tailwindcss-language-server
    vue-language-server
    svelte-language-server
    nginx-language-server
    matlab-language-server
    lua-language-server
    kotlin-language-server
    java-language-server
    docker-language-server
    docker-language-server-nodejs
    docker-compose-language-server
    python313Packages.python-lsp-server
    clang-tools
    marksman
    sqls
  ];
}
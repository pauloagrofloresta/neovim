-- Configurações básicas
vim.g.mapleader = " "

vim.o.hidden = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.expandtab = true

vim.opt.list = true
vim.opt.listchars:append("space:.")
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("tab:→→")
vim.opt.listchars:append("trail:.")
vim.opt.ruler = true
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = "a" -- Habilita o uso do mouse
vim.opt.syntax = "on" -- Ativa a sintaxe
vim.opt.wrap = false -- Desativa quebra de linha
vim.opt.termguicolors = true -- Habilita cores verdadeiras no terminal

vim.wo.colorcolumn = "80"
vim.wo.relativenumber = false
vim.wo.number = true

-- Gerenciador de plugins (usando packer)
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'AlexvZyl/nordic.nvim'

  use {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use("sheerun/vim-polyglot")
  use("lewis6991/gitsigns.nvim")
  use("sbdchd/vim-run")
  use("preservim/tagbar")
  use("RRethy/vim-illuminate")
  use("folke/twilight.nvim")
  use("editorconfig/editorconfig-vim")
  use("mhinz/vim-grepper")
  use("brooth/far.vim")
  use("nvim-lualine/lualine.nvim")
  use("olexsmir/gopher.nvim")
  use("catppuccin/nvim")
  use("windwp/nvim-autopairs")
  use("yanskun/gotests.nvim")
  use("fatih/vim-go")
  use("nvim-treesitter/nvim-treesitter")
  use("petertriho/nvim-scrollbar")
  use("maxandron/goplements.nvim")
  use("crusj/hierarchy-tree-go.nvim")
  use("mrcjkb/rustaceanvim")
  use("numToStr/Comment.nvim")
  use("olimorris/codecompanion.nvim")
  use("FabijanZulj/blame.nvim")
  use("nvim-telescope/telescope.nvim")
  use("nvim-lua/plenary.nvim")
  use("stevearc/conform.nvim")

  use 'mfussenegger/nvim-dap'
  use {
    'rcarriga/nvim-dap-ui',
    requires = {'nvim-neotest/nvim-nio'}
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }
  use 'leoluz/nvim-dap-go'
  use 'mfussenegger/nvim-dap-python'
  
  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.cmd([[colorscheme catppuccin-macchiato]])

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function()
  require("nvim-tree.api").tree.open()
end})


require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "catppuccin-mocha",
    component_separators = { left = "", right = "" }, -- Separadores entre componentes
    section_separators = { left = "", right = "" }, -- Separadores entre seções
    disabled_filetypes = {
      statusline = { "nvim-tree", "NvimTree", "NvimTree_1" }, -- Desabilitar Lualine em certos tipos de arquivo
      winbar = {}, -- Tipos de arquivo para desabilitar na winbar (vazia por padrão)
    },
    ignore_focus = {}, -- Buffers ignorados para atualização da barra
    always_divide_middle = true, -- Dividir a barra ao meio, mesmo com poucos componentes
    globalstatus = false, -- Usar uma barra de status global (desabilitado por padrão)
    refresh = {
      statusline = 1000, -- Atualizar a barra de status a cada 1000ms
      tabline = 1000,    -- Atualizar a tabline a cada 1000ms
      winbar = 1000,     -- Atualizar a winbar a cada 1000ms
    },
  },
  sections = {
    -- Configuração das seções ativas da barra de status
    lualine_a = { "mode" }, -- Exibe o modo atual (normal, insert, etc.)
    lualine_b = { "branch", "diff", "diagnostics" }, -- Informações de Git e diagnósticos
    lualine_c = { "filename" }, -- Nome do arquivo atual
    lualine_x = { "encoding", "fileformat", "filetype" }, -- Codificação, formato e tipo de arquivo
    lualine_y = { "progress" }, -- Progresso no arquivo (ex.: linha atual/total)
    lualine_z = { "location" }, -- Localização do cursor (linha e coluna)
  },
  inactive_sections = {
    -- Configuração das seções inativas (quando o buffer não está em foco)
    lualine_a = {}, -- Seção vazia
    lualine_b = {}, -- Seção vazia
    lualine_c = { "filename" }, -- Exibe apenas o nome do arquivo
    lualine_x = { "location" }, -- Exibe apenas a localização do cursor
    lualine_y = {}, -- Seção vazia
    lualine_z = {}, -- Seção vazia
  },
  tabline = {}, -- Configuração da tabline (vazia por padrão)
  winbar = {}, -- Configuração da winbar (vazia por padrão)
  inactive_winbar = {}, -- Configuração da winbar inativa (vazia por padrão)
  extensions = {}, -- Extensões adicionais (vazia por padrão)
})

require("blame").setup()

require("codecompanion").setup({
    -- Opções gerais
    opts = {
        language = "Portuguese", -- Idioma usado pelo LLM
    },

    -- Estratégias de interação
    strategies = {
        chat = {
            adapter = "copilot", -- Adaptador para o modo de chat
        },
        inline = {
            adapter = "copilot", -- Adaptador para sugestões inline
            keymaps = {
                accept_change = {
                    modes = { n = "ga" }, -- Atalho para aceitar mudanças
                    description = "Accept the suggested change",
                },
                reject_change = {
                    modes = { n = "gr" }, -- Atalho para rejeitar mudanças
                    description = "Reject the suggested change",
                },
            },
        },
    },

    -- Configurações de exibição
    display = {
        chat = {
            -- Ícones personalizados para o buffer de chat
            icons = {
                pinned_buffer = " ",
                watched_buffer = "👀 ",
            },
            -- Configurações da janela de chat
            window = {
                layout = "vertical", -- Layout: float|vertical|horizontal|buffer
                position = "right",  -- Posição: left|right|top|bottom
                border = "single",   -- Estilo da borda
                height = 0.8,        -- Altura relativa
                width = 0.45,        -- Largura relativa
                relative = "editor", -- Relativo ao editor
                full_height = true,  -- Usa altura total (false usa vsplit)
                opts = {
                    breakindent = true, -- Indentação visual
                    cursorcolumn = false,
                    cursorline = false,
                    foldcolumn = "0",
                    linebreak = true,
                    list = false,
                    numberwidth = 1,
                    signcolumn = "no",
                    spell = false,
                    wrap = true, -- Quebra de linha habilitada
                },
            },
        },
        inline = {
            layout = "vertical", -- Layout para sugestões inline
        },
        action_palette = {
            width = 95,                     -- Largura da paleta de ações
            height = 10,                    -- Altura da paleta de ações
            prompt = "Prompt ",             -- Texto do prompt
            provider = "telescope",         -- Provedor: default|telescope|mini_pick
            opts = {
                show_default_actions = true,    -- Mostrar ações padrão
                show_default_prompt_library = true, -- Mostrar biblioteca de prompts padrão
            },
        },
    },
})

require("Comment").setup()

require("conform").setup({
  -- Configuração de formatadores por tipo de arquivo
  formatters_by_ft = {
    -- Para arquivos Lua, utiliza o formatador "stylua"
    lua = { "stylua" },

    -- Para arquivos Python, executa os formatadores "isort" e "black" em sequência
    python = { "isort", "black" },

    -- Para arquivos Rust, utiliza "rustfmt" e um fallback para o formatador do LSP
    rust = { "rustfmt", lsp_format = "fallback" },

    -- Para arquivos JavaScript, tenta "prettierd" e "prettier", parando após o primeiro disponível
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
})

require("gitsigns").setup({
  -- Configuração dos sinais visuais para mudanças no Git
  signs = {
    add          = { text = "┃" }, -- Adição de linhas
    change       = { text = "┃" }, -- Alteração de linhas
    delete       = { text = "◼" }, -- Exclusão de linhas
    topdelete    = { text = "◼" }, -- Exclusão de linhas no topo
    changedelete = { text = "┃" }, -- Alteração e exclusão de linhas
    untracked    = { text = "┃" }, -- Linhas não rastreadas
  },

  -- Configurações gerais
  signcolumn = true,      -- Exibir sinais na coluna de sinais (toggle com `:Gitsigns toggle_signs`)
  numhl = true,           -- Realçar números de linha (toggle com `:Gitsigns toggle_numhl`)
  linehl = true,         -- Realçar linhas inteiras (toggle com `:Gitsigns toggle_linehl`)
  word_diff = false,      -- Mostrar diferenças por palavra (toggle com `:Gitsigns toggle_word_diff`)

  -- Monitoramento do diretório Git
  watch_gitdir = {
    interval = 2000,      -- Intervalo de atualização em milissegundos
    follow_files = true,  -- Seguir arquivos movidos ou renomeados
  },

  -- Configurações de anexação
  auto_attach = true,          -- Anexar automaticamente a novos buffers
  attach_to_untracked = true,  -- Anexar a arquivos não rastreados

  -- Configuração de blame (responsabilidade de linha)
  current_line_blame = true, -- Exibir blame na linha atual (toggle com `:Gitsigns toggle_current_line_blame`)
  current_line_blame_opts = {
    virt_text = true,         -- Exibir texto virtual
    virt_text_pos = "eol",    -- Posição do texto virtual: 'eol' | 'overlay' | 'right_align'
    delay = 300,              -- Atraso antes de exibir o blame
    ignore_whitespace = false,-- Ignorar mudanças apenas de espaços em branco
    virt_text_priority = 100, -- Prioridade do texto virtual
  },
  current_line_blame_formatter = "  <author>, <author_time:%Y-%m-%d> - <summary>", -- Formato do blame

  -- Outras configurações
  sign_priority = 6,          -- Prioridade dos sinais
  update_debounce = 100,      -- Debounce para atualizações em milissegundos
  status_formatter = nil,     -- Usar o formatador padrão para status
  max_file_length = 40000,    -- Desabilitar para arquivos com mais de 40.000 linhas

  -- Configuração da janela de visualização
  preview_config = {
    border = "single",        -- Estilo da borda
    style = "minimal",        -- Estilo minimalista
    relative = "cursor",      -- Relativo ao cursor
    row = 0,                  -- Linha de início
    col = 1,                  -- Coluna de início
  },
})

require("nvim-autopairs").setup({
  -- Desabilitar o plugin em certos modos
  disable_in_macro = true,         -- Desabilitar durante a execução de macros
  disable_in_visualblock = false,  -- Permitir no modo visual block
  disable_in_replace_mode = true,  -- Desabilitar no modo replace

  -- Configurações gerais
  enable_moveright = true,         -- Permitir mover para a direita após inserir um par
  enable_afterquote = true,        -- Inserir pares após aspas
  enable_check_bracket_line = true,-- Verificar se há pares na mesma linha
  enable_bracket_in_quote = true,  -- Permitir pares dentro de aspas
  enable_abbr = false,             -- Desabilitar abreviações automáticas
  break_undo = true,               -- Quebrar ações de desfazer em múltiplos passos

  -- Integração com Treesitter
  check_ts = false,                -- Desabilitar verificação com Treesitter

  -- Mapeamentos
  map_cr = true,                   -- Mapear <CR> para inserir pares automaticamente
  map_bs = true,                   -- Mapear <BS> para apagar pares automaticamente
  map_c_h = false,                 -- Não mapear <C-h> para apagar pares
  map_c_w = false,                 -- Não mapear <C-w> para apagar palavras
})

require("scrollbar").setup({
  -- Configurações gerais
  show = true, -- Exibir a barra de rolagem
  show_in_active_only = false, -- Mostrar apenas em janelas ativas
  set_highlights = true, -- Configurar destaques automaticamente
  folds = 1000, -- Desabilitar em buffers com mais de 1000 linhas dobradas
  max_lines = false, -- Desabilitar em buffers com mais de um número específico de linhas (false = sem limite)
  hide_if_all_visible = false, -- Ocultar a barra se todas as linhas estiverem visíveis
  throttle_ms = 100, -- Intervalo de atualização em milissegundos

  -- Configuração do "handle" (indicador principal da barra)
  handle = {
    text = " ", -- Texto exibido no handle
    blend = 30, -- Transparência (0 = opaco, 100 = totalmente transparente)
    color = nil, -- Cor personalizada (opcional)
    color_nr = nil, -- Cor para terminais cterm (opcional)
    highlight = "CursorColumn", -- Destaque aplicado ao handle
    hide_if_all_visible = true, -- Ocultar o handle se todas as linhas estiverem visíveis
  },

  -- Configuração de marcas (marcadores na barra de rolagem)
  marks = {
    Cursor = {
      text = "◼", -- Indicador para a posição do cursor
      priority = 0, -- Prioridade mais baixa
      highlight = "Normal", -- Destaque aplicado
    },
    Search = {
      text = { "◼", "◼" }, -- Indicador para resultados de busca
      priority = 1,
      highlight = "Search",
    },
    Error = {
      text = { "◼", "◼" }, -- Indicador para erros
      priority = 2,
      highlight = "DiagnosticVirtualTextError",
    },
    Warn = {
      text = { "◼", "◼" }, -- Indicador para avisos
      priority = 3,
      highlight = "DiagnosticVirtualTextWarn",
    },
    Info = {
      text = { "◼", "◼" }, -- Indicador para informações
      priority = 4,
      highlight = "DiagnosticVirtualTextInfo",
    },
    Hint = {
      text = { "◼", "◼" }, -- Indicador para dicas
      priority = 5,
      highlight = "DiagnosticVirtualTextHint",
    },
    Misc = {
      text = { "◼", "◼" }, -- Indicador para outros tipos de mensagens
      priority = 6,
      highlight = "Normal",
    },
    GitAdd = {
      text = "◼", -- Indicador para adições no Git
      priority = 7,
      highlight = "GitSignsAdd",
    },
    GitChange = {
      text = "◼", -- Indicador para alterações no Git
      priority = 7,
      highlight = "GitSignsChange",
    },
    GitDelete = {
      text = "◼", -- Indicador para exclusões no Git
      priority = 7,
      highlight = "GitSignsDelete",
    },
  },

  -- Buffers e tipos de arquivo excluídos
  excluded_buftypes = {
    "terminal", -- Excluir buffers do tipo terminal
  },
  excluded_filetypes = {
    "cmp_docs", -- Excluir buffers de documentação do cmp
    "cmp_menu", -- Excluir menus do cmp
    "noice", -- Excluir buffers do plugin Noice
    "prompt", -- Excluir buffers de prompt
    "TelescopePrompt", -- Excluir buffers do Telescope
  },

  -- Configuração de eventos automáticos
  autocmd = {
    render = {
      "BufWinEnter", -- Renderizar ao entrar em uma janela
      "TabEnter", -- Renderizar ao entrar em uma aba
      "TermEnter", -- Renderizar ao entrar em um terminal
      "WinEnter", -- Renderizar ao entrar em uma janela
      "CmdwinLeave", -- Renderizar ao sair do modo de comando
      "TextChanged", -- Renderizar ao alterar texto
      "VimResized", -- Renderizar ao redimensionar a janela
      "WinScrolled", -- Renderizar ao rolar a janela
    },
    clear = {
      "BufWinLeave", -- Limpar ao sair de uma janela
      "TabLeave", -- Limpar ao sair de uma aba
      "TermLeave", -- Limpar ao sair de um terminal
      "WinLeave", -- Limpar ao sair de uma janela
    },
  },

  -- Configuração de manipuladores
  handlers = {
    cursor = true, -- Exibir posição do cursor
    diagnostic = true, -- Exibir diagnósticos
    gitsigns = true, -- Exibir alterações do Git (requer o plugin gitsigns)
    handle = true, -- Exibir o handle principal
    search = false, -- Exibir resultados de busca (requer o plugin hlslens)
    ale = false, -- Exibir erros do ALE (requer o plugin ALE)
  },
})

require("nvim-tree").setup({
  -- Configuração de filtros
  filters = {
    dotfiles = false, -- Não exibir arquivos ocultos (dotfiles)
    git_ignored = true, -- Ocultar arquivos ignorados pelo Git
    exclude = { vim.fn.stdpath("config") .. "/lua/custom" }, -- Excluir diretórios específicos
  },

  -- Configurações gerais
  disable_netrw = true, -- Desabilitar o netrw (explorador de arquivos padrão do Vim)
  hijack_netrw = true, -- Substituir o netrw pelo nvim-tree
  hijack_cursor = true, -- Centralizar o cursor ao navegar no nvim-tree
  hijack_unnamed_buffer_when_opening = false, -- Não sobrescrever buffers não nomeados ao abrir o nvim-tree
  sync_root_with_cwd = true, -- Sincronizar o diretório raiz com o diretório atual

  -- Atualização do arquivo focado
  update_focused_file = {
    enable = true, -- Atualizar o foco no arquivo atual
    update_root = false, -- Não atualizar o diretório raiz automaticamente
  },

  -- Configuração de diagnósticos
  diagnostics = {
    enable = true, -- Habilitar exibição de diagnósticos
    show_on_dirs = true, -- Mostrar diagnósticos em diretórios
    show_on_open_dirs = true, -- Mostrar diagnósticos em diretórios abertos
    icons = {
      hint = "◼", -- Ícone para dicas
      info = "◼", -- Ícone para informações
      warning = "◼", -- Ícone para avisos
      error = "◼", -- Ícone para erros
    },
  },

  -- Configuração da visualização
  view = {
    adaptive_size = false, -- Não ajustar automaticamente o tamanho da janela
    side = "left", -- Exibir o nvim-tree no lado esquerdo
    width = 25, -- Largura da janela
    preserve_window_proportions = true, -- Preservar proporções da janela
  },

  -- Configuração de integração com Git
  git = {
    enable = true, -- Habilitar integração com Git
    ignore = true, -- Ignorar arquivos rastreados pelo Git
  },

  -- Configuração de observadores do sistema de arquivos
  filesystem_watchers = {
    enable = true, -- Habilitar observadores para mudanças no sistema de arquivos
  },

  -- Configuração de ações
  actions = {
    open_file = {
      resize_window = false, -- Não redimensionar a janela ao abrir um arquivo
    },
  },

  -- Configuração do renderizador
  renderer = {
    root_folder_label = false, -- Não exibir rótulo para a pasta raiz
    highlight_git = true, -- Destacar alterações do Git
    highlight_opened_files = "none", -- Não destacar arquivos abertos

    -- Arquivos especiais a serem destacados
    special_files = {
      "Makefile",
      "pyproject.toml",
      "go.mod",
      "go.sum",
      "requirements.txt",
      "Dockerfile",
    },

    -- Configuração de marcadores de indentação
    indent_markers = {
      enable = true, -- Habilitar marcadores de indentação
    },

    -- Configuração de ícones
    icons = {
      show = {
        file = false, -- Não exibir ícones para arquivos
        folder = false, -- Não exibir ícones para pastas
        folder_arrow = true, -- Exibir setas para pastas
        git = false, -- Não exibir ícones para Git
      },
      glyphs = {
        default = "󰈚", -- Ícone padrão para arquivos
        symlink = "", -- Ícone para links simbólicos
        folder = {
          default = "", -- Ícone para pastas
          empty = "", -- Ícone para pastas vazias
          empty_open = "", -- Ícone para pastas vazias abertas
          open = "", -- Ícone para pastas abertas
          symlink = "", -- Ícone para links simbólicos de pastas
          symlink_open = "", -- Ícone para links simbólicos de pastas abertas
          arrow_open = "", -- Ícone para setas abertas
          arrow_closed = "", -- Ícone para setas fechadas
        },
        git = {
          unstaged = "◼", -- Ícone para alterações não preparadas
          staged = "◼", -- Ícone para alterações preparadas
          unmerged = "◼", -- Ícone para conflitos não resolvidos
          renamed = "◼", -- Ícone para arquivos renomeados
          untracked = "◼", -- Ícone para arquivos não rastreados
          deleted = "◼", -- Ícone para arquivos excluídos
          ignored = "◼", -- Ícone para arquivos ignorados
        },
      },
    },
  },
})

require("nvim-web-devicons").setup({
  -- Sobrescrever ícones padrão com configurações personalizadas
  override = {
    zsh = {
      icon = "", -- Ícone para arquivos Zsh
      color = "#428850", -- Cor do ícone
      cterm_color = "65", -- Cor para terminais cterm
      name = "Zsh", -- Nome do ícone
    },
  },

  -- Habilitar cores diferentes para cada ícone (padrão: true)
  color_icons = true,

  -- Habilitar ícones padrão globalmente (padrão: false)
  default = true,

  -- Habilitar seleção "estrita" de ícones (padrão: false)
  -- Ícones serão buscados primeiro pelo nome do arquivo e, se não encontrados, pela extensão
  strict = true,

  -- Sobrescrever ícones com base no nome do arquivo (requer `strict = true`)
  override_by_filename = {
    [".gitignore"] = {
      icon = "", -- Ícone para arquivos .gitignore
      color = "#f1502f", -- Cor do ícone
      name = "Gitignore", -- Nome do ícone
    },
  },

  -- Sobrescrever ícones com base na extensão do arquivo (requer `strict = true`)
  override_by_extension = {
    ["log"] = {
      icon = "", -- Ícone para arquivos de log
      color = "#81e043", -- Cor do ícone
      name = "Log", -- Nome do ícone
    },
  },
})

require("nvim-treesitter.configs").setup({
  -- Linguagens a serem instaladas
  ensure_installed = {
    "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
    "python", "ruby", "javascript", "arduino", "awk", "c_sharp", "cmake",
    "clojure", "asm", "cpp", "css", "csv", "dart", "dockerfile", "diff",
    "editorconfig", "erlang", "gleam", "go", "gomod", "helm", "haskell",
    "html", "htmldjango", "java", "json", "json5", "kotlin", "nasm",
    "ocaml", "ocaml_interface", "proto", "regex", "rust", "sql", "svelte",
    "toml", "typescript", "yaml", "vue", "xml",
  },

  -- Instalar parsers de forma síncrona (aplicado apenas ao `ensure_installed`)
  sync_install = false,

  -- Instalar parsers automaticamente ao abrir um buffer
  -- Recomendação: defina como `false` se você não tiver o CLI do `tree-sitter` instalado localmente
  auto_install = true,

  -- Lista de parsers a serem ignorados durante a instalação
  ignore_install = {},

  -- Configuração de realce de sintaxe
  highlight = {
    enable = true, -- Habilitar realce de sintaxe com Tree-sitter

    -- Lista de linguagens para as quais o realce será desabilitado
    disable = {},

    -- Executar `:h syntax` e Tree-sitter ao mesmo tempo
    -- Defina como `true` se depender do 'syntax' padrão (pode causar lentidão ou realces duplicados)
    additional_vim_regex_highlighting = false,
  },
})

require("twilight").setup({
  -- Configuração de escurecimento
  dimming = {
    alpha = 0.25, -- Nível de transparência (0 = totalmente escuro, 1 = sem escurecimento)
    color = { "Normal", "#ffffff" }, -- Cor de fundo para o escurecimento
    inactive = false, -- Não escurecer janelas inativas
  },

  -- Número de linhas de contexto a serem mantidas visíveis ao redor do cursor
  context = 1,

  -- Usar Treesitter para determinar o contexto (recomendado para melhor precisão)
  treesitter = false, -- Defina como `true` para habilitar Treesitter

  -- Tipos de blocos a serem expandidos automaticamente
  expand = {
    "function", -- Expandir funções
    "method",   -- Expandir métodos
    "table",    -- Expandir tabelas
    "if_statement", -- Expandir blocos `if`
    "class",    -- Expandir classes
  },

  -- Lista de tipos de arquivo ou buffers a serem excluídos do escurecimento
  exclude = {},
})


require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "gopls",
    "jdtls",
    "html",
    "ts_ls",
    "rust_analyzer",
    "bashls",
    "sqlls",
    "jsonls",
    "lua_ls",
  }
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
  'pyright',
  'gopls',
  'jdtls',
  'html',
  'ts_ls',
  'rust_analyzer',
  'bashls',
  'sqlls',
  'jsonls',
  'lua_ls',
  "django-template-lsp",
  "docker-language-server",
  "djlint",
}

for _, server in ipairs(servers) do
  vim.lsp.config[server] = {
    capabilities = capabilities
  }
end

local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' }
  })
})

-- Configuração do DAP (Debug Adapter Protocol)
local dap = require('dap')
local dapui = require('dapui')

-- Configuração do DAP UI
dapui.setup()

-- Configuração do DAP para Go
require('dap-go').setup()

-- Configuração do DAP para Python
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')


require('config.settings').setup()
require('config.keymaps').setup()
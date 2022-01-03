if !exists('g:loaded_nvim_treesitter')
  echo "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = false,
  },
  highlight = {
	enable = true
  },
  ensure_installed = {
	"javascript",
	"bash",
	"python",
	"html",
	"css",
	"scss",
    "json",
    "yaml",
	"tsx",
	"elixir"
	},
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
parser_config.html.used_by  = { "heex" }
EOF

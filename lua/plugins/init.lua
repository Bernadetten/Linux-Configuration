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

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost **/plugins/init.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  
	-- Theme
	use('EdenEast/nightfox.nvim')
  
	-- Mason/LSP/Linter
	use({
  	'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
    	{'neovim/nvim-lspconfig'},
    	{'williamboman/mason.nvim'},
    	{'williamboman/mason-lspconfig.nvim'},

    	-- Autocompletion
    	{'hrsh7th/nvim-cmp'},
    	{'hrsh7th/cmp-buffer'},
    	{'hrsh7th/cmp-path'},
    	{'saadparwaiz1/cmp_luasnip'},
    	{'hrsh7th/cmp-nvim-lsp'},
    	{'hrsh7th/cmp-nvim-lua'},

    	-- Snippets
    	{'L3MON4D3/LuaSnip'},
    	{'rafamadriz/friendly-snippets'},
		}
	})

	-- File tree
	use({ 
  	'nvim-tree/nvim-tree.lua',
  	requires = {
    	'nvim-tree/nvim-web-devicons', -- optional, for file icons
  	},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	})

	-- Terminal pet 
	use('tamton-aquib/duck.nvim')
 
	-- Telescope 
  use({ 
    'nvim-telescope/telescope.nvim', 
		requires = {'nvim-lua/plenary.nvim' }
	})
 
	-- Comment 
  use({
    'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
    end
	})
	
	-- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })
  use('nvim-treesitter/playground')
  use('nvim-treesitter/nvim-treesitter-context')
  use('nvim-treesitter/nvim-treesitter-textobjects')
	use('nvim-tree/nvim-web-devicons')

	-- Tab bar
  use({
		'romgrk/barbar.nvim', 
		wants = 'nvim-web-devicons'
	})
  
  -- Indentation
	use('lukas-reineke/indent-blankline.nvim')
	
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)

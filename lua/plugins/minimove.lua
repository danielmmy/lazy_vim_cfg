return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.move').setup({
      -- Automatically reindent selection during linewise vertical move
      reindent_linewise = true,
    })
  end
}

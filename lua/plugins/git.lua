return {
    {
        'tpope/vim-fugitive',
        config = function()
          -- vim.g['airline#extensions#branch#enabled'] = 1
          -- vim.g['airline#extensions#branch#format'] = 1
          -- vim.g['airline#extensions#branch#vcs_checks'] = { 'untracked', 'dirty' }

          vim.g.NERDTreeGitStatusIndicatorMapCustom = {
            Modified  = '✹',
            Staged    = '✚',
            Untracked = '✭',
            Renamed   = '➜',
            Unmerged  = '═',
            Deleted   = '✖',
            Dirty     = '✗',
            Ignored   = '☒',
            Clean     = '✔︎',
            Unknown   = '?',
          }
        end,
    },
}

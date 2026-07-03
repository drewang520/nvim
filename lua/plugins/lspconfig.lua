local function on_attach(client, bufnr)
    local map = vim.keymap.set
    local opts = {buffer = bufnr}
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', '<leader>rn', vim.lsp.buf.rename, opts)
    map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    map('n', '[d', vim.diagnostic.goto_prev, opts)
    map('n', ']d', vim.diagnostic.goto_next, opts)
    if client.server_capabilities.documentSymbolProvider then
        require('nvim-navic').attach(client, bufnr)
    end
end

return {
    {
        'neovim/nvim-lspconfig', -- 保留,但0.12.0版本使用内置vim.lsp.config
        config = function()
            -- local capabilities = vim.lsp.protocol.make_client_capabilities()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            vim.lsp.config.clangd = {
                cmd = {'clangd', '--background-index'},
                capabilities = capabilities,
                root_markers = {'.clangd', 'compile_commands.json', '.git'},
                on_attach = on_attach,
            }

            vim.lsp.config.pyright = {
                cmd = {'pyright'},
                capabilities = capabilities,
                root_markers = {'pyproject.toml', 'setup.py', '.git'},
                on_attach = on_attach,
            }
            
            vim.lsp.config.lua_ls = {
                cmd = {'lua-language-server'},
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = {version = 'LuaJIT'},
                        diagnostics = {globals = {'vim'}},
                        workspace = {checkThirdParty = false},
                        telemetry = {enable = false},
                    },
                },
            }

            -- 对C/C++文件自动启动
            vim.api.nvim_create_autocmd('FileType', {
                    pattern = {'c', 'cpp', 'cc'},
                    callback = function(args)
                        vim.lsp.start(vim.lsp.config.clangd, {bufnr = args.buf})
                    end,
                })

            -- Python 触发
            vim.api.nvim_create_autocmd('FileType', {
              pattern = { 'python', 'py'},
              callback = function(args)
                vim.lsp.start(vim.lsp.config.pyright, { bufnr = args.buf })
              end,
            })

            -- Lua 触发
            vim.api.nvim_create_autocmd('FileType', {
              pattern = { 'lua' },
              callback = function(args)
                vim.lsp.start(vim.lsp.config.lua_ls, { bufnr = args.buf })
              end,
            })
        end,
    },
}


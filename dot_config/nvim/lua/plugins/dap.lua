-- local dap = require('dap')
--
-- require('dap-vscode-js').setup({
--   debugger_path = require('mason-registry').get_package('js-debug-adapter'):get_install_path(),
--   debugger_cmd = { 'js-debug-adapter' },
--   adapters = {
--     'pwa-node',
--     'pwa-chrome',
--     'pwa-msedge',
--     'node-terminal',
--     'pwa-extensionHost',
--   },
-- })
--
-- dap.adapters['pwa-node'] = {
--   type = 'server',
--   host = 'localhost',
--   port = '${port}',
--   executable = {
--     command = 'js-debug-adapter',
--     args = { '${port}' },
--   }
-- }
--
-- for _, language in ipairs { 'typescript', 'javascript' } do
--   dap.configurations[language] = {
--     {
--       type = 'pwa-node',
--       request = 'launch',
--       name = 'Launch file',
--       program = '${file}',
--       cwd = '${workspaceFolder}',
--     },
--   }
-- end

return {

}

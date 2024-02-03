vim.api.nvim_create_user_command("RunTests", function()
  -- check if current file is a .jest.js/.jest.ts/.jest.jsx/.jest.tsx file
  -- if not, check if there is a .jest.js/.jest.ts/.jest.jsx/.jest.tsx file in the current directory

  local current_file = vim.fn.expand("%:s?lib/plugin??")
  local full_file_path = vim.fn.expand("%:p")

  -- get the folder after /Users/username/dev
  local project_root = full_file_path:match("^(/Users/[^/]+/dev/rails/[^/]+/)")
  print(project_root)

  if current_file:match("^.*jest%.t?j?sx?$") then
    vim.cmd(
      'silent !tmux popup "cd ' .. project_root .. "lib/plugin && yarn jest --coverage false " .. current_file .. '"'
    )
  end
end, {})

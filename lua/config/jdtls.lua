local M = {}

-- Find paths safely
local function get_jdtls_paths()
  local base = vim.fn.stdpath("data") .. "/mason/packages"
  local paths = {
    lombok = base .. "/jdtls/lombok.jar",
    dap = vim.fn.glob(base .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.adapter-*.jar"),
    tests = vim.fn.split(vim.fn.glob(base .. "/java-test/extension/server/*.jar", true), "\n"),
  }
  return paths
end

function M:setup()
  local jdtls = require("jdtls")
  local paths = get_jdtls_paths()

  -- Attempt to retrieve project root
  local root_dir = vim.fs.root(0, { "gradlew", "mvnw", "pom.xml", "build.gradle", "build.gradle.kts", ".git" })

  local is_single_file = false

  if not root_dir then
    is_single_file = true
    root_dir = vim.fn.getcwd()
  end

  local project_folder
  if is_single_file then
    -- Use the same project folder for single files
    project_folder = "single-file-workspace"
  else
    -- Use hash to ensure uniqueness
    local absolute_path = vim.fn.fnamemodify(root_dir, ":p:h")
    project_folder = vim.fn.fnamemodify(absolute_path, ":t") .. "_" .. vim.fn.sha256(absolute_path):sub(1, 8)
  end

  local sep = package.config:sub(1, 1)
  local workspace_dir = vim.fn.stdpath("data") .. sep .. "jdtls-workspace" .. sep .. project_folder

  -- Construct bundles
  local bundles = {}
  if paths.dap ~= "" then table.insert(bundles, paths.dap) end
  vim.list_extend(bundles, paths.tests)

  local config = {
    name = "jdtls",
    cmd = {
      "jdtls",
      "-data",
      workspace_dir,
      "--jvm-arg=-Xmx8G",
      "--jvm-arg=-Xms2G",
      "--jvm-arg=-XX:+UseG1GC", -- Better for large memory
      "--jvm-arg=-javaagent:" .. (vim.uv.fs_stat(paths.lombok) and paths.lombok or ""),
    },

    init_options = {
      bundles = bundles,
    },

    settings = {
      java = {
        contentProvider = { preferred = "fernflower" },
        sources = {
          organizeImports = {
            starThreshold = 3,
            staticStarThreshold = 3,
          },
        },
      },
    },

    on_attach = function(_, bufnr)
      ---@diagnostic disable-next-line: missing-fields
      if paths.dap ~= "" then jdtls.setup_dap({ hotcodereplace = "auto" }) end

      if is_single_file then vim.notify("JDTLS: Running in Single File Mode", vim.log.levels.INFO) end

      local function map(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc }) end
      map("n", "<leader>xv", jdtls.extract_variable, "Extract Variable")
      map("n", "<leader>xm", jdtls.extract_method, "Extract Method")
      map("n", "<leader>xo", jdtls.organize_imports, "Organize Imports")
    end,
  }

  jdtls.start_or_attach(config)
end

return M

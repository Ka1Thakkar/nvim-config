local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

ANIME = {
  { "nvim.txt", 1900, 1080 },
}

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { "rose-pine/neovim", name = "rose-pine" },
    {
      "catppuccin/nvim",
      name = "catppuccin",
    },
    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
        vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { noremap = true, silent = true })
      end,
    },
    { "AmberLehmann/candyland.nvim", priority = 1000 },
    {
      "presindent/ethereal.nvim",
    },
    {
      "goolord/alpha-nvim",
      event = "VimEnter",
      enabled = true,
      init = false,
      opts = function()
        local dashboard = require("alpha.themes.dashboard")
        -- Define and set highlight groups for each logo line
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#EB6F92" }) -- Indigo
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#EB7997" }) -- Deep Purple
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#EB829C" }) -- Deep Purple
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#EB8CA1" }) -- Medium Purple
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#EB95A6" }) -- Light Purple
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#EB9FAB" }) -- Very Light Purple
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo7", { fg = "#EBA9B0" })
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo8", { fg = "#EBB2B5" }) -- Very Light Purple
        vim.api.nvim_set_hl(0, "NeovimDashboardLogo9", { fg = "#EBBCBA" })
        vim.api.nvim_set_hl(0, "Buttons", { fg = "#e0def4" })
        vim.api.nvim_set_hl(0, "Footer", { fg = "#f6c177" })
        vim.api.nvim_set_hl(0, "NeovimDashboardUsername", { fg = "#ea9d34" }) -- light purple
        vim.api.nvim_set_hl(0, "red", { fg = "#ff0000" }) -- light purple
        dashboard.section.header.type = "group"
        dashboard.section.header.val = {
          {
            type = "text",
            val = "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠹⣛⣛⣯⡸⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿",
            opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⡄⣫⣼⣾⣿⣿⣿⣿⣿⣿⣷⣶⣬⣙⠛⣿⣿⣿⣿⣿",
            opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⣿⣿⣿⣿⣿⣿⡿⢳⣤⣾⢿⣿⣯⣉⡱⠻⢝⠽⢻⣿⣿⢻⢿⣿⣯⠘⣿⣿⣿⣿",
            opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⣿⣿⣿⣿⣿⠻⢡⣿⣿⡏⢼⣯⠄⠙⣈⢭⢟⢐⠁⣾⠃⠡⣿⣿⣿⣷⣌⢿⣿⣿",
            opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⣿⣿⣿⣿⣿⡟⣿⡈⣜⢢⠦⠗⠚⠱⣭⣐⡑⣷⣾⣶⣯⣝⢽⢛⢿⣽⡗⣼⣿⣿",
            opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⣿⣿⣿⣿⠇⣧⡵⢐⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢿⣿⣰⡫⣹⡢⣛⠪⣿⣿",
            opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⣿⣿⣿⣿⣷⡺⠦⢼⣿⣿⣿⣿⣿⣿⣿⡁⣿⡿⣿⣝⣧⣿⡏⣤⣸⣿⢟⢘⠛⠁",
            opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⣿⣿⣿⣿⣿⡜⠷⣅⡇⣿⠿⣿⣿⣿⣿⡇⣿⣗⣻⣿⢘⣛⣿⣷⢻⠓⣥⢸⣦⡀",
            opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⣿⣿⣿⣿⣿⣿⡞⣄⡦⣣⣝⡿⠿⣿⡞⡡⠻⠛⠋⠁⠁⠀⠈⣵⠐⡀⡙⢸⣿⡇",
            opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⣿⣿⣿⣿⣿⣿⣿⠈⠁⠠⠄⠀⠀⠀⡀⣤⣤⠀⠀⠀⠀⠀⣰⣿⠀⠀⠀⡸⣿⢧",
            opts = { hl = "NeovimDashboardLogo7", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⣿⣿⣿⣿⣿⣿⣿⢡⡀⠠⣤⣤⣤⣴⣿⢹⡿⡿⣖⣦⣶⣾⣝⢿⠄⠀⠕⣼⣿⣿",
            opts = { hl = "NeovimDashboardLogo7", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⣿⣿⣿⣿⠿⠋⠁⢸⣿⡀⢹⣽⣶⣶⣿⣶⣾⣿⣿⠿⣿⡿⢿⣷⣤⣀⡰⣿⡷⣹",
            opts = { hl = "NeovimDashboardLogo8", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⣿⠿⠋⠁⠀⠀⠀⣸⣿⡧⣼⣿⡿⡟⡟⣁⣠⡦⢔⡡⣰⣑⠀⠀⠉⠉⣰⡿⠛⠁",
            opts = { hl = "NeovimDashboardLogo8", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⠀⠀⠀⠀⠀⠀⠀⣟⡯⠚⠉⠠⣁⠀⣾⣴⣾⣭⣷⡾⠿⠃⠀⠀⠀⢠⣏⡀⢀⣴",
            opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣷⡀⢾⣎⢉⣭⣭⣀⡀⢀⣀⣰⡄⢀⣿⡿⣱⣾⣟",
            opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
          },
          -- {
          --   type = "text",
          --   val = "                                                                       ",
          --   opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
          -- },
          -- {
          --   type = "text",
          --   val = "                                                                     ",
          --   opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
          -- },
          -- {
          --   type = "text",
          --   val = "       ████ ██████           █████      ██                     ",
          --   opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
          -- },
          -- {
          --   type = "text",
          --   val = "      ███████████             █████                             ",
          --   opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
          -- },
          -- {
          --   type = "text",
          --   val = "      █████████ ███████████████████ ███   ███████████   ",
          --   opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
          -- },
          -- {
          --   type = "text",
          --   val = "     █████████  ███    █████████████ █████ ██████████████   ",
          --   opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
          -- },
          -- {
          --   type = "text",
          --   val = "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
          --   opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
          -- },
          -- {
          --   type = "text",
          --   val = "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
          --   opts = { hl = "NeovimDashboardLogo7", shrink_margin = false, position = "center" },
          -- },
          -- {
          --   type = "text",
          --   val = " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
          --   opts = { hl = "NeovimDashboardLogo8", shrink_margin = false, position = "center" },
          -- },
          -- {
          --   type = "text",
          --   val = "                                                                       ",
          --   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
          -- },
          {
            type = "padding",
            val = 1,
          },
          {
            type = "text",
            val = " There is yet joy beyond your sorrows. ",
            opts = { hl = "NeovimDashboardUsername", shrink_margin = false, position = "center" },
          },
          {
            type = "text",
            val = "~ Jinbei, Post-Marineford Arc",
            opts = { hl = "Footer", shrink_margin = false, position = "center" },
          },
          {
            type = "padding",
            val = 1,
          },
          -- {
          --   type = "text",
          --   val = "<==========<<>>==========>",
          --   opts = { hl = "Footer", shrink_margin = false, position = "center" },
          -- },
          -- {
          --   type = "padding",
          --   val = 1,
          -- },
        }
      --   dashboard.section.header.val = vim.split(logo, "\n")
        
    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file",       LazyVim.pick()),
      -- dashboard.button("n", " " .. " New file",        [[<cmd> ene <BAR> startinsert <cr>]]),
      -- dashboard.button("r", " " .. " Recent files",    LazyVim.pick("oldfiles")),
      -- dashboard.button("g", " " .. " Find text",       LazyVim.pick("live_grep")),
      dashboard.button("c", " " .. " Config",          LazyVim.pick.config_files()),
      -- dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
      dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
      dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
      -- dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
    }
        for _, button in ipairs(dashboard.section.buttons.val) do
          -- button.opts.hl = "AlphaButtons"
          button.opts.hl = "Buttons"
          button.opts.hl_shortcut = "Buttons"
          -- button.opts.hl_shortcut = "AlphaShortcut"
        end
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "Footer"
        dashboard.opts.layout[1].val = 8
        -- dashboard.section.header.opts.hl = "Error"
        return dashboard
      end,
      config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
          vim.cmd.close()
          vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "AlphaReady",
            callback = function()
              require("lazy").show()
            end,
          })
        end

        require("alpha").setup(dashboard.opts)
        local datetime = os.date(" %d-%m-%Y   %H:%M:%S")

        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "LazyVimStarted",
          callback = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            dashboard.section.footer.type = "group"
            dashboard.section.footer.val = {
              { type = "padding", val = 1 },
              {
                type = "text",
                val = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
                opts = { hl = "Footer", shrink_margin = false, position = "center" },
              },
              -- {
              --   type = "padding",
              --   val = 1,
              -- },
              {
                type = "text",
                val = datetime,
                opts = { hl = "Footer", shrink_margin = false, position = "center" },
              },
            }
            -- {"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"},
            pcall(vim.cmd.AlphaRedraw)
          end,
        })
      end,
    },
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
local logoAnime = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠔⣰⣿⣟⡽⢋⡴⣿⠏⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⡿⣡⠏⣴⡟⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢹⣿⣿⣿⣿⡿⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢾⣿⣿⡛⣰⡏⣼⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣿⡿⢛⣻⡅⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡟⣸⣿⣿⢠⣿⠃⣿⣿⠃⣼⢿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⡇⢿⡇⣿⣿⠃⢠⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⢃⣿⣿⠇⣾⡟⠀⣿⢇⣴⡄⢸⣿⣿⣿⡟⣿⣧⠘⣿⣿⡇⣿⢿⢻⣷⠸⣇⢿⣿⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⢹⡿⢸⣿⡿⢸⠟⣵⡿⠈⠈⠿⣷⠈⣿⣿⣿⠆⢿⣷⢀⢻⣿⡆⢹⢼⣷⣿⢀⣿⡜⢿⠦⠀⠩⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣘⡇⣾⡿⢸⣿⡇⣠⡾⢋⣶⣦⠁⢒⡘⣷⡘⣿⣿⡄⣎⠻⡼⣧⡙⣿⣌⠘⣿⣿⢸⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡇⢿⣿⢸⡿⢰⣿⢡⣿⠉⣯⣄⠀⣷⣿⣿⣌⡻⢧⢹⣷⢆⣉⠠⠄⡀⢢⠹⣿⢸⣿⣿⣿⡿⢱⣦⠄⢠⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣷⢸⣿⠸⣿⢸⡏⣼⣿⠀⠟⠁⣸⣿⣿⣿⣿⣿⣷⣶⣴⡟⠿⡁⠀⢹⡎⢷⡹⢸⣿⣿⠟⣠⣿⠏⣼⢸⣿⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡆⣿⡇⣿⢸⣿⡸⣿⣷⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣷⡀⣸⣿⢸⣇⢸⣿⡏⣸⣿⡏⣸⣿⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣷⠸⣷⠸⢸⣿⣷⣮⣛⣛⣋⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⢠⣠⣿⡿⢸⠏⣾⢋⣴⣿⢋⣴⣿⣿⢸⣿⡏⡶⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⣿⣿⣿⣿⣿⣧⡹⣧⠈⣿⣿⣿⣿⣿⣿⣿⡟⠛⠿⢿⣿⣿⣟⠿⣿⣿⣿⣿⡿⣣⡟⠜⣱⣿⠟⣴⣿⣿⣿⣿⢸⣿⠃⣟⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⠀⢻⣿⣿⣿⣿⣿⣷⡘⢆⠻⣿⣿⣿⣿⣿⡿⣰⣿⣿⡇⢿⣿⣿⣿⣶⣭⣭⣭⣾⡟⣠⣾⠟⣥⣿⣿⣿⣿⣿⡇⣼⡿⠸⣸⣿⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⠀⠸⣿⣿⣿⣿⣿⣿⣿⡆⠀⠉⠻⢿⣿⣿⡇⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⢏⡼⢛⣴⣿⣿⣿⣿⣿⣿⣿⢁⣿⢡⢃⡏⣿⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⢰⡍⣛⠷⢭⣙⣛⣛⣸⣿⣿⣿⣿⣿⡿⠡⢊⣴⣿⣿⣿⣿⣿⣿⣿⣿⡏⣸⢇⡎⠘⡇⣿⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⠀⢠⣼⣷⣬⠛⣶⣬⣭⠉⡍⠋⠙⢩⣭⡍⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⢣⡎⠀⠀⢹⣿⠃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⢣⣾⣿⣿⢿⣿⣇⢹⣻⠿⢛⣩⣭⣝⠻⣿⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠁⠀⠀⠀⣼⡟⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢿⣿⢃⣿⣿⢿⣿⣿⣿⠉⡴⠉⠂⣾⣿⡿⢿⣷⡄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⢀⠀⠂⠀⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢸⣿⣿⣿⣮⣛⠿⢣⠰⠧⠾⣿⣿⣿⣿⣾⣿⢸⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⢀⠐⠀⡀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]]

local onePiece = [[
⡀⠢⢄⢂⠰⡀⢆⠰⡀⢆⠰⡀⢆⠰⡀⠆⠐⣀⣠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠲⣤⣉⠙⠟⡣⠐⡤⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣾⣦⠑⡌⢢⡱⣌⢆⡱⢈⠦⢁⣤⠶⣛⠭⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣦⣅⠙⠼⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣼⣿⣿⣿⣿⢗⣵⠞⡫⠴⢉⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣷⠀⢸⡄⠀⠀⠀⠀⠐⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠳⣌⠡⢏⡹⠻⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⠟⣵⠟⠡⡜⠑⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣇⠈⣿⣄⠀⠀⠀⠀⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠶⡉⠱⢈⢷⣄⢇⡓⢖⣢⡙⠿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⢏⡾⢋⠬⢃⢬⠙⣘⠦⢤⠄⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣦⢻⣿⣦⡀⠀⢠⣿⣿⣧⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⢀⠈⠧⠌⠤⡹⣆⢙⡲⠴⣩⠳⢬⠭⣍⠽
⣿⣿⣿⣿⣿⣿⢇⣾⠡⡙⠢⡜⠀⡎⢠⠚⠌⠀⠀⠀⠀⠀⠀⢰⣿⣶⣭⡛⢿⣿⣿⣿⣿⣿⣄⢸⡿⣛⣥⠀⣾⣇⠀⠀⠀⠀⠀⠀⠀⠈⠒⣢⢙⡤⢳⠘⣧⢩⢳⡱⢏⡎⢷⣌⣻
⣿⣿⣿⣿⣿⡟⣼⢃⠢⢡⠙⢠⡛⠤⠃⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠿⣛⡛⢷⡙⠻⣿⣿⣿⣿⠋⢊⠿⣛⣓⠿⣿⡄⠀⠀⠀⠀⠀⠀⠀⡴⣐⠯⠜⠃⢇⡹⣆⢫⡵⣻⣚⢷⡺⣼
⢧⣍⡛⣼⢹⢡⡇⠰⠁⡎⠀⠀⡆⠀⢀⠂⠀⠀⠀⠀⠀⢠⠀⡟⣴⣿⠿⢿⣷⡙⡄⠈⣿⣿⣷⣤⢡⣿⠿⢿⣿⡎⡇⠀⠀⠀⠀⠀⠀⠀⠀⢠⠆⠐⠈⡄⢂⢻⠸⣷⣯⣽⣾⣻⣵
⡳⣌⡳⣬⢳⢸⠃⡓⠸⠀⣡⡆⠘⣆⠀⠀⠀⠀⠸⠈⢆⠘⣆⠡⣿⣯⣄⣠⣿⡧⠐⡠⢸⣿⣿⣇⢿⣿⣀⣴⣿⡿⣠⡏⢀⠞⢓⠀⠀⠀⢀⡎⠀⠀⠀⠐⠨⡌⡇⣿⣿⣟⣾⢿⣽
⣿⣷⣽⢶⢫⢸⠄⡁⢀⣾⣷⣦⠀⠘⢆⠀⠀⠀⠰⠀⠀⢀⢿⣿⣮⣛⣛⣛⣯⣾⣆⠀⠀⢻⣿⣿⣷⠭⢛⠛⠍⡢⣿⠇⠀⠀⡈⠀⠀⢀⡎⠀⠀⠀⠀⠀⠀⠀⣷⢸⣿⢿⣽⣿⣻
⣿⡟⣮⢳⣯⠸⡆⠀⠀⢻⢣⣿⡀⠀⠘⢆⠀⠀⠀⠑⢤⣀⠸⣇⢩⣝⢛⣛⣛⣛⣛⣛⣒⣛⣛⣛⣛⣻⣥⡬⡆⢠⡾⢀⣀⠔⠀⠀⠀⠞⠀⠀⠀⠀⠀⠀⠡⠀⠙⣸⡿⣯⣷⡿⣽
⣿⣞⣷⣿⣿⡇⠁⠀⢠⣿⢸⣿⣡⠀⠀⠈⢣⡀⠀⠀⠀⠉⠃⢿⣆⠘⠚⠿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠛⠉⢁⣿⠁⠉⠁⠀⠀⢠⠏⠀⠀⠀⠀⠀⠀⠈⡐⠀⠂⠘⣿⣟⣷⣿⣿
⣿⡾⣯⣷⠟⣰⣶⣶⣿⣿⢸⣿⣿⡆⠀⠐⡀⠑⣄⠀⠀⠀⠀⠀⢻⣦⠀⠄⠀⡀⡄⢤⠠⡤⢠⠄⡠⠀⠀⢀⡾⠃⠀⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⠄⠐⠀⠌⢀⠀⠘⣿⣿⣿⣿
⣿⣿⣻⠍⢸⣿⣿⣿⣿⣿⠘⣿⣿⣿⡄⠐⠀⡀⠈⠑⢄⡀⠀⠀⠀⢉⠻⣮⡒⢤⣭⣂⣓⣈⣃⣬⡥⣒⠴⠋⠀⠀⠀⠀⢠⠜⠁⠀⠀⠀⠀⠀⠠⠈⠀⠀⠌⠀⠄⠈⠀⠘⣿⣿⣿
⣿⣟⠏⠀⠸⣿⢸⡿⠋⠁⠀⠈⢻⣟⣥⠀⠀⡐⠀⠀⠀⠁⠠⢀⠀⠠⠐⡀⠉⠛⠲⠎⣉⠉⠓⠒⠋⡀⠤⠐⠀⠀⢀⠔⠁⠀⠀⠀⠀⠀⠀⡀⠂⠄⠁⠀⡀⠌⠀⠀⠁⠄⠘⢿⣿
⣿⠏⠀⠀⢀⣿⡎⠁⠀⠀⠀⠀⠀⣿⣿⣇⠀⠀⠐⠀⠀⠀⠀⠀⠉⠀⠀⣈⠂⠁⠆⢠⠀⠠⠀⠂⢀⠀⠄⠀⡠⠐⠁⠀⠀⠀⠀⠀⠀⠠⠐⠀⠠⠐⠀⠀⠀⠄⠂⠈⠀⡀⠄⠈⢿
⠃⠀⠀⠀⣼⣿⡇⢠⡀⠀⠀⠀⣼⣿⣿⠿⠀⠀⠀⠀⠀⠈⢀⠀⠀⠀⠀⠀⠁⠐⠀⠄⣈⡡⠀⠈⡀⠄⠐⠀⠀⠀⠀⠀⠀⠀⢀⠠⠈⠀⠀⠀⠀⠐⠀⠀⠀⠠⠀⠀⠄⢀⠀⠂⠀
]]

local one1 = [[
⠜⡲⢭⠳⡭⢯⡽⢧⠯⣽⣿⣿⣿⣿⣿⣿⣿⣿⢯⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣻⢿⠟⢿⣫⣽⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡽⣯⠳⣍⠶⡑⠎⡔⢂⠆⡐⠠
⣩⠝⣫⢿⡽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⡼⠛⣍⣼⣶⡹⢫⡴⢦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠿⣜⠶⣩⠓⣌⢂⠐⠠⢁
⢬⡏⡽⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡍⡿⢿⢿⣿⣵⢫⡿⢧⡴⡟⢷⣽⢻⣿⡏⡿⠹⢫⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⡿⡜⡍⠆⠂⠉⠐⠠
⠼⣤⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣧⣤⣼⢿⣷⣷⢾⣞⣿⡇⠼⡇⢾⡠⠤⢦⠜⢿⣼⢿⡴⢗⡇⣟⣿⣻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣟⣰⡘⣄⠢⡐⢂
⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣟⠇⢿⠿⢗⣿⠟⢉⡋⠈⢋⣉⢍⣊⠒⠔⠁⢿⠆⣻⡰⣻⣿⣿⣿⣷⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣞⣧⣳⣬⢳⣙⠦
⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣻⣿⣿⣧⢾⣘⣛⣳⣯⢠⠀⣎⠕⠛⠛⠓⢯⢭⢇⢯⡼⣟⢅⣯⣛⢋⣦⣿⢹⣿⣯⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣞⢧⠯⡜
⣟⣯⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡿⣿⠿⠙⣻⣷⣿⣿⣿⣮⣟⣯⠭⣽⣣⣌⣬⠢⣔⣂⣆⡴⠋⡤⣳⣵⣿⣿⡿⣟⢴⢿⣷⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣳⢮⡏⠶⡩
⣛⡞⡿⣞⣿⣿⣿⣿⣿⢿⣣⡟⣾⣹⡷⢯⡭⢮⣾⣿⣿⣿⣿⣿⣿⢷⠈⢳⡽⢿⢇⢒⣨⡥⣾⢿⣻⣭⣿⣽⢿⣇⣯⡿⣽⡿⠿⣟⣫⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⢣⠳⡜⣡⠑
⣭⢻⣽⣽⣾⣿⣿⣿⣿⣿⣷⣿⣿⣿⣷⣻⢿⢟⣿⣿⡏⣾⣮⢼⡿⣞⢾⣟⡈⢚⠻⣿⠿⠧⣻⣟⢽⢿⣭⢽⣛⡿⢿⣿⣿⣿⣟⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠞⠋⡂⠱⠌⠄⣋
⡼⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣦⣉⣿⣱⣿⣿⡆⢁⣼⣾⣿⣇⠀⢀⢉⠰⡆⣿⡼⡌⣼⣿⢸⣿⣷⣾⣤⣿⢤⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⢇⡴⣰⠁⠀⠀⠠⠈
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡫⢱⣶⣶⣿⢯⣏⠑⡞⣀⡜⣸⠂⡀⡹⡴⡼⢻⣿⡿⣿⣿⣿⢿⣷⡿⣫⢽⣷⢿⢿⣿⣿⣿⣿⡿⣵⡟⢞⡐⠂⠅⠂⠁⡀
⣟⣿⣿⣿⣿⠿⢟⣛⢿⣿⣿⣿⣿⢿⡿⣿⡿⣛⣯⣾⡶⢾⡟⣻⢽⣯⡭⡿⣀⣠⠄⢀⢈⢤⢗⣍⢄⠫⡛⢷⢹⣿⣿⣿⠟⣫⣱⣯⣵⣷⢿⣬⣧⣿⠟⣹⡿⠮⢅⡀⠡⠐⠈⠐⠠
⣯⠟⡏⠟⣘⣉⣐⡊⢇⣿⣿⠳⣥⣿⣿⣾⣾⣭⣥⣈⢭⣶⣾⣿⡟⢯⢗⢡⠤⢬⡄⢐⠀⢐⣉⡛⠛⢺⣥⣛⣯⣵⣿⢾⡻⣞⣛⣉⣉⣱⣿⣿⡿⢛⢀⣿⢓⠫⠐⡌⡁⠂⠄⡨⢄
⣯⠉⠴⠙⠈⡐⡤⠿⣆⡽⣧⠯⣿⢷⠟⡽⣻⣿⣿⣿⣿⡮⠛⢯⡍⠥⣥⣗⣛⣓⣶⠦⡾⡘⠷⣜⠟⣢⣰⣼⣿⠋⢡⣶⣿⣿⣿⣿⣿⡿⣿⡿⣾⠇⣼⠏⠊⠅⠃⠤⢀⠃⢂⠡⢎
⡗⡈⠆⡁⠥⠓⡘⠱⢻⡄⠘⠳⣛⣤⣾⣿⣿⣙⢿⣿⣿⣷⢳⠣⣙⡻⢩⢄⢂⣠⢒⡽⣓⠭⢈⢃⣴⢧⣿⣿⡗⠈⣿⣿⣿⣿⣿⣿⣿⡇⢻⠃⢏⣾⡫⠌⣁⠂⠡⢀⠂⠌⣠⠛⡌
⣇⠘⢀⠁⢀⠁⠒⢈⡙⡇⣾⣎⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿⠈⡇⡉⢳⡖⢀⡁⣶⣀⢀⣱⡞⣱⢱⢰⣸⣿⣿⡏⡟⣿⣿⠛⠋⠉⠉⠙⢻⡖⠈⣾⢃⡀⠃⡀⠉⠐⠂⠈⣆⡁⢋⡐
⢎⠄⢂⠈⠠⠐⢀⠡⠀⣿⣿⣿⠛⣿⣿⣿⣿⡿⡗⣻⣿⣟⣴⣭⢞⢦⡙⠶⢲⡮⢻⡻⣇⣿⣿⣟⣴⡼⣿⣿⣎⠷⠨⠀⠀⠀⠰⣭⢙⠆⣶⢰⡏⠣⡐⠂⠄⡁⠂⣈⢞⡰⢍⠲⡐
⠌⢢⠀⠄⡁⠈⠄⠂⢉⢺⢹⣻⢂⣿⠿⠛⠹⠞⣡⣿⣿⣏⠟⣳⣷⣕⢿⠟⣿⣮⣵⣾⣛⡿⣿⣿⣽⣯⢿⣿⣿⣈⠀⠀⠀⢀⡜⡒⢬⢰⣿⣏⠫⠑⠀⠌⠀⢀⡜⡡⢎⠴⡉⢆⠡
⠈⡐⠠⠀⢀⠂⠐⠈⠠⠘⢧⠹⠘⡁⢢⢄⣤⣶⣿⣿⡿⣫⣾⣷⣿⣾⣿⣠⣿⣾⣿⣿⣿⣾⣶⡽⣟⣿⢿⢻⣿⣿⣿⣴⣾⢷⣮⠑⣤⣭⡝⢜⡱⢂⡅⡀⠆⠥⢂⠱⡈⢔⠰⣈⠂
]]

local chopper = [[
⠠⠐⠠⠐⢸⣿⠀⡖⠤⢃⠰⣿⣷⣴⣿⠷⢈⠦⡱⢌⠦⡑⠦⡑⠦⡱⢌⠦⡁⠀
⡀⢁⠂⢡⠈⠛⠰⢌⢣⢃⣨⣾⡿⣿⣦⡘⣌⠲⡡⢎⠒⣍⠲⣉⠖⡡⢎⢒⠁⠀
⣷⣄⣘⡀⠘⠀⣉⠊⡄⡡⢈⡍⢠⢉⡋⢒⡀⠣⠑⢎⡱⢌⠲⡡⢎⡑⢎⠌⠀⠂
⣿⠏⠉⢰⡈⠷⠀⠇⠸⠁⠇⠀⠁⠆⠹⢆⢱⢉⡸⢀⠆⡈⠁⠷⣈⠸⡈⠀⠀⠆
⠁⠄⠒⠀⠁⠀⠀⠠⠀⠀⢀⠂⢀⠀⡀⠀⠀⠀⠁⠉⠊⠁⣍⠒⡌⠡⠁⢀⠈⠀
⠀⠀⠀⠐⠈⠀⠀⣀⡢⣥⣴⣶⣶⣶⣦⣥⣤⢁⡀⠀⠄⠀⠀⠉⠰⣉⠖⣀⠀⢷
⠀⠠⠀⠄⠀⢰⣿⣿⣿⣌⢿⣿⣿⣿⣿⣏⣵⣿⣿⣷⣦⣌⠀⠀⠀⠀⠘⠄⠀⠀
⣧⡄⠀⠀⠂⢸⣷⣘⠻⣿⣿⣿⣿⣿⣿⡿⠻⢛⣋⣥⣿⣿⣿⣦⡀⠈⢀⠀⠀⠀
⣿⣟⡷⡤⠀⣿⣥⣶⣶⣎⠃⢈⣿⣿⣿⣿⣶⣶⣮⣉⣿⣿⣿⣿⣿⣄⠀⠀⠁⡀
⣿⣞⣷⣶⣆⢿⣿⣿⢻⣿⠇⢿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠐⠀⡀
⣿⣾⡉⠉⣿⡈⣿⣿⣶⣶⣿⣷⣶⣉⣹⣷⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠁⠀
⣿⣞⡇⡆⣰⢲⣬⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠅⢠⣴⣶⡆⡒⡜
⣿⣿⡇⠆⢰⣒⣒⣒⣦⠍⠙⠛⠛⠿⠿⠿⠿⠛⠛⠉⠡⣶⣦⣤⣈⡿⠿⣧⠱⣘
⡾⠷⠿⠿⡿⠿⠿⠿⠃⣠⣆⡀⠐⠠⠀⠄⢀⣀⣤⡀⠀⠙⢿⣿⣿⣿⣿⣶⣶⣧
]]

local one2 = [[
⣿⣟⣿⣻⣟⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠉⠉⠛⠂⠀⠀⠀⠀⠀⠀⠀⠈⢰⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣞⣷⣻⢾⣽⡷⣿⣿⣿⣿⣿⣿⠿⠟⠛⠛⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣞⣯⣟⡿⣾⣽⣻⢾⡿⣿⣿⡶⠦⠤⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣷⠯⠓⢋⢿⡷⣯⣟⣯⣿⣷⡏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠹⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠛⢃⠡⣼⢮⡽⣱⣏⣃⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣜⡢⠑⣌⠳⣼⣷⣿⣿⣿⣷⠖⠀⠀⠀⠀⠀⠀⠀⢇⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣳⢮⣴⣭⢷⣻⣷⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠸⣽⣿⡄⠀⡂⠀⠀⠀⢊⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⡘⢏⠹⡙⢿⣻⢿⡿⣿⣿⠟⠀⠀⠀⠀⠀⢰⠀⣺⣿⣿⣿⡄⢸⣧⠀⠀⠘⣷⣂⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣬⣿⣿⣿⣿⣿⣿⢿⣿⣿
⡈⠄⣑⡨⢆⢣⡚⣽⣻⡎⠀⡀⠀⠀⠀⠀⣺⣀⠸⣿⣿⣿⣿⣞⣿⣿⣦⡀⢙⣷⡀⢀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣟⣾⣟⡿⣿
⢠⡛⣬⡓⢎⡱⢜⡹⡷⢠⣾⡇⠀⠀⠀⢀⣿⣯⣾⣮⣟⢿⣿⣿⣿⣟⣵⣾⣾⣿⣷⣸⡄⠀⠀⠀⠀⠀⣀⡙⣿⣿⣿⣿⣿⣿⣽⡾⣽⣻
⠠⡙⢦⡙⢦⡑⢌⡶⣿⣟⣯⠃⠀⠰⡀⣆⣿⡿⠛⠻⢿⣞⡹⣿⣿⣿⣿⠟⣋⣉⣙⣻⡇⡄⢠⠶⡇⠀⢿⣿⣿⣿⣿⣿⣻⣽⡿⣿⣿⣿
⠠⠍⣢⣝⣦⡜⣢⣿⢷⡿⣟⣴⣾⡆⠐⢹⣿⣶⣿⣿⣶⡯⢱⣿⣿⣿⣷⣛⣋⢻⢯⣷⣷⢣⠃⢌⣧⣿⣼⡿⣟⣯⣷⣿⣻⣽⡿⣟⣯⣿
⠐⣤⣟⣾⣳⢿⣻⣞⣯⢿⣻⢾⣽⣷⣣⡊⣿⣿⣿⢿⣿⣷⣮⣿⣿⣿⢿⣿⣿⣷⣿⣿⡟⢋⣠⢞⣪⢛⠷⣻⢟⡿⣞⣷⢿⡳⢿⣻⣽⣻
⠜⣾⡽⣾⣽⣻⢷⣯⣟⣯⣟⡿⣾⣳⠷⢝⠼⣿⣞⠻⢷⣶⣶⣶⣾⣿⣿⣿⣿⢝⣾⡿⠉⠉⣷⢿⡽⠧⣉⢪⣊⠑⠨⢙⡛⣋⢆⡱⢌⠿
⡘⢦⢛⠷⣯⣟⡯⢞⡽⣾⣽⣻⢷⢛⡕⠏⠂⡉⢴⣶⣝⣿⢿⣿⣿⡿⢿⣻⣵⡿⢟⢱⡬⢷⡽⣞⡽⣃⢌⠣⡘⣳⣅⢂⢞⣻⣟⣦⣧⠸
⠐⠌⣎⣷⣻⢾⣽⡻⣜⡷⠯⠛⣉⢤⣤⣎⢈⣄⡴⠎⢝⡻⢿⣭⣭⣿⠿⣛⢍⡚⡄⠈⠙⢤⢻⡼⣣⠈⢢⣁⡱⡘⣞⣎⢻⡝⠋⠗⢩⠆
⣴⣌⣾⣳⢯⡟⢾⣳⢯⣟⡾⢧⢯⢟⡾⣼⣛⣮⢽⠳⠁⠀⣩⠒⣔⢢⠳⣘⠼⣰⣡⠀⠀⠀⠁⢃⡽⢫⢷⡹⢞⡵⣫⢞⢦⠌⡐⠨⠄⠀
⣯⣟⡶⡏⡐⠨⠘⣯⣟⡾⡝⡟⢆⡊⠽⠣⠛⢈⠁⠀⣀⣠⣖⢩⢆⡣⢝⣢⣷⡿⠋⠀⠀⣂⣀⠬⠂⠉⠀⠉⠈⠀⠃⠫⣜⢄⠀⠡⡈⠄
⣟⡾⣽⣓⡠⠁⠂⢭⣼⠛⠁⠀⣸⠿⣯⠀⠀⠠⢈⠀⠘⣍⣛⠙⠢⢬⣉⡝⠛⠒⠈⠉⡁⠠⠀⠀⠄⠂⢁⠂⠁⠌⠀⠄⠀⢺⠀⠄⠁⡀
⣽⢯⢡⣉⢣⢲⡝⡺⠍⠀⠀⣰⣿⣤⡇⠀⠂⢀⠂⢈⠀⣝⠳⣼⡆⢻⠏⠁⡀⠂⠌⠐⠀⠀⠄⠁⢂⠈⡀⠐⠈⡀⠌⠀⠂⠀⠐⡈⢄⠠
⣿⣻⢆⡯⣏⠷⡭⠁⢀⣠⣾⡟⠛⣿⡅⠀⠂⠀⠌⠀⠄⠏⣺⣿⡷⠁⠀⢂⠀⠡⠐⠀⠠⠈⠠⠈⡀⠄⠐⠈⡀⠄⠠⠁⠠⠁⠀⢹⣾⣼
⣷⣻⣤⣻⣽⣻⢢⣾⠟⢻⡿⣷⡆⣿⠇⠀⡁⠀⠂⠁⠄⠘⣿⠋⠀⢀⠂⠄⠈⠀⠀⠄⠁⠄⠁⠀⠄⠀⠀⢂⠀⠄⠂⠀⢁⠀⠂⠀⢿⣾
⣟⡷⣯⢷⣯⢣⣼⡿⣷⣾⠂⠟⠃⠀⠀⠐⠀⠄⠈⠠⠈⠀⠁⠀⡐⠀⠄⠈⠀⢀⠁⠠⠈⢀⠀⠀⠠⠀⠈⠀⠠⠀⠄⠁⡀⠠⠐⠀⠘⣿
⡿⣽⢯⣟⠢⣿⠿⠃⠋⠁⠀⠀⠀⠀⠄⠁⡈⢀⠀⠐⠀⠀⠄⠁⣀⣤⡤⠀⠐⠀⡀⠁⠠⠀⠀⠀⠀⠀⠄⠁⡀⠄⠀⠂⠀⠀⠄⠀⡀⠸
⡿⢽⡻⠂⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠂⠀⠄⠀⡀⠀⠀⠂⠀⣼⡿⢟⣽⠇⠀⠐⠀⡀⠁⠀⠀⠀⠀⠀⠠⠀⢀⠀⠐⠀⠁⡀⠠⠀⠀⠀
]]

local zoro1 = [[
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠹⣛⣛⣯⡸⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⡄⣫⣼⣾⣿⣿⣿⣿⣿⣿⣷⣶⣬⣙⠛⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡿⢳⣤⣾⢿⣿⣯⣉⡱⠻⢝⠽⢻⣿⣿⢻⢿⣿⣯⠘⣿⣿⣿⣿
⣿⣿⣿⣿⣿⠻⢡⣿⣿⡏⢼⣯⠄⠙⣈⢭⢟⢐⠁⣾⠃⠡⣿⣿⣿⣷⣌⢿⣿⣿
⣿⣿⣿⣿⣿⡟⣿⡈⣜⢢⠦⠗⠚⠱⣭⣐⡑⣷⣾⣶⣯⣝⢽⢛⢿⣽⡗⣼⣿⣿
⣿⣿⣿⣿⠇⣧⡵⢐⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢿⣿⣰⡫⣹⡢⣛⠪⣿⣿
⣿⣿⣿⣿⣷⡺⠦⢼⣿⣿⣿⣿⣿⣿⣿⡁⣿⡿⣿⣝⣧⣿⡏⣤⣸⣿⢟⢘⠛⠁
⣿⣿⣿⣿⣿⡜⠷⣅⡇⣿⠿⣿⣿⣿⣿⡇⣿⣗⣻⣿⢘⣛⣿⣷⢻⠓⣥⢸⣦⡀
⣿⣿⣿⣿⣿⣿⡞⣄⡦⣣⣝⡿⠿⣿⡞⡡⠻⠛⠋⠁⠁⠀⠈⣵⠐⡀⡙⢸⣿⡇
⣿⣿⣿⣿⣿⣿⣿⠈⠁⠠⠄⠀⠀⠀⡀⣤⣤⠀⠀⠀⠀⠀⣰⣿⠀⠀⠀⡸⣿⢧
⣿⣿⣿⣿⣿⣿⣿⢡⡀⠠⣤⣤⣤⣴⣿⢹⡿⡿⣖⣦⣶⣾⣝⢿⠄⠀⠕⣼⣿⣿
⣿⣿⣿⣿⠿⠋⠁⢸⣿⡀⢹⣽⣶⣶⣿⣶⣾⣿⣿⠿⣿⡿⢿⣷⣤⣀⡰⣿⡷⣹
⣿⠿⠋⠁⠀⠀⠀⣸⣿⡧⣼⣿⡿⡟⡟⣁⣠⡦⢔⡡⣰⣑⠀⠀⠉⠉⣰⡿⠛⠁
⠀⠀⠀⠀⠀⠀⠀⣟⡯⠚⠉⠠⣁⠀⣾⣴⣾⣭⣷⡾⠿⠃⠀⠀⠀⢠⣏⡀⢀⣴
⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣷⡀⢾⣎⢉⣭⣭⣀⡀⢀⣀⣰⡄⢀⣿⡿⣱⣾⣟
]]

local zoro2 = [[
⣿⣿⣿⣿⣿⠩⠋⠹⢿⣿⠟⣉⡶⢁⣄⡙⠿⣿⣿⣿⡈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣓⣿⣿⡵⢟⣰⡶⠆⣡⣤⠙⢁⠉⢩⣤⣾⢻⡻⣸⢏⣄⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣷⣿⠈⢀⣴⠿⢋⠴⢛⣩⠀⠀⣾⡇⠀⢘⣿⡆⣳⢇⣾⡿⢻⣶⠎⠉⠽⠿⡿⢹⠟⣿⠟⣽⣿⣿⡿⣻⣻⡿⣻⢿⣿⣿⢿⣿⣏⣹⣿⣿
⡿⢋⣴⠋⠁⢨⣴⡆⢻⠃⢰⣼⡷⠃⠀⠩⠙⣗⠟⣼⡿⢡⣿⣷⣴⣞⢁⣠⣴⣤⣌⠙⠘⣿⠛⡚⠺⠾⠾⠿⠩⣚⡽⢷⣿⠃⠠⣾⣿⣿
⡗⠋⠁⣴⠀⡸⡿⣹⡧⠰⠛⠉⠀⠀⠀⠀⢱⢙⢠⣿⣥⣿⣿⣿⣿⣿⡟⣿⣿⣿⡿⣷⣴⡌⠈⡇⣾⠻⣿⡆⡈⠉⡀⡈⠁⠀⠀⠈⣿⣿
⣿⢃⡌⠋⣸⡿⠓⠉⠀⠀⠀⠀⠀⠀⠀⡆⠀⢸⣿⠒⠶⠎⢿⣿⣿⣿⡇⢹⣿⡿⢃⣿⣿⡟⣴⡇⣿⢸⣿⠁⠀⠿⠛⠛⠀⠀⠀⠀⠘⢿
⣋⡼⠛⠀⠀⠀⠀⠀⠀⠀⠀⡄⣰⡄⠰⠀⠀⣼⣿⢠⡈⠓⠜⢿⣿⣿⡇⢸⡏⠀⢣⣾⣿⡇⣿⠁⣾⢸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠁⠀⠀⠀⠀⠀⠀⠀⡀⢠⣾⠇⣿⣗⡄⢧⠀⣿⣿⣷⡙⠦⠤⠘⢿⣿⣇⡘⣀⣴⣿⣿⣿⡇⠃⠈⠻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⡴⢋⡴⡛⣿⢸⣿⣿⣿⣄⠀⣿⣿⣿⣷⣄⣀⡀⠈⠋⢰⠁⢻⡿⠿⠛⠋⠠⠶⠶⢠⣶⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣀⣴⠾⢋⠔⣡⡾⢀⡿⢸⣿⣿⣿⣿⠀⣿⡈⣽⣿⣿⣿⣿⣿⣆⡟⣠⡤⠄⣀⠀⠀⠀⢠⣴⣯⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠐⠊⢉⡀⡄⢠⣾⣿⠃⡼⡅⡀⣀⠂⠈⠁⠀⠙⠣⠈⠻⣿⣿⣿⡿⣸⢱⣿⣷⡘⢿⡿⠱⢋⣸⣿⠇⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀
⣤⣶⣿⡇⢀⣿⣿⡿⠠⢱⡇⣿⣿⣿⣿⡇⢠⢈⢿⣆⢘⡢⣝⣛⠀⠃⣺⣿⣿⣿⡶⠄⠀⢈⣿⠏⠀⠀⠀⠀⠀⠀⠀⡌⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣧⣼⣿⣿⡇⢀⣿⡇⣿⣿⣿⣿⡄⢻⣆⢈⢿⣷⠩⣒⠭⢝⣒⣶⣶⠖⠂⢀⣤⣶⡿⠋⠀⠀⢀⠀⠀⠀⠀⢰⡇⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⡇⣿⣿⣿⣿⡇⢸⣿⡄⢎⢻⣷⣌⠙⠓⠂⢠⣴⣶⣿⡿⠟⠉⢀⠀⠀⠐⠈⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⡇⢸⣿⣿⣌⢷⡍⠛⠿⠷⠸⠿⣛⣋⣥⣴⡶⠟⠁⠀⠀⠀⠀⠀⠀⠌⣼⣿⠀⠀⠀⠀⠀⠀⠀
]]

local logo = [[

                                             
      ████ ██████           █████      ██
     ███████████             █████ 
     █████████ ███████████████████ ███   ███████████
    █████████  ███    █████████████ █████ ██████████████
   █████████ ██████████ █████████ █████ █████ ████ █████
 ███████████ ███    ███ █████████ █████ █████ ████ █████
██████  █████████████████████ ████ █████ █████ ████ ██████

]]

local logo2 = [[
     ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
     ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
     ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
     ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
     ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
     ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

local luffy_nika = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣷⣤⠀⠀⠀⠀⠀⠀⠀⡀⠀⣀⣀⣴⣶⠞⠁⣀⣤⠤⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⠿⣿⣿⡯⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣧⣤⣾⣿⣁⣀⠀⠀⠀⢀⣀⣤⣤⣄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⡏⠁⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⣰⣾⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⠟⠛⠿⣿⣿⣿⣿⣿⣶⣶⣦⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣶⣿⣿⣶⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡉⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⣠⣤⣤⣴⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠛⠛⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⠿⠋⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⠿⠿⣿⣿⣷⣶⣶⣶⣾⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣨⣿⠟⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠃⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⢸⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣤⣤⣶⣿⣷⣄⠀⠀⠀⠀⠸⣿⣿⣷⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠉⢹⣿⣿⠉⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⢿⣿⠇⠀⠀⠀⠀⠀⢸⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⡿⠛⠛⢛⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣸⣿⡁⠀⠀⠀⠀⠀⣸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⠟⠀⠀⠀⠀⠛⠛⠛⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⣠⣤⣴⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠀⢿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⠉⠻⢿⣷⣦⣼⣿⣿⣟⣉⣠⣤⣤⣄⠀⠀⠀⠀⠀
⠀⣠⣄⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⠀⢹⣿⣿⣿⣆⠀⢀⣴⣤⣤⡿⠉⠉⠉⠉⠉⠁⠀⠀⠀⠉⢷⠀⠀⠀⠀
⣼⣿⣿⣦⣤⣀⠀⢸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⣿⣿⣿⣿⣿⠿⠿⢿⣿⠁⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀
⠈⠿⣿⣿⣿⣿⣷⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠘⠛⠛⠋⠁⠀⢰⣿⣷⣶⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠉⢿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⢠⣾⢿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠹⣿⣿⠿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⢰⣿⠏⠀⠈⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣏⠀⠀⠀⢀⣴⡿⠋⠀⠀⠀⠸⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⢿⣿⣿⣿⣿⣷⣶⣶⣿⠟⠁⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠻⠿⠿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]]

-- luffy_smiling dashboard setup
-- {
--   type = "text",
--   val = "⡀⠢⢄⢂⠰⡀⢆⠰⡀⢆⠰⡀⢆⠰⡀⠆⠐⣀⣠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠲⣤⣉⠙⠟⡣⠐⡤⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣾⣦⠑⡌⢢⡱⣌⢆⡱⢈⠦⢁⣤⠶⣛⠭⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣦⣅⠙⠼⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣼⣿⣿⣿⣿⢗⣵⠞⡫⠴⢉⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣷⠀⢸⡄⠀⠀⠀⠀⠐⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠳⣌⠡⢏⡹⠻⣿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⣿⠟⣵⠟⠡⡜⠑⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣇⠈⣿⣄⠀⠀⠀⠀⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠶⡉⠱⢈⢷⣄⢇⡓⢖⣢⡙⠿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⢏⡾⢋⠬⢃⢬⠙⣘⠦⢤⠄⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣦⢻⣿⣦⡀⠀⢠⣿⣿⣧⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⢀⠈⠧⠌⠤⡹⣆⢙⡲⠴⣩⠳⢬⠭⣍⠽",
--   opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⢇⣾⠡⡙⠢⡜⠀⡎⢠⠚⠌⠀⠀⠀⠀⠀⠀⢰⣿⣶⣭⡛⢿⣿⣿⣿⣿⣿⣄⢸⡿⣛⣥⠀⣾⣇⠀⠀⠀⠀⠀⠀⠀⠈⠒⣢⢙⡤⢳⠘⣧⢩⢳⡱⢏⡎⢷⣌⣻",
--   opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⡟⣼⢃⠢⢡⠙⢠⡛⠤⠃⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠿⣛⡛⢷⡙⠻⣿⣿⣿⣿⠋⢊⠿⣛⣓⠿⣿⡄⠀⠀⠀⠀⠀⠀⠀⡴⣐⠯⠜⠃⢇⡹⣆⢫⡵⣻⣚⢷⡺⣼",
--   opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣍⡛⣼⢹⢡⡇⠰⠁⡎⠀⠀⡆⠀⢀⠂⠀⠀⠀⠀⠀⢠⠀⡟⣴⣿⠿⢿⣷⡙⡄⠈⣿⣿⣷⣤⢡⣿⠿⢿⣿⡎⡇⠀⠀⠀⠀⠀⠀⠀⠀⢠⠆⠐⠈⡄⢂⢻⠸⣷⣯⣽⣾⣻⣵",
--   opts = { hl = "NeovimDashboardLogo7", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣌⡳⣬⢳⢸⠃⡓⠸⠀⣡⡆⠘⣆⠀⠀⠀⠀⠸⠈⢆⠘⣆⠡⣿⣯⣄⣠⣿⡧⠐⡠⢸⣿⣿⣇⢿⣿⣀⣴⣿⡿⣠⡏⢀⠞⢓⠀⠀⠀⢀⡎⠀⠀⠀⠐⠨⡌⡇⣿⣿⣟⣾⢿⣽",
--   opts = { hl = "NeovimDashboardLogo8", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣷⣽⢶⢫⢸⠄⡁⢀⣾⣷⣦⠀⠘⢆⠀⠀⠀⠰⠀⠀⢀⢿⣿⣮⣛⣛⣛⣯⣾⣆⠀⠀⢻⣿⣿⣷⠭⢛⠛⠍⡢⣿⠇⠀⠀⡈⠀⠀⢀⡎⠀⠀⠀⠀⠀⠀⠀⣷⢸⣿⢿⣽⣿⣻",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⡟⣮⢳⣯⠸⡆⠀⠀⢻⢣⣿⡀⠀⠘⢆⠀⠀⠀⠑⢤⣀⠸⣇⢩⣝⢛⣛⣛⣛⣛⣛⣒⣛⣛⣛⣛⣻⣥⡬⡆⢠⡾⢀⣀⠔⠀⠀⠀⠞⠀⠀⠀⠀⠀⠀⠡⠀⠙⣸⡿⣯⣷⡿⣽",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣞⣷⣿⣿⡇⠁⠀⢠⣿⢸⣿⣡⠀⠀⠈⢣⡀⠀⠀⠀⠉⠃⢿⣆⠘⠚⠿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠛⠉⢁⣿⠁⠉⠁⠀⠀⢠⠏⠀⠀⠀⠀⠀⠀⠈⡐⠀⠂⠘⣿⣟⣷⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⡾⣯⣷⠟⣰⣶⣶⣿⣿⢸⣿⣿⡆⠀⠐⡀⠑⣄⠀⠀⠀⠀⠀⢻⣦⠀⠄⠀⡀⡄⢤⠠⡤⢠⠄⡠⠀⠀⢀⡾⠃⠀⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⠄⠐⠀⠌⢀⠀⠘⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣻⠍⢸⣿⣿⣿⣿⣿⠘⣿⣿⣿⡄⠐⠀⡀⠈⠑⢄⡀⠀⠀⠀⢉⠻⣮⡒⢤⣭⣂⣓⣈⣃⣬⡥⣒⠴⠋⠀⠀⠀⠀⢠⠜⠁⠀⠀⠀⠀⠀⠠⠈⠀⠀⠌⠀⠄⠈⠀⠘⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣟⠏⠀⠸⣿⢸⡿⠋⠁⠀⠈⢻⣟⣥⠀⠀⡐⠀⠀⠀⠁⠠⢀⠀⠠⠐⡀⠉⠛⠲⠎⣉⠉⠓⠒⠋⡀⠤⠐⠀⠀⢀⠔⠁⠀⠀⠀⠀⠀⠀⡀⠂⠄⠁⠀⡀⠌⠀⠀⠁⠄⠘⢿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⠏⠀⠀⢀⣿⡎⠁⠀⠀⠀⠀⠀⣿⣿⣇⠀⠀⠐⠀⠀⠀⠀⠀⠉⠀⠀⣈⠂⠁⠆⢠⠀⠠⠀⠂⢀⠀⠄⠀⡠⠐⠁⠀⠀⠀⠀⠀⠀⠠⠐⠀⠠⠐⠀⠀⠀⠄⠂⠈⠀⡀⠄⠈⢿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⠀⠀⣼⣿⡇⢠⡀⠀⠀⠀⣼⣿⣿⠿⠀⠀⠀⠀⠀⠈⢀⠀⠀⠀⠀⠀⠁⠐⠀⠄⣈⡡⠀⠈⡀⠄⠐⠀⠀⠀⠀⠀⠀⠀⢀⠠⠈⠀⠀⠀⠀⠐⠀⠀⠀⠠⠀⠀⠄⢀⠀⠂⠀",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },

--bear with gun dashboard setup
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠋⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠈⠉⠉⠙⠛⠛⠻⢿⣿⡿⠟⠁⠀⣀⣴⣿⣿⣿⣿⣿⠟",
--   opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠛⣉⣡⠀⣠⣴⣶⣶⣦⠄⣀⡀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⡿⢃⣾",
--   opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⣾⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣠⣾⡟⢡⣾⣿⣿⣿⡿⢋⣴⣿⡿⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⢡⣾⣿",
--   opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠃⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣼⣿⡟⣰⣿⣿⣿⣿⠏⣰⣿⣿⠟⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢚⣛⢿",
--   opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠸⣿⠟⢰⣿⣿⣿⣿⠃⣾⣿⣿⠏⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣾",
--   opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠻⠻⠃⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢉⣴⣿⣿⣿⣿⡇⠘⣿⣿⠋⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⣿",
--   opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⣿⣿⣿⣿⠁⢀⣀⠀⢀⣾⣿⣿⣿⣿⣿⣿⠟⠉⠉⠉⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌",
--   opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⡿⠁⣀⣤⡀⠀⠈⠻⢿⠀⣼⣿⣷⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo7", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⠟⠛⠙⠃⠀⣿⣿⣿⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠁⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo8", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⠟⠁⢀⣴⣶⣶⣾⣿⣿⣿⣿⣶⡐⢦⣄⠀⠀⠈⠛⢿⣿⣿⣿⣿⡀⠀⠀⠀⠀⢀⣼⡿⢛⣩⣴⣶⣶⣶⣶⣶⣶⣭⣙⠻⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠁⠀⣴⣿⣿⣿⣿⠿⠿⣿⣿⣿⣿⣿⣦⡙⠻⣶⣄⡀⠀⠈⠙⢿⣿⣷⣦⣤⣤⣴⣿⡏⣠⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⠻⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⢸⣿⣿⣿⠋⣠⠔⠀⠀⠻⣿⣿⣿⣿⢉⡳⢦⣉⠛⢷⣤⣀⠀⠈⠙⠿⣿⣿⣿⣿⢸⣿⡄⠻⣿⣿⠟⡈⣿⣿⣿⣿⣿⢉⣿⣧⢹⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⢸⣿⣿⡇⠠⡇⠀⠀⠀⠀⣿⣿⣿⣿⢸⣿⣷⣤⣙⠢⢌⡛⠷⣤⣄⠀⠈⠙⠿⣿⣿⣿⣿⣷⣦⣴⣾⣿⣤⣙⣛⣛⣥⣾⣿⣿⡌⣿⣿⣿⣷⣤⣀⣀⣀⣠⣴⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⢸⣿⣿⣷⡀⠡⠀⠀⠀⣰⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣦⣌⡓⠤⣙⣿⣦⡄⠀⠈⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⢸⣿⣿⣿⣿⣶⣤⣴⣾⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣷⠀⣶⡄⠀⠈⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢃⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⢸⣿⣿⣿⣿⣿⠟⠻⣿⣿⡏⣉⣭⣭⡘⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⡇⢸⡇⢠⡀⠈⠙⠋⠉⠉⠉⠉⠛⠫⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⢸⣿⣿⠛⣿⣿⣀⣀⣾⡿⢀⣿⣿⣿⢻⣷⣦⢈⡙⠻⢿⣿⣿⣿⣿⣿⣿⣿⠀⣿⡇⢸⡇⢸⣿⠀⣦⠀⠀⠶⣶⣦⣀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⢸⣿⣿⣦⣈⡛⠿⠟⣋⣤⣾⣿⣿⣿⣸⣿⣿⢸⡇⢰⡆⢈⡙⠻⢿⣿⣿⣿⠀⢿⡇⢸⡇⢸⣿⢠⣿⡇⣿⡆⢈⡙⠻⠧⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⠀⣝⠛⢿⣿⣿⣿⣿⣿⣿⠟⣁⠀⠀⢈⠛⠿⢸⣇⢸⡇⢸⡇⣶⣦⣌⡙⠻⢄⡀⠁⠘⠇⠘⣿⢸⣿⡇⣿⡇⢸⡛⠷⣦⣄⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
--

-- Zoro Moustache
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠹⣛⣛⣯⡸⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⡄⣫⣼⣾⣿⣿⣿⣿⣿⣿⣷⣶⣬⣙⠛⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⡿⢳⣤⣾⢿⣿⣯⣉⡱⠻⢝⠽⢻⣿⣿⢻⢿⣿⣯⠘⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⠻⢡⣿⣿⡏⢼⣯⠄⠙⣈⢭⢟⢐⠁⣾⠃⠡⣿⣿⣿⣷⣌⢿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⡟⣿⡈⣜⢢⠦⠗⠚⠱⣭⣐⡑⣷⣾⣶⣯⣝⢽⢛⢿⣽⡗⣼⣿⣿",
--   opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⠇⣧⡵⢐⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢿⣿⣰⡫⣹⡢⣛⠪⣿⣿",
--   opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣷⡺⠦⢼⣿⣿⣿⣿⣿⣿⣿⡁⣿⡿⣿⣝⣧⣿⡏⣤⣸⣿⢟⢘⠛⠁",
--   opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⡜⠷⣅⡇⣿⠿⣿⣿⣿⣿⡇⣿⣗⣻⣿⢘⣛⣿⣷⢻⠓⣥⢸⣦⡀",
--   opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⡞⣄⡦⣣⣝⡿⠿⣿⡞⡡⠻⠛⠋⠁⠁⠀⠈⣵⠐⡀⡙⢸⣿⡇",
--   opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⠈⠁⠠⠄⠀⠀⠀⡀⣤⣤⠀⠀⠀⠀⠀⣰⣿⠀⠀⠀⡸⣿⢧",
--   opts = { hl = "NeovimDashboardLogo7", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⢡⡀⠠⣤⣤⣤⣴⣿⢹⡿⡿⣖⣦⣶⣾⣝⢿⠄⠀⠕⣼⣿⣿",
--   opts = { hl = "NeovimDashboardLogo7", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⠿⠋⠁⢸⣿⡀⢹⣽⣶⣶⣿⣶⣾⣿⣿⠿⣿⡿⢿⣷⣤⣀⡰⣿⡷⣹",
--   opts = { hl = "NeovimDashboardLogo8", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⠿⠋⠁⠀⠀⠀⣸⣿⡧⣼⣿⡿⡟⡟⣁⣠⡦⢔⡡⣰⣑⠀⠀⠉⠉⣰⡿⠛⠁",
--   opts = { hl = "NeovimDashboardLogo8", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⠀⠀⠀⠀⠀⠀⣟⡯⠚⠉⠠⣁⠀⣾⣴⣾⣭⣷⡾⠿⠃⠀⠀⠀⢠⣏⡀⢀⣴",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣷⡀⢾⣎⢉⣭⣭⣀⡀⢀⣀⣰⡄⢀⣿⡿⣱⣾⣟",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },

-- Zoro Wano
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⠩⠋⠹⢿⣿⠟⣉⡶⢁⣄⡙⠿⣿⣿⣿⡈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣓⣿⣿⡵⢟⣰⡶⠆⣡⣤⠙⢁⠉⢩⣤⣾⢻⡻⣸⢏⣄⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
--   opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣷⣿⠈⢀⣴⠿⢋⠴⢛⣩⠀⠀⣾⡇⠀⢘⣿⡆⣳⢇⣾⡿⢻⣶⠎⠉⠽⠿⡿⢹⠟⣿⠟⣽⣿⣿⡿⣻⣻⡿⣻⢿⣿⣿⢿⣿⣏⣹⣿⣿",
--   opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⡿⢋⣴⠋⠁⢨⣴⡆⢻⠃⢰⣼⡷⠃⠀⠩⠙⣗⠟⣼⡿⢡⣿⣷⣴⣞⢁⣠⣴⣤⣌⠙⠘⣿⠛⡚⠺⠾⠾⠿⠩⣚⡽⢷⣿⠃⠠⣾⣿⣿",
--   opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⡗⠋⠁⣴⠀⡸⡿⣹⡧⠰⠛⠉⠀⠀⠀⠀⢱⢙⢠⣿⣥⣿⣿⣿⣿⣿⡟⣿⣿⣿⡿⣷⣴⡌⠈⡇⣾⠻⣿⡆⡈⠉⡀⡈⠁⠀⠀⠈⣿⣿",
--   opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⢃⡌⠋⣸⡿⠓⠉⠀⠀⠀⠀⠀⠀⠀⡆⠀⢸⣿⠒⠶⠎⢿⣿⣿⣿⡇⢹⣿⡿⢃⣿⣿⡟⣴⡇⣿⢸⣿⠁⠀⠿⠛⠛⠀⠀⠀⠀⠘⢿",
--   opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣋⡼⠛⠀⠀⠀⠀⠀⠀⠀⠀⡄⣰⡄⠰⠀⠀⣼⣿⢠⡈⠓⠜⢿⣿⣿⡇⢸⡏⠀⢣⣾⣿⡇⣿⠁⣾⢸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--   opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠁⠀⠀⠀⠀⠀⠀⠀⡀⢠⣾⠇⣿⣗⡄⢧⠀⣿⣿⣷⡙⠦⠤⠘⢿⣿⣇⡘⣀⣴⣿⣿⣿⡇⠃⠈⠻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--   opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⠀⠀⠀⠀⣀⡴⢋⡴⡛⣿⢸⣿⣿⣿⣄⠀⣿⣿⣿⣷⣄⣀⡀⠈⠋⢰⠁⢻⡿⠿⠛⠋⠠⠶⠶⢠⣶⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--   opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠀⠀⣀⣴⠾⢋⠔⣡⡾⢀⡿⢸⣿⣿⣿⣿⠀⣿⡈⣽⣿⣿⣿⣿⣿⣆⡟⣠⡤⠄⣀⠀⠀⠀⢠⣴⣯⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--   opts = { hl = "NeovimDashboardLogo7", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⠐⠊⢉⡀⡄⢠⣾⣿⠃⡼⡅⡀⣀⠂⠈⠁⠀⠙⠣⠈⠻⣿⣿⣿⡿⣸⢱⣿⣷⡘⢿⡿⠱⢋⣸⣿⠇⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀",
--   opts = { hl = "NeovimDashboardLogo7", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣤⣶⣿⡇⢀⣿⣿⡿⠠⢱⡇⣿⣿⣿⣿⡇⢠⢈⢿⣆⢘⡢⣝⣛⠀⠃⣺⣿⣿⣿⡶⠄⠀⢈⣿⠏⠀⠀⠀⠀⠀⠀⠀⡌⠀⠀⠀⠀⠀⠀",
--   opts = { hl = "NeovimDashboardLogo8", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣧⣼⣿⣿⡇⢀⣿⡇⣿⣿⣿⣿⡄⢻⣆⢈⢿⣷⠩⣒⠭⢝⣒⣶⣶⠖⠂⢀⣤⣶⡿⠋⠀⠀⢀⠀⠀⠀⠀⢰⡇⠀⠀⠀⠀⠀⠀",
--   opts = { hl = "NeovimDashboardLogo8", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⡇⣿⣿⣿⣿⡇⢸⣿⡄⢎⢻⣷⣌⠙⠓⠂⢠⣴⣶⣿⡿⠟⠉⢀⠀⠀⠐⠈⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },
-- {
--   type = "text",
--   val = "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⡇⢸⣿⣿⣌⢷⡍⠛⠿⠷⠸⠿⣛⣋⣥⣴⡶⠟⠁⠀⠀⠀⠀⠀⠀⠌⣼⣿⠀⠀⠀⠀⠀⠀⠀",
--   opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center" },
-- },

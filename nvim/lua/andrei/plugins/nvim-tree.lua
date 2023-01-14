-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

local icons = require("andrei.icons")

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
  -- change folder arrow icons
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  renderer = {
        indent_markers = {
          enable = false,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            none = " ",
          },
        },
        icons = {
          webdev_colors = true,
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
          glyphs = {
            default = icons.ui.Text,
            symlink = icons.ui.FileSymlink,
            git = {
              deleted = icons.git.FileDeleted,
              ignored = icons.git.FileIgnored,
              renamed = icons.git.FileRenamed,
              staged = icons.git.FileStaged,
              unmerged = icons.git.FileUnmerged,
              unstaged = icons.git.FileUnstaged,
              untracked = icons.git.FileUntracked,
            },
            folder = {
              default = icons.ui.Folder,
              empty = icons.ui.EmptyFolder,
              empty_open = icons.ui.EmptyFolderOpen,
              open = icons.ui.FolderOpen,
              symlink = icons.ui.FolderSymlink,
            },
          },
        },-- disable window_picker for
      },
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  -- 	git = {
  -- 		ignore = false,
  -- 	},
})

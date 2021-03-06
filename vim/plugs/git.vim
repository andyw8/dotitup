" ### tpope/vim-fugitive
"
" | Instruction                 | Description                                                           |
" | ---                         | ---                                                                   |
" | `:Gedit [thing]`            | [thing] can be a commit,                                              |
" |                             | blob, tree or tag (to view the commit etc)                            |
" | `:Gstatus` / `<leader>gs`   | displays a buffer with git status.                                    |
" |                             | use `-` on filename to add / reset from staging                       |
" | `:Gcommit` / `<leader>gc`   | will commit staged changes (with buffer for                           |
" |                             | commit message)                                                       |
" | `:Gblame` / `<leader>gb`    | vertical buffer to show git blame results                             |
" | `:Gvdiff` / `<leader>gd`    | vertical split buffer to show diff                                    |
" | `:Gdelete!` / `<leader>grm` | runs git rm on file and deletes the buffer                            |
" | `:Glog`                     | displays git log for current buffer in the quickfix                   |
" |                             | can be used with visual mode, highlight a function and `:Glog` to see |
" |                             | how it changes over time!                                             |
" | `:Gmove`                    | runs git mv on file and renames the buffer                            |
" | `:Gread`                    | a variant of `git checkout -- filename` but on the buffer             |
" | `:Gbrowse`                  | view current file in github                                           |
" |                             | - also works with visual mode                                         |
" | `:Git`                      | for any git command e.g. `:Git status`                                |
" ###
Plug 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gvdiff<CR> " always split vertically
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :AsyncOpenRun git push origin HEAD<CR>
nnoremap <silent> <leader>gw :Gwrite<CR> " adds the current file
nnoremap <silent> <leader>ga :Gwrite<CR> " to make it feel like git add
nnoremap <silent> <leader>grm :Gdelete!<CR>

nnoremap <silent> <Leader>dg :diffget<CR>
nnoremap <silent> <Leader>dp :diffput<CR>

Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-git'

" ### airblade/vim-gitgutter 
" displays git diffs in the gutter (near line numbers)
"
" short cuts:
"
" | Instruction   | Description                |
" | ---           | ---                        |
" | `<leader>hp`  | preview hunk               |
" | `<leader>hs`  | stage hunk                 |
" | `<leader>hu`  | undo hunk                  |
" | `[c` and `]c` | navigate to prev/next hunk |
" ###
Plug 'airblade/vim-gitgutter'

" ### gregsexton/gitv
"
" | Instruction | Description             |
" | ---         | ---                     |
" | `:Gitv`     | to see a visual git log |
" ###
Plug 'gregsexton/gitv', {'on': ['Gitv']}

Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'


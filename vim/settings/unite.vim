" ---
" Unite

let g:unite_source_history_yank_enable     = 1
let g:unite_source_rec_max_cache_files     = 0
let g:unite_matcher_fuzzy_max_input_length = 50
let g:unite_source_rec_unit                = 100
let g:unite_update_time                    = 200
let g:unite_cursor_line_highlight          = 'TabLineSel'

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async', 'converters', [])
" call unite#custom#source('file_rec/async', 'sorters', [])
call unite#custom#source('file_rec/async', 'max_candidates', 20)

" dont' care if ag is install or not, we're going to use it.
" let's be smart let's use git when it's there, and ag when not.
let g:unite_source_rec_async_command  = 'git ls-files --cached --exclude-standard --others . 2> /dev/null || ag --follow --nogroup --nocolor -l -g "" !'
let g:unite_source_grep_command       = 'ag'
let g:unite_source_grep_default_opts =
      \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
      \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

nnoremap <C-p> :<C-u>Unite -resume -no-split -buffer-name=files -start-insert -auto-preview file_rec/async<CR>
nnoremap <leader>. :<C-u>Unite -no-split -buffer-name=tags -auto-preview -start-insert tag<cr>

nnoremap <leader>bs :Unite -no-split -start-insert -buffer-name=buffers buffer file_mru directory_mru<cr>
nnoremap <leader>be :Unite -no-split -start-insert -buffer-name=buffers buffer file_mru directory_mru<cr>

nnoremap <leader>yr :Unite -no-split -buffer-name=yanks history/yank<cr>
nnoremap <silent> <leader>us :<C-u>Unite -no-split -buffer-name=snippets ultisnips<CR>

nnoremap <silent> <leader>uh :<C-u>Unite -buffer-name=help help<CR>
nnoremap <silent> <leader>ul :<C-u>Unite -no-split -start-insert -buffer-name=search_file line<CR>

nnoremap <leader>/ :<C-u>Unite -no-split -auto-preview -buffer-name=grep grep:.<cr>
nnoremap K :<C-u>Unite -buffer-name=grep -auto-preview grep:.::<C-r><C-w><CR>
nnoremap KK :<C-u>Unite -buffer-name=grep -auto-preview grep:.::"\b<C-r><C-w>\b"<CR>
nnoremap <leader>./ :<C-u>UniteResume -buffer-name=grep<CR>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  nmap <buffer> <TAB>   <Plug>(unite_loop_cursor_down)
  nmap <buffer> <S-TAB> <Plug>(unite_loop_cursor_up)
  imap <buffer> <Tab>   <Plug>(unite_insert_leave)

  imap <buffer> <C-c> <Plug>(unite_exit)
  nmap <buffer> <C-c> <Plug>(unite_exit)

  imap <buffer> <C-w> <Plug>(unite_delete_backward_word)
  imap <buffer> <C-u> <Plug>(unite_delete_backward_path)

  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)

  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  inoremap <silent><buffer> <C-s> unite#do_action('split')
  nnoremap <silent><buffer> <C-s> unite#do_action('split')
endfunction

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'files/',
      \ 'log/',
      \ 'vendor/cache',
      \ 'vendor/gems',
      \ 'vendor/rails',
      \ 'vim/bundle/',
      \ 'vim/sessions/',
      \ 'vim/backups/',
      \ 'tmp/',
      \ '.sass-cache',
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'dist/',
      \ '.pyc',
      \ '.jpg',
      \ '.png',
      \ '.gif',
      \ '.pdf',
      \ '.zip',
      \ '.swf',
      \ ], '\|'))

" Set "-no-quit" automatically in grep unite source.
call unite#custom#profile('source/grep', 'context', {
\   'no_quit' : 1
\ })
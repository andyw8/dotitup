" use ag as the grepping program if is exists
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
  " command -nargs=+ -complete=file -bar Ag silent grep! <args>|cwindow|redraw!

" Search shortcuts

" Fzf search <leader>\ (note the backslack)
nnoremap <leader>\ :<C-u>FzfAg<SPACE>

" Fzf Search for word under cursor
nnoremap L :<C-u>FzfAg <C-R><C-W><CR>

function! DotGrep(search)
  try
    AsyncStop!
  finally
    copen
    cexpr system("echo loading...")
    while g:asyncrun_status == "running"
      sleep 100m
    endwhile
    let l:eformat = &errorformat
    let &errorformat = '%f:%l:%c:%m'
    exec 'AsyncRun! ag --vimgrep ' . a:search
    let &errorformat = l:eformat
  endtry
endfunction
command -nargs=+ -complete=file -bar DotGrep silent call DotGrep('<args>')

" DotGrep search <leader>/
nnoremap <leader>/ :<C-u>DotGrep<SPACE>

" Search for word under cursor
nnoremap K :<C-u>let cmd = 'DotGrep "\b<C-R><C-W>\b"' <bar> call histadd("cmd", cmd) <bar> execute cmd<CR>

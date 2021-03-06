" LinterとFixerの設定
let g:ale_linters = {
    \ 'python': ['flake8'],
    \ 'markdown': ['markdownlint'],
    \ 'go': ['golint'],
    \ 'html': ['tidy'],
    \ 'javascript': ['eslint'],
    \ 'typescript': ['eslint'],
\}
let g:ale_fixers = {
    \ 'python': ['autopep8', 'black', 'isort'],
    \ 'markdown': ['remark'],
    \ 'go': ['goimports'],
    \ 'html': ['tidy'],
    \ 'javascript': ['eslint'],
    \ 'typescript': ['eslint'],
\}
" 各ツールの実行オプションを変更してPythonパスを固定
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'
" 表示設定
let g:ale_fix_on_save = 0
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <Leader>x <Plug>(ale_fix)

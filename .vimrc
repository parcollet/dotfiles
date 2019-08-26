"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  My .VIMRC 	\O/						"
"								"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------- Load plugins ------------------------------------------{{{

call plug#begin()

Plug 'vim-scripts/GrepCommands'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Latex-Box-Team/Latex-Box'
Plug 'scrooloose/nerdcommenter'
Plug 'chrisbra/Recover.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'altercation/vim-colors-solarized'
Plug 'derekwyatt/vim-fswitch'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'tpope/vim-fugitive'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()
"}}}
"-------------------------------------- General Settings ------------------------------------------{{{

syntax on			" Syntax highlighting on
filetype plugin indent on	" Indenting globally on
set shiftwidth=2		" Set indent shift
set backspace=2			" Make backspace work normally
set nomore			" Do not prompt for 'more'


" My Status Line
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2		" Always display status bar
set hidden			" Can hide changed buffers!
set number 			" Show line numbers

"-------------------------------------- CUSTOM COMMANDS ------------------------------------------

" Insert templates
:command! Ttest		:r ~/.vim/templates/test.cpp
:command! TtestF	:r ~/.vim/templates/test_F.cpp
:command! Tpytest	:r ~/.vim/templates/test.py
:command! TCMake	:r ~/.vim/templates/CMakeLists.txt
:command! Ttex		:r ~/.vim/templates/templ.tex

"Command Make will call make and then open quickfix window
autocmd BufReadPost quickfix AnsiEsc
"set makeprg=$HOME/bin/pymake
set makeprg=make
:command! -nargs=* Make :make -j 60 <args> | cwindow 15
"}}}
"-------------------------------------- Key Mappings ------------------------------------------{{{

" rebind leader key and escape
let mapleader = ","
"inoremap ;; <Esc>
"vnoremap ;; <Esc>

" easy copy/pase to clipboard
vnoremap <leader><leader>y 	"*y
nnoremap <leader><leader>p 	"*p
vnoremap <leader><leader>p 	"*p

" simple scrolling through file
nnoremap ;j 	<C-D>
nnoremap ;k 	<C-U>
vnoremap ;j 	<C-D>
vnoremap ;k 	<C-U>

" change window mode mappings
noremap <leader><leader> 	<C-W>
noremap <leader><leader>s	<C-W>s
noremap <leader><leader>v	<C-W><C-V>
noremap <leader><leader>x	<C-W>c
noremap <leader><leader>c	<C-W>x

" comment insertions
nmap <Leader>chl 	:CommLineSmall<cr>
nmap <Leader>ctl 	:CommTLineSmall<cr>
nmap <Leader>Chl 	:CommLine<cr>
nmap <Leader>Ctl 	:CommTLine<cr>
"nmap <Leader>dc 	:DoxComm<cr>

" automatically add closing brackets
"inoremap {      {}<Left>
"inoremap {<cr>  {<cr>}<Esc>O
"inoremap {{     {
"inoremap {}     {}

"Just press F5 to make your program:
map <F5> :Make run<cr><cr><cr>
autocmd Syntax c,cpp map <buffer> 'll :Make -s -C build<cr><cr><cr>

";n for next error
nnoremap ;n	:cn<cr>
nnoremap ;p	:cp<cr>

" create and goto file under cursor
map <leader>gf :e <cfile><cr>

" reload vimrc and automatically do so if .vimrc saved
nmap <Leader>vrc :so $MYVIMRC<cr>
autocmd! bufwritepost .vimrc source %

" search highlighting on / off
nnoremap ;h	:set hlsearch!<cr>

" replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"-------------------------------------- FILE TYPE AUTOCOMMANDS ------------------------------------------


"-------------------------------------- FOLDING  ------------------------------------------
"-------------------------------------- General Coding Config ------------------------------------------{{{
"
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'cpp': ['clangd'],
    \ }

" --- Language Server Bindings
autocmd Syntax c,cpp,python nnoremap <buffer> <C-]> :call LanguageClient#textDocument_definition()<CR>
autocmd Syntax c,cpp,python vnoremap <buffer> <C-]> :call LanguageClient#textDocument_definition()<CR>
autocmd Syntax c,cpp,python nnoremap <buffer> <C-h> :call LanguageClient#textDocument_rename()<CR>
autocmd Syntax c,cpp,python vnoremap <buffer> <C-h> :call LanguageClient#textDocument_rename()<CR>

" --- Code Completion
set omnifunc=syntaxcomplete#Complete
set completefunc=LanguageClient#complete
set wildmenu
inoremap <C-n> <C-x><C-o>
let g:LanguageClient_autoStart = 1
let g:LanguageClient_hoverPreview = 'auto'
let g:LanguageClient_diagnosticsEnable = 1
"}}}

"autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax 	" Enable Syntax folding
"autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR			" Start unfolded

"-------------------------------------- CPP SPECIFIC STUFF ------------------------------------------

" --- Config for clang-format plugin
nnoremap == :ClangFormat<cr>
vnoremap == :ClangFormat<cr>
" Specify command in shell
let g:clang_format#command = '/usr/local/opt/llvm/bin/clang-format'

" Detect and apply style-file .clang-format or _clang-format
let g:clang_format#detect_style_file = 1

au BufNewFile,BufRead *.?pp so ~/.vim/cpp_abb.vim
au BufNewFile,BufRead *.m?pp so ~/.vim/cpp_abb.vim
au BufNewFile,BufRead *.m?pp set filetype=cpp
au BufNewFile,BufRead *.?pp set syntax=cpp11

" match pairs of < and >
autocmd FileType cpp set mps+=<:>
" set up file switch for fswitch plugin
au! BufEnter *.cpp let b:fswitchdst = 'hpp' "| let b:fswitchlocs = '../include'
au! BufEnter *.h let b:fswitchdst = 'cpp' "| let b:fswitchlocs = '../src'

" --- FSwitch bindings
" Switch to the file and load it into the current window >
nmap <silent> <Leader>of :FSHere<cr>
"Switch to the file and load it into the window on the right >
nmap <silent> <Leader>ol :FSRight<cr>
"Switch to the file and load it into a new window split on the right >
nmap <silent> <Leader>oL :FSSplitRight<cr>
"Switch to the file and load it into the window on the left >
nmap <silent> <Leader>oh :FSLeft<cr>
"Switch to the file and load it into a new window split on the left >
nmap <silent> <Leader>oH :FSSplitLeft<cr>
"Switch to the file and load it into the window above >
nmap <silent> <Leader>ok :FSAbove<cr>
"Switch to the file and load it into a new window split above >
nmap <silent> <Leader>oK :FSSplitAbove<cr>
"Switch to the file and load it into the window below >
nmap <silent> <Leader>oj :FSBelow<cr>
"Switch to the file and load it into a new window split below >
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf = 'Skim'

set shellslash
set grepprg=grep\ -nH\ $*
set winaltkeys=no
set nu
set tw=0
set sw=1
set fo-=t "disable autowrap
set tabstop=8
set enc=utf-8
set autochdir

" my commands
command! CleanConstRef %s/const\s*\([^\&]\+\)\s*&\s*\(\<\w*\>\)\s*/\1 const \&\2/gc
command! ReplaceTypeByUsing %s/typedef\s*\(.*\)\s*\(\<\w*\>\)\s*;/using \2=\1;/gc
command! ReplDecay %s/typename std::remove_const<typename std::remove_reference<\(.*\)>::type>::type/std14::decay_t<\1>/gc
command! ReplDR %s/auto \(.*\)\_s*DECL_AND_RETURN(\(.*\));/decltype(auto) \1 { return \2;}/gc
command! Repl14Type %s/typename std::remove_reference<\(.*\)>::type/std14::remove_reference_t<\1>/ge | %s/typename std::result_of<\(.*\)>::type/std14::result_of_t<\1>/ge  | %s/typename std::remove_const<\(.*\)>::type/std14::remove_const_t<\1>/ge | %s/typename std::decay<\(.*\)>::type/std14::decay_t<\1>/ge| %s/typename std::enable_if<\(.*\)>::type/std14::enable_if_t<\1>/ge


let g:clang_rename_path = '/usr/local/Cellar/llvm/3.9.1/bin/clang-rename'
noremap <leader>cr :pyf /Users/parcolle/CLANG/llvm/tools/clang/tools/extra/clang-rename/tool/clang-rename.py<cr>


" Fold Copyright in Python
function! CreateCopyrightFold(com)
    let InCopyright = 0
    set foldmethod=manual
    for Line in range(1,line('$'))
        let LineContents = getline(Line)
        if LineContents !~ a:com
            if InCopyright
                let CopyrightEnd = Line - 1
                exe CopyrightStart . ',' . CopyrightEnd . 'fold'
            endif
            break
        elseif LineContents =~ "Copyright"
            let InCopyright = 1
            let CopyrightStart = 0 " Line
        endif
    endfor
endfunction

au BufRead *.py call CreateCopyrightFold('^#')
au BufRead *.cpp call CreateCopyrightFold('^\s*/*\*')
au BufRead *.hpp call CreateCopyrightFold('^\s*/*\*')

" remove trailing spaces
"
" autocmd BufWritePre * %s/\s\+$//e



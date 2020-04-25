"----------------------
"  1.常规设置
"-----------------------

"""""""""""""""Basics
set nocompatible" Must be first line

"""""""""""""""General
filetype plugin indent on   " Automatically detect file types.
set omnifunc=syntaxcomplete#Complete
syntax on   " Syntax highlighting
set mouse=a " Automatically enable mouse usage
set mousehide   " Hide the mouse cursor while typing
" 禁止光标闪烁
set gcr=a:block-blinkon0

set gfn=Monaco:h12

" 代码折叠
set foldmethod=indent
set nofoldenable
set foldlevel=99

"autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
"set shortmess+=filmnrxoOtT  " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set history=1000" Store a ton of history (default is 20)
"set spell   " Spell checking on
set hidden  " Allow buffer switching without saving

"set register can use system register
if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif

"""""""""""""""Vim UI
set tabpagemax=15   " Only show 15 tabs
set showmode " Display the current mode

"set cursorline  " Highlight current line
set cursorcolumn

highlight clear SignColumn  " SignColumn should match background
highlight clear LineNr  " Current line number row will have same background color in relative mode

"if has('cmdline_info')
"   set ruler   " Show the ruler
"   set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
"   set showcmd " Show partial commands in status line and
"endif

if has('statusline')
   set laststatus=2
   " Broken down into easily includeable segments
   set statusline=%<%f\ " Filename
   set statusline+=%w%h%m%r " Options
   set statusline+=\ [%{&ff}/%Y]" Filetype
   set statusline+=\ [%{getcwd()}]  " Current dir
   set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set backspace=indent,eol,start  " Backspace for dummies
"set linespace=0 " No extra spaces between rows
set nu  " Line numbers on
set showmatch   " Show matching brackets/parenthesis
set incsearch   " Find as you type search
set hlsearch" Highlight search terms
set ignorecase  " Case insensitive search
set smartcase   " Case sensitive when uc present
set wildmenu    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5" Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set foldenable  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

"""""""""""""""""""""Formatting
set nowrap  " Do not wrap long lines
set linebreak
set autoindent  " Indent at the same level of the previous line
set shiftwidth=4 " Use indents of 4 spaces
set expandtab   " Tabs are spaces, not tabs
set tabstop=4   " An indentation every four columns
set softtabstop=4   " Let backspace delete indent
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set splitright  " Puts new vsplit windows to the right of the current
set pastetoggle=<F12>   " pastetoggle (sane indentation on pastes)
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd BufNewFile,BufRead *.ftl.shtml set filetype=html
autocmd BufNewFile,BufRead *.rkt,*rktl set filetype=racket
autocmd BufNewFile,BufRead *.asm set filetype=masm
autocmd BufNewFile,BufRead *.j set filetype=jass
autocmd BufNewFile,BufRead *.css,*.scss,*.less set filetype=css
autocmd BufNewFile,BufRead *.js,*.jsx,*.mpx,*.json set filetype=javascript
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.vue setlocal filetype=vue.html.javascript.css
autocmd FileType haskell,puppet,ruby,yml,javascript,css,html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
au filetype racket set lisp
" preceding line best in a plugin but here for now.

autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Workaround vim-commentary for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell,rust setlocal nospell

" regular expressions
set magic

""""""""""""""""""""Key Mappings

"把ESC映射为jj键
"imap jj <Esc><Right>

"配置<Leader>键
let mapleader=","
let g:mapleader=","
"重复倒退搜索f
noremap \ ,

" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>

"smart way to move between window
map <C-j> <C-W><C-j>
map <C-k> <C-W><C-k>
map <C-h> <C-W><C-h>
map <C-l> <C-W><C-l>

" tab操作
" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>


"""""""""""""""""""""fileencoding setting
set encoding=utf-8
set fenc=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn

set termencoding=utf-8

"-----------------------
"  2.插件设置
"-----------------------

" 此处必须先off vundle会影响UltiSnips插件加载对应文件类型的(如html.snippets)
" 然后在vundle插件配置完毕之后加上: (见194/195行) 1.filetype plugin indent on 2.syntax on

" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

" let Vundle manage Vundle 
" " required!
" 这是Vundle本身的设置
" Bundle 'gmarik/vundle'
"
" plug manage
call plug#begin('~/.vim/bundle')

" 这是我的插件设置
" original repos on github

" General
Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'w0ng/vim-hybrid'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
Plug 'Sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-expand-region'
Plug 'tmhedberg/matchit'
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim'
"Plug 'tpope/vim-fugitive'
"Plug 'winmanager'
"Plug 'bufexplorer.zip'

" python
" Plug 'klen/python-mode'
" Plug 'pythoncomplete'

" Scala
"Plug 'derekwyatt/vim-scala'
"Plug 'derekwyatt/vim-sbt'
"Plug 'xptemplate'

" Javascript
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
"Plug 'briancollins/vim-jst'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'posva/vim-vue'
Plug 'ternjs/tern_for_vim'
"Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

" Html
Plug 'docunext/closetag.vim'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'amirh/HTML-AutoCloseTag'
"Plug 'gorodinskiy/vim-coloresque'
"Plug 'tpope/vim-haml'

" go
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'

" Markdown
Plug 'suan/vim-instant-markdown'

" jass
Plug 'gu-fan/jass.vim'

call plug#end()

syntax on

" vim-go设置

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

set autowrite
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>n :cnext<CR>
autocmd FileType go nmap <leader>m :cprevious<CR>
autocmd FileType go nmap <leader>a :cclose<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>l :GoMetaLinter<CR>
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd BufNewFile,BufRead *.go setlocal expandtab tabstop=4 shiftwidth=4
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"let g:go_metalinter_autosave = 1
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
let g:go_decls_includes = "func,type"
"let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

""F8显示或者关闭taglist串口
"nnoremap <silent> <F8> :TlistToggle<CR>
"""""""""""""""""""""""""""""vim-json插件
let g:vim_json_syntax_conceal = 0     "disable syntax conceal

"""""""""""""""""""""""""""""ctags插件
set tags+=~/.vim/cpptags
set tags+=~/.vim/systags

"""""""""""""""""""""""""""""tagbar插件
nmap <silent> <F8> :TagbarToggle<CR>
"打开自动跳转到tagbar窗口
let g:tagbar_autofocus = 1

"""""""""""""""""""""""""""""easyMotion插件
let g:EasyMotion_smartcase = 1
" let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <leader><leader>h <Plug>(easymotion-linebackward)
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)
map <leader><leader>l <Plug>(easymotion-lineforward)

""""""""""""""""""""""""""""coc插件
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

""""""""""""""""""""""""""""YouCompleteMe插件
"自动补全
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascrīpt set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType masm set omnifunc=masmcomplete#Complete

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<down>', '<C-k>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<up>', '<C-j>']
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_python_binary_path = 'python'

" set completeopt-=preview "no preview window
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" 跳转到定义处, 分屏打开
"let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

" 引入，可以补全系统
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif

"""""""""""""""""""""""""""Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets = '<C-Tab>'
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""color solarized
"colorscheme onedark
"let g:airline_theme='onedark'
"let g:onedark_termcolors=16
set background=dark
"colorscheme solarized
"let g:rehash256 = 1
"let g:molokai_original = 1
"colorscheme molokai
"colorscheme monokai
"colorscheme dracula
colorscheme desert
"colorscheme github
"

""""""""""""""""""""""""""""pydiction插件
"设置查找所有的字典路径
"let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict'

"""""""""""""""""""""""""""syntastic插件
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" 设置js 和 html的检查项目，jslint jshint需要自己安装, 或者使用eslint
"let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exec = 'eslint_d'
"let g:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_html_checkers=['tidy', 'eslint']
" 设置一进入不打开提示窗口
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
"设置提示窗口高度
let g:syntastic_loc_list_height = 5
"设置检查模式
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["js", 'html'] }

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
" 设置打开提示窗口快捷键
nnoremap <Leader>s :call ToggleErrors()<cr>
"nnoremap <Leader>sc :SyntasticCheck<cr>

""""""""""""""""""""""""""CtrlP插件
let g:ctrlp_map = "<c-p>"
let g:ctrlp_cmd = "CtrlP"

let g:ctrlp_working_path_mode = 'ra'

" 设置是否按照文件名来查找 0: 否 1: 是
let g:ctrlp_by_filename = 0

"set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.DS_Store,*/.git/*

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = 'find %s -type f'

""""""""""""""""""""""""""silver search插件
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

if executable('ag')
    " use ag over ack
    let g:ackprg = 'ag --nogroup --nocolor --column'
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0

    " bind \ (backward slash) to grep shortcut
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

    nnoremap \ :Ag<SPACE>
endif

""""""""""""""""""""""""""Ctrlsf插件
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_mapping = {
    \ "next": "n",
    \ "prev": "N",
    \ }
let g:ctrlsf_regex_pattern = 1
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
nmap     <C-F>l <Plug>CtrlSFQuickfixPrompt
vmap     <C-F>l <Plug>CtrlSFQuickfixVwordPath
vmap     <C-F>L <Plug>CtrlSFQuickfixVwordExec

""""""""""""""""""""""""""NERD_Commenter插件
let g:NERDSpaceDelims = 1

""""""""""""""""""""""""""NERDtree插件
"map a specific key or shortcut to open NERDTree
"map <F7> :NERDTreeToggle<CR>

"autocmd VimEnter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p
let g:nerdtree_tabs_open_on_gui_starup=0
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
" 是否显示隐藏文件
let NERDTreeShowHidden=1

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'

""""""""""""""""""""""""""vim-jsx插件
let g:jsx_ext_required = 0

""""""""""""""""""""""""""delimitMate插件
"for python docstring,优化输入
"au FileType python let b:delimitMate_nesting_quotes = ['"']

""""""""""""""""""""""""""closetag.vim自动补全html/xml标签
let g:closetag_html_style=1


""""""""""""""""""""""""""airline插件
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""vim-indent-guides插件
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

""""""""""""""""""""""""""vim-expand-region插件
" map + <Plug>(expand_region_expand)
" map _ <Plug>(expand_region_shrink)
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

""""""""""""""""""""""""""vim-signature插件
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

""""""""""""""""""""""3 编译并执行"""""""""""""""""""""""""""""""""""

func! RunPython()
    exec "!python %"
endfunc

func! CompileCode()
    exec "w"
    if &filetype == "c"
        "exec "SCCompile"
        exec "!gcc -Wall % -o %<"
    elseif &filetype == "python"
        exec "call RunPython()"
    endif
endfunc

func! RunResult()
    exec "w"
    if search("mpi\.h") != 0
        exec "!mpirun -np 4 ./%<"
    elseif &filetype=="c"
        exec "!gcc -Wall % -o %<;./%<"
    elseif &filetype=="python"
        exec "call RunPython()"
    endif
endfunc

map <F5> :call CompileCode()<CR>
imap <F5> :call CompileCode()<CR>
vmap <F5> :call CompileCode()<CR>
map <F6> :call RunResult()<CR>

" make vim fast
" force the old regex engine on any version newer
set re=1
" make fast scoll and draw
set ttyfast
set lazyredraw

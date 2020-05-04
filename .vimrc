" Shamelessly taken and modified from https://github.com/timss/vimconf "

set nocompatible

" Show line numbers "
set number

" Show syntax "
filetype plugin indent on
syntax on

" .pl -> Prolog instead of Perl file
au FileType perl set filetype=prolog

" Centralize backup, swap and undo directories  "
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Useful arrow keys "
nnoremap <left> :vertical resize +5<cr>
nnoremap <right> :vertical resize -5<cr>
nnoremap <up> :resize +5<cr>
nnoremap <down> :resize -5<cr>

" VIM-PLUG RELATED "
call plug#begin('~/.vim/plugged')

" Fuzzy finder (files, mru, etc)
Plug 'ctrlpvim/ctrlp.vim'

" A pretty statusline, bufferline integration
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'

" Undo history visualizer
Plug 'mbbill/undotree'

" Make sure you use single quotes
Plug 'junegunn/vim-easy-align'

" Super easy commenting, toggle comments etc
Plug 'scrooloose/nerdcommenter'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Autoclose (, " etc
Plug 'Townk/vim-autoclose'

" UNIX shell command helpers, e.g. sudo, chmod, remove etc.
Plug 'tpope/vim-eunuch'

" Handle surround chars like ''
Plug 'tpope/vim-surround'

" A fancy start screen, shows MRU etc.
Plug 'mhinz/vim-startify'

" Vim signs (:h signs) for modified lines based off VCS (e.g. Git)
Plug 'mhinz/vim-signify'

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" LaTeX support
" Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'

" Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'

" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'

" See colors in the file!
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Markdown preview
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" Conceals lambdas/inline functions with a lambda character for various languages
Plug 'calebsmith/vim-lambdify'

" R support 
" Plug 'jalvesaq/nvim-r'

" textX support
Plug 'igordejanovic/textx.vim'

" Rust support
" Plug 'racer-rust/vim-racer'

" RON syntax highlighting
Plug 'ron-rs/ron.vim'

" Code completion "
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Sublime-style multiple selection "
Plug 'terryma/vim-multiple-cursors'

" THEMES "
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'dylanaraps/wal.vim'
Plug 'jacoborus/tender.vim'
Plug 'trusktr/seti.vim'
Plug 'chriskempson/base16-vim'
Plug 'noahfrederick/vim-hemisu'
Plug 'chriskempson/tomorrow-theme'
Plug 'phanviet/vim-monokai-pro'
Plug 'nightsense/cosmic_latte'
Plug 'nightsense/snow'
Plug 'lifepillar/vim-solarized8'


" Add plugins to &runtimepath
call plug#end()

""" Local leading config, only for prerequisites and will be overwritten {{{
    if filereadable($HOME."/.vimrc.first")
        source $HOME/.vimrc.first
    endif
""" }}}
""" User interface {{{
    """ Syntax highlighting {{{
        " set termguicolors -- to make hexokinase work
        set background=dark
        colorscheme wal                 " colorscheme from plugin
        """ Force behavior and filetypes, and by extension highlighting {{{
            augroup FileTypeRules
                autocmd!
                autocmd BufNewFile,BufRead *.md set ft=markdown tw=79
                autocmd BufNewFile,BufRead *.tex set ft=tex tw=79
            augroup END
        """ }}}
        """ Custom highlighting, where NONE uses terminal background {{{
           function! CustomHighlighting()
                highlight Normal ctermbg=NONE
                highlight NonText ctermbg=NONE
                highlight LineNr ctermbg=NONE
                highlight SignColumn ctermbg=NONE
                highlight SignColumn guibg=NONE         "#151515
                highlight CursorLine ctermbg=7       "235
           endfunction

            call CustomHighlighting()
        """ }}}
    """ }}}
    """ Interface general {{{
        "set cursorline                              " hilight cursor line
        set more                                    " ---more--- like less
        set number                                  " line numbers
        set scrolloff=3                             " lines above/below cursor
        set showcmd                                 " show cmds being typed
        set title                                   " window title
        set vb t_vb=                                " disable beep and flashing
        """ Depending on your setup you may want to enforce UTF-8. {{{
        """ Should generally be set in your environment LOCALE/$LANG
            " set encoding=utf-8                    " default $LANG/latin1
            " set fileencoding=utf-8                " default none
        """ }}}
    """ }}}
""" }}}
""" General settings {{{
    set completeopt=menu,preview,longest            " insert mode completion
    set hidden                                      " buffer change, more undo
    set history=1000                                " default 20
    set laststatus=2                                " always show statusline
    set linebreak                                   " don't cut words on wrap
    set mouse=                                      " disable mouse
    set noshowmode                                  " hide mode cmd line
    set noexrc                                      " don't use other .*rc(s)
    set nostartofline                               " keep cursor column pos
    set nowrap                                      " don't wrap lines
    set numberwidth=4                               " 99999 lines
    set shortmess+=I                                " disable startup message
    set splitbelow                                  " splits go below w/focus
    set splitright                                  " vsplits go right w/focus
    set ttyfast                                     " for faster redraws etc
    if !has('nvim')
        set ttymouse=xterm2
    endif
    """ Folding {{{
        set foldcolumn=0                            " hide folding column
        set foldmethod=indent                       " folds using indent
        set foldnestmax=10                          " max 10 nested folds
        set foldlevelstart=99                       " folds open by default
    """ }}}
    """ Search and replace {{{
        set gdefault                                " default s//g (global)
        set incsearch                               " "live"-search
    """ }}}
    """ Matching {{{
        set matchtime=2                             " time to blink match {}
        set matchpairs+=<:>                         " for ci< or ci>
        set showmatch                               " tmpjump to match-bracket
    """ }}}
    """ Wildmode/wildmenu command-line completion {{{
        set wildignore+=*.bak,*.swp,*.swo
        set wildignore+=*.a,*.o,*.so,*.pyc,*.class
        set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.pdf
        set wildignore+=*/.git*,*.tar,*.zip
        set wildmenu
        set wildmode=longest:full,list:full
    """ }}}
    """ Return to last edit position when opening files {{{
        augroup LastPosition
            autocmd! BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     exe "normal! g`\"" |
                \ endif
        augroup END
    """ }}}
""" }}}
""" Files {{{
    set autochdir                                   " always use curr. dir.
    set autoread                                    " refresh if changed
    set confirm                                     " confirm changed files
    set noautowrite                                 " never autowrite
    set nobackup                                    " disable backups
    """ Persistent undo. Requires Vim 7.3 {{{
        if has('persistent_undo') && exists("&undodir")
            set undodir=$HOME/.vim/undo/            " where to store undofiles
            set undofile                            " enable undofile
            set undolevels=500                      " max undos stored
            set undoreload=10000                    " buffer stored undos
        endif
    """ }}}
    """ Swap files, unless vim is invoked using sudo {{{
    """ https://github.com/tejr/dotfiles/blob/master/vim/vimrc
        if !strlen($SUDO_USER)
            set directory^=$HOME/.vim/swap//        " default cwd, // full path
            set swapfile                            " enable swap files
            set updatecount=50                      " update swp after 50chars
            """ Don't swap tmp, mount or network dirs {{{
                augroup SwapIgnore
                    autocmd! BufNewFile,BufReadPre /tmp/*,/mnt/*,/media/*
                        \ setlocal noswapfile
                augroup END
            """ }}}
        else
            set noswapfile                          " dont swap sudo'ed files
        endif
    """ }}}
""" }}}
""" Text formatting {{{
    set autoindent                                  " preserve indentation
    set backspace=indent,eol,start                  " smart backspace
    set cinkeys-=0#                                 " don't force # indentation
    set expandtab                                   " no real tabs
    set ignorecase                                  " by default ignore case
    set nrformats+=alpha                            " incr/decr letters C-a/-x
    set shiftround                                  " be clever with tabs
    set shiftwidth=4                                " default 8
    set smartcase                                   " sensitive with uppercase
    set smarttab                                    " tab to 0,4,8 etc.
    set softtabstop=4                               " "tab" feels like <tab>
    set tabstop=4                                   " replace <TAB> w/4 spaces
    set shiftwidth=4
    """ Don't highlight whitespace in Go files
    let g:go_highlight_trailing_whitespace_error=0
    """ Rust - complete function definition preview
    let g:racer_experimental_completer = 1
    let g:racer_insert_paren = 1
    """ Automatic rustfmt when saving a buffer
    let g:rustfmt_autosave = 1
    """ set noexpandtab
    """ Only auto-comment newline for block comments {{{
        augroup AutoBlockComment
            autocmd! FileType c,cpp setlocal comments -=:// comments +=f://
        augroup END
    """ }}}
    """ Take comment leaders into account when joining lines, :h fo-table {{{
    """ http://ftp.vim.org/pub/vim/patches/7.3/7.3.541
        if has("patch-7.3.541")
            set formatoptions+=j
        endif
    """ }}}
""" }}}
""" LaTeX {{{
        let g:vimtex_view_method='zathura'
"""}}}
""" Keybindings {{{
    """ General {{{
        " Remap <leader>
        let mapleader=","

        " Quickly edit/source .vimrc
        noremap <leader>ve :edit $HOME/.vimrc<CR>
        noremap <leader>vs :source $HOME/.vimrc<CR>

        " Yank(copy) to system clipboard
        noremap <leader>y "+y

        " Toggle pastemode, doesn't indent
        set pastetoggle=<F3>

        " Toggle folding
        " http://vim.wikia.com/wiki/Folding#Mappings_to_toggle_folds
        nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

        " Bubbling (bracket matching)
        nmap <C-up> [e
        nmap <C-down> ]e
        vmap <C-up> [egv
        vmap <C-down> ]egv

        " NERDTree toggle
        nmap <C-f> :NERDTreeToggle<CR>

        " Scroll up/down lines from 'scroll' option, default half a screen
        map <C-j> <C-d>
        map <C-k> <C-u>

        " Treat wrapped lines as normal lines
        nnoremap j gj
        nnoremap k gk

        " Buffers, preferred over tabs now with bufferline.
        nnoremap gn :bnext<CR>
        nnoremap gN :bprevious<CR>
        nnoremap gd :bdelete<CR>
        nnoremap gf <C-^>

        " Highlight last inserted text
        nnoremap gV '[V']
        " Enable disable Goyo
        map <leader>g :Goyo<CR>
        map <leader>G :Goyo!<CR>
    """ }}}
        """ Toggle relativenumber using <leader>r {{{
            function! NumberToggle()
                if(&relativenumber == 1)
                    set number
                else
                    set relativenumber
                endif
            endfunction

            nnoremap <leader>r :call NumberToggle()<CR>
        """ }}}
        """ Toggle text wrapping, wrap on whole words {{{
        """ For more info see: http://stackoverflow.com/a/2470885/1076493
            function! WrapToggle()
                if &wrap
                    set list
                    set nowrap
                else
                    set nolist
                    set wrap
                endif
            endfunction

            nnoremap <leader>w :call WrapToggle()<CR>
        """ }}}
        """ Remove multiple empty lines {{{
            function! DeleteMultipleEmptyLines()
                g/^\_$\n\_^$/d
            endfunction

            nnoremap <leader>ld :call DeleteMultipleEmptyLines()<CR>
        """ }}}
        """ Split to relative header/source {{{
            function! SplitRelSrc()
                let s:fname = expand("%:t:r")

                if expand("%:e") == "h"
                    set nosplitright
                    exe "vsplit" fnameescape(s:fname . ".cpp")
                    set splitright
                elseif expand("%:e") == "cpp"
                    exe "vsplit" fnameescape(s:fname . ".h")
                endif
            endfunction

            nnoremap <leader>le :call SplitRelSrc()<CR>
        """ }}}
        """ Strip trailing whitespace, return to cursor at save {{{
            function! StripTrailingWhitespace()
                let l = line(".")
                let c = col(".")
                %s/\s\+$//e
                call cursor(l, c)
            endfunction

            augroup StripTrailingWhitespace
                autocmd!
                autocmd FileType c,cpp,cfg,conf,css,html,perl,python,sh,tex,yaml
                    \ autocmd BufWritePre <buffer> :call
                    \ StripTrailingWhitespace()
            augroup END
        """ }}}
    """ }}}
    """ Plugins {{{
        " Toggle undo history tree
        nnoremap <F5> :UndotreeToggle<CR>
    """ }}}
""" }}}

""" Plugin settings {{{
    """ Startify {{{
        let g:startify_bookmarks = [
            \ $HOME . "/.vimrc", $HOME . "/.vimrc.first",
            \ $HOME . "/.vimrc.last", $HOME . "/.vimrc.plugins"
            \ ]
        let g:startify_custom_header = [
            \ '   http://github.com/pprobst/',
            \ ''
            \ ]
        let g:startify_files_number = 5
    """ }}}
    """ coc {{{
        command! -nargs=0 Prettier :CocCommand prettier.formatFile
        let g:coc_global_extensions = [
        \ 'coc-snippets',
        \ 'coc-pairs',
        \ 'coc-tsserver',
        \ 'coc-html',
        \ 'coc-css',
        \ 'coc-prettier',
        \ 'coc-json',
        \ 'coc-texlab',
        \ 'coc-rls',
        \ 'coc-python',
        \ 'coc-clangd',
        \ ]

        " From Coc Readme
        set updatetime=300

        " Some servers have issues with backup files, see #649
        set nobackup
        set nowritebackup

        " Don't give |ins-completion-menu| messages.
        set shortmess+=c

        " Always show signcolumns
        set signcolumn=yes

        " Use tab for trigger completion with characters ahead and navigate.
        " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
        inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        " Use <c-space> to trigger completion.
        inoremap <silent><expr> <c-space> coc#refresh()

        " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
        " Coc only does snippet and additional edit on confirm.
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

        " Use `[g` and `]g` to navigate diagnostics
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)

        " Remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)

        " Use D to show documentation in preview window
        nnoremap <silent> D :call <SID>show_documentation()<CR>

        function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
        endfunction

        " Highlight symbol under cursor on CursorHold
        "autocmd CursorHold * silent call CocActionAsync('highlight')

        " Remap for rename current word
        nmap <rn> <Plug>(coc-rename)

        " Remap for format selected region
        xmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)

        augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        augroup end

        " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
        xmap <leader>a  <Plug>(coc-codeaction-selected)
        nmap <leader>a  <Plug>(coc-codeaction-selected)

        " Remap for do codeAction of current line
        nmap <leader>ac  <Plug>(coc-codeaction)
        " Fix autofix problem of current line
        nmap <leader>qf  <Plug>(coc-fix-current)

        " Create mappings for function text object, requires document symbols feature of languageserver.
        xmap if <Plug>(coc-funcobj-i)
        xmap af <Plug>(coc-funcobj-a)
        omap if <Plug>(coc-funcobj-i)
        omap af <Plug>(coc-funcobj-a)

        " Use `:Format` to format current buffer
        command! -nargs=0 Format :call CocAction('format')

        " Use `:Fold` to fold current buffer
        command! -nargs=? Fold :call     CocAction('fold', <f-args>)

        " Use `:OR` for organize import of current buffer
        command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

        " Add status line support, for integration with other plugin, checkout `:h coc-status`
        set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    """ }}}
    """ CtrlP {{{
        " Don't recalculate files on start (slow)
        let g:ctrlp_clear_cache_on_exit = 0
        let g:ctrlp_working_path_mode = 'ra'

        " Don't split in Startify
        let g:ctrlp_reuse_window = 'startify'
    """ }}}
    """ TagBar {{{
        set tags=tags;/

        " Proportions
        let g:tagbar_left = 0
        let g:tagbar_width = 30

        " Used in lightline.vim
        let g:tagbar_status_func = 'TagbarStatusFunc'
    """ }}}
    """ }}}
    """ Netrw {{{
        let g:netrw_banner = 0
        let g:netrw_list_hide = '^\.$'
        let g:netrw_liststyle = 3
    """ }}}
    """ Automatically remove preview window after autocomplete {{{
    """ (mainly for clang_complete)
        augroup RemovePreview
            autocmd!
            autocmd CursorMovedI * if pumvisible() == 0 | pclose | endif
            autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
        augroup END
    """ }}}
    """ Vim Hexokinase {{{
    " Vim Hexokinase
        let g:Hexokinase_optInPatterns = [
        \     'full_hex',
        \     'triple_hex',
        \     'rgb',
        \     'rgba',
        \     'hsl',
        \     'hsla',
        \     'colour_names'
        \ ]
        let g:Hexokinase_highlighters = ['backgroundfull']
        " Reenable hexokinase on enter
        autocmd VimEnter * HexokinaseTurnOn
    """ }}}
    """ Lightline {{{
    function! CocCurrentFunction()
        return get(b:, 'coc_current_function', '')
    endfunction
        let g:lightline = {
            \ 'colorscheme': 'wal',
            \ 'active': {
            \     'left': [
            \         ['mode', 'paste'],
            \         ['cocstatus', 'currentfunction', 'readonly', 'fugitive'],
            \         ['ctrlpmark', 'bufferline']
            \     ],
            \     'right': [
            \         ['lineinfo'],
            \         ['percent'],
            \         ['fileformat', 'fileencoding', 'filetype']
            \     ]
            \ },
            \ 'component': {
            \     'paste': '%{&paste?"!":""}'
            \ },
            \ 'component_function': {
            \     'mode'            : 'MyMode',
            \     'fugitive'        : 'MyFugitive',
            \     'readonly'        : 'MyReadonly',
            \     'ctrlpmark'       : 'CtrlPMark',
            \     'bufferline'      : 'MyBufferline',
            \     'fileformat'      : 'MyFileformat',
            \     'fileencoding'    : 'MyFileencoding',
            \     'filetype'        : 'MyFiletype',
            \     'cocstatus'       : 'coc#status', 
            \     'currentfunction' : 'CocCurrentFunction'
            \ },
            \ 'subseparator': {
            \     'left': '|', 'right': '|'
            \ }
            \ }

        " Ensure that each mode indicator is the same size and casing
        let g:lightline.mode_map = {
            \ 'n'      : ' N ',
            \ 'i'      : ' I ',
            \ 'R'      : ' R ',
            \ 'v'      : ' V ',
            \ 'V'      : 'V-L',
            \ 'c'      : ' C ',
            \ "\<C-v>" : 'V-B',
            \ 's'      : ' S ',
            \ 'S'      : 'S-L',
            \ "\<C-s>" : 'S-B',
            \ '?'      : '      ' }

        function! MyMode()
            let fname = expand('%:t')
            return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ winwidth('.') > 60 ? lightline#mode() : ''
        endfunction

        function! MyFugitive()
            try
                if expand('%:t') !~? 'Tagbar' && exists('*fugitive#head')
                    let mark = '± '
                    let _ = fugitive#head()
                    return strlen(_) ? mark._ : ''
                endif
            catch
            endtry
            return ''
        endfunction

        function! MyReadonly()
            return &ft !~? 'help' && &readonly ? '≠' : '' " or ⭤
        endfunction

        function! CtrlPMark()
            if expand('%:t') =~ 'ControlP'
                call lightline#link('iR'[g:lightline.ctrlp_regex])
                return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
            else
                return ''
            endif
        endfunction

        " https://github.com/itchyny/lightline.vim/issues/36
        function! MyBufferline()
            call bufferline#refresh_status()
            let b = g:bufferline_status_info.before
            let c = g:bufferline_status_info.current
            let a = g:bufferline_status_info.after
            let alen = strlen(a)
            let blen = strlen(b)
            let clen = strlen(c)
            let w = winwidth(0) * 4 / 11
            if w < alen+blen+clen
                let whalf = (w - strlen(c)) / 2
                let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
                let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
                return (strlen(bb) < strlen(b) ? '...' : '') . bb . c . aa . (strlen(aa) < strlen(a) ? '...' : '')
            else
                return b . c . a
            endif
        endfunction

        function! MyFileformat()
            return winwidth('.') > 90 ? &fileformat : ''
        endfunction

        function! MyFileencoding()
            return winwidth('.') > 80 ? (strlen(&fenc) ? &fenc : &enc) : ''
        endfunction

        function! MyFiletype()
            return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
        endfunction

        let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
            \ }

        function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
            let g:lightline.ctrlp_regex = a:regex
            let g:lightline.ctrlp_prev = a:prev
            let g:lightline.ctrlp_item = a:item
            let g:lightline.ctrlp_next = a:next
            return lightline#statusline(0)
        endfunction

        function! CtrlPStatusFunc_2(str)
            return lightline#statusline(0)
        endfunction

        function! TagbarStatusFunc(current, sort, fname, ...) abort
            let g:lightline.fname = a:fname
            return lightline#statusline(0)
        endfunction

    """ }}}
""" }}}
""" Local ending config, will overwrite anything above. Generally use this. {{{
    if filereadable($HOME."/.vimrc.last")
        source $HOME/.vimrc.last
    endif
""" }}}

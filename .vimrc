"my configs
"
"ninja mode on
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>


"VUNDLE OPTIONS
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'a.vim'
Bundle 'Mark'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'mru.vim'
Bundle 'Auto-Pairs'
Bundle 'surround.vim'
Bundle 'Indent-Guides'
Bundle 'camelcasemotion'
Bundle 'argtextobj.vim'
Bundle 'vim-indent-object'
Bundle 'JSON.vim'
Bundle 'Tagbar'
Bundle 'EasyMotion'
Bundle 'davidhalter/jedi-vim'
Bundle 'closetag.vim'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'Valloric/YouCompleteMe'
"plugins for colorschemes
"Bundle 'CSApprox'
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/"  }
"Plugin 'ScrollColors'
Plugin 'vim-scripts/Colour-Sampler-Pack'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"VUNDLE END

set shellpipe=2>&1\ \|\ tee-ex
set nocp
set number " Включает отображение номеров строк
"set relativenumber " Номера строк относительно позиции курсора
set nowrap " Отключить перенос строк
set backup
set undofile "файлы с историей действй
set noswapfile
set dir=~/.vim/vimswap "каталог для сохранения своп-файлов
set undodir=~/.vim/vimundo
set backupdir=~/.vim/vimbkp
set autochdir "текущий каталог всегда совпадает с содержимым активного окна
set makeprg=make
if strlen($A)
    set makeprg=ymakevim
endif
set wcm=<Tab>
set noic
"set lazyredraw "отключить визуализацию при выполнении макросов
set list " Включить подсветку невидимых символов
set listchars=tab:·\ ,trail:· " Настройка подсветки невидимых символов
set hidden "переключение буфера без сохранения
set fileencodings=utf-8,cp1251,koi8-r,cp866 " Список кодировок файлов для автоопределения
"set foldenable "включаем фолдинг
"set fdm=syntax " Метод фолдинга - по синтаксису
set keymap=russian-jcukenwin " Настраиваем переключение раскладок клавиатуры по <C-^>
set iminsert=0 " Раскладка по умолчанию - английская
set imsearch=0
set switchbuf=useopen,usetab,newtab "открывать новый буфер в новой вкладке
let mapleader = "\\" "биндим <Leader> клавишу
"set showtabline=2 "Всегда видим вкладки
"" Go to .proto on gf instead of .pb.h     
function GetIncludePath()
    let repo = $REPO_NAME
    let ret= fnamemodify(expand("%"), ":p:h:s?" . repo . "/.*$?" . repo . "?")
    let ret .= "/" . substitute(v:fname,'\\.pb\\.h$','.proto','')
    return ret
endfunction

set includeexpr=GetIncludePath()

"Indent and tabulation
set tabstop=4 " количество пробелов, которыми символ табуляции отображается в тексте
set shiftwidth=4 "количество пробелов, которыми символ табуляции отображается при добавлении
set expandtab "в режиме вставки заменяет символ табуляции на соответствующее количество пробелов. Так же влияет на отступы, добавляемые командами >> и <<
"set autoindent " Копирует отступ от предыдущей строки
"set smarttab "нажатие Tab в начале строки (если быть точнее, до первого непробельного символа в строке) приведет к добавлению отступа, ширина которого соответствует shiftwidth (независимо от значений в tabstop и softtabstop). Нажатие на Backspace удалит отступ
set smartindent " делает то же, что и autoindent плюс автоматически выставляет отступы в «нужных» местах. В частности, отступ ставится после строки, которая заканчивается символом {

set autoread " Set to auto read when a file is changed from the outside
set wildmenu "Turn on WiLd menu
set ruler "Always show current position

" К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim отобразит строку 2d.
set showcmd
" Включаем отображение дополнительной информации в статусной строке
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
"set statusline=%<%F%h%m%r%=type=%y\ format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set laststatus=2 "Значение 2 указывает, что строка статуса всегда должна показываться;

"конфигурация NerdTree
let NERDTreeQuitOnOpen=1

"конфигурация indent_guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"конфигурация tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

"конфигурация closetag
let g:closetag_html_style=1
source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

"jedi config
let g:jedi#popup_select_first=0

"конфигурация YouComleteMe
let g:ycm_global_ycm_extra_conf ='~/.vim/.ycm_extra_conf.py'
nmap ] :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <c-w>] :sp<cr>:YcmCompleter GoToDefinitionElseDeclaration<CR>

" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
au InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" add json filetype
au! BufRead,BufNewFile *.json set filetype=json

"Preview window on the bottom of vim
function! PreviewDown()
    if !&previewwindow
        silent! wincmd P
    endif
    if &previewwindow
        silent! wincmd J
        silent! wincmd p
    endif
endf
au BufWinEnter * call PreviewDown()

" Configure syntax specific options
syntax on " syntax hilight on
syntax sync fromstart
filetype indent on
filetype plugin on

"prog langs configs
setlocal keywordprg=pydoc "Установка быстрой помощи по K для слова под курсором с помощью pydoc

"Tab autocompletion
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction

let python_highlight_all = 1

" MAPPINGS
" Очистить подсветку последнего найденного выражения
nmap <F5> :TagbarToggle<CR>
nmap <F6> :NERDTreeToggle<CR>
"nmap <F6> :!~/bin/ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q ./<CR>
nmap <F12> :nohlsearch<CR>

"COLORS
set t_Co=256
colorscheme wombat256mod
"set cursorline

"Бегаем по вкладкам
nmap <c-p> :tabprevious<CR>
nmap <c-n> :tabnext<CR>
nmap p :bp<CR>
nmap n :bn<CR>
"end of my configs

" Encodings F9> EOL format (dos <CR><NL>,unix <NL>,mac <CR>)
    menu EOL.unix :set fileformat=unix<CR>
    menu EOL.dos :set fileformat=dos<CR>
    menu EOL.mac :set fileformat=mac<CR>
    menu EOL.my_win2unix :%s /\r\n/\r/g<CR>
    map <F9> :emenu EOL.<Tab>

"<F10> Change encoding
    menu Enc.cp1251 :e ++enc=cp1251<CR>
    menu Enc.koi8-r :e ++enc=koi8-r<CR>
    menu Enc.cp866 :e ++enc=ibm866<CR>
    menu Enc.utf-8 :e ++enc=utf-8<CR>
    menu Enc.ucs-2le :e ++enc=ucs-2le<CR>
    map <F10> :emenu Enc.<Tab>



function ShortTabLine()
    let ret = ''
    for i in range(tabpagenr('$'))
        " Если мы имеем дело с активной вкладкой — подсвечиваем ее красной
        if i + 1 == tabpagenr()
            let ret .= '%#errorMsg#'
        else
            let ret .= '%#TabLine#'
        endif
        " ищем название буфера, чтобы поместить его в название вкладки
        let buflist = tabpagebuflist(i + 1)
        let winnr = tabpagewinnr(i + 1)
        let buffername = bufname(buflist[winnr - 1])
        let filename = fnamemodify(buffername, ':t')
        " Если нет названия — то так и говорим 'буфер без названия' (noname)
        if filename == ''
            let filename = 'noname'
        endif

        " Если название слишком длинное — показываем только 6 первых символов
        "if strlen(filename) >= 8
        "    let ret .= '[' . filename[0:5] . '..]'
        "else
            let ret .= '[' . filename . ']'
        "endif
    endfor

    " заполняем лишнее пространство
    let ret .= '%#TabLineFill#%T'
    return ret
endfunction


" устанавливаем нашу функцию в качестве обработчика строки вкладок
set tabline=%!ShortTabLine()

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

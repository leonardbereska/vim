let mapleader =","

set nocompatible              " be iMproved, required
filetype off                  " required
set viminfo+=n~/.vim/viminfo
" vundle
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" Plugin 'VundleVim/Vundle.vim'
	Plugin 'gmarik/Vundle.vim'
	" Plugin 'davidhalter/jedi-vim'
	Plugin 'vim-scripts/indentpython.vim'
	Plugin 'vim-syntastic/syntastic'
	Plugin 'nvie/vim-flake8'
	Plugin 'tpope/vim-fugitive'
	Plugin 'scrooloose/nerdtree'
	Plugin 'jistr/vim-nerdtree-tabs'
	" Plugin 'kien/ctrlp.vim'
	" Plugin 'powerline/powerline'
	" Plugin 'universal-ctags/ctags'
	" Plugin 'https://github.com/tpope/vim-surround'
	" Plugin 'sjl/gundo.vim'
	" Plugin 'auto-pairs-gentle'
	Plugin 'repeat.vim'
	" Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
	call vundle#end()            " required
	filetype plugin indent on    " required
	" filetype indent on " load filetype-specific indent files
" Copy to system clipboard
	vnoremap <C-c> "*Y :let @+=@<CR>
	map <C-p> "+P"

" For saveing view folds:
	au BufWinLeave * mkview
	au BufWinEnter * silent loadview

" Spell-check set to F6
	map <F6> :setlocal spell! spelllang=en_us<CR>

" Delete trailing whitespaces on save
	autocmd BufWritePre * %s/\s\+$//e

"enable folding
	set foldmethod=indent
	set foldlevel=0

" interactive shell
	" set shellcmdflag=-ic
	let $BASH_ENV="~/.bash_aliases"


au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ nnoremap ä ^_i#<Space><Esc><Down>

" comment/uncomment:
	nnoremap ä ^_i"<Space><Esc><Down>
	autocmd Filetype tex nnoremap ä ^_i%<Space><Esc><Down>
	nnoremap Ä ^_xx<Down>

" color scheme
	let python_highlight_all=1
	syntax enable
	colorscheme darcula

" generic settings
	set backspace=indent,eol,start " for more intuitive backspace
	set wrap
	set linebreak
	" set nolist  " list disables linebreak
	set nu "line numbers
	" set clipboard=unnamed
	set lazyredraw
	set showmatch
	" set hlsearch
	set breakindent
	set autoindent
	set smartindent
	set incsearch

" key bindings
	set mouse=a
	inoremap <Up> <NOP>
	vnoremap <Up> <NOP>
	nnoremap <Up> <NOP>
	inoremap <Down> <NOP>
	vnoremap <Down> <NOP>
	nnoremap <Down> <NOP>
	inoremap <Left> <NOP>
	vnoremap <Left> <NOP>
	nnoremap <Left> <NOP>
	inoremap <Right> <NOP>
	nnoremap <Right> <NOP>
	vnoremap <Right> <NOP>
	nnoremap <S-j> 7j
	nnoremap <S-k> 7k
	nnoremap B ^
	nnoremap E $
	nnoremap ^ <NOP>
	nnoremap $ <NOP>
	nnoremap gV '[v']
	inoremap <esc> <NOP>
	nnoremap <leader>u :GundoToggle<CR>
	inoremap jk <Esc>l
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>
	" nnoremap kk 5k
	" nnoremap jj 5j
	nnoremap <M-Right> <w>
	nnoremap <M-Left> <b>
	nnoremap <space> za
	nnoremap ii i <Esc>r
	nnoremap Y y$

" nerd tree
	let g:NERDTreeMouseMode=3
	map <C-o> :NERDTreeToggle<CR>
	" let NERDTreeShowHidden=1

"""LATEX
	" Word count   :
	autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
	autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
	" Compile document using xelatex:
	autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space><c-r>%<Enter>a
	autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>
	" Code snippets
	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,bt {\blindtext}
	autocmd FileType tex inoremap ,nu $\varnothing$
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i
	autocmd VimLeave *.tex !texclear %



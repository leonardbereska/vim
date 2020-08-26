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
	" Plugin 'scrooloose/nerdtree'
	" Plugin 'jistr/vim-nerdtree-tabs'
	" Plugin 'kien/ctrlp.vim'
	" Plugin 'powerline/powerline'
	" Plugin 'universal-ctags/ctags'
	" Plugin 'https://github.com/tpope/vim-surround'
	" Plugin 'sjl/gundo.vim'
	" Plugin 'auto-pairs-gentle'
	" Plugin 'repeat.vim'
	Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
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
	set termguicolors

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
	" beamer
	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><Enter><Enter>\end{frame}<Enter><Enter><Esc>6kf}i

	" text highlighting
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,ti \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,tr \textrm{}<++><Esc>T{i
	autocmd FileType tex inoremap ,tb \textbf{}<++><Esc>T{i
	" autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a

	" reference
	autocmd FileType tex inoremap ,ct \cite{}<Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<Esc>T{i
	autocmd FileType tex inoremap ,r \ref{}<Space><Esc>T{i

	" environments
	autocmd FileType tex inoremap ,eq \begin{equation}<Enter>\end{equation}<Esc>kA<Enter>
	autocmd FileType tex inoremap ,seq \begin{equation*}<Enter>\end{equation*}<Esc>kA<Enter>
	autocmd FileType tex inoremap ,sol \solution{<Enter>}<Esc>kA<Enter>
	autocmd FileType tex inoremap ,al \begin{align}<Enter>\end{align}<Esc>kA<Enter>
	autocmd FileType tex inoremap ,sal \begin{align*}<Enter>\end{align*}<Esc>kA<Enter><Tab>
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>
	autocmd FileType tex inoremap ,it \begin{itemize}<Enter>\end{itemize}<Esc>kA<Enter><Tab>\item<Space>
	autocmd FileType tex inoremap ,en \begin{enumerate}<Enter>\end{enumerate}<Esc>kA<Enter><Tab>\item<Space>
	autocmd FileType tex inoremap ,ni <Enter>\item<Space>
	autocmd FileType tex inoremap $$ $$<++><Esc>2F$a
	autocmd FileType tex inoremap [] []<++><Esc>F[a
	autocmd FileType tex inoremap {} {}<++><Esc>F{a
	autocmd FileType tex inoremap () ()<++><Esc>F(a

	" math
	autocmd FileType tex inoremap ,bs \boldsymbol{}<++><Esc>F{a
	autocmd FileType tex inoremap ,_ _{}<++><Esc>F{a
	autocmd FileType tex inoremap ,^ ^{}<++><Esc>F{a
	autocmd FileType tex inoremap ,sum \sum_{}^{<++>}<++><Esc>2F{a
	autocmd FileType tex inoremap ,int \int_{}^{<++>}<++><Esc>2F{a
	autocmd FileType tex inoremap ,prod \prod_{}^{<++>}<++><Esc>2F{a
	autocmd FileType tex inoremap ,set \{\}<++><Esc>F{a
	autocmd FileType tex inoremap `/ \frac{}{<++>}<++><Esc>2F{a

	" symbols
	autocmd FileType tex inoremap ,ra $\rightarrow$<Space>
	autocmd FileType tex inoremap ,Ra $\Rightarrow$<Space>
	autocmd FileType tex inoremap ,la $\leftarrow$<Space>
	autocmd FileType tex inoremap ,La $\Leftarrow$<Space>
	autocmd FileType tex inoremap ,lra $\leftrightarrow$<Space>
	autocmd FileType tex inoremap ,Lra $\Leftrightarrow$<Space>
	autocmd FileType tex inoremap `6 \partial
	autocmd FileType tex inoremap `8 \infty

	" greek symbols
	autocmd FileType tex inoremap `a \alpha
	autocmd FileType tex inoremap `b \beta
	autocmd FileType tex inoremap `g \gamma
	autocmd FileType tex inoremap `G \Gamma
	autocmd FileType tex inoremap `d \delta
	autocmd FileType tex inoremap `D \Delta
	autocmd FileType tex inoremap `e \epsilon
	autocmd FileType tex inoremap `E \Epsilon
	autocmd FileType tex inoremap `f \phi
	autocmd FileType tex inoremap `F \Phi
	autocmd FileType tex inoremap `h \eta
	autocmd FileType tex inoremap `H \Eta
	autocmd FileType tex inoremap `i \iota
	autocmd FileType tex inoremap `I \Iota
	autocmd FileType tex inoremap `k \kappa
	autocmd FileType tex inoremap `K \Kappa
	autocmd FileType tex inoremap `l \lambda
	autocmd FileType tex inoremap `L \Lambda
	autocmd FileType tex inoremap `m \mu
	autocmd FileType tex inoremap `v \vu
	autocmd FileType tex inoremap `o \omikron
	autocmd FileType tex inoremap `p \pi
	autocmd FileType tex inoremap `q \theta
	autocmd FileType tex inoremap `Q \Theta
	autocmd FileType tex inoremap `r \rho
	autocmd FileType tex inoremap `R \Rho
	autocmd FileType tex inoremap `s \sigma
	autocmd FileType tex inoremap `S \Sigma
	autocmd FileType tex inoremap `t \tau
	autocmd FileType tex inoremap `j \psi
	autocmd FileType tex inoremap `J \Psi
	autocmd FileType tex inoremap `w \omega
	autocmd FileType tex inoremap `W \Omega
	autocmd FileType tex inoremap `x \xi
	autocmd FileType tex inoremap `X \Xi
	autocmd FileType tex inoremap `y \upsilon
	autocmd FileType tex inoremap `z \zeta
	autocmd FileType tex inoremap `Z \Zeta

	autocmd FileType tex inoremap `q \theta
	autocmd FileType tex inoremap `Q \Theta


	" tables
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><Enter>\end{tabular}<Enter><Enter><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\end{columns}<Esc>5kA

	" structure
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><Esc>2kf}i



	autocmd VimLeave *.tex !texclear %

" http://vim-latex.sourceforge.net/documentation/latex-suite/auc-tex-mappings.html

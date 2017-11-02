





set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vim-colorschemes/

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'		"git wrapper
Plugin 'valloric/youcompleteme'		"autocomplete everything and error check
Plugin 'scrooloose/nerdtree'		"file browser
Plugin 'sirver/ultisnips'		"smart snippets
Plugin 'honza/vim-snippets'		"all snippets
Plugin 'vim-airline/vim-airline' 	"bottom
Plugin 'vim-airline/vim-airline-themes'	"themes for bottom
Plugin 'fholgado/minibufexpl.vim'	"see all buffers
Plugin 'terryma/vim-multiple-cursors'	"multiple cursors
Plugin 'jez/vim-superman' 		"read manpages from terminal
Plugin 'majutsushi/tagbar'		"shows functions on side
Plugin 'altercation/vim-colors-solarized'	"beatifull theme
Plugin 'vim-syntastic/syntastic' 	"error checker
Plugin 'jmcantrell/vim-virtualenv'		"virtualenviornement
Plugin 'airblade/vim-gitgutter' 	"show diffs
Plugin 'kien/ctrlp.vim' 		"find everything
Plugin 'flazz/vim-colorschemes' 	"all colorschemes


"different settings for terminal
if has('gui_running')
"	let g:solarized_contrast = 'high'
	set guifont=hack
	set antialias
	set background=dark
	colorscheme solarized
else
	set background=dark
	colorscheme monokai-chris
endif


" --------- for syntatic ---------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"---------------------------------

call vundle#end()
filetype plugin indent on

" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.1

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/bin/bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

"fuzzy search 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"colorscheme solarized
"set background=dark
" vim:set ft=vim et sw=2:

set hidden

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"set statusline 
set laststatus=2


set number
runtime! ftplugin/man.vim
set splitbelow
set splitright


let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
	let snippet = UltiSnips#ExpandSnippetOrJump()
	if g:ulti_expand_or_jump_res > 0
		return snippet
	else
		return "\<CR>"
	endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let &t_Co=256

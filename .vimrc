execute pathogen#infect()

map <silent> <C-N> :NERDTree<CR>
set hlsearch
syntax enable
set nocompatible
filetype plugin indent on
nnoremap / /\v
cnoremap %s/ %smagic/
"set ruler
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap { {}<Esc>i
inoremap < <><Esc>i
let g:indent_guides_enable_on_vim_startup=1
"set number
"set relativenumber
set splitbelow
set splitright
"set foldmethod=indent
set foldlevel=99
nnoremap <space> za
"split navigations
nnoremap ∆ <C-W><C-J>
nnoremap ˚ <C-W><C-K>
nnoremap ¬ <C-W><C-L>
nnoremap ˙ <C-W><C-H>
nnoremap <c-h> gT 
nnoremap <c-l> gt 
"set winheight=30
"set winminheight=2
nnoremap <silent> + :exe "resize " . (winheight(0) + 2)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) - 2)<CR>
nnoremap <silent> - :exe "vertical resize " . (winwidth(0) - 2)<CR>
nnoremap <silent> = :exe "vertical resize " . (winwidth(0) + 2)<CR>
let python_highlight_all = 1
nnoremap <silent> <C-m> :nohl<CR><C-m>

colorscheme gruvbox
let g:gruvbox_contrast_dark='medium'
set background=dark
"":set t_Co=16

nnoremap <esc>^[ <esc>^[
set laststatus=2
let g:lightline = {
      \ 'enable': { 'tabline': 0 },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ] 
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"Speed enhancements
set regexpengine=1
set lazyredraw 
set ttyfast

" option s
nnoremap ß :OverCommandLine<CR>

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,try :-1read ~/.vim/snippets/try.py<CR><S-V>3j

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)

syntax on
set backspace=indent,eol,start
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" colors
color desert

" tab indentation
au BufNewFile,BufRead *.py
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set textwidth=79
set expandtab
set autoindent
set fileformat=unix
" line numbers
set number
set mouse=a
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h 
"match BadWhitespace /\s\+$/
set pastetoggle=<F3>
set hlsearch
set noerrorbells
set history=1000

" Maps the F5 key to trim all white space
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" maps ctrl-r when in visual mode to replace highlighted text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
   let @/ = ''
   if exists('#auto_highlight')
     au! auto_highlight
     augroup! auto_highlight
     setl updatetime=4000
     echo 'Highlight current word: off'
     return 0
  else
    augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
  return 1
 endif
endfunction

" enable mouse, and remap left click for selecting word for highlighting
set mouse=a
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

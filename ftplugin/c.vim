"Use 2 spaces instead of tab
set tabstop=2
set shiftwidth=2
set expandtab

"Very smart indent
set autoindent
set smartindent
set cindent

"disable cursor blinking
:set guicursor+=a:blinkon0

"
:set exrc
:set secure

"C/C++
:inoremap if( if(){<CR><BS><BS>}<Up><Right><Right>
:inoremap for( for(int i = 0 ; i < ; ++i){<CR>}<Up><Esc>wwwwwwwwwi
:inoremap while( while(){<CR><BS><BS>}<Up><Right><Right><Right><Right><Right>
:inoremap #< #include <><Left>
:inoremap #" #include ".h"<Left><Left><Left>
:inoremap <leader>p printf("");<Left><Left><Left>

"C++
:inoremap std::m std::map<
:inoremap <leader>c std::cout << 
:inoremap nullp nullptr
:inoremap <leader>e  << std::endl;
:inoremap std::st std::string
:inoremap std::ve std::vector<
:inoremap vv void
:inoremap ii int
:inoremap bb bool
:inoremap <leader>f false
:inoremap <leader>t true
:inoremap <leader>re return

"Experimenting with this...







"Toggle relative line number
:nnoremap <c-n> :call LineNumberToggle()<CR>
function! LineNumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

:inoremap <leader>( (){<CR>}<Up><Esc>$<Left>i

    
:inoremap <leader>nd #ifndef <C-R>=expand("%:t:r")<CR>_h<Esc>viwUo#define <C-R>=expand("%:t:r")<CR>_h<Esc>viwUo#endif<Esc>O

:inoremap <leader>q <C-R>= expand("%:t:r")<CR><Esc>bvUea::
:inoremap {<CR> {<CR><CR>}<Up><Tab>

"Turn VIM into an IDE
:inoremap <F5> <Esc>:cd build<CR>:!make<CR>:cd ..<CR><i>
:inoremap <F6> <Esc>:cd build<CR>:!openglgame.exe<CR>:cd ..<CR><i>
:noremap <F5> :cd build<CR>:!make<CR>:cd ..<CR>
:noremap <F6> :cd build<CR>:!openglgame.exe<CR>:cd ..<CR>
let &path.="src, include"
"set makeprg=make\ -C /build

function! NewClassHeader(className)
  echo "Creating new header for class"
  let lowerName =  tolower(a:className)
  "create header file in current folder in a new tab
  "execute ":tabe " . tolower(a:className) . ".h"
  "execute ":w"

  "create header guards
  execute "normal i,nd"

  "write the rest of the header
  execute "normal iclass " . a:className . "\<CR>{\<CR>private:\<CR>\<CR>public:\<CR>" . a:className . "();\<CR>};\<Esc>\<Up>\<Up>\<Up>\i\<Tab>\<Tab>"
endfunction

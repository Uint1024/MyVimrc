set tabstop=2
set shiftwidth=2
set expandtab

:set guicursor+=a:blinkon0
:set exrc
:set secure

"C/C++
:inoremap if( if(){<CR><BS>}<Up><Right><Right>
:inoremap for( for(int i = 0 ; i < ; ++i){<CR>}<Up><Esc>wwwwwwwwwi
:inoremap while( while(){<CR><BS>}<Up><Right><Right><Right><Right><Right>
:inoremap #< #include <><Left>
:inoremap #" #include ".h"<Left><Left><Left>
:inoremap <leader>p printf("");<Left><Left><Left>

"C++
:inoremap std::m std::map<Space>
:inoremap <leader>c std::cout << 
:inoremap nullp nullptr
:inoremap <leader>e  << std::endl;
:inoremap std::s std::string
:inoremap std::v std::vector<<Left>
:inoremap vv void
:inoremap ii int
:inoremap bb bool
:inoremap <Backspace> <NOP>
:inoremap <CR> <NOP>
:inoremap jf <CR>
:inoremap fj <CR>
:inoremap qq <Backspace>
:inoremap <leader>f false
:nnoremap <c-l> :call LineNumberToggle()<CR>
:inoremap <c-l> <Esc>:call LineNumberToggle()<CR>i
function! LineNumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

:inoremap <leader>t true
:inoremap <leader>ret return
:inoremap <leader>( (){<CR>}<Up><Esc>$<Left>i
:inoremap <leader>nd #ifndef <C-R>=expand("%:t:r")<CR>_h<Esc>viwUo#define <C-R>=expand("%:t:r")<CR>_h<Esc>viwUo#endif<Esc>O

:inoremap <leader>q <C-R>= expand("%:t:r")<CR><Esc>bvUea::
:inoremap {<CR> {<CR><CR>}<Up><Tab>

:inoremap <F5> <Esc>:!make<i><CR>
:inoremap <F6> <Esc>:!openglgame.exe<i><CR>
:noremap <F5> :!make<CR>
:noremap <F6> :!openglgame.exe<CR>

function! NewClassHeader(className)
  echo "Creating new header for class"
  let lowerName =  tolower(a:className)
  "create header file in current folder in a new tab
  "execute ":tabe " . tolower(a:className) . ".h"
  "execute ":w"

  "create header guards
  execute "normal i,nd"

  "write the rest of the header
  execute "normal iclass " . a:className . "\<CR>{\<CR>private:\<CR>\<CR>public:\<CR>a:className();\<CR>};\<Esc>\<Up>\<Up>\<Up>\i\<Tab>\<Tab>"
endfunction

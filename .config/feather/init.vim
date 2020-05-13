call plug#begin('/home/dhaval/.config/feather/plugged')

"----------- Writing ----------------

Plug 'reedes/vim-textobj-quote'

Plug 'reedes/vim-pencil'

Plug 'junegunn/limelight.vim'                      " LimeLight

Plug 'junegunn/goyo.vim'                           " Goyo

Plug 'kana/vim-textobj-user'

Plug 'reedes/vim-lexical'                          " Better spellcheck mappings

Plug 'reedes/vim-litecorrect'                      " Better autocorrections

Plug 'reedes/vim-textobj-sentence'                 " Treat sentences as text objects

Plug 'reedes/vim-wordy'                            " Weasel words and passive voice

"--------- User Interface -----------
"
Plug 'kyoz/purify', { 'rtp': 'vim' }               " ColorScheme

Plug 'mhinz/vim-startify'                          " StartScreen

"------------------------------------

call plug#end()

set background=dark

let g:limelight_conceal_ctermfg = 'gray'

set laststatus=0

source $HOME/.config/feather/plug-config/startify.vim
source $HOME/.config/feather/plug-config/pencil.vim

set textwidth=72

set nocompatible
filetype plugin on       " may already be in your .vimrc

augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType textile call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END

augroup pencil
   autocmd!
   autocmd filetype markdown,mkd call pencil#init()
       \ | call lexical#init()
       \ | call litecorrect#init()
       \ | setl spell spl=en_us fdl=4 noru nonu nornu
       \ | setl fdo+=search
  augroup END

let g:pencil#wrapModeDefault = 'soft'
let g:pencil#textwidth = 74
let g:pencil#joinspaces = 0
let g:pencil#cursorwrap = 1
let g:pencil#conceallevel = 3
let g:pencil#concealcursor = 'c'
let g:pencil#softDetectSample = 20
let g:pencil#softDetectThreshold = 130


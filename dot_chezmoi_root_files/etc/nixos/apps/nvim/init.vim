      " Personal Vim essentials
      set number
      set tabstop=4
      set shiftwidth=4
      set expandtab
      set termguicolors
      "let ayucolor="light"                   "Ayu light theme
      set background=light                    "Gruvbox theme
      colorscheme gruvbox
      
      " Vim essentials
      syntax enable                           " Enables syntax highlighing
      set hidden                              " Required to keep multiple buffers open multiple buffers
      set nowrap                              " Display long lines as just one line
      set pumheight=10                        " Makes popup menu smaller
      set fileencoding=utf-8                  " The encoding written to file
      set ruler              			            " Show the cursor position all the time
      set cmdheight=2                         " More space for displaying messages
      set iskeyword+=-                      	" treat dash separated words as a word text object"
      set mouse=a                             " Enable your mouse
      set splitbelow                          " Horizontal splits will automatically be below
      set splitright                          " Vertical splits will automatically be to the right
      set t_Co=256                            " Support 256 colors
      set conceallevel=0                      " So that I can see `` in markdown files
      set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
      set smartindent                         " Makes indenting smart
      set autoindent                          " Good auto indent
      set laststatus=0                        " Always display the status line
      set cursorline                          " Enable highlighting of the current line
      "set background=dark                     " tell vim what the background color looks like
      set showtabline=2                       " Always show tabs
      set noshowmode                          " We don't need to see things like -- INSERT -- anymore
      set nobackup                            " This is recommended by coc
      set nowritebackup                       " This is recommended by coc
      set updatetime=300                      " Faster completion
      set timeoutlen=500                      " By default timeoutlen is 1000 ms
      set formatoptions-=cro                  " Stop newline continution of comments
      set clipboard=unnamedplus               " Copy paste between vim and everything else
      
      " IndentLine {{
      let g:indentLine_char = '|'             " = ''
      let g:indentLine_first_char = '|'       " = ''
      "let g:indentLine_showFirstIndentLevel = 1
      let g:indentLine_setColors = 0
      " }}

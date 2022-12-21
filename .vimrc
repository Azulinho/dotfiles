" vim: set ft=vim ts=2 sts=2 et fdm=indent sw=2 autoindent smartindent:
" ~/.vimrc

syntax enable
filetype plugin indent on

""" Keyboard shortcut setup =====================
let mapleader=","
let maplocalleader="\\"
"nnoremap <Leader><Leader> :e#<CR> " open the previous file
nnoremap <Leader>bp :e#<CR> " open the previous file


" VIM PLUG SETUP
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  " initiate plug
  call plug#begin('~/.vim/plugged')
  " PLUGINS
    " https://stackoverflow.com/questions/5017500/vim-difficulty-setting-up-ctags-source-in-subdirectories-dont-see-tags-file-i
    "set tags+=./tags;/
    " https://stackoverflow.com/questions/40851541/relative-paths-in-tag-file
    "set notagrelative
    "set tags=.git/tags;.git/

    " Plug 'Rykka/riv.vim'
    "   let g:riv_ignored_imaps = "<Tab>,<S-Tab>"
    "   set mmp=2000 "https://github.com/gu-fan/riv.vim/issues/144#issuecomment-537304983
    "   let g:riv_link_cursor_hl = 0 "https://github.com/gu-fan/riv.vim/issues/144#issuecomment-536631033
    "
    "Plug 'python-mode/python-mode', { 'branch': 'develop' }
      " let g:pymode_rope_completion = 1
      " let g:pymode_rope_complete_on_dot = 1
      " let g:pymode_rope_autoimport = 1
      " let g:pymode_rope_autoimport_import_after_complete = 1
      " let g:pymode_python = 'python3'
      " disable keybindings that conflict with other plugins or options
      " let g:pymode_breakpoint_bind = '<leader>cpb'
      " let g:pymode_doc_bind = ''
      " let g:pymode_rope_autoimport_bind = ''
      " let g:pymode_rope_change_signature_bind = ''
      " let g:pymode_rope_extract_method_bind = ''
      " let g:pymode_rope_extract_variable_bind = ''
      " let g:pymode_rope_find_it_bind = ''
      " let g:pymode_rope_generate_class_bind = ''
      " let g:pymode_rope_generate_function_bind = ''
      " let g:pymode_rope_generate_package_bind = ''
      " let g:pymode_rope_goto_definition_bind = ''
      " let g:pymode_rope_inline_bind = ''
      " let g:pymode_rope_module_to_package_bind = ''
      " let g:pymode_rope_move_bind = ''
      " let g:pymode_rope_organize_imports_bind = ''
      " let g:pymode_rope_prefix = ''
      " let g:pymode_rope_rename_bind = ''
      " let g:pymode_rope_rename_module_bind = ''
      " let g:pymode_rope_show_doc_bind = '<leader>cpd'
      " let g:pymode_rope_use_function_bind = ''
      " let g:pymode_run_bind = '<leader>cpx'
      " let g:pymode_folding = 1
      " let g:pymode_syntax_slow_sync = 1
      " let g:pymode_syntax_all = 1

    Plug 'sansyrox/vim-python-virtualenv'
      let g:python3_host_prog='/usr/bin/python3'

      " Plug 'xolox/vim-easytags'
      ""  let g:easytags_async = 1
      ""  let g:easytags_suppress_ctags_warning = 1
    " Plug 'python-rope/ropevim'
    "   let ropevim_vim_completion=1
    "   let ropevim_extended_complete=1
    "   let ropevim_enable_autoimport=1


    Plug 'Rykka/InstantRst'
      let g:instant_rst_browser = 'vimb'
    Plug 'junegunn/fzf.vim'
    "https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf

      " cycle between buffer
      noremap <Leader>bl :Buffers<CR>
      " open recent buffers
      noremap <Leader>bh :History<CR>
      " FZF all files
      "noremap <Leader>af :Files<CR>
      noremap <Leader>fa :Files<CR>
      " FZF git files
      "noremap <Leader>gf :GFiles<CR>
      noremap <Leader>fg :GFiles<CR>
      " FZF buffer tags
      "noremap <Leader>bt :BTags<CR>
      noremap <Leader>ctb :BTags<CR>
      " FZF tags
      "noremap <Leader>at :Tags<CR>
      noremap <Leader>cta :Tags<CR>

      function! s:get_mappings()
	      execute 'map'
      endfunction

      command! FZFMru call fzf#run({
        \  'source':  s:get_mappings()})

      "noremap <Leader>am :FZFMru<CR> " FZF All mappings

    Plug 'amiorin/ctrlp-z'
    Plug 'chriskempson/base16-vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'elixir-editors/vim-elixir'
    Plug 'ervandew/supertab'
    Plug 'FelikZ/ctrlp-py-matcher'
    Plug 'NLKNguyen/papercolor-theme'
      " set colorschemes shortcuts
      "noremap <leader>csl :set background=light <bar> :colorscheme default <bar> :colorscheme PaperColor <CR>
      noremap <leader>ucl :set background=light <bar> :colorscheme default <bar> :colorscheme PaperColor <CR>
      "noremap <leader>csd :colorscheme default <bar> :set background=dark <bar> :colorscheme gruvbox <CR>
      noremap <leader>ucd :colorscheme default <bar> :set background=dark <bar> :colorscheme gruvbox <CR>
      "noremap <leader>csd1 :colorscheme default<Cr>:set background=dark<Cr>:colorscheme moonshine<Cr>

    Plug 'Yggdroot/indentLine'
      let g:indentLine_setColors = 0
      let g:indentLine_char_list = ['|', '¦', '┆', '┊', '⦙']
      :set listchars=eol:¬
      :set list

    Plug 'ntpeters/vim-better-whitespace'
      let g:better_whitespace_enabled=1
      let g:strip_whitespace_on_save=1
      let g:strip_whitespace_confirm=0

    Plug 'rodjek/vim-puppet'

    Plug 't9md/vim-choosewin'
      "nmap <leader>cw <Plug>(choosewin)
      nmap <leader>bw <Plug>(choosewin)
      let g:choosewin_overlay_enable = 1
    Plug 'weilbith/nerdtree_choosewin-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Shougo/unite.vim'
    Plug 'google/vim-jsonnet'
    Plug 'honza/vim-snippets'
    Plug 'JazzCore/ctrlp-cmatcher'
    Plug 'junegunn/gv.vim'
    Plug 'morhetz/gruvbox'
    Plug 'NLKNguyen/cloudformation-syntax.vim'
    Plug 'glidenote/serverspec-snippets'
    Plug 'TheLonelyGhost/vim-inspec'
    Plug 'LnL7/vim-nix'
    Plug 'mhinz/vim-signify'
    Plug 'mileszs/ack.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'Raimondi/delimitMate'
    Plug 'rakr/vim-one'
    Plug 'scrooloose/syntastic'
    Plug 'lepture/vim-jinja'
    Plug 'sheerun/vim-polyglot'
      " polyglot ansible plugin sets the filetype to yaml.ansible
      " which doesn't play nice with tagbar and ctags definitions
      let g:polyglot_disabled = ['ansible']
      au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab fdm=indent
    Plug  'https://github.com/pedrohdz/vim-yaml-folds'
    Plug 'chase/vim-ansible-yaml'
      au BufRead,BufNewFile */playbooks/*.yml set filetype=ansible
      au BufRead,BufNewFile */role/*/*.yml set filetype=ansible
      au BufRead,BufNewFile */tasks/*.yml set filetype=ansible
    Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'}
      let g:coc_filetype_map = {
        \ 'yaml.ansible': 'ansible',
        \}
    Plug 'tarekbecker/vim-yaml-formatter'
    Plug 'SirVer/ultisnips'
      " https://groups.google.com/forum/?hl=en#!searchin/ycm-users/snippet%7Csort:date/ycm-users/H7VIlAsqirk/Wb_DnH_wdDEJ
      let g:UltiSnipsExpandTrigger="<c-l>"
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-eunuch'
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-rails'
    Plug 'vim-ruby/vim-ruby'
      autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
      autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
      autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
    Plug 'xolox/vim-misc'
    Plug 'saltstack/salt-vim'
    Plug 'jamessan/vim-gnupg'

    Plug 'mbbill/undotree'
      "noremap <Leader>ut ::UndotreeToggle<CR>
      noremap <Leader>su ::UndotreeToggle<CR>

    Plug 'godlygeek/tabular'
    " :Tabularize /,
    " ^ that would align on ,

    " Plug 'Valloric/YouCompleteMe'
    "   let g:ycm_autoclose_preview_window_after_completion=1
    "   map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
    "   let g:ycm_use_ultisnips_completer = 1
    "   let g:ycm_key_list_select_completion = ["<Down>"]
    "   let g:ycm_key_list_previous_completion = ["<Up>"]
    "   let g:ycm_key_list_invoke_completion = ["<Right>"]
    "   let g:ycm_cache_omnifunc = 0
    "   let g:ycm_collect_identifiers_from_tags_files = 1

    " Plug 'hashivim/vim-terraform'
    "   let g:terraform_fmt_on_save=1
    "   let g:terraform_align=1
    "   let g:terraform_fold_sections=1
    "   autocmd BufEnter,BufNew *.tf set ft=terraform
    " Plug 'jvirtanen/vim-hcl'
    "   autocmd BufEnter,BufNew *.hcl set ft=hcl
    " Plug 'juliosueiras/vim-terraform-completion'
    "   " (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
    "   let g:terraform_completion_keys = 1


    Plug 'MattesGroeger/vim-bookmarks', { 'branch': 'master' }
      let g:bookmark_no_default_key_mappings = 1
      let g:bookmark_manage_per_buffer = 1
      let g:bookmark_auto_close = 1
      let g:bookmark_save_per_working_dir = 1
      let g:bookmark_auto_save = 1
      "nmap <Leader>bm <Plug>BookmarkToggle
      nmap <Leader>cbt <Plug>BookmarkToggle

      "nmap <Leader>ba <Plug>BookmarkAnnotate
      nmap <Leader>cba <Plug>BookmarkAnnotate

      "nmap <Leader>bsa <Plug>BookmarkShowAll
      nmap <Leader>cbl <Plug>BookmarkShowAll
    Plug 'andrewstuart/vim-kubernetes'
    Plug 'martinda/Jenkinsfile-vim-syntax'
    Plug 'SirVer/ultisnips'
      let g:UltiSnipsExpandTrigger="<tab>" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
      "let g:UltiSnipsJumpForwardTrigger="<c-b>"
      "let g:UltiSnipsJumpBackwardTrigger="<c-z>"
      "let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.
      "let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.vim/snippets"]
      let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.vim/snippets", "vim-snippets"]
    Plug 'mileszs/ack.vim'
      let g:ack_autoclose = 1
    Plug 'scrooloose/nerdtree'
      " automatically opens nerdtree on opening vim
      "autocmd VimEnter * NERDTree
      "map <leader>nt :NERDTreeToggle<CR>
      map <leader>st :NERDTreeToggle<CR>
      let NERDTreeIgnore=['\.o$', '\~$', '\.pyc', '__pycache__']
      let NERDTreeQuitOnOpen=0 " don't close NERDTree after opening file
      let g:NERDTreeWinSize=30
      "let g:NERDTreeChDirMode = 2 " change directory when using nerdtree
      "  use NERDTree and opening ack.vim results in a vertical split displacing it
      let g:ack_mappings = {
        \  'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
        \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }
      if executable('ag')
        let g:ackprg = 'ag --vimgrep'
      endif

      " Check if NERDTree is open or active
      function! IsNERDTreeOpen()
        return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
      endfunction

      " Call NERDTreeFind if NERDTree is active, current window contains a
      " modifiable file and we're not in vimdiff
      function! SyncTree()
        if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
          NERDTreeFind
          wincmd p
        endif
      endfunction

      " Highlight currently open buffer in NERDTree
      autocmd BufRead * call SyncTree()

    " TODO: this plugin seems to be broken
" just use VISUAL_BLOCK instead
" Ctrl+V, shift I, #, Esc
"    Plug 'preservim/nerdcommenter'
"      let g:NERDCreateDefaultMappings = 0
"      let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
"      let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
"      let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
"      let g:NERDAltDelims_java = 1 " Set a language to use its alternate delimiters by default
"      let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
"      let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
"      let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
"      let g:NERDToggleCheckAllLines = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not
"      noremap <Leader>cc NERDCommenterToggle
"     "noremap <Leader>ccc :NERDCommenterComment<CR>
"     "noremap <Leader>cu :NERDCommenterUncommentLine<CR>
"     "noremap <Leader>ccu :NERDCommenterUncommentLine<CR>
    Plug 'ryanoasis/vim-devicons'
      set encoding=UTF-8
    Plug 'xuyuanp/nerdtree-git-plugin'
    Plug 'epeli/slimux'
      map <C-c><C-c> :SlimuxREPLSendLine<CR>
      vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
    Plug 'majutsushi/tagbar'
      "nnoremap <Leader>tb :TagbarToggle<CR><CR> "Open/Close Tagbar
      nnoremap <Leader>sb :TagbarToggle<CR><CR>
      "let g:tagbar_ctags_bin = '/home/azul/bin/exuberant-ctags'
      let g:tagbar_ctags_bin = '/usr/bin/ctags'
      let g:tagbar_width = 26
      " TODO disable TabbarOpen for now, as it keeps resize to 80 chars wide
      " autocmd BufEnter,BufNew *.py NERDTreeClose | TagbarOpen
      " autocmd BufEnter,BufNew *.yml NERDTreeClose | TagbarOpen
      " autocmd BufEnter,BufNew *.yaml NERDTreeClose | TagbarOpen
      " autocmd BufEnter,BufNew *.tf NERDTreeClose | TagbarOpen
      " autocmd BufEnter,BufNew *.sh NERDTreeClose | TagbarOpen
      " autocmd BufEnter,BufNew Makefile NERDTreeClose | TagbarOpen
      " autocmd BufEnter,BufNew Jenkinsfile NERDTreeClose | TagbarOpen
      " autocmd BufEnter,BufNew Jenkinsfile_pipelines NERDTreeClose | TagbarOpen
      "
      autocmd BufEnter,BufNew __Tagbar__.* NERDTreeClose
      autocmd BufEnter,BufNew NERD_tree_* TagbarClose
      " python-mode 'pydocs' and 'automcompletion' clash with tagbar when the
      " buffer enters or leaves the .py file, as set above.
      let g:tagbar_left = 1
      let g:tagbar_type_groovy = {
            \ 'ctagstype' : 'groovy',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'c:class',
            \ 'i:interface',
            \ 'f:function',
            \ 't:trait',
            \ 'e:enum',
            \ 'm:package method',
            \ 'm:public method',
            \ 'm:protected method',
            \ 'm:private method',
            \ 'f:property',
            \ 'f:public field',
            \ 'f:protected field',
            \ 'f:private field',
            \ ]
            \ }
      let g:tagbar_type_Jenkinsfile = {
            \ 'ctagstype' : 'Jenkinsfile',
            \ 'kinds'     : [
            \ 's:stages',
            \ 'f:functions',
            \ 'v:variables',
            \ ]
            \ }
      let g:tagbar_type_nix = {
            \ 'ctagstype' : 'nix',
            \ 'kinds'     : [
            \ 'f:function',
            \ ]
            \ }
      let g:tagbar_type_ansible = {
          \ 'ctagstype' : 'ansible',
          \ 'kinds' : [
          \ 't:tasks',
          \ 'i:included_tasks',
          \ 'j:imported_tasks',
          \ 'h:hosts'
          \ ],
          \ 'sort' : 0
          \ }
      let g:tagbar_type_terraform = {
          \ 'ctagstype' : 'terraform',
          \ 'kinds' :[
          \ 'd:data',
          \ 'f:tfvars',
          \ 'h:localvar',
          \ 'v:variables',
          \ 'g:var',
          \ 'm:modules',
          \ 'r:resources',
          \ 'o:outputs',
          \ ],
          \ 'sort' : 0
          \ }
      let g:tagbar_type_make = {
          \ 'kinds':[
          \ 'm:macros',
          \ 't:targets'
          \ ]
          \}
      let g:tagbar_type_sh = {
          \ 'kinds':[
          \ 'f:functions',
          \ 'c:constants'
          \ ]
          \}
      let g:tagbar_type_markdown = {
          \ 'ctagstype' : 'markdown',
          \ 'kinds' : [
          \ 'h:Heading_L1',
          \ 'i:Heading_L2',
          \ 'k:Heading_L3'
          \ ]
          \ }
	let g:tagbar_type_rst = {
	    \ 'ctagstype': 'ReStructuredText',
	    \ 'kinds' : [
		\ 'c:chapters',
		\ 's:sections',
		\ 'S:subsections',
		\ 't:subsubsections',
		\ 'T:targets',
	    \ ],
	    \ 'sro' : '|',
	    \ 'kind2scope' : {
		\ 's' : 'section',
	    \ },
	    \ 'sort': 0,
	\ }
	let g:tagbar_type_go = {
	    \ 'ctagstype': 'go',
	    \ 'kinds' : [
		\'p:package',
		\'f:function',
		\'v:variables',
		\'t:type',
		\'c:const'
	    \]
	\}


    Plug 'vim-airline/vim-airline-themes'
      set laststatus=2               " enable airline even if no splits
      "let g:airline_theme='violet'
      "let g:airline_theme                              = 'papercolor'
      let g:airline_theme                              = 'base16'
      let g:airline_powerline_fonts                    = 0
      let g:airline_enable_branch                      = 0
      let g:airline_enable_syntastic                   = 0
      let g:airline#extensions#ale#enabled             = 1
      let g:airline_left_sep                           = ''
      let g:airline_right_sep                          = ''
      let g:airline_linecolumn_prefix                  = '␊ '
      let g:airline_linecolumn_prefix                  = '␤ '
      let g:airline_linecolumn_prefix                  = '¶ '
      let g:airline_branch_prefix                      = '⎇ '
      let g:airline_paste_symbol                       = 'ρ'
      let g:airline_paste_symbol                       = 'Þ'
      let g:airline_paste_symbol                       = '∥'
      let g:airline#extensions#tabline#enabled         = 1
      let g:airline#extensions#tabline#formatter       = 'default'
      let g:airline#extensions#tabline#show_buffers    = 0
      let g:airline#extensions#tabline#show_tab_nr     = 0
      let airline#extensions#tabline#current_first     = 0
      let g:airline#extensions#tabline#buffer_idx_mode = 1
      nmap <leader>1 <Plug>AirlineSelectTab1
      nmap <leader>2 <Plug>AirlineSelectTab2
      nmap <leader>3 <Plug>AirlineSelectTab3
      nmap <leader>4 <Plug>AirlineSelectTab4
      nmap <leader>5 <Plug>AirlineSelectTab5
      nmap <leader>6 <Plug>AirlineSelectTab6
      nmap <leader>7 <Plug>AirlineSelectTab7
      nmap <leader>8 <Plug>AirlineSelectTab8
      nmap <leader>9 <Plug>AirlineSelectTab9
      let g:airline#extensions#virtualenv#enabled = 1
      let g:airline#extensions#branch#enabled = 0
      let g:airline#extensions#bufferline#enabled = 0
      let g:airline_mode_map = {
          \ 'n' : 'N',
          \ 'i' : 'I',
          \ 'R' : 'REPLACE',
          \ 'v' : 'VISUAL',
          \ 'V' : 'V-LINE',
          \ 'c' : 'CMD   ',
          \ '': 'V-BLCK',
          \ }

      "let g:airline_section_x = '  %{airline#parts#filetype()}'
      let g:airline_section_x = ' '
      let g:airline_section_x = ''
      let g:airline_section_z = '%#__accent_bold#%4l%#__restore__#%#__accent_bold#/%L'
      "let g:airline_section_y = ' %{airline#util#wrap(airline#parts,0)}'
      let g:airline_section_y = ''
      let g:airline_section_y = ' '

    Plug 'ctrlpvim/ctrlp.vim'
      let g:ctrlp_match_window_bottom = 1    " Show at bottom of window
      let g:ctrlp_working_path_mode = 'ra'   " Our working path is our VCS project or the current directory
      let g:ctrlp_mru_files = 1              " Enable Most Recently Used files feature
      let g:ctrlp_jump_to_buffer = 2         " Jump to tab AND buffer if already open
      let g:ctrlp_open_new_file = 'v'        " open selections in a vertical split
      let g:ctrlp_open_multiple_files = 'vr' " opens multiple selections in vertical splits to the right
      let g:ctrlp_arg_map = 0
      let g:ctrlp_dotfiles = 0               " do not show (.) dotfiles in match list
      let g:ctrlp_showhidden = 0             " do not show hidden files in match list
      let g:ctrlp_split_window = 0
      let g:ctrlp_max_height = 40            " restrict match list to a maxheight of 40
      let g:ctrlp_use_caching = 0            " don't cache, we want new list immediately each time
      let g:ctrlp_max_files = 0              " no restriction on results/file list
      let g:ctrlp_working_path_mode = ''
      let g:ctrlp_dont_split = 'NERD_tree_2' " don't split these buffers
      " set wildignore=*/tmp/*,*.so,*.swp,*.zip,*.exe <-- this breaks tags
      let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|gitkeep)$',
            \ 'file': '\v\.(exe|so|dll|log|gif|jpg|jpeg|png|psd|DS_Store|ctags|gitattributes)$'
            \ }
     " let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
     " let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co'] " if you want to use git for this rather than ag
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
      let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("e")': ['<c-e>', '<c-space>'],
            \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
            \ 'AcceptSelection("t")': ['<c-t>'],
            \ 'AcceptSelection("v")': ['<cr>'],
            \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
            \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
            \ 'PrtHistory(-1)':       ['<c-n>'],
            \ 'PrtHistory(1)':        ['<c-p>'],
            \ 'ToggleFocus()':        ['<c-tab>'],
            \}
      " https://medium.freecodecamp.org/make-your-vim-smarter-using-ctrlp-and-ctags-846fc12178a4
      "nnoremap <leader>. :CtrlPTag<cr>
    " Ctrl B for buffer related mappings
      "noremap <Leader>bl :CtrlPBuffer<CR> " cycle between buffer
      "nnoremap <Leader>bb :bn<CR> "create (N)ew buffer
      nnoremap <Leader>bn :bn<CR> "create (N)ew buffer

      nnoremap <Leader>bd :bdelete<CR> "(D)elete the current buffer
      nnoremap <Leader>bu :bunload<CR> "(U)nload the current buffer
      nnoremap <Leader>cs :Snippets<Cr>
      nnoremap <Leader>cl :Lines<Cr>
      nnoremap <Leader>x :Commands<Cr>
    Plug 'fisadev/vim-ctrlp-cmdpalette'
      noremap <leader>: :CtrlPCmdPalette<CR>

    " Plug 'soramugi/auto-ctags.vim'
    "   let g:auto_ctags = 1
    "   let g:auto_ctags_directory_list = ['.git', '.svn', '.venv', 'vendor']
    "   let g:auto_ctags_tags_name = 'tags'
    "   let g:auto_ctags_tags_args = ['--tag-relative=yes', '--recurse=yes', '--sort=yes']
    "   let g:auto_ctags_filetype_mode = 0
    " ansible snippets
    Plug 'phenomenes/ansible-snippets', { 'tag': 'v2.4.0' }
    " disabled plugins
      " AWS CloudFormation snippets
      "Plug 'https://github.com/m-kat/aws-vim'
      ""  let g:AWSVimValidate = 1
      "Plug 'fholgado/minibufexpl.vim'
        " move minifbuffexplorer statusline to top
        "let g:miniBufExplBRSplit = 0
      "Plug 'kient/ctrlp.vim'
      "Plug 'xolox/vim-easytags'
    Plug 'mcfiredrill/vim-liquidsoap'
      au BufRead,BufNewFile *.liq set filetype=liquidsoap
    Plug 'dense-analysis/ale'
      let g:ale_sign_error = '✘'
      let g:ale_sign_warning = '⚠'
      let g:ale_lint_on_save = 1
      let g:ale_fix_on_save = 1
      " Only run linters named in ale_linters settings.
      let g:ale_linters_explicit = 1
      let g:ale_fixers_explicit = 1
      let g:ale_sign_column_always = 1
      let b:ale_linters = {'python': ['pylint', 'bandit', 'mypy']}
      let b:ale_fixers = {'python': ['black', 'isort', 'autoimport']}
      " Use Quickfix
      let g:ale_set_loclist = 1
      let g:ale_set_quickfix = 0
    " is this broken ???
    "Plug 'plasticboy/vim-markdown'
      " Markdown support is in vim, but by default .md is read as Modula-2
      " files.  This fixes that, because I don't ever edit Modula-2 files :)
        autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
        autocmd FileType markdown set tw=80
        let g:vim_markdown_conceal = 0
        let g:vim_markdown_conceal_code_blocks = 0
    Plug 'yasuhiroki/github-actions-yaml.vim'
      au BufNewFile,BufReadPost .github/workflows/*.yaml setlocal filetype=yaml.gha
    Plug 'jreybert/vimagit'

    Plug 'rhysd/vim-grammarous'
    let g:grammarous#show_first_error=1
    let g:grammarous#use_location_list=1
    if has("autocmd")
      au BufWrite *.md :GrammarousCheck<CR><CR>:lopen<CR>
    endif

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
      " Use <c-space> to trigger completion.
      "inoremap <silent><expr> <c-@> coc#refresh()

    " fix vim clipboardproblem
    Plug 'christoomey/vim-system-copy'

    Plug 'tpope/vim-surround'
    " TODO: set key mappings

    Plug 'vim-scripts/TaskList.vim'
      map <leader>cd <Plug>TaskList

    Plug 'liuchengxu/vim-which-key'
      nnoremap <silent> <leader> :<c-u>WhichKey  ','<CR>
      """""""""""""""""""""""""""""""""
      "Dictionary Setting For WhichKey"
      """""""""""""""""""""""""""""""""
      let g:which_key_map = {}
      let g:which_key_map.b = { 'name' : '+buffer' }
      let g:which_key_map.b.l = 'list buffers'
      let g:which_key_map.b.h = 'buffer history'
      let g:which_key_map.b.p = 'Alt-Tab buffer'
      let g:which_key_map.b.w = 'Choose Buffer'
      let g:which_key_map.b.n = 'New Buffer'
      let g:which_key_map.b.d = 'Delete Buffer'
      let g:which_key_map.b.u = 'Unload Buffer'
      let g:which_key_map.b.m = { 'name' : '+minimize' }
      let g:which_key_map.b.m.s = 'Minimize to the side'
      let g:which_key_map.b.m.b = 'Minimize to bottom'

      let g:which_key_map.f = { 'name' : '+files' }
      let g:which_key_map.f.a = 'all files'
      let g:which_key_map.f.g = 'GitFiles'

      let g:which_key_map.s = { 'name' : '+sidebars' }
      let g:which_key_map.s.t = 'NERDTree'
      let g:which_key_map.s.u = 'UndoTree'
      let g:which_key_map.s.b = 'TagBar'
      let g:which_key_map.s.g = 'Show TODO List'
        nnoremap <leader>sg <Plug>TaskList
      let g:which_key_map.s.q = 'Show QuickFix'
        nnoremap <Leader>sq :copen<CR><CR>
      let g:which_key_map.s.l = 'Show LocalList'
        nnoremap <Leader>sl :lopen<CR><CR>
      let g:which_key_map.c = { 'name' : '+code' }
      let g:which_key_map.c.t = { 'name' : '+tags' }
      let g:which_key_map.c.t.b = 'Buffer Tags'
      let g:which_key_map.c.t.a = 'All Tags'
      let g:which_key_map.c.b = {'name': '+bookmarks'}
      let g:which_key_map.c.b.t = 'Toogle bookmark'
      let g:which_key_map.c.b.a = 'Annotate bookmark'
      let g:which_key_map.c.b.l = 'List bookmarks'
      let g:which_key_map.c.c = 'Comment/UnComment'
      let g:which_key_map.c.g = 'Grep for word'
      let g:which_key_map.c.s = 'Snippets'
      let g:which_key_map.c.l = 'Grep for Lines'

      let g:which_key_map.c.d = 'Show TODO List'
      let g:which_key_map.c.q = 'Show QuickFix'
      let g:which_key_map.c.p = 'Show LocalList'

      let g:which_key_map.u = { 'name' : '+ui' }
      let g:which_key_map.u.c = { 'name' : '+colors' }
      let g:which_key_map.u.c.l = 'light theme'
      let g:which_key_map.u.c.d = 'dark theme'

      let g:which_key_map.x = 'Command list'

      let g:which_key_map.1 = 'which_key_ignore'
      let g:which_key_map.2 = 'which_key_ignore'
      let g:which_key_map.3 = 'which_key_ignore'
      let g:which_key_map.4 = 'which_key_ignore'
      let g:which_key_map.5 = 'which_key_ignore'
      let g:which_key_map.6 = 'which_key_ignore'
      let g:which_key_map.7 = 'which_key_ignore'
      let g:which_key_map.8 = 'which_key_ignore'
      let g:which_key_map.9 = 'which_key_ignore'
      let g:which_key_map.0 = 'which_key_ignore'
      let g:which_key_map.M = 'which_key_ignore'

      " mapping for special modes
      " pymode mappings, these should all go under .c.p (for python)
      let g:which_key_map_pymode = { 'name': '+pymode' }
      if has("autocmd")
        au BufEnter *.py let g:which_key_map.c.p = g:which_key_map_pymode
        au BufLeave *.py unlet g:which_key_map.c.p
      endif


 " decode and encode base64
 vnoremap <leader>64e y:let @"=system('base64 -w 0', @")<cr>gvP")"
 vnoremap <leader>64d y:let @"=system('base64 --decode', @")<cr>gvP")"

  " Turn on plugins, indentation, etc.
  filetype plugin indent on
  " Initialize plugin system
  call plug#end()

""fix backspace
  set backspace=indent,eol,start

" find word using Ack
  "noremap <Leader>fw :Ack<CR>
  noremap <Leader>cg :Ack<CR>


""" UI Tweaks ==========================
  set number " line numbering
  set relativenumber
  set t_Co=256 " Force 256 colors
" make splits like preview windows to show at the bottom instead of the top
  set splitbelow

" add symbols for 'tabs'
  set list
  set listchars=tab:\⇥\ ,trail:·,extends:>,precedes:<,nbsp:+

" Turn off menu in gui
  set guioptions="agimrLt"
" Turn off mouse click in gui
  set mouse=""


set colorcolumn=80 " Show a column on 80 char right

set wildmode=list:longest

set showmatch " show matching paranteses

" Highlighting line or number follows vvvvv
"
set cul " highlight current line
" change vim cursor depending on the mode
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    " OS X iTerm 2 settings
    if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
  "else
    " linux settings (gnome-terminal)
    " TODO: Presently in GNOME3 terminal seems to ignore this gconf setting.
    " Need to open a bug with them...
    "if has("autocmd")
    "  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    "  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    "  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    "endif
  endif
endif

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/
""" End UI Tweaks ======================


set hlsearch " hightlight searchs
" Remove highlights
" Clear the search buffer when hitting return
nnoremap <cr> :nohlsearch<cr>

" NO ARROW KEYS COME ON
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

" Custom split opening / closing behaviour
map <C-N> :vsp .<CR>
map <C-C> :q<CR>

" reselect pasted content:
noremap gV `[v`]

" Redraw my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=190
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" force writes as sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

""" End Keyboard shortcut setup =================

""" Vim environment handling tweaks ====
""""" BACKUP / TMP FILES

" Start scrolling 3 lines before the border
  set scrolloff=3

" Makes foo-bar considered one word
  set iskeyword+=-
""" End Vim environment handling tweaks

" case insensitive highlight matches in normal/visual mode
  nnoremap / /\v
  vnoremap / /\v


""" Auto Commands ======================
""""" Filetypes ========================
augroup erlang
  au!
  au BufNewFile,BufRead *.erl setlocal tabstop=4
  au BufNewFile,BufRead *.erl setlocal shiftwidth=4
  au BufNewFile,BufRead *.erl setlocal softtabstop=4
  au BufNewFile,BufRead relx.config setlocal filetype=erlang
augroup END
""""" End Filetypes ====================

""""" Normalization ====================
" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
au BufWrite * silent call DeleteTrailingWS()



""""" End Normalization ================

" autocreate tags
autocmd BufWritePost * silent !sh -c "rm -f .tags; pwd | grep -E '^/home/azul$' >/dev/null || ctags --format=2 --excmd=pattern --extras= --fields=nksaSmt --tag-relative=yes --recurse=yes --sort=yes -f .tags 2>/dev/null &"
set tags=.tags


""" End Auto Commands ==================

""""" Backups  ====================
  " https://begriffs.com/posts/2019-07-19-history-use-vim.html
  set swapfile
  if !isdirectory($HOME."~/.vim/tmp")
    call mkdir($HOME."/.vim/tmp", "p")
  endif
  if !isdirectory($HOME."~/.vim/undo")
    call mkdir($HOME."/.vim/undo", "p")
  endif
  set backupdir=~/.vim/tmp/                   " for the backup files
  set directory=~/.vim/tmp/                   " for the swap files
  set writebackup
  set nobackup
  set backupcopy=auto
  set undofile
  set undodir=~/.vim/undo/

"" Set history
  set hidden
  set history=1000

set fdm=indent

"""" Project specific
  set exrc " load a local .vimrc in the project"
  set secure " but disable autocmd and write from the local project .vimrc file"

" resize current window
  autocmd WinEnter *NERD_tree* set winminwidth=0 winwidth=60
  autocmd WinEnter *__Tagbar__* set winminwidth=0 winwidth=60
  autocmd WinEnter .vimrc set winminwidth=0 winwidth=86
  autocmd WinEnter *.py set winminwidth=0 winwidth=96
  autocmd WinEnter *.rb set winminwidth=0 winwidth=86
  autocmd WinEnter *.json set winminwidth=0 winwidth=86
  autocmd WinEnter *.js set winminwidth=0 winwidth=86
  autocmd WinEnter *.tf set winminwidth=0 winwidth=110
  autocmd WinEnter *.hcl set winminwidth=0 winwidth=110
  autocmd WinEnter *.yml set winminwidth=0 winwidth=110
  autocmd WinEnter *.yaml set winminwidth=0 winwidth=110
  autocmd WinEnter *.yaml set winminwidth=0 winwidth=110
  autocmd WinEnter *.md set winminwidth=0 winwidth=110
  autocmd WinEnter *.rst set winminwidth=0 winwidth=110
  set nowrap

 " minimize some windows
  "noremap <leader>b\| :vertical-resize 3 <CR>
  "noremap <leader>b_ :resize 3 <CR>
  noremap <leader>bms :vertical-resize 3 <CR>
  noremap <leader>bmb :resize 3 <CR>

 " better diffs
 if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
  endif

set completeopt-=preview
set completeopt+=longest,menuone,noselect


" set header title for journal & enter writing mode
function! JournalMode()
	execute 'normal gg'
	let filename = '#' . ' ' . expand('%:r')
	call setline(1, filename)
	execute 'normal o'
endfunction

" Journal
" workflow for daily journal
augroup journal
	autocmd!
	" close NERDTree
	autocmd VimEnter $HOME/git-annex/journal/**   :NERDTreeClose
	" populate journal template
	autocmd BufNewFile $HOME/git-annex/journal/**   0r $HOME/git-annex/journal/.skeleton
	" set header for the particular journal
	autocmd VimEnter $HOME/git-annex/journal/**   :call JournalMode()
	" enable keyword completion for journal files
	autocmd VimEnter $HOME/git-annex/journal/**   set complete=k$HOME/git-annex/journal/**/*
augroup END

      " in case t_Co alone doesn't work, add this as well:
      " i.e. Force 256 colors harder
      let &t_AB="\e[48;5;%dm"
      let &t_AF="\e[38;5;%dm"

      set t_ut= " improve screen clearing by using the background color
      set background=light
      "set background=dark
      syntax enable
      set enc=utf-8
      set term=screen-256color
      se t_Co=256
      let $TERM='screen-256color'
      colorscheme PaperColor
      "colorscheme gruvbox


aug AutoFormatHCLfiles
    au!
    au BufWritePost *.hcl !terragrunt hclfmt %
aug END

aug AutoFormatTFfiles
    au!
    au BufWritePost *.tf !terraform fmt %
    au BufWritePost *.tf !tflint %
    au BufWritePost *.tf !tfsec --no-color --concise-output %:p:h
aug END

aug AutoFormatPythonfiles
    au!
    au BufWrite *.py call CocAction('format')
    au BufWrite *.py CocCommand('python.runLinting')
    au BufWrite *.py CocCommand('python.organizeimports')
    "au BufWritePost *.py !isort %
    "au BufWritePost *.py !black %
    "au BufWritePost *.py !mypy %
    "au BufWritePost *.py !pylint %
aug END


aug AutoReloadVimRC
  au!
  au BufWritePost .vimrc :source ~/.vimrc
aug END

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"call which_key#register('<Space>', "g:which_key_map")
call which_key#register(',', "g:which_key_map")


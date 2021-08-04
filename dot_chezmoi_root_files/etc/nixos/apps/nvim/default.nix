{ pkgs, ... }:

# make pkgs avaliable in the lexical scope of the following expression
with pkgs;

# set the entire package as a local variable to include in environment.systemPackages
let myNvim = neovim.override {

  # lets you use 'vim' to use 'nvim'
  vimAlias = true;

  configure = { 

    # make plugins avaliable to vam
    vam.knownPlugins = pkgs.vimPlugins // import ./vimPlugins.nix;

    # declare plugins to use
    vam.pluginDictionaries = [
      {
        names = [
          "gruvbox"
          "clang_complete"
          "vim-nix"
          "indentLine"
        ];
      }
    ];

    # import init.vim
    customRC = builtins.readFile ./init.vim;
  };
};

# include customized vim package in systemPackages
in {
  environment.systemPackages = with pkgs; [ myNvim ];
  # set nvim as default editor
  environment.variables = { EDITOR = "nvim"; };
}

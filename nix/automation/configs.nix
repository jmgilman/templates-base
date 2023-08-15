{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs std;
  l = nixpkgs.lib // builtins;
in {
  conform = {
    data = {
      commit = {
        header = {length = 89;};
        conventional = {
          types = [
            "build"
            "chore"
            "ci"
            "docs"
            "feat"
            "fix"
            "perf"
            "refactor"
            "style"
            "test"
            "wip"
          ];
          scopes = [];
        };
      };
    };
  };
  lefthook = {
    data = {
      commit-msg = {
        commands = {
          conform = {
            run = "${nixpkgs.conform}/bin/conform enforce --commit-msg-file {1}";
          };
        };
      };
      pre-commit = {
        commands = {
          treefmt = {
            run = "${nixpkgs.treefmt}/bin/treefmt --fail-on-change {staged_files}";
          };
        };
      };
    };
  };
  prettier = {
    data = {
      printWidth = 80;
      proseWrap = "always";
    };
    output = ".prettierrc";
    format = "json";
    packages = with nixpkgs; [nodePackages.prettier];
  };
  treefmt = {
    data = {
      formatter = {
        nix = {
          command = "alejandra";
          includes = ["*.nix"];
        };
        prettier = {
          command = "prettier";
          options = ["--write"];
          includes = [
            "*.md"
          ];
        };
      };
    };
    packages = with nixpkgs; [alejandra];
  };
}

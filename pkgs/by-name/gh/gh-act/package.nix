{
  act,
  lib,
  runCommandLocal,
  testers,
}:

let
  gh-act =
    runCommandLocal "gh-act-${act.version}"
      {
        pname = "gh-act";
        inherit (act) version;

        passthru.tests.version = testers.testVersion {
          package = gh-act;
        };

        meta = {
          inherit (act.meta)
            license
            maintainers
            platforms
            ;
          description = "GitHub CLI extension to run GitHub actions using act";
          homepage = "https://github.com/nektos/gh-act";
          changelog = "https://github.com/nektos/act/releases/tag/v${act.version}";
          mainProgram = "gh-act";
        };
      }
      ''
        mkdir -p $out/bin
        ln -s ${lib.getExe act} $out/bin/gh-act
      '';
in
gh-act

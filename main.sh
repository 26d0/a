dict=$(nix build --no-link --print-out-paths nixpkgs#python3Packages.cmudict)
awk '$1~/ass/&&$1!~/^ass|ass$|\(/{print $1"のassの部分"}' "$dict"/lib/python*/site-packages/cmudict/data/cmudict.dict | sort -u | shuf -n1

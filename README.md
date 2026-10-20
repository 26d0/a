# a

```sh
nix run github:26d0/a
```

初期版と同じ CMU Pronouncing Dictionary（cmudict 1.1.3）のうち、`ass` を含み、先頭・末尾が `ass` ではない630語から一様ランダムに1語を選び、`のassの部分` を付けて表示します。発音違いのエントリと重複は抽選に含めません。

出力例：

```text
cassetteのassの部分
```

Nix の `nix-command` と `flakes` 機能が必要です。Linux・macOSのx86_64とaarch64向けに定義しています。

`bash main.sh` でも実行できます。flakeでは同じ処理を利用し、ロックしたNixpkgsから辞書と実行に必要なコマンドを用意します。

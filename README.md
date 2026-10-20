# a

```sh
nix run github:26d0/a
```

英語辞書 EFF-long のうち、`ass` を含み、先頭・末尾が `ass` ではない25語から一様ランダムに1語を選び、`のassの部分` を付けて表示します。

出力例：

```text
cassetteのassの部分
```

Nix の `nix-command` と `flakes` 機能が必要です。Linux・macOSのx86_64とaarch64向けに定義しています。

`main.sh` は56文字のコードゴルフ版です。flakeではその処理を利用し、ロックしたNixpkgsの依存パッケージを直接実行します。

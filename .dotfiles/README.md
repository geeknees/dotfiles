# dotfiles

[rcm](https://github.com/thoughtbot/rcm) で `$HOME` 直下にシンボリックリンクを張って管理する。

- 実体はこのリポジトリの `.dotfiles/` ディレクトリ（`~/.dotfiles` からシンボリックリンクで参照する）
- nvim 設定は別リポジトリ: https://github.com/geeknees/astronvim_config

## rcm の仕組み

rcm は「dotfiles ディレクトリ内の `zshrc`」を「`~/.zshrc`」としてシンボリックリンクするツール。

| コマンド | 役割 |
| --- | --- |
| `lsrc` | 何がどこにリンクされる予定か一覧表示（dry-run 相当） |
| `rcup` | リンクを作成・更新する |
| `rcdn` | リンクを削除する |
| `mkrc ~/.foo` | 既存の `~/.foo` を dotfiles ディレクトリに取り込んでリンク化 |

設定は `~/.rcrc` から読まれる。

## セットアップ手順（新しいマシン）

```sh
# 1. rcm をインストール
brew install rcm

# 2. リポジトリを取得（Dropbox 同期でも git clone でもよい）
git clone git@github.com:geeknees/dotfiles.git

# 3. ~/.dotfiles をリポジトリ内 .dotfiles/ へのシンボリックリンクにする
ln -s "<リポジトリを置いた場所>/.dotfiles" ~/.dotfiles

# 4. rcrc を配置（下記「rcrc の内容」参照）
cp ~/.dotfiles/rcrc ~/.rcrc   # または手で作成

# 5. リンク予定を確認してから適用
lsrc
rcup -v
```

`rcup` はデフォルトで `~/.dotfiles` を見るので、リンクさえ張れば `-d` オプションは不要。

## rcrc の内容

リンク対象にしたくないファイルは `EXCLUDES` で除外する。

```sh
# ~/.rcrc
EXCLUDES="README.md sddm.conf"
```

- `README.md` — ドキュメントなのでリンク不要
- `sddm.conf` — Linux (SDDM) 専用。macOS では不要

## 既存マシンの移行手順（手動コピー運用からの切り替え）

現在の `~/.dotfiles` はリポジトリへのリンクではなく手動コピーで、ドリフトが発生している
（詳細は `docs/config-review-improvements.md`）。切り替え前に必ず差分を取り込むこと。

```sh
# 1. 差分確認（ライブ側が新しいファイルがないか）
diff -rq ~/.dotfiles "<リポジトリを置いた場所>/.dotfiles"

# 2. ライブ側にしかない変更をリポジトリへ反映してコミット

# 3. 手動コピーを退避してリンクに差し替え
mv ~/.dotfiles ~/.dotfiles.bak
ln -s "<リポジトリを置いた場所>/.dotfiles" ~/.dotfiles

# 4. リンクを張り直し、シェルを再起動して動作確認
rcup -v
exec zsh

# 5. 問題なければ退避分を削除
rm -rf ~/.dotfiles.bak
```

既存の `~/.zshrc` 等はすでに `~/.dotfiles/...` を指しているため、
ステップ 3 の差し替えだけでリンク先が自動的にリポジトリ実体に切り替わる。

## 新しいファイルを管理下に入れる

```sh
mkrc ~/.newconfig   # ~/.dotfiles/newconfig に移動してリンク化される
```

その後リポジトリ側でコミットする。

## 管理の棲み分け

- **このリポジトリ（rcm）**: シェル・git などの一般的な dotfiles
- **chezmoi + private リポジトリ**: agent の skill などエージェント関連設定。ここでは管理しない

## 補足

- **tmux**: herdr に移行済み。tmux 関連の設定は削除した。herdr の設定は `config/herdr/config.toml` として管理し、`rcup` で `~/.config/herdr/config.toml` にリンクされる。
- **Brewfile**: 実態と乖離していたため削除済み。パッケージは必要になったタイミングで個別に `brew install` する。

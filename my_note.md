### 基本方針
自分で環境を位置から構築していると非常に時間がかかるので、
先ずはスターターテンプレートを用いる。
ここではLazyVimを採用することとする。
http://www.lazyvim.org/

lazy.nvimと名称が似通っているので注意すること。

### インストール手順
LazyExtrasで必要な機能をインストールすればよい。

vi
:LazyExtras
ポップアップウィンドウが表示されるので、インストールしたい機能を選択する。
選択はインストールしたい機能にカーソルを合わせてxを押せばよい

lang.clangd
lang.docker
lang.python
lang.json
lang.markdown
lang.toml
clding.luasnip
ai.copilot

次に各LSPをインストールする。
LazyExtrasでカバーされるものについては個別にインストールする必要は無い。

vi
:Mason
表示されるインストール済みLSPを確認する。
* bash-language-server
* clang-format
* clangd
* docker-compose-language-service
* dockerfile-lanbuage-server
* hadolint
* lua-language-server
* pyright
* ruff
* shfmt
* stylua
がインストールされていれば良い。
上記でインストールされていないものがあれば、Masonを用いてインストールすること。
インストールしたい機能にカーソルを合わせてiを押せばよい

### 入力時のフォーマット
フォーマッターが機能するのは保存時なので、入力時と保存時のフォーマットが異なる
場合がある。それはコーディング時の視覚的なノイズとなるので、完全に一致はせずとも
インデントぐらいは合わせるようにしておきたい。

そこで、本リポジトリに登録されている autocmds.luaを用いる。

### 独自スニペット


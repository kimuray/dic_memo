# DIC MEMO

> Trelloっぽいタスク管理アプリを構築するプロジェクトです

## Version

* Ruby 2.5.0
* Rails 5.1.5
* Vue.js (予定)

## Setup

```
git clone git@github.com:kimuray/dic_memo.git
cd dic_memo
bundle install --path vendor/bundle
yarn
bin/webpack-dev-server
rails s
```

### 追記
`yarn` : javascriptのパッケージマネージャー(Rubyでいうところのbundler的なもの)
`bin/webpack-dev-server` : 開発中にjavascriptの変更を検知して開発環境用に自動でビルドしてくれるもの

## Development Flow

1. `git checkout develop`
2. `git pull origin develop`
3. `git checkout -b feature/issues-{number}`
4. `開発実施`
  * `git add {file}`
  * `git commit -m 'commit message'`
5. `bundle exec rubocop -R`
  * 警告があれば修正
6. `git push origin feature/issues-{number}`
7. Pull request
8. レビュー →　レビュー修正
9. マージ

1-9を繰り返す

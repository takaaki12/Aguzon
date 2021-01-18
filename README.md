# README
# 農産物直売ECサイト「おくだいら」

## heroku
https://okudaira.herokuapp.com/aguzon

## サイト内容
私の実家の農産物直売ECサイトです。  
想いとしては、実家のある長野県の綺麗な水と空気で育った花と野菜を、産地の環境情報と共に全国にお届けしたいと言うこと。そして、作物だけであれば全国のスーパーに運ばれて販売されることは当たり前にありますが、生産地の情報も共にお届けできれば消費者の方々にとって、より安心して食べていただけると思ったポジティブな想いがあります。  
一方、問題解決の目的もあります。全国に販売できるのは大規模に農業を行っている業者さんが主だと思いますが、田舎では多くの人が小規模農業を営んでいます。小規模農業では遠くの人に届けることは叶いません。そして、直売所に持っていっても利益にならない量の収穫でも、家で食べきれずに捨てられる農作物は沢山あります。田舎の小規模農業者にとってのこれらの問題を少しでも解決する糸口となるのはITであると思い、このポートフォリオを作成してみました。  
実際には送料の問題や高齢者が生産者としてwebサービスを使いこなせるか等の問題が多々思いつきますが、問題に対してITを通して一歩踏み出せたことにとても満足しています。  
今後もこういった「問題に対してITで解決していく思考」を常に持ったエンジニアになっていきたいと思っております。  

## 機能
Category別絞り込み検索  
product一覧の並び替え  
product一覧の並び方の切り替え（Grid表示、List表示）  
product詳細表示  
数量を指定してproductをカートに入れる  
カート内を空にする  
フリーワード検索  
Google Map APIを用いた生産地の表示  
生産者のブログ投稿機能  
signup,login,logout  

## 環境
■ホストOS  
MacOS  
■言語  
HTML CSS JavaScript Ruby SQL  
■フレームワーク  
Ruby on Rails  
■CSSフレームワーク  
bootstrap  
■JSライブラリ  
jQuery  
■インフラ  
heroku Docker AWS S3  
■テストフレームワーク  
RSpec  
■その他ツールなど  
Solidus solidus_auth_devise Solidus-Blogging  
Git GitHub Rubocop CircleCI  


## ポートフォリオ作成で意識した事
### ＜フロントエンド＞
　自己流のデザインや動きではなく、Instagramや『UIデザインの教科書』から学ぼうという意識を念頭において作成いたしました。特に意識したことは以下の3つです。  

１、色  
２、動き  
３、階層構造を普遍的な「トップ・一覧・詳細」の３層にしたこと  
　
　３つとも目的はインタラクションコストを下げることです。  
　１つ目の「色」についてです。具体的には「サイト内を少ない色に絞る」ということを意識しました。人間は進化の過程で色で判別する力をつけているため感覚的に見やすくなるということと、逆に多彩すぎると判断しにくくなると言うことを学んだからです。  
　２つ目の「動き」についてです。具体的にはhover時に色を変えたり動きをつけることによって、感覚的に理解しやすくすることを意識しました。  
　3つ目についてです。これは一般的なWebサイトはこの構造であり、この共通概念を使うことによって使いやすくなると学んだからです。また、ユーザーが必ず通る「一覧」ページのインタラクションコストを下げるために「絞り込み・並べ替え・切り替え」機能も実装しました。  

### ＜バックエンド＞
　バックエンドに関してはRails tutorialやRailsガイド等から学んだことを生かしていこうと考えました。特に意識したことは以下の3つです。  

１、コードを重複させないこと  
２、バグを想定する習慣を持つこと  
３、テストをしっかり書くこと  

　1つ目の、「コードを重複させないこと」ことについてです。理由は、チームメンバーや後から自分でコードを見たときに理解するのにタイムコストがかかったり、誤解を招いたりする無駄なコストを使わずに済むと学んだからです。  
　２つ目の「バグを想定する習慣を持つこと」についてです。ここの意識を持って開発に取り組んでいれば、経験を重ねるたびに初めからバグを生まない設計を行うことができるようになっていけると考えたからです。ポートフォリオの具体例は、商品詳細ページの「一覧ページに戻る」ボタン等です。これはそれが属するカテゴリーページに戻るボタンですが、adminが商品を登録する際にカテゴリーを決めずに出品すると戻るボタンでバグが起きてしまいます。したがって属するカテゴリーがなかった場合はこのボタン自体を表示しないようにいたしました。  
　3つ目の「テストをしっかりと書くこと」についてです。これは一つ一つ確実に、そして早く開発を進めていく為です。正直、機能の実装の方が圧倒的に楽しいのでテストは敬遠したい気持ちがあります。しかし、プロのエンジニアになるためには素早く正確な開発がとても重要であると考え、購入した教材を参考にRSpecを書きました。  

## ポートフォリオを通しての学び
１、errorにハマった時に問題の究明までの時間的コストを最小限にしていくために、こまめなデプロイが超大事だと思いました。  
２、変更が思わぬ悪影響を与えていくことが多々あったので、RSpec等のテストをこまめに書いていくこともと超重要だと感じました。  

## 自分が苦労した点
１、すでに構築されているモデルの構造やディレクトリ構造を理解していくことが初めてだったので、初めはとてもエネルギーがかかりました。  
２、準備されているmethodはどこにあってどういった機能なのか、探してコードを見て理解していくのがとても大変でした。  
３、環境を構築したりデプロイしたりする上でDBの動きを理解しつつ問題を解決していくことがとても大変だでしたし、解決できないこともあったので、これからも勉強して理解を深めていきたいと思っています。  

## 自慢したい点
１、ポートフォリオ作成を通して、１度だけメンターさんに質問しましたが、それ以外は自分で調べて解決して実装したこと！  
２、オープンソースのフレームワークやAPIを使うことによって既にあるコードを理解して実装していくと言う、より実践に近いポートフォリオ作成ができたこと！  
３、一部はスクールでの本課題となりますが、その際のプルリクエストで２度同じことを指摘されないように意識したことと、しっかりとコメントに対して感謝の気持ちを伝えていったこと！  

## 使い方のお願い
１、Session周りについてはsolidus_auth_deviseを用いております。しかし、signup,login.logoutの際にokudairaにredirectする実装ができておりません。お手数ですが、　　
「https://okudaira.herokuapp.com/aguzon」　　
のように「aguzon」ディレクトリにアクセスしてください。「カートへ入れる機能」はアカウントに紐づけられていますので、loginすると使えるようになります。  
２、支払い機能までは実装しておりません。  

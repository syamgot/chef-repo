# chef-repo

knife solo で cook する

## セットアップ

	# 
	$ git clone https://github.com/syamgot/chef-repo

	# yum, apt の cookbookをダウンロード
	$ knife cookbook site vendor yum
	$ knife cookbook site vendor apt

	# 対象サーバで Chef solo の実行環境を用意する
	$ knife solo prepare hostname

## 実行

	# 
	$ knife solo cook hostname



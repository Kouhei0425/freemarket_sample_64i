# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails dbseed command (or created alongside the database with dbsetup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Brand.create(:name => 'シャネル')
Brand.create(:name => 'ナイキ')
Brand.create(:name => 'ルイ　ヴィトン')
Brand.create(:name => 'シュプリーム')
Brand.create(:name => 'アディダス')

Category.create(:name => 'メンズ')
Category.create(:name => 'レディース')
Category.create(:name => 'ベビー・キッズ')
Category.create(:name => 'インテリア・・住まい・小物')
Category.create(:name => '本・音楽・・ゲーム')
Category.create(:name => 'おもちゃ・ホビー・グッズ')
Category.create(:name => 'コスメ・香水・美容')
Category.create(:name => '家電・スマホ・カメラ')
Category.create(:name => 'スポーツ・レジャー')
Category.create(:name => 'ハンドメイド')
Category.create(:name => 'チケット')
Category.create(:name => '自動車・オートバイ')
Category.create(:name => 'その他')
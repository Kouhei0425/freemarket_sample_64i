# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails dbseed command (or created alongside the database with dbsetup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  :nickname => '仮の人',
  :email => 'sample@gmail.com',
  :password => 'sample'
)

require 'csv'
CSV.foreach('db/categories_list.csv') do |row|
  Category.create(
      name:         row[0],
      parent_id:    row[1]
  )
end

Brand.create(:name => 'シャネル')
Brand.create(:name => 'ナイキ')
Brand.create(:name => 'ルイ　ヴィトン')
Brand.create(:name => 'シュプリーム')
Brand.create(:name => 'アディダス')

Area.create(:name => '北海道')
Area.create(:name => '青森県')
Area.create(:name => '岩手県')
Area.create(:name => '宮城県')
Area.create(:name => '秋田県')
Area.create(:name => '山形県')
Area.create(:name => '福島県')
Area.create(:name => '茨城県')
Area.create(:name => '栃木県')
Area.create(:name => '群馬県')
Area.create(:name => '埼玉県')
Area.create(:name => '千葉県')
Area.create(:name => '東京都')
Area.create(:name => '神奈川県')
Area.create(:name => '新潟県')
Area.create(:name => '富山県')
Area.create(:name => '石川県')
Area.create(:name => '福井県')
Area.create(:name => '山梨県')
Area.create(:name => '長野県')
Area.create(:name => '岐阜県')
Area.create(:name => '静岡県')
Area.create(:name => '愛知県')
Area.create(:name => '三重県')
Area.create(:name => '滋賀県')
Area.create(:name => '京都府')
Area.create(:name => '大阪府')
Area.create(:name => '兵庫県')
Area.create(:name => '奈良県')
Area.create(:name => '和歌山県')
Area.create(:name => '鳥取県')
Area.create(:name => '島根県')
Area.create(:name => '岡山県')
Area.create(:name => '広島県')
Area.create(:name => '山口県')
Area.create(:name => '徳島県')
Area.create(:name => '香川県')
Area.create(:name => '愛媛県')
Area.create(:name => '高知県')
Area.create(:name => '福岡県')
Area.create(:name => '佐賀県')
Area.create(:name => '長崎県')
Area.create(:name => '熊本県')
Area.create(:name => '大分県')
Area.create(:name => '宮崎県')
Area.create(:name => '鹿児島県')
Area.create(:name => '沖縄県')

Good.create(
  name: 'ドレスアップ姿勢フィットインナー',
  size: 'M',
  price: '1200',
  method: 'ゆうゆうメルカリ便',
  ship: '1~2日',
  status: '新品、未使用',
  burden: '送料込み(出品者負担)',
  explain: '出品はブラック１枚のみです。
  表記サイズ　M〜Ｌ
  取り外し出来るブラパッド内蔵で、上品なレース調の生地が使用されています。
  
  新品ですが写真撮影のため袋から出しています。
  
  自宅保管品につき、細かいことを気になさる方や完璧な商品をお求めの方はご購入をご遠慮ください。',
  user_id: '1',
  brand_id: '1',
  area_id: '12'
)

CategoryGood.create(category_id: '1', good_id: '1')
CategoryGood.create(category_id: '14', good_id: '1')
CategoryGood.create(category_id: '21', good_id: '1')
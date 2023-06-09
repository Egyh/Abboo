# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
  email: "admin@admin",
  password: "abboo2023",
  )

users=User.create!(
  [
    {email: "Ichiro@example.com", name: "一郎", password: "password", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/monster01.png"), filename:"monster01.png"), introduction:"よろしくお願いします。", country_code:"JP", abroad_record:"アメリカ", purpose:"語学留学", period:"1年間"},
    {email: "james@example.com", name: "James", password: "password", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/monster02.png"), filename:"monster02.png"), introduction:"イギリス大好き", country_code:"CN", abroad_record:"イギリス", purpose:"大学留学", period:"半年間"},
    {email: "lucas@example.com", name: "Lucas", password: "password", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/monster03.png"), filename:"monster03.png"), introduction:"写真が趣味です", country_code:"AE", abroad_record:"ブラジル", purpose:"社会人留学", period:"３カ月"},
    {email: "Ebba@example.com", name: "Ebba", password: "password", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/monster04.png"), filename:"monster04.png"), introduction:"アジアに行きたい", country_code:"CA", abroad_record:"韓国", purpose:"語学留学", period:"1カ月"},
    {email: "Valencia@example.com", name: "Valencia", password: "password", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/monster05.png"), filename:"monster05.png"), introduction:"数学を勉強してます", country_code:"ES", abroad_record:"アメリカ,中国", purpose:"高校留学", period:"２年間"},
    {email: "Yoson@example.com", name: "서연", password: "password", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/monster06.png"), filename:"monster06.png"), introduction:"シーフードが食べたい!", country_code:"KR", abroad_record:"イタリア", purpose:"語学留学", period:"1年間"},
    {email: "Liam@example.com", name: "Liam", password: "password", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/monster07.png"), filename:"monster07.png"), introduction:"サッカーが得意", country_code:"FR", abroad_record:"ロシア", purpose:"大学留学", period:"3カ月"},
    {email: "Muchen@example.com", name: "沐宸", password: "password", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/monster08.png"), filename:"monster08.png"), introduction:"バスの運転手です", country_code:"CN", abroad_record:"南アフリカ共和国", purpose:"社会人留学", period:"3カ月"},
    {email: "Harry@example.com", name: "Harry", password: "password", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/monster09.png"), filename:"monster09.png"), introduction:"クラシックをよく聞く", country_code:"CH", abroad_record:"インド", purpose:"短期留学", period:"２週間"},
    {email: "yuuki@example.com", name: "ゆうき", password: "password", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/monster10.png"), filename:"monster09.png"), introduction:"プログラミング学習中", country_code:"JP", abroad_record:"アメリカ", purpose:"大学留学", period:"1年間"},
  ]
)

Article.create!(
  [
    {title: "マーライオン！！！", article_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample1.jpg"), filename:"sample1.jpg"), body: "マーライオンがすごい#サンプルテスト", latitude:"1.2867416" , longitude:"103.8496255" ,user_id: users[0].id },
    {title: "大自然のアメリカ", article_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample2.jpg"), filename:"sample2.jpg"), body: "絵の中にいるみたい・・・", latitude:"35.9881301", longitude:"-110.5690768" ,user_id: users[1].id },
    {title: "パスタ専門店", article_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample3.jpg"), filename:"sample3.jpg"), body: "パスタ好きにはたまらない場所#サンプルテスト", latitude:"44.446948", longitude:"8.80826" ,user_id: users[2].id },
    {title: "KYOTO", article_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample4.jpg"), filename:"sample4.jpg"), body: "what a beautiful place", latitude:"34.9957302", longitude:"135.7783725" ,user_id: users[3].id },
    {title: "以后我要吃火锅", article_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample5.jpg"), filename:"sample5.jpg"), body: "楽しみ～", latitude:"22.4025615", longitude:"114.2424928" ,user_id: users[4].id },
    {title: "エクアドル", article_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample6.jpg"), filename:"sample6.jpg"), body: "鮮やかな民族衣装#サンプルテスト", latitude:"-2.4160298", longitude:"-78.5127067" ,user_id: users[5].id },
    {title: "ホームシックの対処方法", body: "何かいい方法があれば教えてください～",user_id: users[6].id },
    {title: "やっと到着!!!", article_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample7.jpg"), filename:"sample7.jpg"), body: "長旅つかれた(笑)#サンプルテスト", latitude:"55.8844161", longitude:"-3.8062872" ,user_id: users[7].id },
    {title: "食べ物？？？", article_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample8.jpg"), filename:"sample8.jpg"), body: "ベトナムではスープらしい", latitude:"10.7760423", longitude:"106.6740722" ,user_id: users[8].id },
    {title: "面白い勉強方???", body: "何かいい方法があれば教えてください～",user_id: users[1].id },
    {title: "一人旅", article_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample9.jpg"), filename:"sample9.jpg"), body: "思い出に一人旅", latitude:"-33.8567844", longitude:"151.2127218" ,user_id: users[9].id },
  ]
)
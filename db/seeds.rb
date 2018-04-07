# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: "User1", university: "東京工業大学", email: "hogehuga@gmail.com", password: "password")
user2 = User.create(name: "User2", university: "東京大学", email: "hohuga@gmail.com", password: "password")

field = Field.create(name: "航空工学")
field2 = Field.create(name: "バイオ")
filed3 = Field.create(name: "IT")

UserField.create(user_id: user2.id, field_id: field.id)

Rank.create(field_id: field.id, rank: 0, from_id: user1.id, to_id: user2.id)

recruit = Recruit.create(
  title: "完全人柄採用！エンジニアになりたい人、Gizumoが育てます！",
  field_id: field.id,
  detail: "「人の未来を創る」をビジョンに、Web領域を中心としたシステム開発事業、未経験者に向けエンジニア教育サービス「GizTech」を提供。2017年より、AI×金融やブロックチェーン技術といったFinTech領域を研究対象としたラボを設立。先端技術を用いた新規サービス開発をしているテックベンチャーです。",
  status: 0
)

ClientRecruitRelation.create(
  user_id: user1,
  recruit_id: recruit.id
)

Recruit.create(
  title: "リアル版「YOUは何しに日本へ？」世界に感動を生むWebエンジニア大募集",
  field_id: 2,
  detail: "TRIPLUSは、旅行先の生活様式や文化を体験したい外国人旅行客が、日本各地のアクティブシニアの方々自身が提案/提供する、まるでそこで暮らしているかのようなちょっとした日本体験を、検索/申し込みをしたり、外国人旅行客側からシニア側に対して、体験の内容をリクエストしたりする事ができるインターネットサービスです。",
  status: 0
)

Recruit.create(
  title: "仮想通貨相場一覧アプリ",
  field_id: 3,
  detail: "世界中で取引されるビットコインのデータ（トランザクション）は、ネットワークに伝播すると、世界中にいる採掘者（マイナー）が、一定時間の取引データを1つにまとめた「ブロック」を競うように生成していきます。
その取引の二重払いや不正を防ぐため、過去の取引履歴のデータの整合性を取りながら 取引の承認・確認作業を行うことをマイニングと言います。",
  status: 0
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Staff.create!(nickname:'スタッフ01', email: 'test-staff01@test.market', password: 'test1234')
User.create!(nickname:'ユーザー01', family_name: 'ゆーざーぜろいち', first_name: 'ゆーざーぜろいち', family_name_kana: 'ユーザーゼロイチ', first_name_kana: 'ユーザーゼロイチ', phone_number: '00011112222', email: 'test-user01@test.market', password: 'test1234')
User.create!(nickname:'ユーザー02', family_name: 'ゆーざーぜろに', first_name: 'ゆーざーぜろに', family_name_kana: 'ユーザーゼロニ', first_name_kana: 'ユーザーゼロニ', phone_number: '00011112222', email: 'test-user02@test.market', password: 'test1234')
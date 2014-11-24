#encoding: utf-8

# несколько пользователей
User.create([ 
  {name: 'Alex', email: 'alex@alivance.com', password: '123456'},
  {name: 'Bob', email: 'bob@alivance.com', password: 'Qwerty12'},
  {name: 'Alice', email: 'alice@alivance.com', password: 'EbMNk44'},
  {name: 'Eve', email: 'eve@alivance.com', password: '![dwMk]}654iEydbPcdd#'},
])

# выполним запрос к базе
# теперь в переменной alex объект с полями, соответствующими записи в таблице
alex = User.where(name: 'Alex').first
bob = User.where(name: 'Bob').first
alice = User.where(name: 'Alice').first

# две категории
Category.create([
  {name: "Бар"},
  {name: "Кафе"}
])

cafe = Category.where(name: "Кафе").first

# два типа рейтинга
RatingType.create([
  {name: "Сервис"},
  {name: "Кухня"}
])

kitchen = RatingType.where(name: "Кухня").first

# создадим сотню заведений
# такие громоздкие операции лучше выполнять в одной транзакции
Club.transaction do 
  100.times do |i|
    # в переменной c будет объект, соответствующий только что созданной записи
    c = Club.create({
      name: "Club#{i}",
      description: "Описание",
      address: "ул. Ленина, д. #{i}",
      photo: "http://smartreserve.by/assets/img/default-photo.png",
      web_site: "http://example.com",
      email: "club#{i}@alivance.com",
      owner_id: alex.id, # ссылка на владельца
      category_id: cafe.id # ссылка на категорию
    })

    # по двадцать столиков для каждого заведения
    20.times do
      t = Table.create({
        club_id: c.id,
        seats: 5
      })

      # по заказу на каждый столик
      Order.create({
        time: Time.now,
        confirmation: "1234",
        table_id: t.id,
        user_id: bob.id
      })
    end

    # по одной новости
    News.create(title: "Мы открылись", content: "Мы открылись", club_id: c.id, created_at: Time.now)

    # подписке
    Subscribe.create(club_id: c.id, user_id: alice.id)

    # оценке
    Rate.create(club_id: c.id, user_id: alice.id, stars: 5)

    # и комментарию
    Comment.create(club_id: c.id, user_id: alice.id, content: "First comment", created_at: Time.now)
  end
end

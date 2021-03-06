Rails.application.configure do
  Phobos.configure('config/phobos.yml')

  group_id = SecureRandom.uuid

  config.after_initialize do
    book_listener = Phobos::Listener.new(
      handler: Books::Consumer,
      group_id: group_id,
      topic: 'test.books'
    )

    review_listener = Phobos::Listener.new(
      handler: Reviews::Consumer,
      group_id: group_id,
      topic: 'test.reviews'
    )

    review_book_listener = Phobos::Listener.new(
      handler: Reviews::Consumer,
      group_id: 'reviews',
      topic: 'test.books'
    )

    review_user_listener = Phobos::Listener.new(
      handler: Reviews::Consumer,
      group_id: 'reviews',
      topic: 'test.users'
    )

    user_listener = Phobos::Listener.new(
      handler: Users::Consumer,
      group_id: group_id,
      topic: 'test.users'
    )

    # start method blocks
    Thread.new { book_listener.start }
    Thread.new { review_listener.start }
    Thread.new { review_book_listener.start }
    Thread.new { review_user_listener.start }
    Thread.new { user_listener.start }
  end
end

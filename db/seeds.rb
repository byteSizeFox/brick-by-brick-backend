user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password", username: "test1")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password", username: "test2")

Post.create(
    title: 'Bombtastic Build',
    time_spent: '3 hours',
    difficulty: 5,
    price: '$100',
    review: 'sample review',
    image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
    user_id: user1.id,
    username: 'shauneigh'
)

Post.create(
    title: 'post2',
    time_spent: '4 hours',
    difficulty: 8,
    price: '$105',
    review: 'sample review 2',
    image: 'https://unsplash.com/photos/white-and-black-lego-toy-B7N0IjiIJYo',
    user_id: user2.id,
    username: 'TheBrizeulator'
)

p Post.all
p User.all
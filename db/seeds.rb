# Create users
User.create(email: 'use1@example.com', password: 'password', name: 'Tommy', bio: 'Poor Developer', avatar_url: 'https://thumbs.dreamstime.com/b/face-portrait-very-happy-man-against-aqua-marine-blue-face-portrait-very-happy-man-against-aqua-marine-blue-color-background-204349508.jpg', admin: false)
User.create(email: 'use@example.com', password: 'password', name: 'Johny', bio: 'Meaw Meaw', avatar_url: 'https://lookyourbestbeyourbest.files.wordpress.com/2011/11/image-3.jpeg', admin: false)
User.create(email: 'user@example.com', password: 'password', name: 'Prantosh', bio: 'Lazy Developer', avatar_url: 'https://i0.wp.com/manforhimself.com/wp-content/uploads/2022/01/andrew-garfield-wavy-quiff-mens-hairstyles-man-for-himself-ft.jpg?fit=1200%2C1200&ssl=1?v=1641480718', admin: false)
User.create(email: 'user2@example.com', password: 'password', name: 'Hein', bio: 'Talented Programmer', avatar_url: 'https://images.unsplash.com/photo-1592334873219-42ca023e48ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8M3w3NjA4Mjc3NHx8ZW58MHx8fHw%3D&w=1000&q=80', admin: false)
User.create(email: 'user3@example.com', password: 'password', name: 'Aman', bio: 'MacBook User', avatar_url: 'https://stylesatlife.com/wp-content/uploads/2019/09/Hairstyles-for-Square-Face-Men-12.jpg', admin: false)
User.create(email: 'user4@example.com', password: 'password', name: 'Thant', bio: 'From Myanmar', avatar_url: 'https://picsum.photos/200', admin: false)
User.create(email: 'user5@example.com', password: 'password', name: 'Biswas', bio: 'From India', avatar_url: 'https://picsum.photos/200', admin: false)
User.create(email: 'user6@example.com', password: 'password', name: 'Worku', bio: 'From Ethiopia', avatar_url: 'https://picsum.photos/200', admin: false)

# Create code snippets
CodeSnippet.create(title: 'Ruby on Rails Tutorial', description: 'A basic tutorial for Ruby on Rails', code: 'rails new myapp', language: 'Ruby', stars_counter: 0, comments_counter: 0, user_id: 1)
CodeSnippet.create(title: 'Working with Django', description: 'A beginner\'s guide to Django', code: 'python manage.py runserver', language: 'Python', stars_counter: 0, comments_counter: 0, user_id: 2)

# Create comments
Comment.create(content: 'This is a great tutorial!', code_snippet_id: 1, user_id: 2)
Comment.create(content: 'Thanks for sharing this!', code_snippet_id: 1, user_id: 1)

# Create ratings
Rating.create(stars: 4, code_snippet_id: 1, user_id: 1)
Rating.create(stars: 5, code_snippet_id: 1, user_id: 2)

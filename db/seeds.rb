# Create users
User.create(email: 'user1@example.com', password: 'password', name: 'Tom', bio: 'Software Developer', avatar_url: 'https://picsum.photos/200', admin: false)
User.create(email: 'user2@example.com', password: 'password', name: 'John', bio: 'Full Stack Developer', avatar_url: 'https://picsum.photos/200', admin: false)

# Create code snippets
CodeSnippet.create(title: 'Ruby on Rails Tutorial', description: 'A basic tutorial for Ruby on Rails', code: 'rails new myapp', language: 'Ruby', stars_counter: 0, comments_counter: 0, user_id: 1)
CodeSnippet.create(title: 'Working with Django', description: 'A beginner\'s guide to Django', code: 'python manage.py runserver', language: 'Python', stars_counter: 0, comments_counter: 0, user_id: 2)

# Create comments
Comment.create(content: 'This is a great tutorial!', code_snippet_id: 1, user_id: 2)
Comment.create(content: 'Thanks for sharing this!', code_snippet_id: 1, user_id: 1)

# Create ratings
Rating.create(stars: 4, code_snippet_id: 1, user_id: 1)
Rating.create(stars: 5, code_snippet_id: 1, user_id: 2)

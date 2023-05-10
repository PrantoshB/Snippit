# Create users
user1 = User.create!(email: 'user1@example.com', password: 'password', name: 'Tommy', bio: 'Poor Developer', avatar_url: 'https://thumbs.dreamstime.com/b/face-portrait-very-happy-man-against-aqua-marine-blue-face-portrait-very-happy-man-against-aqua-marine-blue-color-background-204349508.jpg', admin: false)
user2 = User.create!(email: 'user2@example.com', password: 'password', name: 'Hein', bio: 'Talented Imposter', avatar_url: 'https://images.unsplash.com/photo-1592334873219-42ca023e48ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8M3w3NjA4Mjc3NHx8ZW58MHx8fHw%3D&w=1000&q=80', admin: false)
user3 = User.create!(email: 'user3@example.com', password: 'password', name: 'Aman', bio: 'MacBook User', avatar_url: 'https://stylesatlife.com/wp-content/uploads/2019/09/Hairstyles-for-Square-Face-Men-12.jpg', admin: false)
user4 = User.create!(email: 'user4@example.com', password: 'password', name: 'Thant', bio: 'From Myanmar', avatar_url: 'https://picsum.photos/200', admin: false)
user5 = User.create!(email: 'user5@example.com', password: 'password', name: 'Biswas', bio: 'From India', avatar_url: 'https://picsum.photos/200', admin: false)
user6 = User.create!(email: 'user6@example.com', password: 'password', name: 'Worku', bio: 'From Ethiopia', avatar_url: 'https://picsum.photos/200', admin: false)
user7 = User.create!(email: 'user7@example.com', password: 'password', name: 'Johny', bio: 'Meaw Meaw', avatar_url: 'https://lookyourbestbeyourbest.files.wordpress.com/2011/11/image-3.jpeg', admin: false)
user8 = User.create!(email: 'user8@example.com', password: 'password', name: 'Prantosh', bio: 'Lazy Developer', avatar_url: 'https://i0.wp.com/manforhimself.com/wp-content/uploads/2022/01/andrew-garfield-wavy-quiff-mens-hairstyles-man-for-himself-ft.jpg?fit=1200%2C1200&ssl=1?v=1641480718', admin: false)

# Create code snippets
snippet1 = CodeSnippet.create!(user: user1, title: 'Ruby on Rails Tutorial', description: 'A basic tutorial for Ruby on Rails', code: 'rails new myapp', language: 'Ruby')
snippet2 = CodeSnippet.create!(user: user2, title: 'Working with Django', description: 'A beginner\'s guide to Django', code: 'python manage.py runserver', language: 'Python')
snippet3 = CodeSnippet.create!(user: user3, title: 'FizzBuzz Algorithm', description: "Algorithm that prints numbers from 1 to 100, but for multiples of three, it prints 'Fizz' instead of the number and for the multiples of five, it prints 'Buzz'. For numbers which are multiples of both three and five, it prints 'FizzBuzz'.", code: "for (let i = 1; i <= 100; i++) {\n  if (i % 3 === 0 && i % 5 === 0) {\n    console.log('FizzBuzz');\n  } else if (i % 3 === 0) {\n    console.log('Fizz');\n  } else if (i % 5 === 0) {\n    console.log('Buzz');\n  } else {\n    console.log(i);\n  }\n}", language: 'JavaScript')
snippet4 = CodeSnippet.create!(user: user5, title: 'Factorial Program', description: "A program that calculates the factorial of a given number.", code: "function factorial(n) {\n  if (n <= 1) {\n    return 1;\n  }\n  return n * factorial(n - 1);\n}", language: "JavaScript")

# Create comments
Comment.create(content: 'This is a great tutorial!', code_snippet: snippet4, user: user5)
Comment.create(content: 'This is a great tutorial!', code_snippet: snippet3, user: user3)
Comment.create(content: 'This is a great tutorial!', code_snippet: snippet1, user: user8)
Comment.create(content: 'Thanks for sharing this!', code_snippet: snippet1, user: user7)

# Create ratings
Rating.create(stars: 4, code_snippet: snippet1, user: user5)
Rating.create(stars: 5, code_snippet: snippet2, user: user4)

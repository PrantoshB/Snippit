# Clear existing data
User.destroy_all
CodeSnippet.destroy_all
Comment.destroy_all
Rating.destroy_all


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
snippet1 = CodeSnippet.create!(user: user1, title: 'Ruby String Manipulation', description: 'A code snippet demonstrating string manipulation in Ruby', code: "string = 'Hello, World!'\nputs string.upcase\nputs string.reverse", language: 'Ruby')
snippet2 = CodeSnippet.create!(user: user2, title: 'Arduino Blink LED', description: 'A basic Arduino sketch to blink an LED', code: "int ledPin = 13;\n\nvoid setup() {\n  pinMode(ledPin, OUTPUT);\n}\n\nvoid loop() {\n  digitalWrite(ledPin, HIGH);\n  delay(1000);\n  digitalWrite(ledPin, LOW);\n  delay(1000);\n}", language: 'Arduino')
snippet3 = CodeSnippet.create!(user: user3, title: 'FizzBuzz Algorithm', description: "Algorithm that prints numbers from 1 to 100, but for multiples of three, it prints 'Fizz' instead of the number and for the multiples of five, it prints 'Buzz'. For numbers which are multiples of both three and five, it prints 'FizzBuzz'.", code: "for (let i = 1; i <= 100; i++) {\n  if (i % 3 === 0 && i % 5 === 0) {\n    console.log('FizzBuzz');\n  } else if (i % 3 === 0) {\n    console.log('Fizz');\n  } else if (i % 5 === 0) {\n    console.log('Buzz');\n  } else {\n    console.log(i);\n  }\n}", language: 'JavaScript')
snippet4 = CodeSnippet.create!(user: user5, title: 'Factorial Program', description: "A program that calculates the factorial of a given number.", code: "function factorial(n) {\n  if (n <= 1) {\n    return 1;\n  }\n  return n * factorial(n - 1);\n}", language: "JavaScript")
snippet5 = CodeSnippet.create!(user: user1, title: 'GDScript Timer', description: 'A code snippet demonstrating the use of a Timer in GDScript', code: "extends Node\n\nvar timer = Timer.new()\n\nfunc _ready():\n    timer.wait_time = 2.0\n    timer.one_shot = false\n    timer.connect('timeout', self, '_on_Timer_timeout')\n    timer.start()\n\nfunc _on_Timer_timeout() -> void:\n    print('Timer expired')", language: 'GDScript')
snippet6 = CodeSnippet.create!(user: user1, title: 'PHP File Handling', description: 'A code snippet demonstrating file handling in PHP', code: "<?php\n$file = fopen('example.txt', 'r');\necho fread($file, filesize('example.txt'));\nfclose($file);\n?>", language: 'PHP')
snippet7 = CodeSnippet.create!(user: user2, title: 'Database Connection in Go', description: 'A code snippet for connecting to a database in Go', code: "package main\n\nimport (\n    'database/sql'\n    _ 'github.com/go-sql-driver/mysql'\n    'log'\n)\n\nfunc main() {\n    db, err := sql.Open('mysql', 'user:password@tcp(127.0.0.1:3306)/database')\n    if err != nil {\n        log.Fatal(err)\n    }\n    defer db.Close()\n\n    // Rest of the code...\n}", language: 'GO')
snippet8 = CodeSnippet.create!(user: user3, title: 'Python Fibonacci Sequence', description: 'A Python function to generate the Fibonacci sequence', code: "def fibonacci(n):\n    fib = [0, 1]\n    for i in range(2, n+1):\n        fib.append(fib[i-1] + fib[i-2])\n    return fib\n\nprint(fibonacci(10))", language: 'Python')
snippet9 = CodeSnippet.create!(user: user4, title: 'JavaScript Event Listener', description: 'A code snippet demonstrating an event listener in JavaScript', code: "document.getElementById('myButton').addEventListener('click', function() {\n    alert('Button clicked!');\n});", language: 'JavaScript')
snippet10 = CodeSnippet.create!(user: user5, title: 'CSS Flexbox Layout', description: 'A CSS snippet demonstrating a basic flexbox layout', code: ".container {\n    display: flex;\n    justify-content: center;\n    align-items: center;\n}", language: 'CSS')

# Create comments
Comment.create(content: 'This is a great tutorial!', code_snippet: snippet4, user: user5)
Comment.create(content: 'This is a great tutorial!', code_snippet: snippet3, user: user3)
Comment.create(content: 'This is a great tutorial!', code_snippet: snippet1, user: user8)
Comment.create(content: 'Thanks for sharing this!', code_snippet: snippet1, user: user7)

# Create ratings
Rating.create(stars: 4, code_snippet: snippet1, user: user5)
Rating.create(stars: 5, code_snippet: snippet2, user: user4)

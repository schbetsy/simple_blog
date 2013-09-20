User.create(email: "me@me.com", password: "123")

User.first.posts << Post.create(title: "my_title", content: "my_content")

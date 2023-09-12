# user作成
user = User.new(
  name: "test",
  email: "test@example.com",
  password: "password",
  password_confirmation: "password"
)
user.save!

# userに紐づいたtaskを作成
3.times do |n|
  user.tasks.create!(
    content: "task#{n}"
  )
end

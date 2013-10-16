require_relative 'hnscraper'
require 'faker'

post = Post.create(Scraper.new("https://news.ycombinator.com/item?id=6560275").find_post)
User.all.sample.posts << post
post.save

Scraper.new("https://news.ycombinator.com/item?id=6560275").find_comments.each do |comment|
  post.comments << Comment.create(comment)
end

Scraper.new("https://news.ycombinator.com/item?id=6558937").find_comments.each do |comment|
  comment = Comment.create(comment)
  Post.all.sample.comments << comment
  User.all.sample.comments << comment
end


scraper = Scraper.new("https://news.ycombinator.com/item?id=6558180")

p = Post.new(scraper.find_post)
User.all.sample.posts << p
p.save
scraper.find_comments.each do |comment|
  p.comments << Comment.create(comment)
end

scraper = Scraper.new("https://news.ycombinator.com/item?id=6555025")

p = Post.create(scraper.find_post)
User.all.sample.posts << p
p.save
scraper.find_comments.each do |comment|
  p.comments << Comment.create(comment)
end

scraper = Scraper.new("https://news.ycombinator.com/item?id=6553692")

p = Post.create(scraper.find_post)
User.all.sample.posts << p
p.save
scraper.find_comments.each do |comment|
  p.comments << Comment.create(comment)
end

scraper = Scraper.new("https://news.ycombinator.com/item?id=6560214")

p = Post.create(scraper.find_post)
User.all.sample.posts << p
p.save
scraper.find_comments.each do |comment|
  p.comments << Comment.create(comment)
end

scraper = Scraper.new("https://news.ycombinator.com/item?id=6559760")

p = Post.create(scraper.find_post)
User.all.sample.posts << p
p.save
scraper.find_comments.each do |comment|
  p.comments << Comment.create(comment)
end

post = Post.create(title: Faker::Company.bs,
                content: "He's the hero Gotham deserves, but not the one it needs right now. So we'll hunt him. Because he can take it. Because he's not our hero. He's a silent guardian, a watchful protector. A dark knight.")


post.comments << Comment.create(:content => "This guy rocks!")

post.user = User.all.sample
post.save

require 'random_data'

 50.times do

   Post.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all


 100.times do
   Comment.create!(

     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 comments = Comment.all

posts.find_or_create_by!(title: "Unique Title", body: "A unique body for a unique post.")
comments.find_or_create_by!(post: Post.find(51), body: "A unique comment!")

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"

namespace :det do
  desc " -Just test- "
  task( :testT ) do
    puts "kerokero"
  end

  desc " -lol.txt- "
  task( :lol ) do
    if File.exists?( " #{ RAILS_ROOT } /public/lol.txt " )
      puts " lol.txt exists. "
    else
      puts " Create the file. "
      #File .touch " #{ RAILS_ROOT } /public/lol.txt "
    end
  end

  desc " Fake post "
  task( :fakeP => :environment ) do
    @forum = Forum.find(3)
    @post = @forum.posts.new
    @post.title = "From task"
    @post.content = "Fake\r\nFake\r\nFake"
    @post.user_id = 3
    @post.save
    puts "Make fake post complete."
  end
end
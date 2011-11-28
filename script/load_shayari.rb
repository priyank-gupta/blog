Shayari.transaction do
  (5..50).each do |i|
    Shayari.create(:title => "Shayari #{i}", :body => "This is test shayari number #{i}", :category => "Life", :user_id => 3)
  end
end

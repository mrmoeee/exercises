# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

user1 = User.create(username: 'Jing Xia')
user2 = User.create(username: 'M03')
user3 = User.create(username: 'Mike Ross')
user4 = User.create(username: 'D3XTER')

artwork1 = Artwork.create(title: 'Jing', image_url: 'www.google.com', artist_id: 1)
artwork2 = Artwork.create(title: 'Space', image_url: 'www.space.com', artist_id: 2)
artwork3 = Artwork.create(title: 'suits', image_url: "http://www.usanetwork.com/sites/usanetwork/files/Suits_Mike-1.jpg", artist_id: 3)
artwork4 = Artwork.create(title: 'bloody', image_url: 'http://www.gstatic.com/tv/thumb/tvbanners/9707531/p9707531_b_v8_aa.jpg', artist_id: 4)

share1 = ArtworkShare.create(artwork_id: 1, viewer_id: 4)
share2 = ArtworkShare.create(artwork_id: 2, viewer_id: 3)
share3 = ArtworkShare.create(artwork_id: 3, viewer_id: 2)
share4 = ArtworkShare.create(artwork_id: 4, viewer_id: 1)
share5 = ArtworkShare.create(artwork_id: 4, viewer_id: 3)
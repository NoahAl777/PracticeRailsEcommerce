Ecommerce App

Post
  - belongs_to :user
  <!-- - belongs_to :category -->
  - has_many :comments
  - has_many :users, through: :comments
  * Title
  * Price
  * Content
  * Author
  * Buyer
  <!-- * Category -->

User
  - has_many :posts
  - has_many :comments
  - has_many :commented_posts, through: :comments
  <!-- - has_many :categories, through: :posts -->
  * Email
  * Username
  * Password (password_digest)

Comment - join table joining users and posts
  - belongs_to :user
  - belongs_to :post
  * Content

<!-- Categories
  - has_many :posts
  - has_many :comments, through :posts
  - has_many :users, through: :posts
  * Name -->
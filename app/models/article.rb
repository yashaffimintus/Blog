class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates_presence_of :title
   validates :text, presence: true          

  def name
    [title, text ].join " "
  end
  def self.by_letter(letter)
    where("text LIKE ?", "#{letter}%").order(:text)
  end
end

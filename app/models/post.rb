class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}

  PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]
  def clickbait?
    if PATTERNS.none? { |p| p.matct title}
      errors.add(:title, 'must be clickbait')
    end
  end
end

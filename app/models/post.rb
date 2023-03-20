class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    #Post category is either Fiction or Non-Fiction. This step requires an inclusion validator
    validates :category, inclusion: { in: %w( Fiction Non-Fiction)}
    validate :post_should_be_clickbait_y

    #custom validation
    #add a custom validator to the Post model that ensures the title is sufficiently clickbait-y. The validator should add a validation error if the title does not contain:
    #"Won't Believe"
    #"Secret"
    #"Top [number]"
    #"Guess"
    clickbait_y_pattern = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]
    def post_should_be_clickbait_y
        if clickbait_y_pattern.none? {|pattern| pattern.match(title)}
        errors.add(:title, "Title should be clickbait_y")
        end
    end

end

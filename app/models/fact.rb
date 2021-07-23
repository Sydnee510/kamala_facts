class Fact < ApplicationRecord
    belongs_to :myth
    accepts_nested_attributes_for :myth, reject_if: :all_blank
    validates :true_content, presence: true, uniqueness:true
    validates :receipt_url, presence: true

    scope :searched, ->(search_term) { where("true_content LIKE ?", "%#{search_term}%") }
end

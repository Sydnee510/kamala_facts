class Myth < ApplicationRecord
    include PgSearch
    has_many :facts
    validates :false_content, presence: true
   # pg_search_scope :search_for, against: %i(false_content)
    pg_search_scope :search_content_for, against: :false_content, using: { tsearch: { any_word: true } }
    # scope :search_myth, ->(myth_search) { where("false_content LIKE ?", "%#{myth_search}%") }

    #  def fact_receipt
    # c = self.facts.map do |fact|
    #     fact.receipt_url
    # end
    # d = c.join(", ")
    # end
    
    # def fact_content
    #    a = self.facts.map do |fact| 
    #    [ fact.true_content ]
    #     end 
    #     b = a.join("   
    #      " )
    # end 

   

end

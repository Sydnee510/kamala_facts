class Myth < ApplicationRecord
    has_many :facts
    validates :false_content, presence: true

    scope :search_myth, ->(myth_search) { where("false_content LIKE ?", "%#{myth_search}%") }

    #  def fact_receipt
    # c = self.facts.map do |fact|
    #     fact.receipt_url
    # end
    # d = c.join(", ")
    # end
    
    def fact_content
       a = self.facts.map do |fact| 
       [ fact.true_content, 
       fact.receipt_url ]
        end 
        b = a.join("   
         " )
    end 

   

end

class CompanyValue < ApplicationRecord
  has_many :kudos, foreign_key: 'company_value_id', dependent: :destroy
  validates :title, presence: true, uniqueness: true
end

class CompanyValue < ApplicationRecord
  has_many :kudos, dependent: :destroy
  validates :title, presence: true, uniqueness: true
end

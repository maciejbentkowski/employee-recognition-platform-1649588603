class CompanyValue < ApplicationRecord
  belongs_to :kudo
  validates :title, presence: true, uniqueness: true
end

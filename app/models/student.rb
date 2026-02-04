class Student < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :email, presence: true,
                   format: { with: URI::MailTo::EMAIL_REGEXP },
                   uniqueness: { case_sensitive: false }
  validates :status, presence: true
  enum :status, { active: "Active", inactive: "Inactive", graduated: "Graduated" }

  def self.ransackable_attributes(auth_object = nil)
    [
      "name",
      "class_name",
      "status"
    ]
  end
end

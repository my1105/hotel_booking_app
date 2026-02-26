class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, :check_out, :people, presence: true
  validates :people, numericality: { greater_than_or_equal_to: 1 }

  validate :check_in_cannot_be_in_the_past
  validate :check_out_after_check_in

  def check_in_cannot_be_in_the_past
    return if check_in.blank?
    errors.add(:check_in, "は本日以降を選択してください") if check_in < Date.today
  end

  def check_out_after_check_in
    return if check_in.blank? || check_out.blank?
    errors.add(:check_out, "はチェックイン日より後にしてください") if check_out <= check_in
  end
end
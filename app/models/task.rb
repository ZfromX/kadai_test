class Task < ApplicationRecord

    validates :title, presence: true, length: {maximum:20}
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :memo, length: {maximum:500}

    validate :start_finish_check

    def start_finish_check
        if start_date.present? && end_date.present? && start_date >= end_date
        errors.add(:end_date, "は開始日より前の日付は登録できません")
        end
    end
end
class Location < ApplicationRecord
  # TODO: 不用額外設訂instance變數，交給Util::LocationPropertySetter設定
  attr_accessor :co2_reduction, :sale_electricity_price, :daily_power, 
                :total_power, :total_voltage, :total_current, :instant_power, 
                :daily_cumulative_sunshine, :daily_electricity_sale, :formate_time, 
                :now_pr, :average_sunshine_index, :pr_percentage, :temperature, :wx

  has_many :sites_locations
  has_many :sites, through: :sites_locations

  has_many :devices
  has_many :error_log

  has_many :boards_locations, dependent: :delete_all
  has_many :boards, through: :boards_locations, dependent: :delete_all

  validates :name, presence: true, uniqueness: true

  # TODO: 移動到Image Model存
  has_attached_file :mppt_image, path: File.join(Rails.root, 'public/uploads/mppt_image/:id/:filename'), url: '/uploads/mppt_image/:id/:filename'
  validates_attachment_content_type :mppt_image, content_type: /\Aimage\/.*\z/

  # TODO: 移動到Image Model存
  has_attached_file :photo, path: File.join(Rails.root, 'public/uploads/location_photo/:id/:filename'), url: '/uploads/location_photo/:id/:filename'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def mppt_image_url
    mppt_image.url
  end
end

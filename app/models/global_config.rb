class GlobalConfig < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :kind, presence: true
  validates :value, presence: true

  ALL_KIND = {
    'string'  => 'to_s',
    'integer' => 'to_i',
    'float'   => 'to_f',
  }

  def self.to_arr
    configs = GlobalConfig.all.reduce([]) do |a, c|
      a << {name: c.name, value: c.value.send(ALL_KIND[c.kind])}
      a
    end
  end

  def self.get_config(name)
    c = GlobalConfig.find_by_name(name)
    c = {name: c.name, value: c.value.send(ALL_KIND[c.kind])} if c.present?

    c
  end

end

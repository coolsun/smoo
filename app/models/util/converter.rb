class Util::Converter
  def self.to_float(num)
    num = num.to_f
    num.infinite? ? 0.0 : num
  end
end
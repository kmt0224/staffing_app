class Form::StaffingCollection < Form::Base
  FORM_COUNT = 1
  attr_accessor :staffings

  def initialize(attributes = {})
		if attributes.present?
      attrs = attributes.to_unsafe_h.dup#受け取ったストロングパラメータをハッシュ化
      if attrs[:staffings].present?#日時作成
        attrs[:date] = Date.new(
          attrs[date(1i)].to_i,
          attrs[date(2i)].to_i,
          attrs[date(3i)].to_i,
          )
      end
    end    
    super attributes
    unless self.staffings.present?
      self.staffings = FORM_COUNT.times.map { Staffing.new() } 
    end
  end

  def staffings_attributes=(attributes)
    self.staffings = attributes.map { |_, v| Staffing.new(v) }
  end

  def save
    Staffing.transaction do
      self.staffings.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
      
end
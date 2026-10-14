class NilClass  # nil.class
  def blank?
    true
  end
end

class String  # string.class
  def blank?
    self.size == 0
  end
end

['', 'person', nil].each do |element|
  puts element unless element.blank?
end

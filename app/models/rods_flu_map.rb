class RodsFluMap < Component
  field :intensities, type: Hash, default: {}

  def zips
    self.intensities.keys
  end

  def intensity_color(zip)
    case self.intensities[zip]
    when 1 then '#0D0'
    when 2 then '#3D0'
    when 3 then '#7D0'
    when 4 then '#AD0'
    when 5 then '#DD0'
    when 6 then '#DC0'
    when 7 then '#DA0'
    when 8 then '#D70'
    when 9 then '#D30'
    when 10 then '#D00'
    else '#BBB'
    end
  end

  def codes
    Zip::Code.where(:zip.in => self.zips)
  end
end

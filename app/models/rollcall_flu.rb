class RollcallFlu < Component
  field :title
  field :caption

  def self.line_data(params)
    {
      :points => [
        {:x => I18n.l(40.days.ago.to_date, :format => :short), :y => 5.5},
        {:x => I18n.l(39.days.ago.to_date, :format => :short), :y => 5.1},
        {:x => I18n.l(38.days.ago.to_date, :format => :short), :y => 6.2},
        {:x => I18n.l(37.days.ago.to_date, :format => :short), :y => 4.5},
        {:x => I18n.l(36.days.ago.to_date, :format => :short), :y => 6.0},
        {:x => I18n.l(35.days.ago.to_date, :format => :short), :y => 7.1},
        {:x => I18n.l(34.days.ago.to_date, :format => :short), :y => 8.5},
        {:x => I18n.l(33.days.ago.to_date, :format => :short), :y => 9.0},
        {:x => I18n.l(32.days.ago.to_date, :format => :short), :y => 9.2},
        {:x => I18n.l(31.days.ago.to_date, :format => :short), :y => 10.1},
        {:x => I18n.l(30.days.ago.to_date, :format => :short), :y => 10.0},
        {:x => I18n.l(29.days.ago.to_date, :format => :short), :y => 10.3},
        {:x => I18n.l(28.days.ago.to_date, :format => :short), :y => 9.8},
        {:x => I18n.l(27.days.ago.to_date, :format => :short), :y => 9.3},
        {:x => I18n.l(26.days.ago.to_date, :format => :short), :y => 7.2},
        {:x => I18n.l(25.days.ago.to_date, :format => :short), :y => 7.1},
        {:x => I18n.l(24.days.ago.to_date, :format => :short), :y => 6.4},
        {:x => I18n.l(23.days.ago.to_date, :format => :short), :y => 6.5},
        {:x => I18n.l(22.days.ago.to_date, :format => :short), :y => 6.3},
        {:x => I18n.l(21.days.ago.to_date, :format => :short), :y => 4.8},
        {:x => I18n.l(20.days.ago.to_date, :format => :short), :y => 5.3},
        {:x => I18n.l(19.days.ago.to_date, :format => :short), :y => 4.9},
        {:x => I18n.l(18.days.ago.to_date, :format => :short), :y => 5.0},
        {:x => I18n.l(17.days.ago.to_date, :format => :short), :y => 5.6},
        {:x => I18n.l(16.days.ago.to_date, :format => :short), :y => 6.7},
        {:x => I18n.l(15.days.ago.to_date, :format => :short), :y => 5.1},
        {:x => I18n.l(14.days.ago.to_date, :format => :short), :y => 4.8},
        {:x => I18n.l(13.days.ago.to_date, :format => :short), :y => 4.3},
        {:x => I18n.l(12.days.ago.to_date, :format => :short), :y => 4.5},
        {:x => I18n.l(11.days.ago.to_date, :format => :short), :y => 4.8},
        {:x => I18n.l(10.days.ago.to_date, :format => :short), :y => 5.1},
        {:x => I18n.l(9.days.ago.to_date, :format => :short), :y => 5.9},
        {:x => I18n.l(8.days.ago.to_date, :format => :short), :y => 4.8},
        {:x => I18n.l(7.days.ago.to_date, :format => :short), :y => 4.9},
        {:x => I18n.l(6.days.ago.to_date, :format => :short), :y => 5.2},
        {:x => I18n.l(5.days.ago.to_date, :format => :short), :y => 4.7},
        {:x => I18n.l(4.days.ago.to_date, :format => :short), :y => 4.3},
        {:x => I18n.l(3.days.ago.to_date, :format => :short), :y => 5.2},
        {:x => I18n.l(2.days.ago.to_date, :format => :short), :y => 5.1},
        {:x => I18n.l(1.days.ago.to_date, :format => :short), :y => 4.9}
      ],
      :min => 0,
      :max => 25
    }
  end
end

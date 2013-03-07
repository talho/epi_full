class GoogleFlu < Component

  field :location, type: String, :default => "United States"
  field :title
  field :caption

  def self.line_data(params)
    GoogleFluData.update
    cmp = Component.find_by_loc_ids(params[:loc_ids])
    {
      :points => GoogleFluData.where(:Date.gte => 1.year.ago.to_date).map{|d| {x:  I18n.l(d["Date"].to_date, :format => :short), y: d[cmp.location].to_i}}
    }
  end
end

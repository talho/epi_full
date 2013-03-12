class GoogleFluData
  include Mongoid::Document
  include Mongoid::Timestamps

  field :Date, type: Date

  validates :Date, :uniqueness => true, :presence => true

  def self.load
    res = HTTParty.get('http://www.google.org/flutrends/us/data.txt')
    data = res.body[667..-1]

    require 'csv'
    csv = CSV.new(data, {headers: true});

    csv.each do |row|
      GoogleFluData.create row.to_hash
    end
  end

  def self.update
    if (GoogleFluData.last.nil? || last_updated_at = GoogleFluData.last.updated_at.to_date) < Date.today
      res = HTTParty.get('http://www.google.org/flutrends/us/data.txt')
      data = res.body[667..-1]

      require 'csv'
      csv = CSV.new(data, {headers: true});

      csv.to_a[[-2, -(Date.today - last_updated_at.to_date).to_i/7].min..-1].each do |row|
        GoogleFluData.where(:Date => row['Date']).first_or_create.update_attributes row.to_hash
      end
    end
  end
end

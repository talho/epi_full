class ZipImporter
  def self.run(path)
    files = Dir.entries path
    pn = Pathname.new path
    STDOUT.sync = true
    p 'Writing/Updating state records'
    files.select{|x| /zt.._d00a.dat/ =~ x }.each do |file|
      state_id = /(?<=zt)..(?=_d00a.dat)/.match(file)[0]
      print state_id
      File.open pn.join(file) do |file|
        # set up the zips with the info id and zip code
        begin
          detail_id = file.gets.strip
          zip = file.gets.strip.gsub!(/\A"|"\Z/, '')
          4.times {|i| file.gets }

          unless detail_id == "0" || zip.blank?
            code = Zip::Code.where(zip: zip, state_id: state_id).first_or_create
            code.update_attributes detail_ids: code.detail_ids | [detail_id]
          end
          print '.'
        end until file.eof?
      end
    end

    print "\n"
    p "Writing zip codes"

    files.select{|x| /zt.._d00.dat/ =~ x }.each do |file|
      # calculate and write the path out to the database
      state_id = /(?<=zt)..(?=_d00.dat)/.match(file)[0]
      print state_id
      File.open pn.join(file) do |file|
        begin
          detail_id, lat, lng = file.gets.split
          print detail_id
          break if detail_id == "END" #there's a double end at the end, this lets us know we're done
          r = file.gets
          arr = []
          until r =~ /END/
            arr << r.split.map{|l| l.to_f}
            r = file.gets
            print '.'
          end

          code = Zip::Code.where(state_id: state_id, :detail_ids.in => [detail_id]).first
          code.update_attributes coords: (code.coords | [arr]), lat: lat.to_f, lng: lng.to_f unless code.nil?
        end until file.eof?
      end
    end

    print "\n"
    p "Zip Import Complete"
  end
end

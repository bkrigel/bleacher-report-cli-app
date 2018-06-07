class BleacherReportCliApp::Scraper

  def get_divisions
    page = Nokogiri::HTML(open("http://bleacherreport.com/"))
  end

end

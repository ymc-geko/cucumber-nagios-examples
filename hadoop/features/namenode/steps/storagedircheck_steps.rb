require 'nokogiri'
require 'pp'

cur_state="ok"

Then /^the directories should be "(.*)"$/ do |status_val|
  doc = Nokogiri::HTML(response.body.to_s)
  rows = doc.xpath('/html/body/div[@id="dfstable"][3]/table/tr')
  rows.collect do |row|
    detail = {}
    [
      [:dir, 'td[1]/text()'],
      [:unused, 'td[2]/text()'],
      [:state, 'td[3]/text()'],
    ].each do |name,xpath|
      if name.to_s == "state"
        if row.at_xpath(xpath).to_s == status_val.to_s
          cur_state = "ok"
        else
          cur_state = "error"
        end
      end
      detail[name] = row.at_xpath(xpath).to_s.strip
    end
  end
  cur_state.should == "ok"
end

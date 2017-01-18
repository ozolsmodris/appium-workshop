class ScreenCheckFilterParameters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @filter_background = element(:id, 'row_filter_background')
    @driver = driver
  end

  def visible?
    @driver.wait do
      @driver.find_element(
        @filter_name[:type], @filter_name[:value]
      ).displayed?
    end
  end

  def check_filter(text_name)
    @driver.find_elements(
      @filter_background[:type], @filter_background[:value]
    ).each do |row|
      next unless row.find_element(:id, 'row_filter_name').text == text_name
        print "Filter created \n"
        row.click
      break
    end
  end

end

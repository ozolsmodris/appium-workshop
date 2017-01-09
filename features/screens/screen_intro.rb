class ScreenIntro < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @base = element(:id, 'content')
    @driver = driver
    @close_intro = element(:id, 'close_intro')
    @intro_image = element(:id, 'intro_footer_image')
    @intro_yellow_text = element(:id, 'intro_text_header')
    @intro_black_text = element(:id, 'intro_text_footer')
  end

  def visible?
    @driver.find_element(@base[:type], @base[:value])
    @driver.find_element(@close_intro[:type], @close_intro[:value])
    @driver.find_element(@intro_image[:type], @intro_image[:value])
    @driver.find_element(@intro_yellow_text[:type], @intro_yellow_text[:value])
    @driver.find_element(@intro_black_text[:type], @intro_black_text[:value])
  end
end

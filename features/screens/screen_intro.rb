class ScreenIntro < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @base = element(:id, 'content')
    @driver = driver
    #unique ID for button (Iespejams vareja ari ar button class, jo ta ir vieniga poga)
    @close_intro = element(:id, 'close_intro')
    #unique ID for specific image
    @intro_footer_image = element(:id, 'intro_footer_image')
    #unique ID for specific image
    @intro_page_image = element(:id, 'page_image')
    #unique ID for specific text
    @intro_yellow_text = element(:id, 'intro_text_header')
    #unique ID for specific text
    @intro_black_text = element(:id, 'intro_text_footer')
  end

  def visible?
    @driver.find_element(@base[:type], @base[:value])
    @driver.find_element(@close_intro[:type], @close_intro[:value])
    @driver.find_element(@intro_footer_image[:type], @intro_footer_image[:value])
    @driver.find_element(@intro_page_image[:type], @intro_page_image[:value])
    @driver.find_element(@intro_yellow_text[:type], @intro_yellow_text[:value])
    @driver.find_element(@intro_black_text[:type], @intro_black_text[:value])
  end
end

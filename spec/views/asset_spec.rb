require 'spec_helper'

describe "assets/index" do 
  it "renders asset list page" do
    assets = [FactoryGirl.build(Asset, id: 123), FactoryGirl.build(Asset, id: 456)]
    assign(:assets, assets).stub(:total_pages).and_return(0)
    assign(:employees, [])
    render
    Capybara.string(rendered).should have_link('Download as CSV'), href: download_assets_path 
    # Capybara.string(rendered).should have_xpath("//a[text()='Download as CSV' and @href='#{download_assets_path}']")
  end
end

require 'rails_helper'

RSpec.describe LoadTestController, type: :request do
	it "renders the placeholder and can resolve the real partial" do
		get '/'
		expect(response.body).to include("progressive-load-placeholder")

		# Extract the new request URL
		doc = Nokogiri::HTML(response.body)
		path = doc.css('#name_progressive_load')[0]["data-progressive-load-path"]

		get path

		expect(response.body).to include("World")
	end
end
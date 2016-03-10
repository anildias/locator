require 'httparty'
require 'nokogiri'

module Response

	ERROR_JSON_RESPONSE = { status: 400, message: "error" }
	ERROR_XML_RESPONSE = "<?xml version=\"1.0\"?>\n<response>\n  <status>400</status>\n<message>error</message>\n</response>\n"
	ERROR_CSV_RESPONSE = ""

	def self.json(url)
		zipcode_response = HTTParty.get(url)
		if zipcode_response.code == 200
			JSON.parse(zipcode_response.body)
		else
			ERROR_JSON_RESPONSE
		end
	end

	def self.xml(url)
		zipcode_response = HTTParty.get(url)
		if zipcode_response.code == 200
			Nokogiri::XML(zipcode_response.body).to_xml
		else
			ERROR_XML_RESPONSE
		end
	end

	def self.csv(url)

	end
end


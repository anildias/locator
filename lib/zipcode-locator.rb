require 'zipcode-locator/unit'

require 'httparty'

class ZipcodeLocator
	DEFAULT_UNIT = "km"
	DEFAULT_FORMAT = "json"
	AVAILABLE_UNITS = ["km", "mile", "radians", "degrees"]
	AVAILABLE_FORMATS = ["json", "xml", "csv"]

	def initialize(api_key)
		@api_key = api_key
	end

	def distance_between_zipcodes(zip_code1, zip_code2, unit = nil, format = nil)
		format = AVAILABLE_FORMATS.include?(format) ? format : DEFAULT_FORMAT
		unit =  AVAILABLE_UNITS.include?(unit) ? unit : DEFAULT_UNIT
		url = "http://www.zipcodeapi.com/rest/#{@api_key}/distance.#{format}/#{zip_code1}/#{zip_code2}/#{unit}"
		JSON.parse(HTTParty.get(url).body)
	end

	def get_zipcodes_by_radius(zip_code, radius, unit = nil, format = nil)
		format = AVAILABLE_FORMATS.include?(format) ? format : DEFAULT_FORMAT
		unit =  AVAILABLE_UNITS.include?(unit) ? unit : DEFAULT_UNIT
		url = "http://www.zipcodeapi.com/rest/#{@api_key}/radius.#{format}/#{zip_code}/#{radius}/#{unit}"
		JSON.parse(HTTParty.get(url).body)
	end

	# zip_codes = array of zipcodes
	def find_close_zipcodes(zip_codes, distance, unit = nil, format = nil)
		format = AVAILABLE_FORMATS.include?(format) ? format : DEFAULT_FORMAT
		unit =  AVAILABLE_UNITS.include?(unit) ? unit : DEFAULT_UNIT
		zip_codes = zip_codes.join(',')
		url = "http://www.zipcodeapi.com/rest/#{@api_key}/match-close.#{format}/#{zip_codes}/#{distance}/#{unit}"
		JSON.parse(HTTParty.get(url).body)
	end

	def zipcode_location_info(zip_code, unit = nil, format = nil)
		format = AVAILABLE_FORMATS.include?(format) ? format : DEFAULT_FORMAT
		unit =  AVAILABLE_UNITS.include?(unit) ? unit : DEFAULT_UNIT
		url = "http://www.zipcodeapi.com/rest/#{@api_key}/info.#{format}/#{zip_code}/#{unit}"
		JSON.parse(HTTParty.get(url).body)
	end

	# zip_codes = array of zipcodes
	def multi_zipcodes_location_info(zip_codes, unit = nil, format = nil)
		format = AVAILABLE_FORMATS.include?(format) ? format : DEFAULT_FORMAT
		unit =  AVAILABLE_UNITS.include?(unit) ? unit : DEFAULT_UNIT
		zip_codes = zip_codes.join(',')
		url = "http://www.zipcodeapi.com/rest/#{@api_key}/multi-info.#{format}/#{zip_codes}/#{unit}"
		JSON.parse(HTTParty.get(url).body)
	end

	def get_zipcodes_by_locations(city, state)
		city = city.delete(' ')
		state = state.delete(' ')
		url = "http://www.zipcodeapi.com/rest/#{@api_key}/city-zips.#{DEFAULT_FORMAT}/#{city}/#{state}"
		JSON.parse(HTTParty.get(url).body)
	end

end
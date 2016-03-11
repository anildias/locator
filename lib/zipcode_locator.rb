require 'zipcode_locator/unit'
require 'zipcode_locator/format'
require 'zipcode_locator/response'
require 'zipcode_locator/locator'

class ZipcodeLocator

	def initialize(api_key)
		@api_key = api_key
	end

	def distance_between_zipcodes(zip_code1, zip_code2, unit = nil, format = nil)
		unit = Unit.set(unit)
		format = Format.set(unit)
		url = "http://www.zipcodeapi.com/rest/#{@api_key}/distance.#{format}/#{zip_code1}/#{zip_code2}/#{unit}"
		response = Locator.get_response(url, format)
	end

	def get_zipcodes_by_radius(zip_code, radius, unit = nil, format = nil)
		unit = Unit.set(unit)
		format = Format.set(unit)
		url = "http://www.zipcodeapi.com/rest/#{@api_key}/radius.#{format}/#{zip_code}/#{radius}/#{unit}"
		response = Locator.get_response(url, format)
	end

	# zip_codes = array of zipcodes
	def find_close_zipcodes(zip_codes, distance, unit = nil, format = nil)
		unit = Unit.set(unit)
		format = Format.set(unit)
		zip_codes = zip_codes.join(',')
		url = "http://www.zipcodeapi.com/rest/#{@api_key}/match-close.#{format}/#{zip_codes}/#{distance}/#{unit}"
		response = Locator.get_response(url, format)
	end

	def zipcode_location_info(zip_code, unit = nil, format = nil)
		unit = Unit.set(unit)
		format = Format.set(unit)
		url = "http://www.zipcodeapi.com/rest/#{@api_key}/info.#{format}/#{zip_code}/#{unit}"
		response = Locator.get_response(url, format)
	end

	# zip_codes = array of zipcodes
	def multi_zipcodes_location_info(zip_codes, unit = nil, format = nil)
		unit = Unit.set(unit)
		format = Format.set(unit)
		zip_codes = zip_codes.join(',')
		url = "http://www.zipcodeapi.com/rest/#{@api_key}/multi-info.#{format}/#{zip_codes}/#{unit}"
		response = Locator.get_response(url, format)
	end

	def get_zipcodes_by_locations(city, state, format = nil)
		city = city.delete(' ')
		state = state.delete(' ')
		format = Format.set(unit)
		url = "http://www.zipcodeapi.com/rest/#{@api_key}/city-zips.#{format}/#{city}/#{state}"
		response = Locator.get_response(url, format)
	end

end
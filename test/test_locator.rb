require 'helper'

class TestLocator < Minitest::Test

	@@loc = Locator.new('3YJBA4WF9vpMJWjnh0otcznhkPzlsuRwtB74F4KOz9Bj6VGnV4Q8EepY3Zkwtc2X')

	def test_distance_between_zipcodes()
		test_zipcode1 = 10001
		test_zipcode2 = 10005
		VCR.use_cassette("distance_between_zipcodes", :record => :new_episodes) do
			res = @@loc.distance_between_zipcodes(10001, 10005)
			response = Net::HTTP.get_response(URI("http://www.zipcodeapi.com/rest/3YJBA4WF9vpMJWjnh0otcznhkPzlsuRwtB74F4KOz9Bj6VGnV4Q8EepY3Zkwtc2X/distance.json/#{test_zipcode1}/#{test_zipcode2}/km"))
			assert_equal res, JSON.parse(response.body)
		end
	end

	def test_get_zipcodes_by_radius()
		test_zipcode = 10001
		test_radius = 5
		VCR.use_cassette("get_zipcodes_by_radius", :record => :new_episodes) do
			res = @@loc.get_zipcodes_by_radius(10001, 5)
			response = Net::HTTP.get_response(URI("http://www.zipcodeapi.com/rest/3YJBA4WF9vpMJWjnh0otcznhkPzlsuRwtB74F4KOz9Bj6VGnV4Q8EepY3Zkwtc2X/radius.json/#{test_zipcode}/#{test_radius}/km"))
			assert_equal res, JSON.parse(response.body)
		end
	end

	def test_find_close_zipcodes()
		test_zipcodes = "10001,10005"
		test_distance = 5
		VCR.use_cassette("close_zipcodes", :record => :new_episodes) do
			res = @@loc.find_close_zipcodes([10001, 10005], 5)
			response = Net::HTTP.get_response(URI("http://www.zipcodeapi.com/rest/3YJBA4WF9vpMJWjnh0otcznhkPzlsuRwtB74F4KOz9Bj6VGnV4Q8EepY3Zkwtc2X/match-close.json/#{test_zipcodes}/#{test_distance}/km"))
			assert_equal res, JSON.parse(response.body)
		end
	end

	def test_zipcode_location_info()
		test_zipcode = 10001
		VCR.use_cassette("zipcode_location_info", :record => :new_episodes) do
			res = @@loc.zipcode_location_info(10001)
			response = Net::HTTP.get_response(URI("http://www.zipcodeapi.com/rest/3YJBA4WF9vpMJWjnh0otcznhkPzlsuRwtB74F4KOz9Bj6VGnV4Q8EepY3Zkwtc2X/info.json/#{test_zipcode}/km"))
			assert_equal res, JSON.parse(response.body)
		end
	end

	def test_multi_zipcodes_location_info()	
		test_zipcodes = "10001,10005"
		VCR.use_cassette("multi_zipcodes_location_info", :record => :new_episodes) do
			res = @@loc.multi_zipcodes_location_info([10001, 10005], 5)
			response = Net::HTTP.get_response(URI("http://www.zipcodeapi.com/rest/3YJBA4WF9vpMJWjnh0otcznhkPzlsuRwtB74F4KOz9Bj6VGnV4Q8EepY3Zkwtc2X/multi-info.json/#{test_zipcodes}/km"))
			assert_equal res, JSON.parse(response.body)
		end
	end

	def test_get_zipcodes_by_locations()
		test_city = "NewYork"
		test_state = "NY"
		VCR.use_cassette("zipcode_by_location", :record => :new_episodes) do
			res = @@loc.get_zipcodes_by_locations("NewYork", "NY")
			response = Net::HTTP.get_response(URI("http://www.zipcodeapi.com/rest/3YJBA4WF9vpMJWjnh0otcznhkPzlsuRwtB74F4KOz9Bj6VGnV4Q8EepY3Zkwtc2X/city-zips.json/#{test_city}/#{test_state}/km"))
			assert_equal res, JSON.parse(response.body)
		end
	end

end

module Unit
	DEFAULT_UNIT = "km"
	AVAILABLE_UNITS = ["km", "mile", "radians", "degrees"]

	def self.default_unit
		DEFAULT_UNIT
	end

	def self.available_units
		AVAILABLE_UNITS
	end

	def self.set(unit)
		AVAILABLE_UNITS.include?(unit) ? unit : DEFAULT_UNIT
	end
end


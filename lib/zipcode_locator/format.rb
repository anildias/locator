module Format
	DEFAULT_FORMAT = "json"
	AVAILABLE_FORMATS = ["json", "xml", "csv"]

	def self.default_format
		DEFAULT_FORMAT
	end

	def self.available_formats
		AVAILABLE_FORMATS
	end

	def self.set(format)
		AVAILABLE_FORMATS.include?(format) ? format : DEFAULT_FORMAT
	end
end


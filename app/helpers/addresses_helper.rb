module AddressesHelper

	def to_address_line(address)
		html = ""
		html << address.street
		html << ", "
		html << address.number
		unless address.complement.empty?
			html << " ("
			html << address.complement
			html << ") "
		end
		html << " - "
		html << address.district
		html << "<br>"
		html << address.city
		html << "/"
		html << address.state
		html << ", " 
		html << address.country
		html << " - CEP "
		html << address.zipcode

		html.html_safe
	end
end

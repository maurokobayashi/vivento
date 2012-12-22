#encoding: utf-8
module AddressesHelper

	def format_address(address)
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

	def to_states_select
		[
			['Acre', 'AC'],
			['Alagoas', 'AL'],
			['Amapá', 'AP'],
			['Amazonas', 'AM'],
			['Bahia', 'BA'],
			['Ceará', 'CE'],
			['Distrito Federal', 'DF'],
			['Espírito Santo', 'ES'],
			['Goiás', 'GO'],
			['Maranhão', 'MA'],
			['Mato Grosso', 'MT'],
			['Mato Grosso do Sul', 'MS'],
			['Minas Gerais', 'MG'],
			['Pará', 'PA'],
			['Paraíba', 'PB'],
			['Paraná', 'PR'],
			['Pernambuco', 'PE'],
			['Piauí', 'PI'],
			['Rio de Janeiro', 'RJ'],
			['Rio Grande do Sul', 'RS'],
			['Rio Grande do Norte', 'RN'],
			['Rondônia', 'RO'],
			['Roraima', 'RR'],
			['Santa Catarina', 'SC'],
			['São Paulo', 'SP'],
			['Sergipe', 'SE'],
			['Tocantins', 'TO']
	 	]
	end

end

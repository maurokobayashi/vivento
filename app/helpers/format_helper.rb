#encoding: utf-8
module FormatHelper

    def format_phone(phone_area_code, phone_number)

        phone = ""

        unless nil_or_empty? phone_number
            unless nil_or_empty? phone_area_code
                phone << "(" + phone_area_code + ") "
            end
            phone << phone_number
        end

        phone
    end
end

#encoding: utf-8
module DateHelper

    def to_brazillian_date(date)
        if !date.nil?
            date.strftime('%d/%m/%Y')
        else
            nil
        end
    end

    def to_brazillian_datetime(datetime)
        if !datetime.nil?
            datetime.strftime('%d/%m/%Y %H:%M:%S')
        else
            nil
        end
    end

    def to_time(time)
        if !time.nil?
            time.strftime('%H:%M:%S')
        else
            nil
        end
    end

end
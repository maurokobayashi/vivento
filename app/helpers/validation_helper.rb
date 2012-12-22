#encoding: utf-8
module ValidationHelper

    def nil_or_empty?(value)
        value.nil? || value.empty?
    end
end
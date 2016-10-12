# frozen_string_literal: true

require_relative 'page'

class MemberPage
  class Korean < Page
    field :name__ko do
      noko.css('div.profile h4').text.tidy
    end

    field :name__cn do
      noko.css('div.profile ul li:contains("(")').first.text.gsub(/[()]/,'').tidy
    end

    field :party__ko do
      dd('정당')
    end

    field :area__ko do
      dd('선거구')
    end

    field :email do
      dd('이메일')
    end

    private

    def dd(dt)
      noko.xpath('//dt[contains(.,"%s")]/following-sibling::dd' % dt).first.text.tidy
    end
  end
end

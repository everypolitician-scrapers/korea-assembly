# frozen_string_literal: true

require_relative 'page'

class MemberPage
  class English < Page
    field :id do
      Pathname.new(image).basename('.*').to_s
    end

    field :name do
      sibling_td('NAME')
    end

    field :birth_date do
      sibling_td('BIRTHDAY').gsub('/','-')
    end

    field :phone do
      sibling_td('OFFICE PHONE')
    end

    field :website do
      sibling_td('WEBSITE')
    end

    field :group do
      sibling_td('NEGOTIATION GROUP')
    end

    field :committee do
      sibling_td('COMMITTEE')
    end

    field :area do
      sibling_td('CITY OR PROVINCE')
    end

    field :previous_terms do
      sibling_td('TERM')
    end

    field :image do
      noko.css('.imgBox2 img/@src').text
    end

    field :source do
      url.to_s
    end

    field :source_ko do
      'http://www.assembly.go.kr/assm/memPop/memPopup.do?dept_cd=' + id
    end

    private

    def sibling_td(th)
      noko.xpath('//th[contains(.,"%s")]/following-sibling::td' % th).text.tidy
    end
  end
end

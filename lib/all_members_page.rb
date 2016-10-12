# frozen_string_literal: true
require_relative 'page'

class AllMembersPage < Page
  field :members do
    noko.css('.dotList3 li').map do |li|
      id = li.css('a/@onclick').text[/memInfo\('(.*)'\)/, 1]
      {
        name: li.text,
        url:  member_url(id),
      }
    end
  end

  private

  def member_url(id)
    # Be careful not to unescape
    "http://korea.assembly.go.kr/mem/mem_pro.jsp?mem_code=#{id}"
  end
end

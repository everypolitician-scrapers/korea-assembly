#!/bin/env ruby
# encoding: utf-8
# frozen_string_literal: true

require 'pry'
require 'require_all'
require 'scraperwiki'

require_rel 'lib'

# require 'open-uri/cached'
require 'scraped_page_archive/open-uri'

LIST_PAGE = 'http://korea.assembly.go.kr/mem/mem_01.jsp'

data = AllMembersPage.new(LIST_PAGE).to_h
warn "Found #{data[:members].count} members"

data[:members].each do |mem|
  data_en = MemberPage::English.new(mem[:url]).to_h
  data_ko = MemberPage::Korean.new(data_en[:source_ko]).to_h

  data = data_en.merge(data_ko)
  ScraperWiki.save_sqlite(%i(id), data)
end

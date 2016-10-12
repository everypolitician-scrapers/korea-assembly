#!/bin/env ruby
# encoding: utf-8
# frozen_string_literal: true

require 'pry'
require 'require_all'
require 'scraperwiki'

require_rel 'lib'

require 'open-uri/cached'
# require 'scraped_page_archive/open-uri'

LIST_PAGE = 'http://korea.assembly.go.kr/mem/mem_01.jsp'

data = AllMembersPage.new(LIST_PAGE).to_h
warn "Found #{data[:members].count} members"

data[:members].each do |mem|
  member = MemberPage.new(mem[:url]).to_h
  warn member
  # ScraperWiki.save_sqlite(%i(id), member)
end

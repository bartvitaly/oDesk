#! /usr/bin/env ruby

require 'rubygems'

include Selenium::WebDriver

describe 'WebDriver Examples' do

  before { @driver = nil }

  def run_test
    @driver.get 'http://code.google.com/p/selenium'
    @driver.page_source.should_not include('The 5 Minute Getting Started Guide')

    @driver.find_element(:link_text, 'GettingStarted').click

    @driver.page_source.should include('The 5 Minute Getting Started Guide')
  end

  it 'local Firefox' do
    @driver = Driver.for :firefox
    run_test
  end

  it 'local Chrome' do
    @driver = Driver.for :chrome
    run_test
  end

  it 'remote Firefox' do
    @driver = Driver.for :remote, :desired_capabilities => Remote::Capabilities.firefox
    run_test
  end

  it 'remote Chrome' do
    @driver = Driver.for :remote, :desired_capabilities => Remote::Capabilities.chrome
    run_test
  end

  it 'remote HtmlUnit' do
    @driver = Driver.for :remote, :desired_capabilities => Remote::Capabilities.htmlunit
    run_test
  end

end
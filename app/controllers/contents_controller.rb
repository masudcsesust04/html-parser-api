require 'httparty'
require 'nokogiri'

class ContentsController < JSONAPI::ResourceController
  def parse
    begin
      response = HTTParty.get(params[:ref_url])
      doc = Nokogiri::HTML(response.body)
      puts doc.at('meta[property="og:title"]')['content']

      render json: { success: true, code: response.code, message: response.message, title: doc.at('meta[property="og:title"]')['content'] }
    rescue Exception => e
      render json: e
    end
  end
end

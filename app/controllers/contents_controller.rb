require 'httparty'
require 'nokogiri'

class ContentsController < JSONAPI::ResourceController
  def parse
    begin
      response = HTTParty.get(params[:ref_url])
      doc = Nokogiri::HTML(response.body)

      %w[h1 h2 h3 a].each do |tag|
        doc.xpath("//#{tag}").each do |element|
          extract_element(element, tag)
        end
      end

      render json: { success: true, code: response.code, message: response.message }
    rescue Exception => e
      render json: e
    end
  end

  private
  def extract_element(element, tag='')
    content = Content.new
    content.url = params[:ref_url]
    content.tag = tag
    content.content = element.text
    content.save!
  end
end

require 'httparty'
require 'nokogiri'

class ContentsController < JSONAPI::ResourceController
  def parse
    begin
      response = HTTParty.get(params[:ref_url])
      doc = Nokogiri::HTML(response.body)

      contents = []
      %w[h1 h2 h3 a].each do |tag|
        doc.xpath("//#{tag}").each do |element|
          content = Content.new
          content.url = params[:ref_url]
          content.tag = tag
          content.content = element.text
          contents << content
        end
      end

      Content.transaction do
        Content.import! contents, validate: false
      end

      render json: { success: true, code: response.code, message: response.message }
    rescue Exception => e
      render json: e
    end
  end
end

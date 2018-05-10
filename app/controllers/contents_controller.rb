class ContentsController < JSONAPI::ResourceController
  def parse
    render json: { success: true }
  end
end

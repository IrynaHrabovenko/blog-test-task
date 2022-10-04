module Posts
  class AttributesGenerator
    def call(params)
      @params = params
      @category = Category.find_by(id: @params[:category_id])
      @attributes = []
      generate_title
      get_attributes
    end

    private

    def generate_title
      last_post_id = @category.posts.last.id 
      title = "Title #{last_post_id + 1}"
      @attributes << title
    end

    def get_attributes
      @attributes
    end
  end
end

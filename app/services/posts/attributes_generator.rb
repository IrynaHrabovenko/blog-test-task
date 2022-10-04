module Posts
  class AttributesGenerator
    def call(params)
      @params = params
      @category = Category.find_by(id: @params[:category_id])
      @attributes = []
      generate_title
      generate_shared_url
      get_attributes
    end

    private

    def generate_title
      last_post_id = @category.posts.last.id 
      title = "Title #{last_post_id + 1}"
      @attributes << title
    end

    def generate_shared_url
      shared_url = "/posts/#{SecureRandom.hex(6)}"
      @attributes << shared_url
    end

    def get_attributes
      @attributes
    end
  end
end

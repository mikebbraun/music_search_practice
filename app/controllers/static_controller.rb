class StaticController < ApplicationController
  def search
    # @results = Artist.where name: params[:term]
    # can be victim of sequel injection vvvv
    # @results = Artist.where("name LIKE '#{params[:term]}'")
    # artists = Artist.where("name LIKE ?", "%#{params[:term]}%")
    # albums = Album.where("name LIKE ?", "%#{params[:term]}%")
    # labels = Label.where("name LIKE ?", "%#{params[:term]}%")
    # @results = artists + albums + labels
    # something = something.where("name LIKE ?", "%#{params[:term]}%")

    # @results = []
    # [Artist, Album, Label].each do |model|
    #   @results += model.where("name LIKE ?", "%#{params[:term]}%")
    # end

    term = params[:term]
    return if term.blank?

    @results = [Artist, Album, Label].map do |model|
      # model.where("name LIKE ?", "%#{params[:term]}%")
      model.search(term)
    end.flatten
  end
end

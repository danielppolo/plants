class PlantLabelsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_label = PlantLabel.new
  end

  def create
    plant_labels_input = params[:plant_label][:label_id] # -> Array of Label IDs
    # plant_labels_input.shift

    labels = Label.where(id: plant_labels_input)
    # plant_labels_input.map do |label_id|
    #   Label.find(label_id)
    # end
    @plant = Plant.find(params[:plant_id])

    labels.each do |label|
      @plant_label = PlantLabel.new
      @plant_label.plant = @plant # Plant Instance
      @plant_label.label = label # Label Instance
      unless @plant_label.save
        render :new
        return # Exiting the create method
      end
    end

    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_label_params
    params.require(:plant_label).permit(:label_id)
  end
end

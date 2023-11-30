class WildAnimalsController < ApplicationController
    def index
        animals = WildAnimal.all
        render json: animals
    end
    def show
        animal = WildAnimal.find(params[:id])
        render json: animal
    end
    def create
        animal = WildAnimal.create(animal_params)
        if animal.valid?
            render json: animal
        else render json: animal.errors
        end
    end
    def update
        animal = WildAnimal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end
    def destroy
        animal = WildAnimal.find(params[:id])
        if animal.destroy 
            render json: animal
        else
            render json: animal.errors
        end
    end
    private
    def animal_params
        params.require(:wild_animal).permit(:name, :description)
    end
end

require 'rails_helper'

RSpec.describe '/projects/:id' do
    before :each do
        @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
        @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    end

    it 'shows project name and material' do
        visit "/projects/#{@news_chic.id}"
        save_and_open_page
        expect(page).to have_content(@news_chic.name)
        expect(page).to have_content(@news_chic.material)
        expect(page).to have_content(@recycled_material_challenge.theme)
    end
end
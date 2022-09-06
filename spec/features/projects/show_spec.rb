require 'rails_helper'

RSpec.describe '/projects/:id' do
    before :each do
        @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

        @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

        ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
        ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    end

    it 'shows project name and material' do
        visit "/projects/#{@news_chic.id}"
        expect(page).to have_content(@news_chic.name)
        expect(page).to have_content(@news_chic.material)
        expect(page).to have_content(@recycled_material_challenge.theme)
    end

    it 'shows contestant count on project' do
        visit "/projects/#{@news_chic.id}"
        expect(page).to have_content("Number of Contestants: 2")
    end

    it 'shows average years of experience for the contestants' do
        visit "/projects/#{@news_chic.id}"
        expect(page).to have_content("Average Contestant Experience: 12.5 years")
    end
end
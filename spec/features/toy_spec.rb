require 'rails_helper'

  feature "toys cats" do
    scenario "User can view toys cats on toy index" do
      cat = Cat.create!(
        name: 'Kelly'
      )
      toy = Toy.create!(
        name: 'Cat nip',
        cat_id: cat.id
      )
      visit '/'
      click_on 'Toys'
      expect(page).to have_content(toy.name)
      expect(page).to have_content(cat.name)
    end

    scenario "User can view link to cat on toy showpage" do
      cat = Cat.create!(
        name: 'Frank'
      )
      toy = Toy.create!(
        name: 'Glitter yarn',
        cat_id: cat.id
      )
      visit '/'
      click_on 'Toys'
      click_on 'Glitter yarn'
      expect(page).to have_content(toy.name)
      expect(page).to have_link(cat.name)
    end

    scenario "Cat dropdown on new toy page" do
      cat = Cat.create!(
        name: 'Shannon'
      )
      visit '/'
      click_on 'Toys'
      click_on 'New Toy!'
      select (cat.name)
    end

    scenario "New toy and cat ownership are listed on toy index after creation" do
        cat = Cat.create!(
          name: 'Henry'
        )
        visit '/'
        click_on 'Toys'
        click_on 'New Toy!'
        fill_in "Name", with: "Giant shiny ball"
        select (cat.name)
        click_on "Create Toy"
        expect(page).to have_content("Toys!")
        expect(page).to have_content("Giant shiny ball")
    end

end

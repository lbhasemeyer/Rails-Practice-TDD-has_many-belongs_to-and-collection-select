require 'rails_helper'

  feature "cats toys" do
    scenario "User can view Cat's toy on cat showpage" do
    	cat = Cat.create!(
    		name: 'Tom'
    	)
    	toy = Toy.create!(
    		name: 'Jerry',
    		cat_id: cat.id
    	)
    	visit '/'
    	click_on 'Cats'
    	expect(page).to have_content(cat.name)
    	click_on (cat.name)
    	expect(page).to have_content(toy.name)
  end

end

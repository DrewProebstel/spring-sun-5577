require 'rails_helper'

RSpec.describe 'the doctor show page' do
   it 'shows all the attributes for a doctor' do

        merchant = Merchant.create(name: "Braum's")
        item1 = merchant.items.create(name: "Toast", description: "Let it rip!", unit_price: 1000)
        bob = Customer.create!(first_name: "Bob", last_name: "Benson")
        invoice_1 = bob.invoices.create!(status: 1, created_at: '05 Apr 2022 00:53:36 UTC +00:00')
        visit "/merchants/#{merchant.id}/invoices/#{invoice_1.id}"
        expect(page).to have_content("#{invoice_1.id}")
        expect(page).to have_content("completed")
        expect(page).to have_content("Bob Benson")
        expect(page).to have_content('Tuesday, April 05, 2022')
    end
  end

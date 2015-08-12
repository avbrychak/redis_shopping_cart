ActiveAdmin.register Discount do
  permit_params :value_in_decimal, :value_in_numbers, :is_percentage, :min_count, :category_id

  index do
    column :is_percentage
    column :value_in_numbers
    column :value_in_decimal
    column :category
    column :min_count
    actions
  end

  form do |f|
    inputs 'Discount' do
      input :is_percentage
      input :value_in_numbers
      input :value_in_decimal
      input :category
      input :products, as: :check_boxes
      input :min_count
      actions
    end
  end
end

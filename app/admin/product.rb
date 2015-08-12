ActiveAdmin.register Product do

permit_params :name, :description, :category_id, :price

end

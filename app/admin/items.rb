ActiveAdmin.register Item do

  permit_params :title, :desc, :image, :location, :price, :user_id

  index do
    selectable_column
    id_column
    br
    a link_to ("10 개씩 보기"), "/admin/items?order=id_desc&per_page=10", class: "button small"
    a link_to ("30 개씩 보기"), "/admin/items?order=id_desc&per_page=30", class: "button small"
    a link_to ("50 개씩 보기"), "/admin/items?order=id_desc&per_page=50", class: "button small"
    a link_to ("모두 보기"), "/admin/items?order=id_desc&per_page=#{Item.count}", class: "button small"

    column :title
    column :desc
    column :image do |item| image_tag(item.image.thumb.url.presence || '/assets/img/no_image.png', style: "width: 100px;") end
    column :location
    column :price
    column :user
    actions
  end

  show do
    attributes_table do
      row :title
      row :desc
      row :image do |item| image_tag(item.image.thumb.url.presence || '/assets/img/no_image.png', style: "width: 100px;") end
      row :location
      row :price
      row :user
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :desc
      f.input :image do |item| image_tag(item.image.thumb.url.presence || '/assets/img/no_image.png', style: "width: 100px;") end
      f.input :location
      f.input :price
      f.input :user, as: :select, collection: User.all.map{|user| [user.email, user.id]}
      f.input :created_at
    end
    f.actions
  end

end

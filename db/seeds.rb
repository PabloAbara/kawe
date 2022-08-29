Resource.create! :title => 'Página de git', :link => 'https://www.youtube.com/watch?v=PW_A-lOpVV0', :checkpoint_id => 1
Resource.create! :title => 'Guía de Platanus', :link => 'https://la-guia.platan.us/setup/proyectos/git', :checkpoint_id => 1
p "Terminando de sembrar"


#create_table "resources", force: :cascade do |t|
#  t.string "title"
#  t.string "link"
#  t.bigint "checkpoint_id", null: false
#  t.datetime "created_at", null: false
#  t.datetime "updated_at", null: false
#  t.index ["checkpoint_id"], name: "index_resources_on_checkpoint_id"


#create_table "resource_ratings", force: :cascade do |t|
#  t.bigint "user_id", null: false
#  t.bigint "resource_id", null: false
#  t.integer "rating"
#  t.datetime "created_at", null: false
#  t.datetime "updated_at", null: false
#  t.index ["resource_id"], name: "index_resource_ratings_on_resource_id"
#  t.index ["user_id"], name: "index_resource_ratings_on_user_id"
#end

object @todo_item
attributes :id, :title, :status
child(:user) { attributes :name }
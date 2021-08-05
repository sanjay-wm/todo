object @item
attributes :id, :title, :status
child(:tags) { attributes :title }

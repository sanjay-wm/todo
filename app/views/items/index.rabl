collection @items
attributes :id, :title, :status
child(:tags) { attributes :title }

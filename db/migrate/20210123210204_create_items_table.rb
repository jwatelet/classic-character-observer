class CreateItemsTable < ActiveRecord::Migration[6.1]
  def up
    create_items_table
    create_tooltip_labels_table
    migrate_data
  end

  def down
    drop_table :items
    drop_table :tooltip_labels
  end

  def create_items_table
    create_table :items do |t|
      t.string :name
      t.string :icon
      t.string :item_class
      t.string :item_subclass
      t.integer :sell_price
      t.string :quality
      t.integer :item_level
      t.integer :required_level
      t.string :slot
      t.string :item_link
      t.integer :content_phase
      t.string :unique_name
      t.timestamps
    end
  end

  def create_tooltip_labels_table
    create_table :tooltip_labels do |t|
      t.string :label
      t.string :format
      t.integer :item_id, null: false, references: %i[items id]
    end
  end

  def migrate_data
    items_hash = JSON.parse(File.read('db/data.json'))

    items_hash.each do |item_hash|
      item = Item.create(
        id: item_hash['itemId'],
        name: item_hash['name'],
        icon: item_hash['icon'],
        item_class: item_hash['class'],
        item_subclass: item_hash['subclass'],
        sell_price: item_hash['sellPrice'],
        quality: item_hash['quality'],
        item_level: item_hash['itemLevel'],
        required_level: item_hash['requiredLevel'],
        slot: item_hash['slot'],
        item_link: item_hash['itemLink'],
        content_phase: item_hash['contentPhase'],
        unique_name: item_hash['uniqueName']
      )
      item_hash['tooltip'].each do |tooltip|
        item.tooltip_labels.create(
          label: tooltip['label'],
          format: tooltip['format']
        )
      end
    end
  end
end

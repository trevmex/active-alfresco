class CreateAlfrescos < ActiveRecord::Migration
  def self.up
    create_table :alfrescos do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :alfrescos
  end
end

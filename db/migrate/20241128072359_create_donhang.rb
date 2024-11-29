class CreateDonhang < ActiveRecord::Migration[7.2]
  def change
    create_table :donhangs do |t|
      t.string :hoten
      t.string :sdt
      t.text :diachi
      t.string :tensanpham
      t.integer :soluong
      t.boolean :trangthaithanhtoan
      t.decimal :tongthanhtoan
      t.datetime :ngaydathang

      t.timestamps
    end
  end
end

class CreateSalesInfos < ActiveRecord::Migration
  def change
    create_table :sales_infos do |t|
      t.string :book_title
      t.string :url
      t.string :purchase_id
      t.string :total_paid_for_bundle
      t.string :book_revenue_from_bundle
      t.decimal :total_paid_for_book, :precision => 8, :scale => 2
      t.decimal :total_book_royalty, :precision => 8, :scale => 2
      t.string :author_name
      t.string :author_percentage_of_total_royalty
      t.string :affiliate_code
      t.string :affiliate_cut
      t.decimal :author_and_cause_royalties, :precision => 8, :scale => 2
      t.string :cause_name
      t.string :cause_percentage_of_author_royalty
      t.string :cause_royalties_portion
      t.decimal :author_royalties_portion, :precision => 8, :scale => 2
      t.string :package_name
      t.string :bundle_name
      t.date :date_purchased
      t.date :royalty_held_until_at_least
      t.string :date_author_royalty_was_paid
      t.string :date_publisher_royalty_was_paid
      t.string :date_cause_royalty_was_paid
      t.string :coupon_code
      t.string :coupon_note
      t.string :email_if_shared


      t.timestamps
    end
  end
end

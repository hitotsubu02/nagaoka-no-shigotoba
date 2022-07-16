class AddColumnTermTextToInternships < ActiveRecord::Migration[7.0]
  def change
    add_column :internships, :term_text, :string
  end
end

class AddApprovalStatusToAdoptionApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :adoption_applications, :approval_status, :string, default: "unapproved"
  end
end

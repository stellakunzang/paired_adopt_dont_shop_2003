class AddApprovalStatusToPetApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :pet_applications, :approval_status, :string, default: "unapproved"
  end
end

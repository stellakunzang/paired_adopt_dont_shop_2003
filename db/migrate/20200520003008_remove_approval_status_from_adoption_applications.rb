class RemoveApprovalStatusFromAdoptionApplications < ActiveRecord::Migration[5.1]
  def change
    remove_column :adoption_applications, :approval_status, :string
  end
end

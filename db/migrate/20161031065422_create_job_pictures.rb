class CreateJobPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :job_pictures do |t|
      t.attachment :pickup
      t.attachment :dropoff

      t.belongs_to :employee
      t.belongs_to :job
      t.timestamps
    end
  end
end

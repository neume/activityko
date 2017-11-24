class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
    	t.belongs_to :subj, polymorphic: true
    	t.string		 :action
    	t.belongs_to :dir_obj, polymorphic: true
    	t.string		 :prep
    	t.belongs_to :prep_obj, polymorphic: true
			t.integer		 :level, default: 0

    	t.json			 :params

    	t.integer 	 :status, default: 0
    	t.integer		 :activity_status, default: 0
      t.integer    :activity_type, default: 0

    	t.datetime	 :deleted_at
      t.timestamps
    end
		add_index :activities, [:subj_id, :subj_type]
		add_index :activities, [:dir_obj_id, :dir_obj_type]
		add_index :activities, [:prep_obj_id, :prep_obj_type]
  end
end

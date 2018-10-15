class PatientToBed < ActiveRecord::Base
  belongs_to :patient
  belongs_to :bed
end

class Sleep < ActiveRecord::Base
  attr_accessible :note, :start_time, :wake_time
  
  scope :chronological, order('start_time asc')
  scope :antichronological, order('start_time desc')
  scope :with_note, where('note > ""')
  
  def duration
    wake_time - start_time
  end
  
  def duration_in_hours
    duration / (60*60)
  end
end

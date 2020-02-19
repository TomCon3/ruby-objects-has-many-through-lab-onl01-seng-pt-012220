class Doctor
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def save
    @@all << self
  end
  
  def new_appointment(date, patient, doctor = self)
    Appointment.new(date, patient, doctor)
  end
  
  def appointments
    Appointment.all.select {|date| date.doctor == self}
  end
  
  def patients
    self.appointments.collect {|date| date.patient}
  end
  
  def self.all
    @@all
  end
end
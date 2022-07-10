require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(email: 'test1@testing.com', password: 'password1', password_confirmation: 'password1',
                            first_name: 'John', last_name: 'Doe', age: 45, gender: 'male', role: 'patient') }
  let!(:user_2) { User.create(email: 'test2@testing.com', password: 'password1', password_confirmation: 'password1',
                        first_name: 'John', last_name: 'Doe', age: 45, gender: 'male', role: 'patient') }

  let!(:user_3) { User.create(email: 'test3@testing.com', password: 'password1', password_confirmation: 'password1',
                            first_name: 'Elisa', last_name: 'Jane', age: 40, gender: 'female', role: 'doctor') }
  describe 'Validations' do 
    it 'is valid with user attributes' do 
      expect(user).to be_valid
    end

    describe 'with invalid email' do
      before { user.email = nil }

      it 'is not valid without email' do 
        expect(user).to_not be_valid
      end
    end

    describe 'with invalid first_name' do
      before { user.first_name = nil }

      it 'is not valid without first_name' do 
        expect(user).to_not be_valid
      end
    end

    describe 'when gender is invalid ' do
      before { user.gender = 'lorem' }

      it 'is not valid without proper gender' do 
        expect(user).to_not be_valid
      end
    end
  end

  describe 'Scopes' do 
    it 'returns number of doctor' do 
      expect(User.doctors.count).to eq 1
    end

    it 'returns number of patients' do 
      expect(User.patients.count).to eq 2
    end
  end

  describe '#active_appointments' do 
    let!(:appointment) { Appointment.create(fixed_date: DateTime.now + 2.days, description: 'Patient_2 appointment', 
                                           user_ids: [user.id, user_3.id] ) }
    it 'returns active appointments' do 
      expect(user.active_appointments.count).to eq 1
    end
  end
end

require 'spec_helper'

describe 'nrpe_basic::install' do
  let :pre_condition do
    'class {"nrpe_basic":}'
  end

  context 'on RedHat' do
    let :facts do
      { :osfamily => 'RedHat' }
    end

    it 'should install nrpe' do
      should contain_package('nrpe').with_ensure('installed')
    end
  end

  context 'on Debian' do
    let :facts do
      { :osfamily => 'Debian' }
    end

    it 'should install nrpe' do
      should contain_package('nagios-nrpe-server').with_ensure('installed')
    end
  end
end


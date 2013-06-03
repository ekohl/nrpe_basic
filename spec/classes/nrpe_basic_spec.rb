require 'spec_helper'

describe 'nrpe_basic' do
  context 'on RedHat' do
    let :facts do
      { :osfamily => 'RedHat' }
    end

    it 'should include classes' do
      should include_class('nrpe_basic')
      should include_class('nrpe_basic::install')
      should include_class('nrpe_basic::config')
      should include_class('nrpe_basic::service')
    end
  end

  context 'on Debian' do
    let :facts do
      { :osfamily => 'Debian' }
    end

    it 'should include classes' do
      should include_class('nrpe_basic')
      should include_class('nrpe_basic::install')
      should include_class('nrpe_basic::config')
      should include_class('nrpe_basic::service')
    end
  end

  context 'on Unsupported' do
    let :facts do
      { :osfamily => 'Unsupported' }
    end

    it 'should fail' do
      expect {
        should contain_class('nrpe_basic')
      }.to  raise_error(Puppet::Error, /Module [a-z_]+ is not supported on Unsupported/)
    end
  end
end

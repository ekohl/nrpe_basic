require 'spec_helper'

describe 'nrpe_basic::command' do
  let (:title) { 'my_check' }
  let (:params) { { :command => 'check123check' } }

  context 'on RedHat' do
    let :facts do
      { :osfamily => 'RedHat' }
    end

    it 'should work' do
      should contain_file('/etc/nrpe.d/my_check.cfg').with({
        :owner   => '0',
        :group   => '0',
        :mode    => '0644',
        :require => 'Class[Nrpe_basic::Install]',
        :notify  => 'Class[Nrpe_basic::Service]',
      })
    end
  end
end


require 'spec_helper'

describe 'nrpe_basic::command' do
  context 'without parameters' do
    let (:title) { 'my_check' }

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
          :content => "command[my_check]=/usr/lib/nagios/plugins/my_check \n",
        })
      end
    end
  end

  context 'without command parameter' do
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
          :content => "command[my_check]=/usr/lib/nagios/plugins/check123check \n",
        })
      end
    end
  end
end

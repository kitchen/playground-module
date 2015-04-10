require 'spec_helper'

describe 'playground' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "playground class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('playground::params') }
        it { should contain_class('playground::install').that_comes_before('playground::config') }
        it { should contain_class('playground::config') }
        it { should contain_class('playground::service').that_subscribes_to('playground::config') }

        it { should contain_service('playground') }
        it { should contain_package('playground').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'playground class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('playground') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end

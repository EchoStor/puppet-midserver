require 'spec_helper'

describe 'midserver', :type => 'class' do

  context "On an Redhat OS" do
    let :facts do
      {
        :osfamily => 'RedHat'
      }
    end

    it do
      is_expected.to contain_file('/servicenow').with(
        'ensure' => 'directory',
      )
      is_expected.to contain_package('unzip').with(
        'ensure' => 'installed',
      )
    end
  end
end

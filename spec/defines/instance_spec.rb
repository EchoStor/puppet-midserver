require 'spec_helper'

describe 'midserver::instance', :type => 'define' do

  let(:title) { 'midserver1' }
  let(:params) {{:download => 'https://install.service-now.com/glide/distribution/builds/package/mid/2016/09/28/mid.helsinki-03-16-2016__patch3-hotfix7-09-28-2016_09-28-2016_1637.linux.x86-64.zip',
                :username => 'miduser',
                :password => 'midpass',
                :instance => 'https://puppet.service-now.com'}}

  context "On an Redhat OS" do
    let :facts do
      {
        :osfamily => 'RedHat'
      }
    end

    it do
      is_expected.to contain_file("/servicenow/#{title}").with(
        'ensure' => 'directory',
      )
      is_expected.to contain_file("/servicenow/#{title}/agent/config.xml").with(
        'ensure' => 'file',
      )
      is_expected.to contain_exec("Start #{title}").with(
            'cwd'       => "/servicenow/#{title}/agent/",
            'command'   => "/servicenow/#{title}/agent/start.sh",
            'logoutput' => 'true',
            'unless'    => "/bin/test -e /servicenow/#{title}/agent/logs/agent0.log.0.lck",
      )
    end
  end
end

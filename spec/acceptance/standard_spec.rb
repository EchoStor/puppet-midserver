require 'spec_helper_acceptance'

describe 'midserver class' do

  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work with no errors based on the example' do
      pp = <<-EOS
        class{'midserver':}
        midserver::instance{'midserver1':
          download => 'https://install.service-now.com/glide/distribution/builds/package/mid/2016/09/28/mid.helsinki-03-16-2016__patch3-hotfix7-09-28-2016_09-28-2016_1637.linux.x86-64.zip',
          username => 'miduser',
          password => 'midpass',
          instance => 'https://puppet.service-now.com',
        }
      EOS

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

  end
end

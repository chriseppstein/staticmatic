require File.join(File.dirname(__FILE__), "..", "lib", "staticmatic")
require 'templater'

describe StaticMatic::Builder do
  def generate_site(path)
  end
  
  before :each do
    @root_dir    = File.dirname(__FILE__) + "/fixtures/builder-test"
    
    orig_stdout = STDOUT.dup
    STDOUT.reopen('/dev/null') # redirect stdout to /dev/null
    StaticMatic::Generators.run_cli(File.dirname(@root_dir), 'staticmatic', 1, ["setup", File.basename(@root_dir)])
    STDOUT.reopen(orig_stdout) # restore stdout
    
    @staticmatic = StaticMatic::Base.new(@root_dir)
    @staticmatic.logger = mock("logger")
#    @staticmatic.logger.should_receive(:info).at_least(:once)
    StaticMatic::Builder.build(@staticmatic)
  end
  
  after :each do
    FileUtils.rm_rf(@root_dir)
  end
  
  it "should create version tracking file with current build timestamp" do
    versions_file = "#{@root_dir}/builds"
    about_now     = Time.now.strftime("%Y%m%d%H%M")
    
    File.exists?(versions_file).should be_true

    versions = File.read(versions_file).split(/\n/)
    versions[0].should include(about_now)
  end
end
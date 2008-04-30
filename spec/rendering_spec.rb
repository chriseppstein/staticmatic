require File.dirname(__FILE__) + "/../lib/staticmatic"

describe StaticMatic::Base do
  before(:all) do
    @sample_site_path = File.dirname(__FILE__) + "/fixtures/sample"
    
    @staticmatic = StaticMatic::Base.new(@sample_site_path)
  end
  
  it "should render a single template" do
    @staticmatic.render("hello_world").should match(/Hello world!/)
  end
  
  it "should render a page" do
    @staticmatic.render("hello_world").should match(/Hello world!/)
  end
  
  it "should render with layout" do
    output = @staticmatic.render_with_layout("hello_world.html")
    
    output.should match(/My Sample Site/)
    output.should match(/Hello world!/)
  end
  
  it "should render haml template" do
    output = @staticmatic.render("haml_test")
    output.should match(/<strong>Hello from haml<\/strong>/)
  end
  
  it "should register a css renderer" do
    output = @staticmatic.render("stylesheets/site.css")
    output.should match(/body \{/)
    output.should match(/font\-family\: verdana/)
  end
  
  it "should setup up css type correctly" do
    @staticmatic.determine_format_for("stylesheets/site.css").should == :css
  end
  
  it "should determine format for fille with extension" do
    @staticmatic.determine_format_for("stylesheets/site.css.sass").should == :css
  end
  
  it "should render index template from sub-directory" do
    output = @staticmatic.render("services/")
    output.should match(/Services/)
  end
  
  it "should render template from sub-directory" do
    output = @staticmatic.render("services/web_development")
    output.should match(/Web Development/)
  end
end
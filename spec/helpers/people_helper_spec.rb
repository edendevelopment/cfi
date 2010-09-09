require 'spec_helper'

describe PeopleHelper do
  describe "person image with size" do
    context "person has an image" do
      before do
        @image = mock(:image, :url => 'whatever')
        @person = mock(:person, :image => @image)
      end

      it "fetches this image" do
        @image.should_receive(:url).with('80x80#')
        helper.person_image_with_size(@person, 80)
      end

      it "links to that image" do
        @image.stub!(:url => 'fake-image-url')
        result = helper.person_image_with_size(@person, 80)
        result.should have_tag('img[src=/images/fake-image-url]')
      end
    end

    context "person has no image" do
      it "uses the default image of that size" do
        person = mock(:person, :image => nil)
        result = helper.person_image_with_size(person, 80)
        result.should include("/images/default-person-80.png")
      end
    end
  end
end

# == Schema Information
#
# Table name: concept_resources
#
#  id                :integer          not null, primary key
#  resource          :binary
#  presentation_mode :integer
#  resource_type     :integer
#  concept_id        :integer
#

class ConceptResource < ApplicationRecord
  belongs_to :concept
  
  # Apply styling appropriate for this file
  has_attached_file :resource, styles: lambda { |a| a.instance.check_file_type},default_url: "/images/missing.png"
  validates_attachment_content_type :resource, :content_type => ["image/jpg","image/jpeg","image/png","image/gif","application/pdf","video/mp4"]


  # The path of the image that will be shown while the file is loading
  def processing_image_path(image_name)
    "/assets/" + Rails.application.assets.find_asset(image_name).digest_path
  end

  #process_in_background :resource, processing_image_url: lambda { |a| a.instance.processing_image_path("dad.jpg")}


  # IMPORTANT! The ffmpeg library has to added to the server machine. 
  # It can be uploaded from the official website https://www.ffmpeg.org/
  def check_file_type
    if is_image_type?
      { }
    elsif is_video_type?
      {
=begin
          :medium => { :geometry => "300x300#", :format => 'jpg'},
          :video => {:geometry => "640x360#", :format => 'mp4', :processors => [:transcoder]}
=end
      }
    elsif is_audio_type?
      {
          :audio => {
              :format => "mp3", :processors => [:transcoder]
          }
      }
    elsif is_pdf_type?

      {:large => "750x750>", :medium => "300x300#", :thumb => "100x100#" }

      #resource_file_name = self.basename(:resource_file_name, self.extname(:resource_file_name))
    else
      {}
    end
  end



  # Method returns true if file's content type contains word 'image', overwise false
  def is_image_type?
    resource_content_type =~ %r(image)
  end

  def is_pdf_type?
    resource_content_type =~ %r(pdf)
  end

  # Method returns true if file's content type contains word 'video', overwise false
  def is_video_type?
    resource_content_type =~ %r(video)
  end

  # Method returns true if file's content type contains word 'audio', overwise false
  def is_audio_type?
    resource_content_type =~ /\Aaudio\/.*\Z/
  end

end


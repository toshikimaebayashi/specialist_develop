class PostImage < ApplicationRecord
    mount_uploader :imageurl, PostimageUploader
end

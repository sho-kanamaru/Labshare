module ApplicationHelper
    def display_image(field_id)
        if field_id == 1
          image_tag("/images/1.jpg", style: "width: 100%")
        elsif field_id == 2
          image_tag("/images/2.jpg", style: "width: 100%")
        elsif field_id == 3
          image_tag("/images/3.jpg", style: "width: 100%")
        elsif field_id == 4
          image_tag("/images/4.jpg", style: "width: 100%")
        elsif field_id == 5
          image_tag("/images/5.jpg", style: "width: 100%")
        end
      end
end

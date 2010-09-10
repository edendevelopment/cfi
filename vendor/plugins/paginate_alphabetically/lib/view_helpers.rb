module PaginateAlphabetically
  module ViewHelpers
    def alphabetically_paginate(collection)
      return "" if collection.empty?
      available_letters = collection.first.class.pagination_letters
      content_tag(:ul, safe(alphabetical_links_to(available_letters)),
                  :class => "pagination")
    end

    def safe(content)
      if content.respond_to?(:html_safe)
        return content.html_safe
      end
      content
    end

    def alphabetical_links_to(available_letters)
      ('A'..'Z').map do |letter|
        content_tag(:li, paginated_letter(available_letters, letter))
      end.join(" ")
    end

    def paginated_letter(available_letters, letter)
      if available_letters.include?(letter)
        link_to(letter, "#{request.path}?letter=#{letter}")
      else
        letter
      end
    end
  end
end

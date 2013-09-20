def prepare_tags(tag_string)
  no_spaces = tag_string.gsub(" ", "")
  string_array = no_spaces.split(",")
  tag_array = []
  string_array.each do |str|
    tag = Tag.find_or_create_by_name(str)
    tag_array << tag
  end
  tag_array
end


def display_tags(tag_array)
  tag_string = ""
  tag_array.each do |tag|
    tag_string << "#{tag.name}, "
  end
  tag_string[0..-3]
end

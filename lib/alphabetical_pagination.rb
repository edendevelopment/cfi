module AlphabeticalPagination

  def pagination_letters
    all.sort_by{|obj| obj.send(@attribute)}.group_by {|group| group.send(@attribute)[0].chr.upcase}.keys
  end

  def first_letter
    first_person = find(:first, :order => @attribute)
    return 'A' if first_person.nil?
    first_person.send(@attribute)[0].chr.upcase
  end

  def alphabetical_group(letter = nil)
    find(:all, :conditions => ["#{@attribute.to_s} LIKE ?", "#{letter || first_letter}%"], :order => @attribute)
  end

  private
  def sort_by(attribute)
    @attribute = attribute
  end

end

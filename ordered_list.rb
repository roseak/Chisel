class OrderedList
  def ordered_tags(chunk)
    lines = break_into_lines(chunk)
    listed = list_tags(lines)
    tagged = ol_tags(listed)
    back_together_chunks(tagged)
  end

  def break_into_lines(chunk)
    chunk.split("\n")
  end

  def list_tags(lines)
    lines.map do |line|
      "<li>#{line[3..-1]}</li>"
    end
  end

  def ol_tags(listed)
    listed.unshift("<ol>")
    listed.push("</ol>")
  end

  def back_together_chunks(tagged)
    tagged.join("\n")
  end
end

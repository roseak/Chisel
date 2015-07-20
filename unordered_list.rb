class UnorderedList
  def unordered_tags(chunk)
    lines = break_into_lines(chunk)
    listed = list_tags(lines)
    tagged = ul_tags(listed)
    back_together_chunks(tagged)
  end

  def break_into_lines(chunk)
    chunk.split("\n")
  end

  def list_tags(lines)
    lines.map do |line|
      "<li>#{line[2..-1]}</li>"
    end
  end

  def ul_tags(listed)
    listed.unshift("<ul>")
    listed.push("</ul>")
  end

  def back_together_chunks(tagged)
    tagged.join("\n")
  end
end

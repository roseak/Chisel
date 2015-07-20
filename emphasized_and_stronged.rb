class EmphasizedAndStronged
  def em_and_strong_tags(chunk)
    strong_tagger(chunk)
    em_tagger(chunk)
  end

  def strong_tagger(chunked)
    while chunked.include?("**")
      chunked.sub!("**", "<strong>")
      chunked.sub!("**", "</strong>")
    end
    chunked
  end

  def em_tagger(chunked)
     while chunked.include?("*")
      chunked.sub!("*", "<em>")
      chunked.sub!("*", "</em>")
    end
    chunked
  end
end

class Header
  def header_tags(chunk)
    hash_count = chunk.count("#")
    header_out_hash = chunk.delete("#")
    "<h#{hash_count}>#{header_out_hash}</h#{hash_count}>"
  end
end

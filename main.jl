const BUFFER_SIZE = 4096
const BUFFER = Vector{UInt8}(undef, BUFFER_SIZE)

function main()
  ascii_histogram = Vector{Int64}(undef, 128); fill!(ascii_histogram, 0)
  while !eof(stdin)
    bytes_read = readbytes!(stdin, BUFFER, BUFFER_SIZE)
    for c in BUFFER[1:bytes_read]
      if c < 128
        ascii_histogram[c + 1] += 1
      end
    end
  end
  for (index, value) in enumerate(ascii_histogram)
    real_index = index - 1
    if real_index >= 32 && value > 0
      print("$(Char(real_index)):$value,")
    end
  end
  println("")
end

main()
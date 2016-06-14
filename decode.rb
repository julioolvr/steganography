require 'chunky_png'

sections = []
current_section = []

ChunkyPNG::Image.from_file(ARGV.first).pixels.each_slice(3) do |pixels|
  rgb_data = pixels.flat_map do |pixel|
    ChunkyPNG::Color.to_truecolor_bytes(pixel)
  end

  next_byte = rgb_data.take(8).each_with_index.map do |byte, i|
    (byte & 0b1) << (7 - i)
  end.reduce(:|)

  current_section << next_byte

  section_finished = rgb_data.last & 0b1 == 0b1

  if section_finished
    sections << current_section
    current_section = []
  end
end

file_name = sections[0].map(&:chr).join

File.open(file_name, 'wb') do |file|
  file.write(sections[1].pack('c*'))
end

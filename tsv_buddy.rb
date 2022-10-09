# frozen_string_literal: false

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv_rows = tsv.split("\n")
    header = tsv_rows[0].split
    @data = []
    tsv_rows[1..].each do |row|
      dict = {}
      row.split("\t").each_with_index do |e, idx|
        dict[header[idx]] = e
      end
      @data.push(dict)
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    header = @data.first.keys.join("\t")
    tsv_string = ''
    @data.each do |row|
      tsv_string << row.values.join("\t")
      tsv_string << "\n"
    end
    header << "\n" << tsv_string
  end
end

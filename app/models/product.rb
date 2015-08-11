class Product < ActiveRecord::Base
  def self.to_csv
    CSV.generate do | csv |
      csv << column_names
      all.each do |product|
       csv << product.attributes.values_at(*column_names)
      end

    end

  end

  def self.import(file)
    CSV.foreach(file.path,headers: true ) do |row|
      Product.create! row.to_hash
    end

  end

  def self.check_file?(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else
      return false
    end
  end

end

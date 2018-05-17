require 'spreadsheet'


Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet::Workbook.new
sheet = book.create_worksheet



hello = File.open('email.csv', 'r')

 csv = hello.readlines
 csv = csv[0].split(',')

index = 0
for email in csv do
if email.include?('@')
  sheet[index, 0] = email
  index +=1
  end
end

book.write 'out.xls'
hello.close

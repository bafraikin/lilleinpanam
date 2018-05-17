require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'watir'
require 'pry'

browser = Watir::Browser.new :firefox
browser.driver.manage.timeouts.implicit_wait = 5
Book_of_old_student = ["/Master-EPPSy","/Master-ID","/Master-IDS/","/Master-TSM","/Licence-SH","/Master-GIDE","/Licence-MIASHS"]
# 1er exercice, on récupére l'adresse mail d'une page demandé
def get_the_name_of_old_students(array, client)
 fichier = File.open('email.csv', 'a')
	x =[]
	array.each do |url|
		doc = Nokogiri::HTML(open("http://annuaires-anciens.univ-lille3.fr#{url}"))
		doc.css('p:nth-child(2) a.interne').each do |name|
			if name.values[1].include?("trombinoscope")
			else
				page = Nokogiri::HTML(open("#{name.values[1]}"))
				page.css("div.contenu a.interne").each do|student|
                                  unless student.values[1].include?("Michael-Popek")
					client.goto student.values[1]
                                        fichier.write(client.a(class: "externe").href.sub(/mailto:/, '') + ",")
                                  end
				end
			end

		end

	end
end

array = get_the_name_of_old_students(Book_of_old_student,browser)



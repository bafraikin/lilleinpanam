require 'gmail'
require 'dotenv'
require 'pry'
Dotenv.load('gmail.env')

gmail = Gmail.connect!(ENV['username'],ENV['password'])

email = File.open('email_sort.csv', 'r')
email = email.readlines

email.each do |student|
  student = student.split("\n")
  gmail.deliver do 
    to student

    subject "Présentation de The Hacking Project"
    text_part do
      body "Text of plaintext message."
    end
    html_part do
      content_type 'text/html; charset=UTF-8'
      body "<p>Bonjour,</p>
      <p>	Nous sommes des élèves de <b>The Hacking Project.<br></b>
      Une formation au code gratuite:
      <ul>
      <li>sans locaux</li>
      <li>sans sélection</li>
      <li>sans restriction géographique</li><br>
      </ul>	
      La pédagogie de notre formation est celle du <u>peer-learning</u>, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code.<br>
      Aujourd'hui, on s'est fixé comme projet de créer une landing page pour pouvoir promouvoir cette formation, <br>
      On a aussi décidé d'envoyer quelques mails aux anciens étudiants de lille pour leur présenter ce que des débutants savent faire en 1 mois et demi de code. <br>
      Déjà 400 personnes sont passées par <b>The Hacking Project</b>et ont changé leur vie<br>
      Est-ce ça te dirait de changer le monde avec nous ?<br>
      Viens en découvrir plus sur cette <a href= 'https://hidden-sierra-91449.herokuapp.com/home/hackers' > adresse</a> . 

      <p>The Hacking Project Lille</p>"
    end
  end
end

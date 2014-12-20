class TicketScraper 

  def ticket_grabber
    mechanize = Mechanize.new
    page = mechanize.get("http://impresario.comedycentral.com/show/e0d100ed55c2dc9e")
    form = page.forms[0]

    # form.fields[0].value = "Joshua"
    # form.fields[1].value = "Owens"
    # form.fields[2].value = "11238"
    # form.fields[3].value = "3473622309"
    # form.fields[4].value = "3473622309"
    # form.fields[5].value = "3473622309"
    # form.fields[6].value = "joshuaowens011@gmail.com"
    # form.fields[7].value = "joshuaowens011@gmail.com"
    form.firstname = "Joshua"
    form.lastname = "Owens"
    form.zip = "11238"
    form.phone_daytime = "3473622309"
    form.phone_evening = "3473622309"
    form.phone_mobile = "3473622309"
    form.email = "joshuaowens011@gmail.com"
    form.emailVerify = "joshuaowens011@gmail.com"
    # skip hidden value
    # skip notes form
    # form.tickets_number = "2"
    form.field_with(:name => "tickets_number").option_with(:value => "2").click
    # skip country
    form.field_with(:name => "state").option_with(:value => "NY").click
    # form.state = "NY"
    form.checkbox_with(:name => "terms").check
    page.links[8].click
    puts "success"
  end
end

t = TicketScraper.new
t.ticket_grabber

  # def scrape_myspace_for_profile_photo
  #   mechanize = Mechanize.new
  #   page = mechanize.get("https://myspace.com/search/people?q=#{@old_email}")
  #   profile_page = page.links[20].click
  #   if profile_page.links[0].attributes.search("img").size == 0
  #     return nil
  #   else
  #     return profile_page.links[0].attributes.search("img").first.attributes["src"].value
  #   end
  # end

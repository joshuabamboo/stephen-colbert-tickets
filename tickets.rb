class TicketGrabber
  require 'mechanize'
  require 'pry'

  def initialize(firstname, lastname, zipcode, phone, email, num_of_tickets)
    @firstname = firstname
    @lastname = lastname
    @zipcode = zipcode
    @phone = phone
    @email = email
    @num_of_tickets = num_of_tickets.to_s
  end

  def get_form
    mechanize = Mechanize.new
    # testing the script
    @page = mechanize.get("file:///Users/joshuaowens011/Development/code/stephen-colbert-tickets/ticket_form.html")
    # The Daily Show ticket form
    # page = mechanize.get("http://impresario.comedycentral.com/show/e0d100ed55c2dc9e")
    @form = @page.forms[0]
  end

  def fill_out_form
    # form.fields[0].value = "Joshua"
    # form.fields[1].value = "Owens"
    # form.fields[2].value = "11238"
    # form.fields[3].value = "3473622309"
    # form.fields[4].value = "3473622309"
    # form.fields[5].value = "3473622309"
    # form.fields[6].value = "joshuaowens011@gmail.com"
    # form.fields[7].value = "joshuaowens011@gmail.com"
    @form.firstname = @firstname
    @form.lastname = @lastname
    @form.zip = @zipcode
    @form.phone_daytime = @phone
    @form.email = @email
    @form.emailVerify = @email
    @form.field_with(:name => "tickets_number").option_with(:value => @num_of_tickets).click
    @form.field_with(:name => "country").option_with(:value => "US").click
    @form.field_with(:name => "state").option_with(:value => "NY").click
    @form.state = "NY"
    @form.checkbox_with(:name => "terms").check
  end

  def submit_form
    @page.links[8].click
  end

  def get_tickets
    get_form
    fill_out_form
    submit_form
  end
end

t = TicketGrabber.new("Joshua", "Owens", 11238, 3473622309, "joshuaowens011@gmail.com", 2)
t.get_tickets
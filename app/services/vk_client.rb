class VkClient

  attr_reader :login, :password, :token, :client

  def initialize(login, password)
    @login = login
    @password = password
    @token = authorize
    @client = VkontakteApi::Client.new(@token)
  end

  def authorize
    count = 0 # число попыток
    begin
      browser = Mechanize.new

      auth_link = VkontakteApi.authorization_url(type: :client, scope: [:messages, :offline])

      page = browser.get(auth_link)

      # логинимся в вк
      form = page.forms.first
      sleep 1
      form['email'] = login
      sleep 1
      form['pass'] = password
      page = browser.submit(form, form.buttons.first)

      # забираем access_token и время жизни токена из параметров страницы,
      # на которую произошел редирект
      uri = page.uri.to_s
      access_token = uri[/access_token=\w+/]
      access_token[13..access_token.length-1]
    rescue StandardError => e
      count += 1
      retry if count <= 4
    end
  end

end


class DistributionService

  def initialize(user)
    @organizer = user
    @client ||= VkontakteApi::Client.new(ENV['API_TOKEN'])
  end

  def associate!
    victims = User.all.to_a.shuffle
    santas  = User.all.to_a.shuffle

    all_good = true
    santas.each_with_index do |santa, idx|
      all_good &&= santa.id != victims[idx].id
    end

    if all_good
      notify_all(santas, victims)
    else
      associate!
    end
  end

  private

  def notify_all(santas, victims)
    santas.each_with_index { |santa, idx| notify_user(santa, victims[idx]) }
  end

  def notify_user(santa, victim)
    return unless Rails.env.production?
    if santa.id == @organizer.id
      puts build_message(santa, victim)
      return
    end
    msg_id = send_message(santa.vkid, build_message(santa, victim))
    sleep(2)
    delete_message(msg_id)
    sleep(2)
  end

  def build_message(santa, victim)
    "Поздравляю #{santa.name}! Твоя жертва #{victim.url}"
  end

  def send_message(vkid, text)
    @client.messages.send(user_id: vkid, message: text)
  end

  def delete_message(msg_id)
    @client.messages.delete(message_ids: msg_id.to_s)
  end
end
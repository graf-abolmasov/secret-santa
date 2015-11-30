Secret Santa
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Простая организация игры Тайный Дед Мороз. Участники регистрируются с помощью VK. Затем рассылается оповещение через сообщения VK кто кому дарит подарок.


Ruby on Rails
-------------

This application requires:

- Ruby 2.2.3
- Rails 4.2.4

Getting Started
---------------

- Необходимо создать приложение (тип IFrame) в [VK](https://vk.com/apps?act=manage)
- Настроить oauth callback https://example.com/users/auth/vkontakte/callback
- Прописать в переменные окружения APP_ID, APP_SECRET для приложения IFrame
- Создать приложение типа Standalon, необходимо для отправки сообщений через api
- Получить для этого приложения токен и прописать в переменную окружения API_TOKEN. Необходимо получить токен с правами messages и offline

# import this script to your deepnude folder and execute with: python3 deepnude-telegrambot.py
# code by adotDEV
# please visit https://github.com/adotdev

import os
import logging
import telegram

from telegram.ext import (
    Filters,
    Updater,
    CommandHandler,
    MessageHandler
)

# defining bot's
botToken = 'TOKEN'  # insert your token here

bot = telegram.Bot(botToken)
updater = Updater(token=botToken)
dispatcher = updater.dispatcher

# debugigng
logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    level=logging.INFO
)

# define functions


# starting message
def start(update, context):
    context.bot.send_message(
        chat_id=update.effective_chat.id,
        text="bot start sucefull"
    )


def photo(update, context):

    # downloading photo
    photo_file = update.message.photo[-1].get_file()
    photo_file.download('input.png')

    # executing deepnude script
    os.system('python3 ./main.py')

    # sending photo
    context.bot.send_photo(
        chat_id=update.effective_chat.id,
        photo=open('./output.png', 'rb')
    )

    # removing user files
    os.remove('./input.png')
    os.remove('./output.png')


# set here your handlers

# start command
start_handler = CommandHandler('start', start)
dispatcher.add_handler(start_handler)

# photo receive and send
photo_handler = MessageHandler(
    Filters.photo,
    photo
)
dispatcher.add_handler(photo_handler)

updater.start_polling()  # starting bot


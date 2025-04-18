# !/usr/bin/env python3
import imaplib
from dotenv import dotenv_values

config = dotenv_values("../../../configs/.gmail_env")

REQUIRED_ENV_VARS = [
    "GMAIL_USERNAME",
    "GMAIL_PASSWORD",
]


def validate(config=False):
    if not config:
        raise ValueError("No config provided")

    if not all([config.get(f"{KEY}") for KEY in REQUIRED_ENV_VARS]):
        raise ValueError("Missing required environment variables")


def get_unread_count():
    obj = imaplib.IMAP4_SSL("imap.gmail.com", "993")
    obj.login(config["GMAIL_USERNAME"], config["GMAIL_PASSWORD"])
    obj.select()
    return obj.search(None, "UNSEEN")[1][0].split().__len__()


def main():
    # Ensure the required variables exist
    validate(config)

    # Count unread emails
    print(f"{get_unread_count()}")


main()

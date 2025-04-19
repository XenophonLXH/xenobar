# !/usr/bin/env python3
import imaplib
import sys
from dotenv import dotenv_values

config_file = sys.argv[1] or "../../../configs/.gmail_env"
config = dotenv_values(config_file)

REQUIRED_ENV_VARS = [
    "GMAIL_USERNAME",
    "GMAIL_PASSWORD",
]


def validate(config=False):
    if not config:
        raise ValueError(f"No config provided in {config_file}")

    if not all([config.get(f"{KEY}") for KEY in REQUIRED_ENV_VARS]):
        raise ValueError("Missing required environment variables")


def get_unread_count():
    obj = imaplib.IMAP4_SSL("imap.gmail.com", "993")
    obj.login(config["GMAIL_USERNAME"], config["GMAIL_PASSWORD"])
    obj.select("INBOX", readonly=True)
    return obj.search(None, 'X-GM-RAW "in:inbox is:important is:unread"')[1].__len__()


def main():
    # Ensure the required variables exist
    validate(config=config)

    # Count unread emails
    print(f"{get_unread_count()}")


main()

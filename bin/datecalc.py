#!/usr/bin/env python3

from datetime import datetime

if __name__ == "__main__":
    print(f"I am {(datetime.today() - datetime(1988,3,3)).days} days old")

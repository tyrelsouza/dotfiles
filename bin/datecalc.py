#!/usr/bin/env python3

from datetime import datetime

if __name__ == "__main__":
    print(f"Today is March {(datetime.today() - datetime(2020,2,29)).days}")

import argparse
import json
import os
import pylast
from slacker import Slacker
from sys import platform as _platform
import time


LASTFM_USER= os.environ['LASTFM_USER']
LASTFM_API_KEY = os.environ['LASTFM_API_KEY']
LASTFM_API_SECRET = os.environ['LASTFM_API_SECRET']
SLACK_OAUTH_TOKEN = os.environ['SLACK_OAUTH_TOKEN']

# You have to have your own unique two values for API_KEY and API_SECRET
# Obtain yours from http://www.last.fm/api/account/create for Last.fm
SESSION_KEY_FILE = os.path.join(os.path.expanduser("~"), ".lastfm_session_key")

def set_status(text, emoji=''):
    for token in SLACK_OAUTH_TOKEN.split(" "):
        slack = Slacker(token)
        # print slack.users.profile.get()
        status = json.dumps({'status_text':text, u'status_emoji':emoji})
        # print status
        slack.users.profile.set(profile=status)

def get_session_key():
    if not os.path.exists(SESSION_KEY_FILE):
        skg = pylast.SessionKeyGenerator(network)
        url = skg.get_web_auth_url()

        print(
            "Please authorize the scrobbler "
            "to scrobble to your account: %s\n" % url)
        import webbrowser
        webbrowser.open(url)

        while True:
            try:
                session_key = skg.get_web_auth_session_key(url)
                fp = open(SESSION_KEY_FILE, "w")
                fp.write(session_key)
                fp.close()
                break
            except pylast.WSError:
                time.sleep(1)
    else:
        session_key = open(SESSION_KEY_FILE).read()
    return session_key


if __name__ == '__main__':
    network = pylast.LastFMNetwork(LASTFM_API_KEY, LASTFM_API_SECRET)

    network.session_key = get_session_key()
    user = network.get_user(LASTFM_USER)
    playing_track = None

    try:
        new_track = user.get_now_playing()
        title = new_track.get_title()
        artist = new_track.get_artist().name
        text = "{}: {}".format(artist, title)
        print(text)

        set_status(text, ':musical_note:')

    except Exception as e:
        print(e)
        set_status('', '')

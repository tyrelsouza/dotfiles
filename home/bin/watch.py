import time
import subprocess
from watchdog.observers import Observer
from watchdog.events import PatternMatchingEventHandler

class MyHandler(PatternMatchingEventHandler):
    patterns=["*.png",]

    def on_created(self, event):
        print "yay"
        subprocess.Popen(['/bin/bash', '/Users/tyrelsouza/bin/upload_and_copy', event.src_path])


if __name__ == '__main__':
    observer = Observer()
    observer.schedule(MyHandler(), path='/Users/tyrelsouza/screenshots/')
    observer.start()

    try:
        while True:
            time.sleep(0.1)
    except KeyboardInterrupt:
        observer.stop()

    observer.join()

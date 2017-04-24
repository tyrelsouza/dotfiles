import sys
import pprint
sys.displayhook = pprint.pprint
try:
    import pdir
except ImportError:
    pass

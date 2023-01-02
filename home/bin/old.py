import os

def get_ssh_keys():
    key_out = os.popen('ssh-add -l').read()
    keylist = key_out.split("\n")[:-1]
    keys = []
    for key in keylist:
        key = key.split(" ")[2]
        keys.append(key)
    return keys


def _map_list_to_numbers(option):
    """Get a dictionary of strings mapping to indexes of the list."""
    enumerated_options = []
    index = 1
    indexMapping = {}
    for i, appname in enumerate(option):
        enumerated_options.append('{0:3d} - {1}'.format(index, appname))
        indexMapping[str(index)] = i
        index += 1
    return indexMapping, "\n".join(enumerated_options)


def _keys():
    keys = get_ssh_keys()
    if len(keys) == 1:
        return keys, None, None

    mapping, key_strings = _map_list_to_numbers(keys)
    return keys, mapping, key_strings


def _prompt_key():
    """ Prompt for which heroku app, retries if fails"""

    options, mapping, option_strings = _keys()
    if not options:
        return None

    if len(options) == 1:
        print "Using SSH Private Key {0}".format(options[0])
        return options[0]

    print option_strings
    while True:
        try:
            index = raw_input(
                "Work with which Private Key? (Type a number) (Ctrl+C to cancel): ").rstrip("\n")
            option = options[mapping[index]]
        except KeyError:
            print "Invalid Option, try again (Ctrl+C to cancel)"
            continue
        break
    return option


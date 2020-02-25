import sys
import argparse
import json
import re


def main(input_file, output_file):
    entries = []
    # split file up into single entries which ends with ===== END =====
    with open(input_file, 'r') as f_in:
        entry = ""
        for line in f_in.readlines():
            if "===== END =====" in line:
                # add new entry
                entries.append(entry)
                entry = ""
            else:
                # add to current entry
                entry += line

    data = []

    # get language from file name
    if "_DE." in input_file:
        template = re.compile(r"^\w+: (?P<id>\d+) \w+\n\n(?P<de>.*)", re.DOTALL)
    else:
        template = re.compile(r"^\w+: (?P<id>\d+) \w+\n\n(?P<en>.*)", re.DOTALL)

    for x in entries:
        # parse entry and add to data
        match = template.match(x)
        if match is None:
            print("Warning: following entry doesn't match template\n{}".format(x))
        else:
            data.append(match.groupdict())

    with open(output_file, 'w') as f_out:
        json.dump(data, f_out, indent=4)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='parse a txt exported from etherpad and create a json for importing into the database')
    parser.add_argument('input_file', help="file to parse")
    parser.add_argument('output_file', help="output file for json")
    args = parser.parse_args()
    main(args.input_file, args.output_file)


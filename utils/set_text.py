import MySQLdb as mdb
import sys
import argparse
import json


def main(host, user, passwd, db, file_name):
    try:
        con = mdb.connect(host, user, passwd, db)
    except mdb.Error as e:
        print("Error %d: %s" % (e.args[0], e.args[1]))
        sys.exit(1)

    try:
        cur = con.cursor()

        with open(file_name, 'r') as fp:
            data = json.load(fp)

        for entry in data:
            if 'de' in entry.keys() and 'en' in entry.keys() and 'id' in entry.keys():
                cur.execute('update or_lang set en=%s, de=%s where lang_id=%s', (entry['en'], entry['de'], entry['id']))
            elif 'de' in entry.keys() and 'id' in entry.keys():
                cur.execute('update or_lang set de=%s where lang_id=%s', (entry['de'], entry['id']))
            elif 'en' in entry.keys() and 'id' in entry.keys():
                cur.execute('update or_lang set en=%s where lang_id=%s', (entry['en'], entry['id']))
            else:
                print("Warning: following entry misses important keys (id and de or en are required):\n{}".format(entry))

    except mdb.Error as e:
        print("Error %d: %s" % (e.args[0], e.args[1]))
        sys.exit(1)

    finally:
        if con:
            con.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='set the emails in the or_lang table from the file email.json in the current directory')
    parser.add_argument('user',  help='user for modifying the database')
    parser.add_argument('passwd',  help="user's password")
    parser.add_argument('--host', dest='host',  default='localhost', help='host of database server')
    parser.add_argument('--db', dest='db', default='pesa2019', help='database to use')
    parser.add_argument('--file', dest='file_name', default='text.json', help='input file')
    args = parser.parse_args()
    main(args.host, args.user, args.passwd, args.db, args.file_name)

import MySQLdb as mdb
import sys
import argparse
import json


def main(host, user, passwd, db):
    try:
        con = mdb.connect(host, user, passwd, db)
    except mdb.Error as e:
        print("Error %d: %s" % (e.args[0], e.args[1]))
        sys.exit(1)

    try:
        cur = con.cursor()
        cur.execute("SELECT lang_id, content_name, en, de from or_lang where content_type='mail'")

        data = []
        for (lang_id, content_name, en, de) in cur:
            data.append({'id': lang_id, 'name': content_name, 'en': en, 'de': de})

        with open('emails.json', 'w') as fp:
            json.dump(data, fp, indent=4)

    except mdb.Error as e:
        print("Error %d: %s" % (e.args[0], e.args[1]))
        sys.exit(1)

    finally:
        if con:
            con.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='get the emails in the or_lang table and export them to the file email.json in the current directory')
    parser.add_argument('user',  help='user for modifying the database')
    parser.add_argument('passwd',  help="user's password")
    parser.add_argument('--host', dest='host',  default='localhost', help='host of database server')
    parser.add_argument('--db', dest='db', default='pesa2019', help='database to use')
    args = parser.parse_args()
    main(args.host, args.user, args.passwd, args.db)

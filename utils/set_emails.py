import MySQLdb as mdb
import sys
import argparse


def main(host, user, passwd, db, email):
    try:
        con = mdb.connect(host, user, passwd, db)
    except mdb.Error as e:
        print("Error %d: %s" % (e.args[0], e.args[1]))
        sys.exit(1)

    try:
        cur = con.cursor()
        cur.execute('update or_participants set email=%s', (email,))

    except mdb.Error as e:
        print(e)
        # print("Error %d: %s" % (e.args[0], e.args[1]))
        sys.exit(1)

    finally:
        if con:
            con.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='set the email of all participants')
    parser.add_argument('user',  help='user for modifying the database')
    parser.add_argument('passwd',  help="user's password")
    parser.add_argument('email', help='email to replace with')
    parser.add_argument('--host', dest='host',  default='localhost', help='host of database server')
    parser.add_argument('--db', dest='db', default='pesa', help='database to use')
    args = parser.parse_args()
    main(args.host, args.user, args.passwd, args.db, args.email)

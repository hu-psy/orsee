import MySQLdb as mdb
import sys
import argparse


def main(host, user, passwd, db):
    try:
        con = mdb.connect(host, user, passwd, db)
    except mdb.Error as e:
        print("Error %d: %s" % (e.args[0], e.args[1]))
        sys.exit(1)

    try:
        cur = con.cursor()
        cur.execute('update or_admin set disabled="y"')
        # list of tuples (adminname, email)
        admins = []

        for adminname, email in admins:
            cur.execute('update or_admin set disabled="n", email="%s", admin_type="experimenter" where adminname = %s', (email, adminname))

        # list of tuples (adminname, fname, lname, email)
        new_admins = []

        for adminname, fname, lname, email in new_admins:
            cur.execute("""insert into or_admin (admin_id, adminname, fname, lname, email, admin_type, disabled, language)
                           select max(admin_id)+1, %s, %s, %s, %s, 'experimenter', 'n', 'de'
                           from or_admin""", (adminname, fname, lname, email))

    except mdb.Error as e:
        print(e)
        # print("Error %d: %s" % (e.args[0], e.args[1]))
        sys.exit(1)

    finally:
        if con:
            con.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='enable some experimenter during testing phase')
    parser.add_argument('user',  help='user for modifying the database')
    parser.add_argument('passwd',  help="user's password")
    parser.add_argument('--host', dest='host',  default='localhost', help='host of database server')
    parser.add_argument('--db', dest='db', default='pesa', help='database to use')
    args = parser.parse_args()
    main(args.host, args.user, args.passwd, args.db)

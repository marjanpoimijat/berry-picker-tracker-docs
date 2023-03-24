# Connecting to a database locally

This application uses a PostgreSQL database. Make sure that it is installed with command:

```sh
$ psql --version
```

If running the command does not return any version, see the instructions [here](https://www.postgresql.org/download/).

You might need to install some dev packages in order to connect database with commands:

```sh
# for a python deve package
$ sudo apt-get install python3-dev

# for a PostgreSQL dev package
$ sudo apt-get install libpq-dev
```

## After installing

After you're sure PostgreSQL is installed you can check database status with command:

```sh
$ service postgresql status
```

You can open PostgreSQL terminal with command:

```sh
$ sudo -u postgres psql
```

### Setting up database

In the psql terminal, create a new database named *bpt*.

```sql
CREATE DATABASE bpt;
```

### Setting up environment variables

Create a new file named `.env` in the same folder as the backend root directory and add the next line.

```sh
DATABASE_URI=postgresql://*username*:*password*@localhost:5432/bpt
```

Where *username* is your PostgreSQL user and *password* is the password of your user account.

If this does not work, remove `localhost:5432` from the line.

You can check your current user with following SQL query.

```sql
SELECT current_user;
```

If you don't know your current user's password, you can define it in the psql terminal.

```sql
\password *username*
```

When you insert something into database for the first time via the application, the schema tables are created automatically!

For testing add:

```sh
TEST_DATABASE_URI=sqlite:///test.db
```

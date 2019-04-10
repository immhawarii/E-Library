import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Members(db.Model):
    __tablename__ = 'member'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String)
    email = db.Column(db.String)
    password = db.Column(db.String)
    created_at = db.Column(db.DateTime, default=datetime.datetime.now())

    def __init__(self, name, email, password, created_at):
        self.name = name
        self.email = email
        self.password = password
        self.created_at = created_at

    def __repr__(self):
        return '<user_list id ()>'.format(self.id)

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'password': self.password,
            'email': self.email,
            'created_at': self.created_at
        }


class Book_list(db.Model):
    __tablename__ = 'book_list'

    id = db.Column(db.Integer, primary_key=True)
    book_title = db.Column(db.String)
    published = db.Column(db.String)
    author = db.Column(db.String)
    created_at = db.Column(db.DateTime, default=datetime.datetime.now())

    def __init__(self, book_title, published, author, created_at):
        self.book_title = book_title
        self.published = published
        self.author = author
        self.created_at = created_at

    def __repr__(self):
        return '<book_list id ()>'.format(self.id)

    def serialize(self):
        return {
            'id': self.id,
            'book_title': self.book_title,
            'published': self.published,
            'author': self.author,
            'created_at': self.created_at
        }


class Borrower(db.Model):
    __tablename__ = 'borrower'

    id = db.Column(db.Integer, primary_key=True)
    book_id = db.Column(db.String)
    bor_name = db.Column(db.String)
    title = db.Column(db.String)
    borrow_date = db.Column(db.String)
    return_date = db.Column(db.String)

    def __init__(self, bor_name, book_id, title, borrow_date, return_date):
        self.bor_name = bor_name
        self.book_id = book_id
        self.title = title
        self.borrow_date = borrow_date
        self.return_date = return_date

    def __repr__(self):
        return '<borrower id ()>'.format(self.id)

    def serialize(self):
        return {
            'id': self.id,
            'bor_name': self.bor_name,
            'book_id': self.book_id,
            'title': self.title,
            'borrow_date': self.borrow_date,
            'return_date': self.return_date
        }

from flask import Flask, request, json, jsonify
from src.models import db, Members, Book_list, Borrower
from flask_sqlalchemy import SQLAlchemy 
from flask_cors import CORS
import os, datetime

app = Flask(__name__)
CORS(app)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
                                                     #username:password@host:port/db
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URI')
app.config['JSON_SORT_KEYS'] = False

db.init_app(app)

@app.route('/')
def main():
    return "connection test"

@app.route('/register-member', methods=['POST'])
def register_user():
    body = request.json
    response = {}
    try:
        member = Members(
            name= body["name"],
            email= body["email"],
            password= body["password"],
            created_at = datetime.datetime.now()
            )
        
        db.session.add(member)
        db.session.commit()
        
        statusCode = 200
        response['data'] = member.serialize()
        response['message'] = "Registration {} Success, Please Login".format(member.name)
        response['status_code'] = statusCode

        return jsonify(response), statusCode
    except Exception as e:
        return (str(e))        


@app.route('/all-member', methods=['GET'])
def get_all_members():
    try: 
        members = Members.query.all()
        return jsonify([mem.serialize() for mem in members])
    except Exception as e:
        return str(e)


@app.route('/login-member', methods=['POST'])
def login_member():
    response = {}
    body = request.json
    email = body['email']
    password = body['password']
    isSignin = False

    try:
        members = get_all_members().json
        for member in members:
            if email == member['email']:
                if password == member['password']:
                    isSignin = True

    except Exception as e:
        response['e'] = str(e)
    
    if isSignin:
        response['message'] = 'Signin success, welcome {}'.format(email)
        for i in range(len(members)):
            response['name'] = members[i]['name']
            response['email'] = members[i]['email']
            response['id'] = members[i]['id']
            break
        statusCode = 200
        
    else:
        response['message'] = 'Signin failed, username or password is wrong'
        statusCode = 400

    return jsonify(response), statusCode


@app.route('/add-books', methods=['POST'])    
def add_books():
    body = request.json
    response = {}
    try:

        book_list = Book_list(
            book_title = body['book_title'],
            published = body['published'],
            author = body['author'],
            created_at = datetime.datetime.now()
        )
        
        db.session.add(book_list)
        db.session.commit()

        statusCode = 200
        response['data'] = book_list.serialize()
        response['message'] = "Add Book {} Success".format(book_list.book_title)
        response['status_code'] = statusCode

        return jsonify(response), statusCode

    except Exception as e:
        return (str(e)),400

@app.route('/update-book-data/<id_>', methods=['PUT'])
def update_book_data(id_):
    body = request.json
    try:
        book = Book_list.query.filter_by(id = id_).first()
        for key, value in body.items():
            if key == "book_title":
                book.book_title = value
            elif key == "published":
                book.published = value
            elif key == "author":
                book.author = value

    except Exception as e:
        return (str(e)),400
    
    db.session.commit()
    body['message'] = "Book {} has updated".format(book.book_title)
    return jsonify(body),200

@app.route('/all-books', methods=['GET'])
def get_all_books():
    try: 
        book = Book_list.query.all()
        return jsonify([bk.serialize() for bk in book])
    except Exception as e:
        return str(e)    

@app.route('/borrow-books/<id_>', methods=['POST'])        
def borrow_books(id_):
    body = request.json 
    response = {}
    bor_name = body['bor_name']

    try:
        book = Book_list.query.filter_by(id = id_).first()
        borrower = Borrower(
            bor_name = bor_name,
            book_id = id_,
            title = book.book_title,
            borrow_date = body['borrow_date'],
            return_date = body['return_date']
        )

        db.session.add(borrower)
        db.session.commit()

        statusCode = 200
        response['data'] = borrower.serialize()
        response['message'] = "Borrow Book {} Success".format(borrower.title)
        response['status_code'] = statusCode

        return jsonify(response), statusCode
    except Exception as e:
        return (str(e)), 400


@app.route('/all-borrower')
def get_all_borrower():
    
    try: 
        borrower = Borrower.query.all()
        return jsonify([br.serialize() for br in borrower])
    except Exception as e:
        return str(e)   

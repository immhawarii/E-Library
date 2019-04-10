CREATE TABLE member(
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  email varchar unique NOT NULL,
  password varchar NOT NULL,
  created_at timestamp
);

CREATE TABLE book_list(
  id serial PRIMARY KEY,
  book_title varchar unique,
  published varchar,
  author varchar,
  created_at timestamp
);		

CREATE TABLE borrower(
  id serial PRIMARY KEY, 
  book_id int
  bor_name varchar,
  title varchar,
  borrow_date varchar, 
  return_date varchar
);		


#LIBRARY MANAGEMENT SYSTEM
create database LMS;
USE LMS;

create table Branch(Branch_no int primary key,
Manager_id int,
Branch_address varchar(30),
contact_no int);
desc branch;
drop table branch;
insert into branch values (1,001,'mlptm branch',987456321);
insert into branch values (2,002,'mlptm branch',987456322);
insert into branch values (3,003,'mlptm branch',987456323);
insert into branch values (4,004,'mlptm branch',987456324);
insert into branch values (5,005,'mlptm branch',987456325);
select * from branch;

create table employee(emp_id int primary key,
emp_name varchar(30),
position varchar(30),
salary int,
branch_no int,
foreign key(branch_no) references Branch(Branch_no));
desc employee;
insert into employee values(101,'abhinav','lib assistant',17000,1);
insert into employee values(102,'abhijith','lib manager',53000,2);
insert into employee values(103,'abhiraj','librerian',20000,3);
insert into employee values(104,'abhinand','lib assistant',15000,4);
insert into employee values(105,'abhina','lib manager',45000,5);
insert into employee values(106,'pranav','librerian',17000,4);
insert into employee values(107,'naveen','lib manager',41000,2);
insert into employee values(108,'avishna','lib assistant',20500,3);
insert into employee values(109,'vishnu','lib manager',59000,4);
insert into employee values(110,'nandhana','lib manager',51000,1);
select * from employee;


create table Books(ISBN int PRIMARY KEY,
Book_title varchar(30),
Category varchar(28),
Rental_price float,
status char(5),
Author varchar(50),
Publisher varchar(30));
desc books;
insert into books values(9754221, 'Harry Potter', 'Fantasy', 599, 'yes', 'J.K. Rowling', 'Scholastic'),
    (9780930, 'To Kill a Mockingbird', 'classic', 499, 'yes', 'Harper lee', 'Scholastic'),
    (9780439, 'Adujeevitham', 'Fantasy', 499, 'yes', 'benniyamin', 'DC books'),
    (9780839, 'The Great Gatsby', 'Fantasy', 399, 'yes', ' F. Scott Fitzgerald ', 'Scribner'),
    (9780465, '1984', 'Fantasy', 199, 'no', 'George Orwell', 'Secker & Warburg'),
    (9780071, 'The Catcher in the Rye', 'Fiction', 299, 'yes', 'J.D. Salinger', ' Little Brown and Company'),
    (9749700, 'The Da Vinci Code', 'Fiction', 199, 'no', 'Dan Brown', 'Ss books'),
    (9783427, 'A Brief History of Humankind', 'Non Fiction', 299, 'yes', ' Yuval Noah Harar', 'Bloomsbury'),
    (9784735, 'wings of fire', 'autobiography', 499, 'yes', 'APJ abdul kalam', 'DC books'),
    (9781483, 'Alchemist', 'Fiction', 699, 'yes', 'paulo coelho', 'Bloomsbury');
select * from books;

create table customer(customer_id int primary key,
customer_name varchar(25),
customer_address varchar(30),
Reg_date date);
desc customer;

insert into customer values(1001,'vishnu','alavoor house','2021-06-11'),
(1002,'shanu','deva house','2022-3-21'),(1003,'vishak','pp house','2023-09-14'),
(1004,'anu','ram house','2024-04-19'),(1005,'vinod','mr house','2022-10-24');
select * from customer;

create table IssueStatus(issue_id int primary key,
issued_cus int,
foreign key (issued_cus) references customer(customer_id),
issued_date date,
Isbn_book int,foreign key (Isbn_book) references Books(ISBN));
desc Issuestatus;

insert into IssueStatus values(10001,1001,'2020-2-14',9754221),
(10002,1002,'2024-05-22',9754221),(10003,1003,'2024-07-20',9780071),
(10004,1004,'2023-05-12',9780439),(10005,1005,'2024-05-22',9780465);
select * from Issuestatus;

create table ReturnStatus(Return_id int primary key,
Return_cus varchar(25),
Return_book_name varchar(30),
Return_date date,
Isbn_book2 int,foreign key (Isbn_book2) references Books(ISBN));
desc ReturnStatus;
drop table returnstatus;
insert into ReturnStatus values(01,'vishnu','Harry Potter','2020-01-13',9754221),
(02,'anu','Adujeevitham','2024-04-29',9780439);
select * from ReturnStatus;

#1. Retrieve the book title, category, and rental price of all available books.
select book_title,category,rental_price from books;

#2. List the employee names and their respective salaries in descending order of salary.
select emp_name,salary from employee order by salary desc;

#3. Retrieve the book titles and the corresponding customers who have issued those books.
select b.book_title,c.customer_name,i.issued_date
from issuestatus i join books b on b.isbn=i.isbn_book
join customer c on i.issued_cus=c.customer_id;

#4. Display the total count of books in each category.
select category,count(book_title) from books group by category;

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select emp_name,salary,position from employee where salary>50000;

#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select customer_name from customer where reg_date<'2022-01-01'
and customer_id not in (select issued_cus from issuestatus);

#7. Display the branch numbers and the total count of employees in each branch.
select branch_no,count(emp_name) as totalEmployees from employee group by branch_no;

#8. Display the names of customers who have issued books in the month of June 2023.
select issued_cus from issuestatus where issued_date in ('2023-06-01');

#9. Retrieve book_title from book table containing history.
select book_title,category from books where category='history';

#10.Retrieve the branch numbers along with the count of employees for branches having more than 3 employees
select branch_no,count(emp_name) as TotleEmployees from employee group by branch_no having count(emp_name)>=3;














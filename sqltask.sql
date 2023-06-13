
create table department (department_no int primary key not null,
	department_name varchar(30) not null,
	);

insert into department values(1,'Sales'),(2,'IT'),(3,'HR');

create table employee (eid int primary key not null,
	name varchar(30) not null,
	city varchar(30) not null,
	salary decimal(10,2) not null,
	department_no int not null
	);


create table employee (eid int primary key not null,
	name varchar(30) not null,
	city varchar(30) not null,
	salary decimal(10,2) not null,
	department_no int not null,
	foreign key (department_no) references department(department_no)
	);


--Task 3
select max(salary) from employee where salary < (select max(salary) from employee);

--Task 4
select department_no, count(*) from employee group by department_no;


--Task 5
--Inner Join

select employee.eid, employee.name, department.department_name from department inner
join employee on employee.department_no=department.department_no;

--Left Join

select employee.eid, employee.name, department.department_name from department left
join employee on employee.department_no=department.department_no;

--Right Join

select employee.eid, employee.name, department.department_name from employee right
join department on employee.department_no=department.department_no;


--Task 6


select employee.eid, employee.name, employee.city, employee.salary, department.department_name from employee, department
where employee.department_no=department.department_no;



--Task 7,8

--For Insertion

create procedure insertEmployee
	@Eid int,
	@Name varchar(30),
	@City varchar(30),
	@Salary decimal(10,2),
	@Department_no int 

as
begin
	insert into employee values (@Eid,@Name,@City,@Salary, @Department_no);
end



insertEmployee 6,'Vishnu', 'Aluva', 35000, 3;




--For Updation


create procedure updateEmployee
	@Eid int,
	@City varchar(30)

as
begin
	update employee set city='@City' where eid=@Eid;
end


updateEmployee 2,'Alappuzha';


--For Deletion


create procedure deleteEmployee
	@Eid int

as
begin
	delete employee where eid=@Eid;
end


deleteEmployee 7;



--For Selection

create procedure selectEmployee
	@Salary decimal(10,2)

as
begin
	select * from employee where salary>@Salary;
end


selectEmployee 30000;

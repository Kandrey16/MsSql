set ansi_nulls on
go
set ansi_padding on
go
set quoted_identifier on 
go

use [Airport_Database]
go

create table [dbo].[Airport]
(
	[ID_Airport] [int] not null identity(1,1),
	[Name_Airport] [varchar] (50) not null
	constraint [PK_Airport] primary key clustered
	([ID_Airport] ASC) on [PRIMARY],
	constraint [UQ_Name_Airport] unique ([Name_Airport])
) 
go
insert into [dbo].[Airport] ([Name_Airport])
values ('Шереметьево'),
('Пулково'),
('Гумрак'),
('Национальный аэропорт Минска'),
('Международный аэропорт Краснодара'),
('Аэропорт Руасси')
go
select [Name_Airport] as 'Название аэропорта' from [dbo].[Airport]
order by [Name_Airport] ASC
go
insert into [dbo].[Airport] ([Name_Airport])
values ('Домодедово')
go
update [dbo].[Airport] set
	[Name_Airport] = 'Сочи'	
	where
	[ID_Airport] = 2;
	go
delete from [dbo].[Airport]
	where [ID_Airport] = 3
	go

----------------------------
create table [dbo].[Airline]
(
	[ID_Airline] [int] not null identity(1,1),
	[Name_Airline] [varchar] (50) not null
	constraint [PK_Airline] primary key clustered
	([ID_Airline] ASC) on [PRIMARY],
	constraint [UQ_Name_Airline] unique ([Name_Airline])
)
go
insert into [dbo].[Airline] ([Name_Airline])
values ('Победа'), ('S7'), ('Аэрофлот'), ('Азимут'), ('Аврора')
go
select [Name_Airline] as 'Название Авиакомпании' from [dbo].[Airline]
order by [Name_Airline] ASC
go
-------------------
insert into [dbo].[Airline] ([Name_Airline])
values ('Emirates')
go
update [dbo].[Airline] set
	[Name_Airline] = 'Red Wings'
	where
	[ID_Airline] = 2
	go
delete from [dbo].[Airline]
	where [ID_Airline] = 3
	go
-------------------
create table [dbo].[Passenger]
(
	[ID_Passenger] [int] not null identity(1,1),
	[First_Name_Passenger] [varchar] (50) not null,
	[Second_Name_Passenger] [varchar] (50) not null,
	[Middle_Name_Passenger] [varchar] (50) null default ('-'),
	[Passport_Data] [varchar] (10) not null,
	[Birth_Certificate][varchar] (6) not null
	constraint [PK_Passenger] primary key clustered
	([ID_Passenger] ASC) on [PRIMARY],
	constraint [UQ_Passport_Data] unique ([Passport_Data]),
	constraint [CH_Passport_Data] check (len([Passport_Data])=10),
	constraint [CH_Passport_Data_Symbols] check ([Passport_Data] like ('%[0-9]%')),
	constraint [UQ_Birth_Certificate] unique ([Birth_Certificate]),
	constraint [CH_Birth_Certificate] check (len([Birth_Certificate])=6),
	constraint [CH_Birth_Certificate_Symbols] check ([Passport_Data] like ('%[0-9]%'))
)
go
insert into [dbo].[Passenger] ([First_Name_Passenger],
[Second_Name_Passenger],[Middle_Name_Passenger],
[Passport_Data],[Birth_Certificate])
values ('Будько', 'Иван', 'Романович','4139408839','583646'),
('Сергеев','Андрей','Николаевич','4931667374','513042'),
('Иванов','Юрий','Андреевич','4165411789','774334'),
('Романов','Николай','Сергеевич','4951881664','656297'),
('Федоров','Никита','Артемович','4083914546','507493')
go
select [First_Name_Passenger]+' '+[Second_Name_Passenger]+' '+[Middle_Name_Passenger] as 'ФИО Пассажира', 
[Passport_Data] as 'Паспортные данные', [Birth_Certificate] as 'Свидетельство о рождении' from [dbo].[Passenger]
where [Birth_Certificate] like '%493'
order by [First_Name_Passenger] ASC
go
insert into [dbo].[Passenger] ([First_Name_Passenger],
[Second_Name_Passenger],[Middle_Name_Passenger],
[Passport_Data],[Birth_Certificate])
values ('Андреев','Андрей','Андреевич','4073672367','387637')
go
update [dbo].[Passenger] set
	[First_Name_Passenger] = 'Иван'
	where [ID_Passenger] = 2
	go
delete from [dbo].[Passenger]
	where [ID_Passenger] = 7
	go


----------------------
create table [dbo].[Mark]
(
	[ID_Mark] [int] not null identity(1,1),
	[Name_Mark] [varchar] (30) not null
	constraint [PK_Mark] primary key clustered
	([ID_Mark] ASC) on [PRIMARY]
)
go
insert into [dbo].[Mark] ([Name_Mark])
values ('Airbus'), ('Иркут'), ('Boeing'), ('Craic'), ('Fokker')
go
select [Name_Mark] as 'Название Марки' from [dbo].[Mark]
order by [Name_Mark] ASC
go
insert into [dbo].[Mark] ([Name_Mark])
values ('ATR')
go
update [dbo].[Mark] set
	[Name_Mark] = 'Lockheed'
	where [ID_Mark] = 3
	go
delete from [dbo].[Mark]
	where [ID_Mark] = 3
	go
-----------------------
create table [dbo].[Class]
(
	[ID_Class] [int] not null identity(1,1),
	[Name_Class] [varchar](30) not null
	constraint [PK_Class] primary key clustered
	([ID_Class] ASC) on [PRIMARY]
)
go
insert into [dbo].[Class] ([Name_Class])
values ('Эконом'), ('Бизнес')
go
select [Name_Class] as "Название классов" from [dbo].[Class]
order by [Name_Class] ASC
go
insert into [dbo].[Class] ([Name_Class])
values ('Стандартный')
go
update [dbo].[Class] set
	[Name_Class] = 'Премиальный'
	where [ID_Class] = 3
	go
delete from [dbo].[Class]
	where [ID_Class] = 3
	go
create table [dbo].[City_View]
(
	[ID_City_View] [int] not null identity(1,1),
	[Name_City_View] [varchar] (20) not null
	constraint [PK_City_View] primary key clustered
	([ID_City_View] ASC) on [PRIMARY],
	constraint [UQ_Name_City_View] unique ([Name_City_View])
)
go
insert into [dbo].[City_View] ([Name_City_View])
values('Отправление'),('Прибытие')
go
select [Name_City_View] as 'Вид города' from [dbo].[City_View]
go

create table [dbo].[Flight_Status]
(
	[ID_Flight_Status] [int] not null identity(1,1),
	[Name_Flight_Status] [varchar] (30) not null
	constraint [PK_Flight_Status] primary key clustered
	([ID_Flight_Status] ASC) on [PRIMARY]
)
go
insert into [dbo].[Flight_Status] ([Name_Flight_Status])
values ('Ожидается прибытие'),('Задержан'),('Идет посадка'),('Идет регистрация')
go
select [Name_Flight_Status] as 'Статус рейса' from [dbo].[Flight_Status]
where [Name_Flight_Status] = 'Ожидается прибытие'
go

create table [dbo].[Current_Position]
(
	[ID_Current_Position] [int] not null identity(1,1),
	[Name_Current_Position] [varchar] (30) not null
	constraint [PK_Current_Position] primary key clustered
	([ID_Current_Position] ASC) on [PRIMARY],
	constraint [UQ_Name_Current_Position] unique ([Name_Current_Position])
)
go
insert into [dbo].[Current_Position] ([Name_Current_Position])
values ('Менеджер аэропорта по организации вылетов'),('Менеджер аэропорта')
go
select [Name_Current_Position] as 'Занимаемая должность' from [dbo].[Current_Position]
where [Name_Current_Position] = 'Менеджер аэропорта по организации вылетов'
go

create table [dbo].[Employee]
(
	[ID_Employee] [int] not null identity(1,1),
	[First_Name_Employee] [varchar] (30) not null,
	[Second_Name_Employee] [varchar] (30) not null,
	[Middle_Name_Employee] [varchar] (30) not null default ('-'),
	[Login_Employee] [varchar] (32) not null,
	[Password_Employee] [varchar] (32) not null
	constraint [PK_Employee] primary key clustered
	([ID_Employee] ASC) on [PRIMARY],
	constraint [UQ_Login_Employee] unique ([Login_Employee]),
	constraint [CH_Login_Employee] check (len([Login_Employee])>=3),
	constraint [CH_Password_Employee_Upper] check ([Password_Employee] like ('%[A-Z]%')),
	constraint [CH_Password_Employee_Letter_Lower] check ([Password_Employee] like ('%[a-z]%')),
	constraint [CH_Password_Employee_Symbols] check ([Password_Employee] like ('%[!@#$%^&*()]%'))
)
go
insert into [dbo].[Employee] ([First_Name_Employee],[Second_Name_Employee],[Middle_Name_Employee],[Login_Employee],[Password_Employee])
values ('Матвеев','Матвей','Матвеевич','Matveev','Matveev_Pa$$word'), 
('Павлов','Павел','Павлович','Pavlov','Pavlov_Pa$$word'), 
('Тимофеев','Тимофей','Тимофеевич','Timofeev','Timofeev_Pa$$word'), 
('Сафонов','Илья','Ильич','Safonov','Safonov_Pa$$word'), 
('Сорокин','Дмитрий','Дмитриевич','Sorokin','Sorokin_Pa$$word')
go
select [First_Name_Employee]+' '+[Second_Name_Employee]+' '+[Middle_Name_Employee] as 'ФИО Сотрудника',
[Login_Employee] as 'Логин', [Password_Employee] as 'Пароль' from [dbo].[Employee]
go
-----------------------------------
insert into [dbo].[Employee] ([First_Name_Employee],[Second_Name_Employee],[Middle_Name_Employee],[Login_Employee],[Password_Employee])
values ('Иванов','Иван','Иванович','Ivanov','Ivanov_Pa$$word')
go
update [dbo].[Employee] set
	[Second_Name_Employee] = 'Игорь'
	Where [ID_Employee] = 4
	go

alter table [dbo].[Employee] add [Salary] [decimal] (38,2)
go
 update [dbo].[Employee] set
	[Salary] = '70000'
	where [ID_Employee] = 6
	go 
---------------------
create table [dbo].[Terminal]
(
	[ID_Terminal] [int] not null identity(1,1),
	[Name_Terminal] [varchar] (10) not null
	constraint [PK_Terminal] primary key clustered
	([ID_Terminal] ASC) on [PRIMARY],
	constraint [UQ_Name_Terminal] unique ([Name_Terminal])
)
go
insert into [dbo].[Terminal] ([Name_Terminal])
values ('A'),('B'),('C'),('D'),('Грузовой')
go
select [Name_Terminal] as 'Название терминала' from [dbo].[Terminal]
go
--------------------
create table [dbo].[Gates]
(
	[ID_Gates] [int] not null identity(1,1),
	[Number_Gates] [varchar] (5) not null,
	[Terminal_ID] [int] not null
	constraint [PK_Gates] primary key clustered
	([ID_Gates] ASC) on [PRIMARY]
	constraint [FK_Terminal_Gates] foreign key ([Terminal_ID])
	references [dbo].[Terminal] ([ID_Terminal])
)
go
insert into [dbo].[Gates] ([Number_Gates],[Terminal_ID])
values ('A1',1),('B15',2),('C3',3),('D12',4),('E17',5)
go
select [Number_Gates] as 'Номер ворот' from [dbo].[Gates]
go
----------------------
create table [dbo].[Place]
(
	[ID_Place] [int] not null identity(1,1),
	[Number_Place] [varchar] (10) not null,
	[Class_ID] [int] not null
	constraint [PK_Place] primary key clustered
	([ID_Place] ASC) on [PRIMARY],
	constraint [UQ_Number_Place] unique ([Number_Place]),
	constraint [CH_Number_Place_Symbols] check (len([Number_Place])<=4 and len([Number_Place])>=1),
	constraint [FK_Class_Place] foreign key ([Class_ID])
	references [dbo].[Class] ([ID_Class])
)
go
insert into [dbo].[Place] ([Number_Place], [Class_ID])
values ('450',1),('341',2),('25',2),('198',1),('357',2)
go
select 'Номер: '+[Number_Place] as "Данные о месте" from [dbo].[Place]
inner join [dbo].[Class] on [ID_Class] = [Class_ID]
go	

create table [dbo].[Flight] 
(
	[ID_Flight] [int] not null identity(1,1),
	[Landing_Flight] [varchar] (10) not null,
	[Number_Flight] [varchar] (8) not null,
	[Flight_Status_ID] [int] not null,
	[Passenger_ID] [int] not null,
	[Structure_Of_Airline_ID] [int] not null,
	[Structure_Of_City_ID] [int] not null
	constraint [PK_Flight] primary key clustered
	([ID_Flight] ASC) on [PRIMARY],
	constraint [UQ_Number_Flight] unique ([Number_Flight]),
	constraint [CH_Number_Flight_Numbers] check (len([Number_Flight])<=8 and len([Number_Flight])>=4),
	constraint [CH_Number_Flight_Symbols] check ([Number_Flight] like ('%[-]%')),
	constraint [FK_Flight_Status_Flight] foreign key ([Flight_Status_ID])
	references [dbo].[Flight_Status] ([ID_Flight_Status]),
	constraint [FK_Passenger_Flight] foreign key ([Passenger_ID])
	references [dbo].[Passenger] ([ID_Passenger]),
	constraint [FK_Structure_Of_Airline_Flight] foreign key ([Structure_Of_Airline_ID])
	references [dbo].[Structure_Of_Airline] ([ID_Structure_Of_Airline]),
	constraint [FK_Structure_Of_City_Flight] foreign key ([Structure_Of_City_ID])
	references [dbo].[Structure_Of_City] ([ID_Structure_Of_City])
)
go
insert into [dbo].[Flight] ([Number_Flight],[Landing_Flight],[Flight_Status_ID],[Passenger_ID],[Structure_Of_Airline_ID],[Structure_Of_City_ID])
values ('IZ-4261','Идёт',1,1,2,1),
('SU-46','Завершена',2,2,3,2),
('EK-656','Завершена',3,3,4,3),
('TK-428','Идёт',1,4,5,4),
('WZ-9948','Завершена',4,5,6,5)
go
select 'Номер: '+[Number_Flight]+' Посадка: '+[Landing_Flight] as "Данные о Рейсе", 'Статус рейса: '+convert([varchar](30),[Flight_Status_ID]) as "Данные о статусе рейса" from [dbo].[Flight] 
inner join [dbo].[Flight_Status] on [ID_Flight_Status] = [Flight_Status_ID]
go

alter table [dbo].[Flight] add [Data_Flight] [date]
go
alter table [dbo].[Flight] add [Start_Flight] [time]
go
alter table [dbo].[Flight] add [End_Flight] [time]
go
 update [dbo].[Flight] set
	[Data_Flight] = '22.08.2022'
	where [ID_Flight] = 1
	go 
 update [dbo].[Flight] set
	[Data_Flight] = '16.09.2022'
	where [ID_Flight] = 2
	go 
 update [dbo].[Flight] set
	[Data_Flight] = '20.07.2022'
	where [ID_Flight] = 3
	go 
 update [dbo].[Flight] set
	[Data_Flight] = '29.03.2022'
	where [ID_Flight] = 4
	go 
 update [dbo].[Flight] set
	[Data_Flight] = '12.05.2022'
	where [ID_Flight] = 5
	go 

 update [dbo].[Flight] set
	[Start_Flight] = '16:00'
	where [ID_Flight] = 1
	go
 update [dbo].[Flight] set
	[Start_Flight] = '16:30'
	where [ID_Flight] = 2
	go
 update [dbo].[Flight] set
	[Start_Flight] = '14:00'
	where [ID_Flight] = 3
	go
 update [dbo].[Flight] set
	[Start_Flight] = '19:00'
	where [ID_Flight] = 4
	go
 update [dbo].[Flight] set
	[Start_Flight] = '22:00'
	where [ID_Flight] = 5
	go

update [dbo].[Flight] set
	[End_Flight] = '18:00'
	where [ID_Flight] = 1
	go
update [dbo].[Flight] set
	[End_Flight] = '20:00'
	where [ID_Flight] = 2
	go
update [dbo].[Flight] set
	[End_Flight] = '16:00'
	where [ID_Flight] = 3
	go
update [dbo].[Flight] set
	[End_Flight] = '21:00'
	where [ID_Flight] = 4
	go
update [dbo].[Flight] set
	[End_Flight] = '23:30'
	where [ID_Flight] = 5
	go
-------------------------------------
create table [dbo].[City]
(
	[ID_City] [int] not null identity(1,1),
	[Name_City] [varchar] (30) not null,
	[City_View_ID] [int] not null
	constraint [PK_City] primary key clustered
	([ID_City] ASC) on [PRIMARY],
	constraint [UQ_Name_City] unique ([Name_City]),
	constraint [FK_City_View_City] foreign key ([City_View_ID])
	references [dbo].[City_View] ([ID_City_View])
)
go
insert into [dbo].[City] ([Name_City],[City_View_ID])
values ('Санкт-Петербург',2),('Волгоград',2),('Минск',2),('Краснодар',2),('Париж',2)
go 
select 'Название: '+[Name_City] as "Данные о городе" from [dbo].[City]
inner join [dbo].[City_View] on [ID_City_View] = [City_View_ID]
go

create table [dbo].[Model]
(
	[ID_Model] [int] not null identity(1,1),
	[Name_Model] [varchar] (30) not null,
	[Mark_ID] [int] not null
	constraint [PK_Model] primary key clustered
	([ID_Model] ASC) on [PRIMARY],
	constraint [FK_Mark_Model] foreign key ([Mark_ID])
	references [dbo].[Mark] ([ID_Mark])
)	
go
insert into [dbo].[Model] ([Name_Model],[Mark_ID])
values ('A300',1),('MC-21',2),('777',6),('CR929',4),('F27',5)
go
select 'Название: '+[Name_Model] as "Данные о Модели" from [dbo].[Model]
inner join [dbo].[Mark] on [ID_Mark] = [Mark_ID]
go

create table [dbo].[Plane]
(
	[ID_Plane] [int] not null identity(1,1),
	[Number_Plane] [varchar] (30) not null,
	[Model_ID] [int] not null
	constraint [PK_Plane] primary key clustered
	([ID_Plane] ASC) on [PRIMARY],
	constraint [FK_Model_Plane] foreign key ([Model_ID])
	references [dbo].[Model] ([ID_Model])
)
go
insert into [dbo].[Plane] ([Number_Plane],[Model_ID])
values ('000001',4),('000122',5),('001234',6),('103444',7),('023040',8)
go
select 'Номер: '+[Number_Plane] as "Данные о самолете" from [dbo].[Plane]
inner join [dbo].[Model] on [ID_Model] = [Model_ID]
go

create table [dbo].[Structure_Of_Airline]
(
	[ID_Structure_Of_Airline] [int] not null identity(1,1),
	[Airline_ID] [int] not null,
	[Plane_ID] [int] not null
	constraint [PK_Strucrure_Of_Airline] primary key clustered
	([ID_Structure_Of_Airline] ASC) on [PRIMARY],
	constraint [FK_Airline_Structure_Of_Airline] foreign key ([Airline_ID])
	references [dbo].[Airline] ([ID_Airline]),
	constraint [FK_Plane_Structure_Of_Airline] foreign key ([Plane_ID])
	references [dbo].[Plane] ([ID_Plane])
)
go
insert into [dbo].[Structure_Of_Airline] ([Airline_ID],[Plane_ID])
values (2,2),(5,3),(4,4),(3,5),(1,6)
go
select 'Название: '+[Name_Airline] as "Данные о Авиакомпании", 'Номер: '+[Number_Plane] as "Данные о самолете" from [dbo].[Structure_Of_Airline]
inner join [dbo].[Airline] on [ID_Airline] = [Airline_ID]
inner join [dbo].[Plane] on [ID_Plane] = [Plane_ID]
go
----------------------------
create table [dbo].[Structure_Of_Flight]
(
	[ID_Structure_Of_Flight] [int] not null identity(1,1),
	[Flight_ID] [int] not null,
	[Gates_ID] [int] not null,
	[Airport_ID] [int] not null
	constraint [PK_Structure_Of_Flight] primary key clustered
	([ID_Structure_Of_Flight] ASC) on [PRIMARY],
	constraint [FK_Flight_Structure_Of_Flight] foreign key ([Flight_ID])
	references [dbo].[Flight] ([ID_Flight]),
	constraint [FK_Gates_Structure_Of_Flight] foreign key ([Gates_ID])
	references [dbo].[Gates] ([ID_Gates]),
	constraint [FK_Airport_Structure_Of_Flight] foreign key ([Airport_ID])
	references [dbo].[Airport] ([ID_Airport])
)
go
insert into [dbo].[Structure_Of_Flight] ([Airport_ID],[Flight_ID],[Gates_ID])
values (2,1,1),(3,2,2),(4,3,3),(5,4,4),(6,5,5)
go
select 'Название: '+[Name_Airport] as "Данные о Аэропорте",
'Номер: '+[Number_Flight]+' Посадка: '+[Landing_Flight] as "Данные о рейсе",
'Номер: '+[Number_Gates] as "Данные о воротах" from [dbo].[Structure_Of_Flight]
inner join [dbo].[Airport] on [ID_Airport] = [Airport_ID]
inner join [dbo].[Flight] on [ID_Flight] = [Flight_ID]
inner join [dbo].[Gates] on [ID_Gates] = [Gates_ID]
go
-----------
create table [dbo].[Structure_Of_Place]
(
	[ID_Structure_Of_Place] [int] not null identity(1,1),
	[Place_ID] [int] not null,
	[Passenger_ID] [int] not null
	constraint [PK_Structure_Of_Place] primary key clustered
	([ID_Structure_Of_Place] ASC) on [PRIMARY],
	constraint [FK_Place_Structure_Of_Place] foreign key ([Place_ID])
	references [dbo].[Place] ([ID_Place]),
	constraint [FK_Passenger_Structure_Of_Place] foreign key ([Passenger_ID])
	references [dbo].[Passenger] ([ID_Passenger])
)
go
insert into [dbo].[Structure_Of_Place] ([Passenger_ID],[Place_ID])
values (1,1),(2,2),(3,3),(4,4),(5,5)
go
select 'Фамилия: '+[First_Name_Passenger]+' Имя: '+[Second_Name_Passenger]+' Отчество: '+
[Middle_Name_Passenger]+' Паспортные данные: '+[Passport_Data]+' Свидетельство о рождении: '+[Birth_Certificate] as "Данные о пассажире",
'Номер: '+[Number_Place] as "Данные о месте" from [dbo].[Structure_Of_Place]
inner join [dbo].[Passenger] on [ID_Passenger] = [Passenger_ID]
inner join [dbo].[Place] on [ID_Place] = [Place_ID]
go

create table [dbo].[Structure_Of_Employee]
(
	[ID_Structure_Of_Employee] [int] not null identity(1,1),
	[Flight_ID] [int] not null,
	[Employee_ID] [int] not null,
	[Current_Position_ID] [int] not null
	constraint [PK_Structure_Of_Employee] primary key clustered
	([ID_Structure_Of_Employee] ASC) on [PRIMARY],
	constraint [FK_Flight_Structure_Of_Employee] foreign key ([Flight_ID])
	references [dbo].[Flight] ([ID_Flight]),
	constraint [FK_Employee_Structure_Of_Employee] foreign key ([Employee_ID])
	references [dbo].[Employee] ([ID_Employee]),
	constraint [FK_Current_Position_Structure_Of_Employee] foreign key ([Current_Position_ID])
	references [dbo].[Current_Position] ([ID_Current_Position])
)
go
insert into [dbo].[Structure_Of_Employee] ([Flight_ID],[Employee_ID],[Current_Position_ID])
values (1,1,1),(2,2,1),(3,3,2),(4,4,1),(5,5,1)
go
select 'Номер: '+[Number_Flight]+' Посадка: '+[Landing_Flight] as "Данные о рейсе",
'Имя: '+[First_Name_Employee]+' Фамилия: '+[Second_Name_Employee]+' Отчество: '+[Middle_Name_Employee]+' Логин: '+[Login_Employee]+' Пароль: '+[Password_Employee] as "Данные о сотруднике",
'Название: '+[Name_Current_Position] as "Данные о занимаемой должности" from [dbo].[Structure_Of_Employee]
inner join [dbo].[Flight] on [ID_Flight] = [Flight_ID]
inner join [dbo].[Employee] on [ID_Employee] = [Employee_ID]
inner join [dbo].[Current_Position] on [ID_Current_Position] = [Current_Position_ID]
go

create table [dbo].[Structure_Of_Plane]
(
	[ID_Structure_Of_Plane] [int] not null identity(1,1),
	[Plane_ID] [int] not null,
	[Class_ID] [int] not null
	constraint [PK_Structure_Of_Plane] primary key clustered
	([ID_Structure_Of_Plane] ASC) on [PRIMARY],
	constraint [FK_Plane_Structure_Of_Plane] foreign key ([Plane_ID])
	references [dbo].[Plane] ([ID_Plane]),
	constraint [FK_Class_Structure_Of_Plane] foreign key ([Class_ID])
	references [dbo].[Class] ([ID_Class])
)
go
insert into [dbo].[Structure_Of_Plane] ([Plane_ID],[Class_ID])
values (2,1),(3,2),(4,2),(5,1),(6,2)
go
select 'Номер: '+[Number_Plane] as "Данные о самолете",
'Название: '+[Name_Class] as "Данные о классе" from [dbo].[Structure_Of_Plane]
inner join [dbo].[Plane] on [ID_Plane] = [Plane_ID]
inner join [dbo].[Class] on [ID_Class] = [dbo].[Structure_Of_Plane].[Class_ID]
go

create table [dbo].[Structure_Of_City]
(
	[ID_Structure_Of_City] [int] not null identity(1,1),
	[City_ID] [int] not null
	constraint [PK_Structure_Of_City] primary key clustered
	([ID_Structure_Of_City] ASC) on [PRIMARY],
	constraint [FK_City_Structure_Of_City] foreign key ([City_ID])
	references [dbo].[City] ([ID_City])
)
go
insert into [dbo].[Structure_Of_City] ([City_ID])
values (1),(2),(3),(4),(5)
go
select 'Название: '+[Name_City] as "Данные о городе" from [dbo].[Structure_Of_City]
inner join [dbo].[City] on [ID_City] = [City_ID]
go















create database [Practice_Database]
go

use [Practice_Database]
go
----------Обычный таблицы
create table [dbo].[Airline]
(
	[ID_Airline] [int] not null identity(1,1),
	[Name_Airline] [varchar] (50) not null
	constraint [PK_Airline] primary key clustered
	([ID_Airline] ASC) on [PRIMARY],
	constraint [UQ_Name_Airline] unique ([Name_Airline])
)
go
insert into [dbo].[Airline] ([Name_Airline])
values ('Победа'), ('S7'), ('Аэрофлот'), ('Азимут'), ('Аврора')
go
select [Name_Airline] as "Название Авиакомпании" from [dbo].[Airline]
go
-------------------------------------------------------------------------
create table [dbo].[Mark]
(
	[ID_Mark] [int] not null identity(1,1),
	[Name_Mark] [varchar] (30) not null
	constraint [PK_Mark] primary key clustered
	([ID_Mark] ASC) on [PRIMARY]
)
go
insert into [dbo].[Mark] ([Name_Mark])
values ('Airbus'), ('Иркут'), ('Boeing'), ('Craic'), ('Fokker')
go

-------------------------------------------------------------------------------
create table [dbo].[Class]
(
	[ID_Class] [int] not null identity(1,1),
	[Name_Class] [varchar](30) not null
	constraint [PK_Class] primary key clustered
	([ID_Class] ASC) on [PRIMARY]
)
go
insert into [dbo].[Class] ([Name_Class])
values ('Эконом'), ('Бизнес')
go
select [Name_Class] as "Название классов" from [dbo].[Class]
go
-------------------------------------------
create table [dbo].[City]
(
	[ID_City] [int] not null identity(1,1),
	[Name_City] [varchar] (30) not null,
	constraint [PK_City] primary key clustered
	([ID_City] ASC) on [PRIMARY],
	constraint [UQ_Name_City] unique ([Name_City])
)
go
insert into [dbo].[City] ([Name_City])
values ('Москва'),('Санкт-Петербург'),('Волгоград'),('Минск'),('Краснодар'),('Париж')
go 
select [Name_City] as "Данные о городе" from [dbo].[City]
go
------------------------------------------------------
create table [dbo].[Model]
(
	[ID_Model] [int] not null identity(1,1),
	[Name_Model] [varchar] (30) not null
	constraint [PK_Model] primary key clustered
	([ID_Model] ASC) on [PRIMARY],
)	
go
insert into [dbo].[Model] ([Name_Model])
values ('A300'),('MC-21'),('777'),('CR929'),('F27')
go
select [Name_Model] as "Данные о Модели" from [dbo].[Model]
go
----------------------------------------------------------------------------------
create table [dbo].[City_View]
(
	[ID_City_View] [int] not null identity(1,1),
	[Name_City_View] [varchar] (20) not null
	constraint [PK_City_View] primary key clustered
	([ID_City_View] ASC) on [PRIMARY],
	constraint [UQ_Name_City_View] unique ([Name_City_View])
)
go
insert into [dbo].[City_View] ([Name_City_View])
values('Отправление'),('Прибытие')
go
select [Name_City_View] as "Вид города" from [dbo].[City_View]
go
-----------------------------------------------------------------------------------
create table [dbo].[Flight_Status]
(
	[ID_Flight_Status] [int] not null identity(1,1),
	[Name_Flight_Status] [varchar] (30) not null
	constraint [PK_Flight_Status] primary key clustered
	([ID_Flight_Status] ASC) on [PRIMARY]
)
go
insert into [dbo].[Flight_Status] ([Name_Flight_Status])
values ('Ожидается прибытие'),('Задержан'),('Идет посадка'),('Идет регистрация')
go
select [Name_Flight_Status] as "Статус рейса" from [dbo].[Flight_Status]
go
--------------------------1КМ---------------------------------------------------------
create table [dbo].[Airport]
(
	[ID_Airport] [int] not null identity(1,1),
	[Name_Airport] [varchar] (50) not null,
	[City_ID] [int] not null
	constraint [PK_Airport] primary key clustered
	([ID_Airport] ASC) on [PRIMARY],
	constraint [UQ_Name_Airport] unique ([Name_Airport]),
	constraint [FK_City_Airport] foreign key ([City_ID])
	references [dbo].[City] ([ID_City])
) 
go
insert into [dbo].[Airport] ([Name_Airport],[City_ID])
values ('Гумрак',3),
('Международный аэропорт Краснодара',5),
('Национальный аэропорт Минска',4),
('Шереметьево',1),
('Аэропорт Руасси',6),
('Пулково',2)
go
select [Name_Airport] as "Название аэропорта" from [dbo].[Airport]
inner join [dbo].[City] on [ID_City] = [City_ID]
go
-------------------------------------------------------------------
create table [dbo].[Terminal]
(
	[ID_Terminal] [int] not null identity(1,1),
	[Name_Terminal] [varchar] (10) not null,
	[Airport_ID] [int] not null
	constraint [PK_Terminal] primary key clustered
	([ID_Terminal] ASC) on [PRIMARY],
	constraint [UQ_Name_Terminal] unique ([Name_Terminal]),
	constraint [FK_Terminal_Airport] foreign key ([Airport_ID])
	references [dbo].[Airport] ([ID_Airport]),
)
go
insert into [dbo].[Terminal] ([Name_Terminal],[Airport_ID])
values ('A',1),('B',2),('C',3),('D',4),('Грузовой',5)
go
select [Name_Terminal] as "Название терминала" from [dbo].[Terminal]
inner join [dbo].[Airport] on [ID_Airport] = [Airport_ID]
go
--------------------------------------------------------------------
create table [dbo].[Gates]
(
	[ID_Gates] [int] not null identity(1,1),
	[Number_Gates] [varchar] (5) not null,
	[Terminal_ID] [int] not null
	constraint [PK_Gates] primary key clustered
	([ID_Gates] ASC) on [PRIMARY]
	constraint [FK_Gates_Terminal] foreign key ([Terminal_ID])
	references [dbo].[Terminal] ([ID_Terminal]),
)
go
insert into [dbo].[Gates] ([Number_Gates],[Terminal_ID])
values ('A1',1),('B15',2),('C3',3),('D12',4),('E17',5)
go
select [Number_Gates] as 'Номер ворот' from [dbo].[Gates]
inner join [dbo].[Terminal] on [ID_Terminal] = [Terminal_ID]
go
--------------------------------------------------------------------
create table [dbo].[Place]
(
	[ID_Place] [int] not null identity(1,1),
	[Number_Place] [varchar] (10) not null,
	[Class_ID] [int] not null
	constraint [PK_Place] primary key clustered
	([ID_Place] ASC) on [PRIMARY],
	constraint [UQ_Number_Place] unique ([Number_Place]),
	constraint [CH_Number_Place_Symbols] check (len([Number_Place])<=4 and len([Number_Place])>=1),
	constraint [FK_Class_Place] foreign key ([Class_ID])
	references [dbo].[Class] ([ID_Class])
)
go
insert into [dbo].[Place] ([Number_Place], [Class_ID])
values ('450',1),('341',2),('25',2),('198',1),('357',2)
go
select 'Номер: '+[Number_Place] as "Данные о месте" from [dbo].[Place]
inner join [dbo].[Class] on [ID_Class] = [Class_ID]
go	
--------------------------------------------------------------------
create table [dbo].[Flight] 
(
	[ID_Flight] [int] not null identity(1,1),
	[Landing_Flight] [varchar] (10) not null,
	[Number_Flight] [varchar] (8) not null,
	[Flight_Status_ID] [int] not null,
	[Plane_ID] [int] not null
	constraint [PK_Flight] primary key clustered
	([ID_Flight] ASC) on [PRIMARY],
	constraint [UQ_Number_Flight] unique ([Number_Flight]),
	constraint [CH_Number_Flight_Numbers] check (len([Number_Flight])<=8 and len([Number_Flight])>=4),
	constraint [CH_Number_Flight_Symbols] check ([Number_Flight] like ('%[-]%')),
	constraint [FK_Flight_Status_Flight] foreign key ([Flight_Status_ID])
	references [dbo].[Flight_Status] ([ID_Flight_Status]),
	constraint [FK_Plane_Flight] foreign key ([Plane_ID])
	references [dbo].[Plane] ([ID_Plane])
)
go
insert into [dbo].[Flight] ([Number_Flight],[Landing_Flight],[Flight_Status_ID],[Plane_ID])
values 
('AZ-4568','Завершена',4,5)
go
select 'Номер: '+[Number_Flight]+' Посадка: '+[Landing_Flight] as "Данные о Рейсе" from [dbo].[Flight] 
inner join [dbo].[Flight_Status] on [ID_Flight_Status] = [Flight_Status_ID]
inner join [dbo].[Plane] on [ID_Plane] = [Plane_ID]
go
--------------------------------------------------------------------
create table [dbo].[Plane]
(
	[ID_Plane] [int] not null identity(1,1),
	[Number_Plane] [varchar] (6) not null,
	[Country_ID] [int] not null,
	[Model_ID] [int] not null,
	[Airline_ID] [int] not null,
	[Mark_ID] [int] not null
	constraint [PK_Plane] primary key clustered
	([ID_Plane] ASC) on [PRIMARY],
	constraint [CH_Number_Plane_Symbols] check (len([Number_Plane])=6),
	constraint [FK_Country_Plane] foreign key ([Country_ID])
	references [dbo].[Country] ([ID_Country]),
	constraint [FK_Model_Plane] foreign key ([Model_ID])
	references [dbo].[Model] ([ID_Model]),
	constraint [FK_Airline_Plane] foreign key ([Airline_ID])
	references [dbo].[Airline] ([ID_Airline]),
	constraint [FK_Mark_Plane] foreign key ([Mark_ID])
	references [dbo].[Mark] ([ID_Mark])
)
go
insert into [dbo].[Plane] ([Number_Plane],[Airline_ID],[Country_ID],[Mark_ID],[Model_ID])
values ('000001',1,1,1,1),('000122',2,1,2,2),('001234',3,3,3,3),('103444',4,1,4,4),('023040',5,2,5,5)
go
select 'Номер: '+[Number_Plane]+' Авиакомпания: '+[Name_Airline]+' Марка: '+[Name_Mark]+' Название: '+[Name_Model]+' Страна: '+[Name_Country] as "Данные о самолете" from [dbo].[Plane]
inner join [dbo].[Airline] on [ID_Airline] = [Airline_ID]
inner join [dbo].[Country] on [ID_Country] = [Country_ID]
inner join [dbo].[Mark] on [ID_Mark] = [Mark_ID]
inner join [dbo].[Model] on [ID_Model] = [Model_ID]
go

create table [dbo].[Structure_Of_Flight]
(
	[ID_Structure_Of_Flight] [int] not null identity(1,1),
	[City_View_ID] [int] not null,
	[Flight_ID] [int] not null,
	[Gates_ID] [int] not null
	constraint [PK_Structure_Of_Flight] primary key clustered
	([ID_Structure_Of_Flight] ASC) on [PRIMARY],
	constraint [FK_City_View_Plane] foreign key ([City_View_ID])
	references [dbo].[City_View] ([ID_City_View]),
	constraint [FK_Flight_Plane] foreign key ([Flight_ID])
	references [dbo].[Flight] ([ID_Flight]),
	constraint [FK_Gates_Plane] foreign key ([Gates_ID])
	references [dbo].[Gates] ([ID_Gates])
)
go
insert into [dbo].[Structure_Of_Flight] ([Flight_ID],[City_View_ID],[Gates_ID])
values (6,1,3),(6,2,1)
go
select 'Название: '+[Name_City_View] as "Данные о городе",
'Номер: '+[Number_Flight]+' Посадка: '+[Landing_Flight] as "Данные о рейсе",
[Name_City]+' (Аэропорт: '+[Name_Airport]+' Терминал: '+[Name_Terminal]+' Ворота: '+[Number_Gates]+')' as 'Город' from [dbo].[Structure_Of_Flight]
inner join [dbo].[Flight] on [ID_Flight] = [Flight_ID]
inner join [dbo].[City_View] on [ID_City_View] = [City_View_ID]
inner join [dbo].[Gates] on [ID_Gates] = [Gates_ID]
inner join [dbo].[Terminal] on [ID_Terminal] = [Terminal_ID]
inner join [dbo].[Airport] on [ID_Airport] = [Airport_ID]
inner join [dbo].[City] on [ID_City] = [City_ID]
go
----------------------------------------------------
create table [dbo].[Structure_Of_Place]
(
	[ID_Structure_Of_Place] [int] not null identity(1,1),
	[Plane_ID] [int] not null,
	[Place_ID] [int] not null,
	constraint [PK_Structure_Of_Place] primary key clustered
	([ID_Structure_Of_Place] ASC) on [PRIMARY],
	constraint [FK_Plane_Structure_Of_Place] foreign key ([Plane_ID])
	references [dbo].[Plane] ([ID_Plane]),
	constraint [FK_Place_Structure_Of_Place] foreign key ([Place_ID])
	references [dbo].[Place] ([ID_Place])
)
go
insert into [dbo].[Structure_Of_Place] ([Plane_ID],[Place_ID])
values (2,1),(3,2),(4,3),(5,4),(6,5)
go
select 'Номер: '+[Number_Place] as "Данные о месте", 'Номер: '+[Number_Plane] as "Данные о самолете" from [dbo].[Structure_Of_Place]
inner join [dbo].[Place] on [ID_Place] = [Place_ID]
inner join [dbo].[Plane] on [ID_Plane] = [Plane_ID]
go

create table [dbo].[Employee]
(
	[ID_Employee] [int] not null identity(1,1),
	[First_Name_Employee] [varchar] (30) not null,
	[Second_Name_Employee] [varchar] (30) not null,
	[Middle_Name_Employee] [varchar] (30) not null default ('-'),
	[Login_Employee] [varchar] (32) not null,
	[Password_Employee] [varchar] (32) not null
	constraint [PK_Employee] primary key clustered
	([ID_Employee] ASC) on [PRIMARY],
	constraint [UQ_Login_Employee] unique ([Login_Employee]),
	constraint [CH_Login_Employee] check (len([Login_Employee])>=3),
	constraint [CH_Password_Employee_Upper] check ([Password_Employee] like ('%[A-Z]%')),
	constraint [CH_Password_Employee_Letter_Lower] check ([Password_Employee] like ('%[a-z]%')),
	constraint [CH_Password_Employee_Symbols] check ([Password_Employee] like ('%[!@#$%^&*()]%'))
)
go
insert into [dbo].[Employee] ([First_Name_Employee],[Second_Name_Employee],[Middle_Name_Employee],[Login_Employee],[Password_Employee])
values ('Матвеев','Матвей','Матвеевич','Matveev','Matveev_Pa$$word'), 
('Павлов','Павел','Павлович','Pavlov','Pavlov_Pa$$word'), 
('Тимофеев','Тимофей','Тимофеевич','Timofeev','Timofeev_Pa$$word'), 
('Сафонов','Илья','Ильич','Safonov','Safonov_Pa$$word'), 
('Сорокин','Дмитрий','Дмитриевич','Sorokin','Sorokin_Pa$$word')
go
select [First_Name_Employee]+' '+[Second_Name_Employee]+' '+[Middle_Name_Employee] as 'ФИО Сотрудника',
[Login_Employee] as 'Логин', [Password_Employee] as 'Пароль' from [dbo].[Employee]
go

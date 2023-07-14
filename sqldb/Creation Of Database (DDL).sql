create schema MedicalService;
use MedicalService;

create table PatientDetails (
	medicalNo numeric(11,1),
    dob date,
    bloodtype char(3) check(bloodtype rlike '^[ABO][+\-]$' or bloodtype rlike '^AB[+\-]$'),
    sex char(1) check(sex = "M" or sex="F"),
    comments varchar(200),
    primary key(medicalNo)    
);

create table Patient (
	patientID int unsigned auto_increment,
    name varchar(40) not null,
    medicalNo numeric(11,1) not null,    
    unique(medicalNo),
    primary key (patientID),
    foreign key (medicalNo) references PatientDetails(medicalNo)
);

create table Suburb (
	postcode numeric(4) check((postcode >= 3000 and postcode < 4000) or postcode >= 8000 and postcode < 9000),
    suburb varchar(20) not null,
    primary key (postcode)
);

create table Clinic (
	clinicID int unsigned,
    streetAdd varchar(40) not null,
    postcode numeric(4) not null,
    managerID int unsigned,
    primary key(clinicID),
    foreign key(postcode) references Suburb(postcode)
    #managerID foreign key is added after employee table is created
    
);

create table Employee(
	employeeID int unsigned auto_increment,
    clinicID int unsigned not null,
    role char(10) not null,
    name varchar(40) not null,
    salary int unsigned,
    startDate date not null,
    primary key(employeeID),
    foreign key(clinicID) references Clinic(clinicID)
);

alter table Clinic add foreign key (managerID) references Employee(employeeID);


create table Appointment(
	appointmentID int unsigned auto_increment,
    employeeID int unsigned not null,
    app_date date not null,
    app_time time not null,
    clinicID int unsigned not null,
    primary key(appointmentID),
    foreign key(employeeID) references Employee(employeeID),
    foreign key(clinicID) references Clinic(clinicID)
);

create table Admission(
	appointmentID int unsigned not null,
    patientID int unsigned not null,
    issue varchar(200) not null,
    primary key(appointmentID, patientID),
    foreign key (appointmentID) references Appointment(appointmentID),
    foreign key (patientID) references Patient(patientID)
);

#thought of later
alter table admission alter issue set default 'General Checkup';

create table Callout(
	calloutID int unsigned auto_increment,
    streetAdd varchar(40) not null,
    postcode numeric(4) not null,
    call_date date not null,
    call_time time not null,
    sender_clinicID int unsigned not null,
    reciever_clinicID int unsigned,
    comment varchar(200),
    primary key(calloutID),
    foreign key(postcode) references Suburb(postcode),
    foreign key(sender_clinicID) references Clinic(clinicID),
    foreign key(reciever_clinicID) references Clinic(clinicID)
);

create table Assignment(
	employeeID int unsigned not null,
    calloutID int unsigned not null,
    primary key(employeeID, calloutID),
    foreign key(employeeID) references Employee(employeeID),
    foreign key(calloutID) references Callout(calloutID)
);

commit;
use medicalService;
#Suburb
insert into Suburb (postcode, suburb)
values(3122, 'Hawthorn');
insert into Suburb (postcode, suburb)
values(8627, 'Camberwell');
insert into Suburb (postcode, suburb)
values(3134, 'Ringwood');
insert into Suburb (postcode, suburb)
values(3136, 'Croydon');
insert into Suburb (postcode, suburb)
values(3162, 'Caufield');
insert into suburb (postcode,suburb)
values(3057, 'Brunswick');

#Clinic addresses followed by employess and then manager adssigned
#Clinic 1
set @cid = 1001;
insert into Clinic(ClinicID ,streetAdd, postcode)
values(@cid, '7 street st', 3122);

insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'doctor', 'Melissa Frandern', 100000, '2019-09-16');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'doctor', 'Danton Kold', 100000, '2019-09-19');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'doctor', 'Elizebeth Draxton', 100000, '2019-011-05');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'admin', 'Gary Vraden', 70000, '2019-11-05');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'admin', 'Natalie Geeb', 70000, '2020-03-24');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'manager', 'Natasha Henry',110000, '2019-08-08');

update clinic set managerID = last_insert_id() where clinicID = @cid;

#clinic 2
set @cid = 1002;
insert into Clinic(ClinicID, streetAdd, postcode)
values(@cid, '154 road rd', 3122);

insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'doctor', 'Frank Torsten', 100000, '2021-02-18');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'admin', 'Rachael Hart', 70000, '2021-02-18');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'manager', 'Henry Ocksoen',110000, '2021-02-18');

update clinic set managerID = last_insert_id() where clinicID = @cid;

#clinic 3
set @cid = 2001;
insert into Clinic(ClinicID,streetAdd, postcode)
values(@cid, '17 high hwy', 3134);

insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'doctor', 'Derek Mandel', 100000, '2020-04-01');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'doctor', 'Renton Smith', 100000, '2020-04-11');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'doctor', 'Anna Bartel', 100000, '2021-03-24');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'admin', 'Sally Goordin', 70000, '2020-04-05');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'admin', 'Kyle Manison', 70000, '2021-03-24');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'manager', 'Monique Frivel',110000, '2020-04-01');

update clinic set managerID = last_insert_id() where clinicID = @cid;


#clinic 4
set @cid = 3001;
insert into Clinic(ClinicID, streetAdd, postcode)
values(@cid,'67 avenue ave', 8627);

insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'doctor', 'James Bolden', 100000, '2020-08-02');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'doctor', 'Karen Yert', 100000, '2020-011-05');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'admin', 'Indi Samson', 70000, '2020-08-02');
insert into Employee(clinicID, role, name, salary, startDate)
values(@cid, 'manager', 'John Kart',110000, '2020-08-02');

update clinic set managerID = last_insert_id() where clinicID = @cid;
commit;

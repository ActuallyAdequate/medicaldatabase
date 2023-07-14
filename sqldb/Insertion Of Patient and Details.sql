use medicalService;
#patientdetail, patient inserts
set @mn = 1023786932.2;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '2002-05-31', 'AB+', "M", null);
insert into patient(name, medicalno)
values("James Leroy", @mn);

set @mn = 4022346932.2;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '1988-06-08', 'O-', "F", null);
insert into patient(name, medicalno)
values("Franklyn Hubeer", @mn);

set @mn = 8746389278.1;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '2006-09-03', 'O-', "M", 'Allergy to penicillin');
insert into patient(name, medicalno)
values("Byron McEnen", @mn);

set @mn = 1439867028.3;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '2001-11-12', null, "F",'Diabetic type 1');
insert into patient(name, medicalno)
values("Holly Smirn", @mn);

set @mn = 1023786932.1;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '1978-10-07', 'A+', "F", 'Previous Allergic reaction to tetanus shot');
insert into patient(name, medicalno)
values("Marilyn Leroy", @mn);

set @mn = 1023986791.3;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '1998-04-22', null, "M", null);
insert into patient(name, medicalno)
values("Jack Jackson", @mn);

set @mn = 4523986791.1;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '1999-04-23', 'AB+', "F", null);
insert into patient(name, medicalno)
values("Jacinda Terna", @mn);

set @mn = 7836487592.2;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '2010-10-07', null, "F", 'Severe Asthma');
insert into patient(name, medicalno)
values("Lucy Frankton", @mn);

set @mn = 4523456791.3;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '2015-12-08', 'O-', "M", null);
insert into patient(name, medicalno)
values("Ben Sterop", @mn);

set @mn = 1234876523.1;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '2000-06-12', 'B-', "F", "Diagnosed with crones, requires pacemaker");
insert into patient(name, medicalno)
values("Mary Mudle", @mn);

set @mn = 4456786791.2;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '1999-08-09', 'A-', "F", null);
insert into patient(name, medicalno)
values("Alice Burkswood", @mn);

set @mn = 4523986791.2;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '2020-05-10', null, "M", 'Allergy to penicillin');
insert into patient(name, medicalno)
values("Mark Terna", @mn);

set @mn = 3678903465.2;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '2003-04-14', null, "F", 'Severe reaction to Meningococcal vaccine');
insert into patient(name, medicalno)
values("Sara Holop", @mn);


set @mn = 0857364923.4;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '1957-04-14', null, "F", null);
insert into patient(name, medicalno)
values("Karsten Marok", @mn);


set @mn = 3673356765.2;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '1996-03-13', 'A+', "M", null);
insert into patient(name, medicalno)
values("Geoffery Stain", @mn);


set @mn = 3678563465.2;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '1988-09-25', null, "M", 'Common Heart Fibrillation');
insert into patient(name, medicalno)
values("Kunen Marin", @mn);

set @mn = 8746792367.1;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '1993-09-21','B+', "F", null);
insert into patient(name, medicalno)
values("Pheobie Larston", @mn);

set @mn = 3875493465.1;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '2004-01-04','AB-', "M", null);
insert into patient(name, medicalno)
values("Addison Jimlet", @mn);

set @mn = 6458737665.2;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '2000-01-06', null, "F", 'requires pacemaker');
insert into patient(name, medicalno)
values("Ynett Gereld", @mn);

set @mn = 3467534126.3;
insert into patientdetails(medicalno, dob, bloodtype, sex, comments )
values(@mn, '2000-02-13', null, "M", null);
insert into patient(name, medicalno)
values("Nicolas Gart", @mn);


commit;

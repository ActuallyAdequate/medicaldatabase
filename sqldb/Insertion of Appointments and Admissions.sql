use medicalservice;
 #appointments
insert into Appointment(employeeID, app_date, app_time, clinicID)
values(23, '2020-09-02', '09:30:00', 3001); 
insert into admission(appointmentID, patientID, issue)
values(last_insert_id(), 1, 'General Checkup');


insert into Appointment(employeeID, app_date, app_time, clinicID)
values(24, '2020-11-24', '16:00:00', 3001); 
insert into admission(appointmentID, patientID, issue)
values(last_insert_id(), 5, 'General Checkup');

insert into Appointment(employeeID, app_date, app_time, clinicID)
values(14, '2021-04-19', '14:15:00', 1002);
set @aid = last_insert_id();
insert into admission(appointmentID, patientID, issue)
values(@aid, 18, 'Sonogram');
insert into admission(appointmentID, patientID, issue)
values(@aid, 19, 'General Checkup');

insert into Appointment(employeeID, app_date, app_time, clinicID)
values(8,'2019-12-08', '10:45:00', 1001);
insert into admission(appointmentID, patientID, issue)
values(last_insert_id(), 13, 'Fitness Assessment');
 

insert into Appointment(employeeID, app_date, app_time, clinicID)
values(23, '2021-11-09', '10:30:00', 3001);
insert into admission(appointmentID, patientID, issue)
values(last_insert_id(),11, 'vaccination');

insert into Appointment(employeeID, app_date, app_time, clinicID)
values(10, '2021-10-05', '13:15:00', 1001);
set @aid = last_insert_id();
insert into admission(appointmentID, patientID, issue)
values(@aid, 1, 'Heart Issues');
insert into admission(appointmentID, patientID, issue)
values(@aid, 6, 'Broken Arm');


insert into Appointment(employeeID, app_date, app_time, clinicID)
values(18, '2021-05-18', '12:30:00', 2001);
insert into admission(appointmentID, patientID, issue)
values(last_insert_id(),19, 'General Checkup');

commit;
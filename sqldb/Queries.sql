use medicalservice;

#A Patient wants to request their medical data
#this could be common so worth making a view that joins medical history with patient info
create view PatientData as 
select name, medicalno, dob,bloodtype, sex, comments
from patient natural join patientdetails;
#then a patient can use their medical no which they know to get their data
set @mno = 1023786932.2;
select *
from PatientData
where medicalno = @mno;

#Service needs to know what clinic has served most appointments and callouts to plan for expansion of ammenties
#This could be used often so should make a view as requires a lot of joins
create view ClinicWorkLoad as
select *, Appointments + CalloutsSent + CalloutsRecieved as total
from (select clinicID, count(appointmentID) as Appointments from clinic natural join appointment group by clinicID) as a 
natural join (select clinicID, count(calloutID) as CalloutsSent from clinic left join callout on clinic.clinicID = callout.sender_clinicID group by clinicID) as cs
natural join (select clinicID, count(calloutID) as CalloutsRecieved from clinic left join callout on clinic.clinicID = callout.reciever_clinicID group by clinicID) as cr
order by (total) desc;

#What suburbs have had callouts but are lacking a clinic to consider where new branches should be built
select postcode, suburb, Count(calloutID) as Callouts
from suburb natural join callout
where not exists (select clinicID from clinic where suburb.postcode = clinic.postcode)
group by postcode
order by (Callouts) desc;

#How many admissions from each patient have occured to determine billing information
select patientID, name, count(*) as Admissions
from patient natural join admission
group by patientID
order by (Admissions) asc;

#How much work has each doctor done? To manage assignments to appointments and callouts
#this may be used a lot so a view could help for efficeincy
create view EmployeeWork as
select employeeID, name, eAppoint.AppCount + eAssign.AssCount as WorkLoad
from employee natural join
(select employeeID, Count(appointment.employeeID) as AppCount from employee natural left join appointment group by employee.employeeId) as eAppoint
natural join
(select employeeID, Count(assignment.employeeID) as AssCount from employee natural left join assignment group by employee.employeeID) as eAssign
where role = 'doctor'
order by WorkLoad asc;

#How much work as a doctor done at a particular clinic?
set @clinic = 1001;
select employeeID, name, WorkLoad
from EmployeeWork natural join employee join Clinic on Clinic.clinicID = Employee.clinicID
where Clinic.clinicID = @clinic;

#How many employees work at a particular clinic compared to the amount of appoiuntments and callouts each get to plan for employment strategies
#Can use the previously made view for this
select clinicID, Count(EmployeeID) as Employees, total as WorkLoad
from ClinicWorkLoad natural join clinic natural join employee
group by clinicID;

#common insert and query transaction for a patient making an appointment
set @medicalno = 1048724870.3;
set @name = 'Mary Hammond';
set @appointmentDate = '2021-08-13';
set @appointmentTime = '18:30:00';
set @clinic = 1002; #this would be selected from a drop down of options with the location attached

insert ignore into patientdetails(medicalno)
values(@medicalno);
insert ignore into patient(name, medicalNo)
values(@name, @medicalno);

set @patientID = (select patientID from patient where medicalno = @medicalno limit 1);
set @employeeID = (select employeeID
from EmployeeWork natural join employee join Clinic on Clinic.clinicID = Employee.clinicID
where Clinic.clinicID = @clinic
limit 1);

insert into Appointment(employeeID, app_date, app_time, clinicID)
values(@employeeID, @appointmentDate,@appointmentTime,@clinic);
insert into admission(patientID, appointmentID)
values(@patientID, last_insert_id());


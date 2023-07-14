use medicalservice;

insert into callout(streetAdd, postcode, call_date, call_time, sender_clinicID, reciever_clinicID, comment)
values('1 varizon cres', 3136, '2020-09-05', '04:34:08', 2001, null, 'Suspected heart attck due to chest pains, resolved on site.');
set @cid = last_insert_id();
insert into assignment(employeeID, calloutID)
values(18, @cid);
insert into assignment(employeeID, calloutID)
values(17, @cid);

insert into callout(streetAdd, postcode, call_date, call_time, sender_clinicID, reciever_clinicID, comment)
values('78 main street', 3162, '2021-08-05', '09:36:45', 3001, 3001, null);
set @cid = last_insert_id();
insert into assignment(employeeID, calloutID)
values(23, @cid);

insert into callout(streetAdd, postcode, call_date, call_time, sender_clinicID, reciever_clinicID, comment)
values('21 brice ave', 3122, '2021-02-28', '18:45:56', 1001, 1002, 'Severe car crash required clinic for burns');
set @cid = last_insert_id();
insert into assignment(employeeID, calloutID)
values(8, @cid);
insert into assignment(employeeID, calloutID)
values(9, @cid);
insert into assignment(employeeID, calloutID)
values(11, @cid);

commit;
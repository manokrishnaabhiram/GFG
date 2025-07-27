create database eapcet;
use eapcet;

desc eapcet.ap_eapcet;
describe eapcet.ap_eapcet;
select * from ap_eapcet;
select count(*) from ap_eapcet;

SELECT DISTINCT `District Name` FROM AP_EAPCET;

SELECT distinct institute_name,Place,district_name FROM AP_EAPCET WHERE District_Name IN ('SKL','EG','VZM','VSP','WG','KRI','GNT')
order by district_name,place;
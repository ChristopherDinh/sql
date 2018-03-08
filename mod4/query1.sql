select * from id
order by state;

select * from id
where state = 'ca';

select concat('$', format(sum(sales),2)) as 'Total Sales' from id
where state = 'ca';

select state, concat('$', format(sum(sales),2)) as 'Sales' from id
group by state;



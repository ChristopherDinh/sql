select DivisionNumber, date from 
storesales a, store b, division c
where c.DivisionNumber = 111
and a.sales
;

select DivisionNumber, date, sum(a.sales) from 
storesales a, store b, division c
group by c.DivisionNumber;

select DivisionNumber, sum(storesales.sales) as 'Store Sales'
from division, store, storesales
where DivisionNumber = '001'
and division.id = store.DivisionID
and storesales.storeid = store.id;


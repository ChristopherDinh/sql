-- Using an alias
select ordernumber, CustomerName, orderdate, invoiceid, productid,	quanity
from invoice a, lineitem b
where a.id = 1;


select * from invoice
inner join
lineitem on invoice.id = lineitem.InvoiceId;

-- Using 3 Tables
select ordernumber, CustomerName, orderdate, invoiceid, sum(b.quanity*c.ListPrice) as 'Invoice Total'
from invoice a, lineitem b, product c
where a.id = 1
and a.id = b.InvoiceId
and b.ProductId = c.ID
group by a.id;


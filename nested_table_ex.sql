create type nest_col as object
(branch_id number(3),
 tot_sales number(10,2))
/
create type nested_table
as table of nest_col
/
create or replace function assign_val return nested_table as
 v_ret nested_table := nested_table(); -- initalization is needed

begin 
 v_ret.extend; -- need to extend each time
 v_ret(1) := nest_col(101,10000);
 v_ret.extend;
 v_ret(v_ret.last) := nest_col(201,20000);

 return v_ret;

end assign_val;
/
select * from table(assign_val)
create type varr_col is varray(2) of number(10);
/
create type varr_table as table of varr_col
/
create or replace function assign_val_varr return varr_table as
 v_ret varr_table := varr_table(); -- initalization is needed

begin 
 v_ret.extend; -- need to extend each time
 v_ret(1) := varr_col(101,10000);
 v_ret.extend;
 v_ret(v_ret.last) := varr_col(201,20000);

 return v_ret;

end assign_val_varr;
/
select * from table(assign_val_varr)

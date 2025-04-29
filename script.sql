/*CRIAÇÃO DOS USUÁRIOS*/
CREATE USER User_A WITH PASSWORD = 'PTB_A123';
CREATE USER User_B WITH PASSWORD = 'PTB_B123';
CREATE USER User_C WITH PASSWORD = 'PTB_C123';
CREATE USER User_D WITH PASSWORD = 'PTB_D123';
CREATE USER User_E WITH PASSWORD = 'PTB_E123';

/*PERMISSÕES PARA O USER A*/
GRANT SELECT ON advisor TO User_A WITH GRANT OPTION;
GRANT SELECT ON course TO User_A WITH GRANT OPTION;
GRANT SELECT ON department TO User_A WITH GRANT OPTION;
GRANT SELECT ON instructor TO User_A WITH GRANT OPTION;
GRANT SELECT ON prereq TO User_A WITH GRANT OPTION;
GRANT SELECT ON section TO User_A WITH GRANT OPTION;
GRANT SELECT ON student TO User_A WITH GRANT OPTION;
GRANT SELECT ON takes TO User_A WITH GRANT OPTION;
GRANT SELECT ON teaches TO User_A WITH GRANT OPTION;
GRANT SELECT ON time_slot TO User_A WITH GRANT OPTION;

GRANT UPDATE ON advisor TO User_A WITH GRANT OPTION;
GRANT UPDATE ON course TO User_A WITH GRANT OPTION;
GRANT UPDATE ON department TO User_A WITH GRANT OPTION;
GRANT UPDATE ON instructor TO User_A WITH GRANT OPTION;
GRANT UPDATE ON prereq TO User_A WITH GRANT OPTION;
GRANT UPDATE ON section TO User_A WITH GRANT OPTION;
GRANT UPDATE ON student TO User_A WITH GRANT OPTION;
GRANT UPDATE ON takes TO User_A WITH GRANT OPTION;
GRANT UPDATE ON teaches TO User_A WITH GRANT OPTION;
GRANT UPDATE ON time_slot TO User_A WITH GRANT OPTION;

/*LISTAR TODOS OS USUÁRIOS*/
SELECT * FROM sysusers WHERE name IN ('User_A', 'User_B', 'User_C', 'User_D', 'User_E');

/*LISTAGEM DAS PERMISSÕES DO USER A*/
select  princ.name
,       princ.type_desc
,       perm.permission_name
,       perm.state_desc
,       perm.class_desc
,       object_name(perm.major_id)
from    sys.database_principals princ
left join
        sys.database_permissions perm
on      perm.grantee_principal_id = princ.principal_id
where princ.type_desc = 'SQL_USER' AND name = 'User_A' 
order by princ.name;

/*SIMULAÇÃO DE LOGIN COM O USER A PARA VALIDAÇÃO DO SCRIPT*/
EXECUTE AS USER = 'User_A';
SELECT TOP 5 * FROM student;
GRANT SELECT ON advisor TO User_B;
REVERT;

/*LISTAGEM DAS PERMISSÕES DO USER B PARA VALIDAÇÃO DO SCRIPT*/
select  princ.name
,       princ.type_desc
,       perm.permission_name
,       perm.state_desc
,       perm.class_desc
,       object_name(perm.major_id)
from    sys.database_principals princ
left join
        sys.database_permissions perm
on      perm.grantee_principal_id = princ.principal_id
where princ.type_desc = 'SQL_USER' AND name = 'User_B' 
order by princ.name;

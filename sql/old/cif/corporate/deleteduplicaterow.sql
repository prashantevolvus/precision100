delete from CROPMISC_O_TABLE
where rowid not in (select min(rowid) from CROPMISC_O_TABLE group by cif_id,str1)
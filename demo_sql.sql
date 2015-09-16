CREATE TABLE uw_DemoSql_color(uw_id int8 NOT NULL, uw_nam text NOT NULL,
 PRIMARY KEY (uw_id)
  
 );
 
 CREATE TABLE uw_DemoSql_thing(uw_id int8 NOT NULL, uw_nam text NOT NULL, 
                                uw_color int8 NOT NULL,
  CONSTRAINT uw_DemoSql_thing_Thing_isof_Color
   FOREIGN KEY (uw_color) REFERENCES uw_DemoSql_color (uw_id)
  );
  
  
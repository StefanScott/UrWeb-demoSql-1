table color : { Id: int, Nam : string }
  PRIMARY KEY Id

table thing : {Id: int, Nam: string, Color: int}
  CONSTRAINT Thing_isof_Color FOREIGN KEY Color REFERENCES color(Id)

fun list () =
    rows <- queryX (SELECT thing.Id, thing.Nam, color.Nam
                    FROM thing, color
                    WHERE thing.Color = color.Id )
            (fn row => <xml><tr>
              <td>{[row.Thing.Id]}</td>
              <td>{[row.Thing.Nam]}</td> 
              <td>{[row.Color.Nam]}</td> 
              <td><form><submit action={delete row.Thing.Id} value="Delete"/></form></td>
            </tr></xml>);
    return <xml>
      <table border=1>
        <tr> <th>Id</th> <th>Name</th> <th>Color Name</th> </tr>
        {rows}
      </table>

      <br/><hr/><br/>

      <form>
        <table>
          <tr> <th>Id:</th> <td><textbox{#Id}/></td> </tr>
          <tr> <th>Nam:</th> <td><textbox{#Nam}/></td> </tr>
          <tr> <th>Color Id:</th> <td><textbox{#Color}/></td> </tr>
          <tr> <th/> <td><submit action={add} value="Add Thing"/></td> </tr>
        </table>
      </form>
    </xml>

and add r =
    dml (INSERT INTO thing (Id,Nam,Color)
         VALUES ({[readError r.Id]}, {[r.Nam]}, {[readError r.Color]}));
    xml <- list ();
    return <xml><body>
      <p>Thing added.</p>

      {xml}
    </body></xml>

and delete id () =
    dml (DELETE FROM thing
         WHERE Id = {[id]});
    xml <- list ();
    return <xml><body>
      <p>Thing deleted.</p>

      {xml}
    </body></xml>

fun main () =
    xml <- list ();
    return <xml><body>
      {xml}
    </body></xml>

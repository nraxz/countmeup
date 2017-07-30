
class candidate {
  var candidate_id: Int = 0
  var candidate_name: String = ""
  var message: String = ""  
  
  val con = new MySqlConnectManager
  val getconnected = con.connection
  val statement = getconnected.createStatement()
  
    def addnew(candidate_name: String) = {    
       
        
         val insertrec = statement.executeUpdate("INSERT INTO tbl_candidate (candidate_name) VALUES ('" + candidate_name + "')")
         val message = "New Candidate has been added successfully"
        
      
         } 
     
}
  
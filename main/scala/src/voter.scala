

class voter {
   var voter_id: Int = 0
   var voter_name: String = ""
   var message: String = ""  
  var totalvotes = 0;
  var maxvotes = 0
  var max = 0
  var winner = 0
  val con = new MySqlConnectManager
  val getconnected = con.connection
  val statement = getconnected.createStatement()
  
    def addnew(voter_name: String) = {          
        
         val insertrec = statement.executeUpdate("INSERT INTO tbl_voter (candidate_name) VALUES ('" + voter_name + "')")
         val message = "New voter has been added successfully"       
      
         } 
  
   def votes(voter: Int, candidate: Int){
         val resultSet = statement.executeQuery("SELECT maxcount FROM maxcount WHERE voter =" + voter )
         resultSet.next()
         val recNum = resultSet.getInt(1)
        if (recNum < 3){  
          
              val query = "INSERT INTO tbl_ballot (voter_id, candidate_id) VALUES(" + voter +", "+ candidate +")"
              val insertrec = statement.executeUpdate(query)
               val message = "Voted successfully"
          println(message)
        }
        else{
          val message = "Vote Max out"
          println(message)
        }
    
     }
    def getSum() {
              val resultSet = statement.executeQuery("SELECT SUM(maxcount) as sum FROM maxcount" )
              resultSet.next()
              totalvotes = resultSet.getInt("sum")
       
     }
     
    def getMax(){
              val resultSet = statement.executeQuery("SELECT Max(votes) as max FROM countmeup" )
              resultSet.next()
              max = resultSet.getInt("max")
       
     }
    
    
    def getWinner(){
              val resultSet = statement.executeQuery("SELECT candidate, Max(votes) FROM countmeup Group By candidate" )
              resultSet.next()
               winner = resultSet.getInt("candidate")
       
     }
     
     
   
   
   
}
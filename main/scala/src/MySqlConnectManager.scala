import java.sql.DriverManager
import java.sql.Connection

class MySqlConnectManager {
   val driver = "com.mysql.jdbc.Driver"
    val url = "jdbc:mysql://localhost:3306/countmeup"
    val username = "root"
    val password = ""

   
    var connection:Connection = null

    try {
    
      Class.forName(driver)
      connection = DriverManager.getConnection(url, username, password)

      
    } catch {
      case e => e.printStackTrace
    }
   
}
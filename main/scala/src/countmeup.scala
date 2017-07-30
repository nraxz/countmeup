

class countmeup {
  def main(args: Array[String]) {
        var voter = new voter
        voter. getSum()
        val sum = voter.totalvotes
        voter.getMax()
        val max = voter.max
        voter.getWinner()
        val winner = voter.winner
        
        println("Winner  is Candidate" + winner + " has "+ (max*100)/sum + "% of total votes")
        println("Winner has recieved " + max + " out of total " + sum + " votes.")
        
      }
}
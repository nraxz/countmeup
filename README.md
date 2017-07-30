# countmeup

/* Adding Candidate */
//instanciate object of the class candidate

scala> val candidate = new candidate
candidate: candidate = candidate@27808f31

//Adding new candidate
scala> candidate addnew "Harry"

//instanciate object of the class voter

scala> val newvoter = new voter

//Adding new voter
scala> newvoter addnew "James"

//voter votes
//votes(voter_id: Int, candidate_id: Int)
//Assuming ID of the voter & Candidate must be known

scala> newvoter votes(5, 2)

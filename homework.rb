MVP Questions
In our Property Tracker application:

Q1. Where are we instantiating instances of the Property class?
the console

Q2. Where are we defining the SQL that enables us to save the ruby Property object into the database?
property.rb in the models directory
def save...
  sql = ...

Q3. In console.rb, which lines modify the database?
13 property1.save()
22 property2.save()
31 property3.save()
33 property1.delete()

Q4. Why do we not define the id of a Property object at the point we instantiate it (‘new it up’)?
  we want to get it from the database table to 'sync' it to ruby

Q5. Where and how do we assign the property id (that is generated by the database) to the ruby object?
   @id = db.exec_prepared("save", values)[0]["id"]
   in models/property.rb
   db.exec_prepared("save", values) gives the return value of the SQL code.
   "RETURNING id" returns the id hash {'id': 5}
   [0]["id"] accesses that hashes' id value

Q6. Why do we put a guard (an ‘if’ clause) on the @id attribute in the constructor?
  it only assigns the @id attribute when an id key exist. which is only after the object is inserted, then retrieved from the database

Q7. Why are some of the CRUD actions represented by instance methods, and others, class methods?
  instance methods are called on instanciated objects. this is when you need to access instanced variables. CREATE/UPDATE/DELETE
  class methods are called on the class. this is when you need to READ/find/(DELETE_ALL) entrees from the database

Q8. What type of data structure is returned by db.exec() and db.exec_prepared(), and how do we index into it to pull out a desired attribute?
  exec + exec_prepared seems to give the return value of the SQL code. for the find methods, this returns an array of hashes
  unsure of data structure if no return value is specified
  #<PG::Result:0x007f8b171b5860 status=PGRES_COMMAND_OK ntuples=0 nfields=0 cmd_tuples=0> ---- this is what pry gives for db.exec_prepared("delete", values)
  is that a gem?

Q9. Why do we use prepared statements when performing database operations?
  to protect against SQL injections/attacks. we can seperate out the user inputs and sanitize.

Extension Questions
Look at the find_by_id and find_by_address methods in the Property class.

Q10. What do they take in as their arguments?
  a string

Q11. What are their return values?
  an instantiated property object with the corresponding serial id assigned to @id

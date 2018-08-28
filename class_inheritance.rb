class Employee
  attr_reader :salary
    
  def initialize(name, title, salary)
    @name = name 
    @title = title
    @salary = salary
  end
    
  def bonus(multiply)
    @salary * multiply
  end 
  
  def add_boss(boss)
    @boss = boss
  end 
  
end 

class Manager < Employee
  attr_reader :subordinates
  
  def initialize(name, title, salary)
    super
    @subordinates = []
  end
  
  def bonus(multiply)
    bonus = 0
    @subordinates.each {|x| bonus += x.salary} 
    bonus * multiply
  end 
  
  def add_sub(sub)
    @subordinates << sub unless @subordinates.include?(sub)
    sub.add_boss(self)
  end
   
end

ned=Manager.new("Ned","Founder",1000000)
dar=Manager.new("Darren","TA Manager",78000)



shaw=Employee.new("Shawna","TA",12000)
dav=Employee.new("David","TA",10000)
dar.add_sub(shaw)
dar.add_sub(dav)
ned.add_sub(dar)
ned.add_sub(dav)
ned.add_sub(shaw)
p ned.bonus(5)
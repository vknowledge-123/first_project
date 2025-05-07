/* Case Statement : Syntax
	case variable
    When [ condition ] Then result
    When [ condition ] Then result ....]
    [ Else result ]
End
*/
set @day=8;
select case @day
When 1 Then 'Monday'
When 2 Then 'Tuesday'
When 3 Then 'Wednesday'
When 4 Then 'Thursday'
When 5 Then 'Friday'
When 6 Then 'Saturday'
Else 'Invalid Day' End as Day;

use sql830;
show tables;
select * from student;

INSERT INTO student VALUES
(101, 'John Doe', 'DA', 85),
(102, 'Emma Smith', 'DS', 90),
(103, 'Liam Johnson', 'FSD', 78),
(104, 'Olivia Brown', 'DA', 92),
(105, 'Noah Williams', 'DS', 88),
(106, 'Sophia Miller', 'FSD', 95),
(106, 'Sophia Miller', 'IT', 95);

select rollno, name,
CASE class
 When "DS" Then "Data Science"
 When "DA" Then "Data Analyst"
 When "FSD" Then "Full Stack Developer "
 Else "Pyhton developer"
 End as course from student;
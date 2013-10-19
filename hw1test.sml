(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "hw1.sml";

val test1 = is_older((1,2,3),(2,3,4)) = true
val test1b = is_older((2,3,4),(1,2,3)) = false
val test1c = is_older((1999,12,31),(2000,1,1)) = true

val test2 = number_in_month([(2012,2,28),(2013,12,1)],2) = 1
val test2b = number_in_month([(2012,2,28),(2013,12,1),(1,2,3),(3241,12,31)],2) = 2
val test2c = number_in_month([(1,1,1),(1,1,1),(3,2,1),(4,4,4)],5) = 0
val test2d = number_in_month([(1,2,3)],0) = 0
val test2e = number_in_month([],2) = 0

val test3 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3b = number_in_months([(2012,2,28),(2013,12,1),(1,1,1),(42151542,3,30)],[2,3,4]) = 2
val test3c = number_in_months([],[]) = 0
val test3d = number_in_months([(1,2,3)],[]) = 0
val test3e = number_in_months([],[1]) = 0

val test4 = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4b = dates_in_month([(2012,3,30),(1,3,30)],3) = [(2012,3,30),(1,3,30)]
val test4c = dates_in_month([(2012,3,30),(2013,12,1)],2) = []
val test4d = dates_in_month([],3) = []

val test5 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test5b = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[5,6,7]) = []
val test5c = dates_in_months([],[1,3,4]) = []
val test5d = dates_in_months([(2012,2,28)],[]) = []

val test6 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there"
val test6b = get_nth(["hi", "there", "how", "are", "you"], 0) = "hi"
val test6c = get_nth(["hi", "there", "how", "are", "you"], 5) = "you"

val test7 = date_to_string((2013, 6, 1)) = "June 1, 2013"
val test7b = date_to_string((3, 1, 2)) = "January 2, 3"
val test7c = date_to_string((3, 2, 2)) = "February 2, 3"
val test7d = date_to_string((3, 3, 2)) = "March 2, 3"
val test7e = date_to_string((3, 4, 2)) = "April 2, 3"
val test7f = date_to_string((3, 5, 2)) = "May 2, 3"
val test7g = date_to_string((3, 7, 2)) = "July 2, 3"
val test7h = date_to_string((3, 8, 2)) = "August 2, 3"
val test7i = date_to_string((3, 9, 2)) = "September 2, 3"
val test7j = date_to_string((3, 10, 2)) = "October 2, 3"
val test7k = date_to_string((3, 11, 2)) = "November 2, 3"
val test7l = date_to_string((3, 12, 2)) = "December 2, 3"

val test8 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3
val test8b = number_before_reaching_sum(1, [20,4,2]) = 0

val test9 = what_month(70) = 3
val test9b = what_month(31) = 1
val test9c = what_month(32) = 2
val test9d = what_month(59) = 2
val test9e = what_month(60) = 3
val test9f = what_month(90) = 3
val test9g = what_month(91) = 4
val test9h = what_month(120) = 4
val test9i = what_month(121) = 5
val test9j = what_month(151) = 5
val test9k = what_month(152) = 6
val test9l = what_month(181) = 6
val test9m = what_month(182) = 7
val test9n = what_month(212) = 7
val test9o = what_month(213) = 8
val test9p = what_month(243) = 8
val test9q = what_month(244) = 9
val test9r = what_month(273) = 9
val test9s = what_month(274) = 10
val test9t = what_month(304) = 10
val test9u = what_month(305) = 11
val test9v = what_month(334) = 11
val test9w = what_month(335) = 12
val test9x = what_month(356) = 12

val test10 = month_range(31, 34) = [1,2,2,2]
val test10b = month_range(31, 31) = [1]
val test10c = month_range(364,365) = [12,12]

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test11b = oldest([(1,1,1),(1,1,2)]) = SOME (1,1,1)
val test11c = oldest([(1,1,1),(1,1,1)]) = SOME (1,1,1)
val test11d = oldest([(1,1,1),(1,2,1)]) = SOME (1,1,1)
val test11e = oldest([(1,2,1),(1,1,1)]) = SOME (1,1,1)
val test11f = oldest([(1,1,2),(1,1,1)]) = SOME (1,1,1)
val test11g = oldest([(1,1,1),(32421,2,1)]) = SOME (1,1,1)
val test11h = oldest([]) = NONE

val test12 = number_in_months_challenge([(2012,2,28),(2013,12,1),(1,1,1),(42151542,3,30)],[2,3,3,3,4]) = 2
val test12b = number_in_months_challenge([(2012,2,28),(2013,12,1),(1,1,1),(42151542,3,30)],[2,3,4]) = 2
val test12c = number_in_months_challenge([],[]) = 0
val test12d = number_in_months_challenge([(1,2,3)],[]) = 0
val test12e = number_in_months_challenge([],[1]) = 0

val test13 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test13b = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[5,6,7]) = []
val test13c = dates_in_months_challenge([],[1,3,4]) = []
val test13d = dates_in_months_challenge([(2012,2,28)],[]) = []
val test13e = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2,3,3,3,4,4,4,5,5,5,6]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val test14 = reasonable_date(2014,10,12) = true
val test14b = reasonable_date(2014,2,29) = false
val test14c = reasonable_date(1600,2,29) = true
val test14d = reasonable_date(1700,2,29) = false
val test14e = reasonable_date(1800,2,29) = false
val test14f = reasonable_date(1900,2,29) = false
val test14g = reasonable_date(1,1,1) = true
val test14h = reasonable_date(37284123,12,31) = true

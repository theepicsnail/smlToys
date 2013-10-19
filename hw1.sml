fun is_older((y1:int, m1:int, d1:int), (y2:int, m2:int, d2:int)):bool =
  if y1 < y2 then true
  else if y1 > y2 then false
  else if m1 < m2 then true
  else if m1 > m2 then false
  else if d1 < d2 then true
  else false

fun number_in_month([], targetMonth:int) = 0
|   number_in_month((year:int, month:int, day:int)::rest, targetMonth:int) =
    if targetMonth = month
    then 1 + number_in_month(rest, targetMonth)
    else 0 + number_in_month(rest, targetMonth)

fun number_in_months(x, []) = 0
|   number_in_months([], x) = 0
|   number_in_months(dates, curMonth::months):int =
    number_in_month(dates, curMonth) + number_in_months(dates, months)


fun dates_in_month([], x) = []
|   dates_in_month((year:int, month:int, day:int)::otherDates, targetMonth)(*:(int,int,int) list*) =
    if targetMonth = month
    then [(year, month, day)] @ dates_in_month(otherDates, targetMonth)
    else dates_in_month(otherDates, targetMonth)

fun dates_in_months([], x) = []
|   dates_in_months(x, []) = []
|   dates_in_months(dates, month::months) =
    dates_in_month(dates, month) @ dates_in_months(dates, months)

fun get_nth(x, n) = 
    if n < 2 then hd x (*index 0 and 1 are apparently both head... *)
    else get_nth(tl x, n-1)

(* itoa because Int.toString doesn't exist. Extra credit? :D *)
fun itoa(n:int):string = 
  let
    val digit = get_nth(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"], (n mod 10) + 1)
    val str = if n > 9 then itoa(n div 10) else ""
  in
    str ^ digit
  end

fun date_to_string((year, month, day)) =
  let
    val names = ["January", "February", "March", "April", "May", "June", 
      "July", "August", "September", "October", "November", "December"]
  in
    get_nth(names, month) ^ " " ^ itoa(day) ^ ", " ^ itoa(year)
  end

fun number_before_reaching_sum(sum:int, nums:int list):int = 
  if sum <= hd nums then 0
  else 1 + number_before_reaching_sum(sum - hd nums, tl nums)

fun what_month(day:int):int = 
  let
    val count = [31,28,31,30,31,30,31,31,30,31,30,31]
  in
    number_before_reaching_sum(day, count) + 1
  end

fun month_range(start:int, stop:int):int list = 
  if stop < start then []
  else what_month(start) :: month_range(start + 1 , stop)

fun oldest([]) = NONE
|   oldest(x::[]) = SOME x
|   oldest(x::y::rest) = 
    if is_older(x,y) then
      oldest(x::rest)
    else
      oldest(y::rest)

(* Helper for challenge 1 *)
fun remove_duplicates([]) = []
|   remove_duplicates(x::nums:int list)=
  let
    fun remove_helper(toRemove:int, [])= []
    |   remove_helper(toRemove:int, nums: int list):int list =
      if hd nums = toRemove
      then            remove_helper(toRemove, tl nums)
      else hd nums :: remove_helper(toRemove, tl nums)
  in
    x :: remove_duplicates(remove_helper(x , nums))
  end

fun number_in_months_challenge(dates, months) = 
    number_in_months(dates, remove_duplicates(months))

fun dates_in_months_challenge(dates, months) =
    dates_in_months(dates, remove_duplicates(months))

fun reasonable_day_for_month(month:int, day:int):bool = 
  day <= get_nth([31,29,31,30,31,30,31,31,30,31,30,31], month)

fun is_leapyear(year:int) =
  year mod 400 = 0 
  orelse (
    (year mod 4 = 0) 
    andalso 
    not (year mod 100 = 0)
  )

fun reasonable_date(year:int, month:int, day:int):bool = 
  let 
    val reasonable_day = reasonable_day_for_month(month, day)
  in
    if year < 1 then false else
    if month < 1 orelse month > 12 then false else
    if not reasonable_day then false else 
    if month = 2 andalso day = 29 then is_leapyear(year)
    else true
  end

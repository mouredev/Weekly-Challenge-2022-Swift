#!/usr/bin/ruby

def is_leap_year (year)
  return year%4 == 0 && year%100 !=0 || year%400 == 0
end

def print_next_leap_years (amount, year)
  $printed = 0
  while $printed < amount  do
    year += 1
    if is_leap_year(year)
      $printed += 1
      puts year
    end
  end
end

print_next_leap_years(30, 1999)
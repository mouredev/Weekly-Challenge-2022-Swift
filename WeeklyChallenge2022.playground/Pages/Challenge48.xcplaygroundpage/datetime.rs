#[derive(Copy, Debug, Clone)]
pub struct Datetime {
    pub year: i16,
    pub month: u8,
    pub day: u8,
    pub hour: u8,
    pub minute: u8,
    pub second: u8,
}

impl Datetime {
    pub fn new(year: i16, month: u8, day: u8, hour: u8, minute: u8, second: u8) -> Self {
        Self {
            year: year,
            month: month,
            day: day,
            hour: hour,
            minute: minute,
            second: second,
        }
    }
}
impl std::cmp::PartialOrd for Datetime {

   fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
       if self.gt(other) {
           return Some(std::cmp::Ordering::Greater);
       }
       else if self.lt(other) {
           return Some(std::cmp::Ordering::Less);
       }
       else {
          return Some(std::cmp::Ordering::Equal);
       }
    }     
    fn ge(&self, other: &Self) -> bool {
        self.gt(other) ||
        (self.year == other.year &&
        self.month == other.month &&
        self.day == other.day &&
        self.hour == other.hour &&
        self.minute == other.minute &&
        self.second == other.second)

    }
    fn gt(&self, other: &Self) -> bool {

        if self.year > other.year {
           return true; 
        }
        else if self.month > other.month {
           return true; 
        }
        else if self.day > other.day {
           return true; 
        }
        else if self.hour > other.hour {
           return true; 
        }
        else if self.minute > other.minute {
           return true; 
        }
        else if self.second > other.second {
           return true; 
        }
        false

    }
    fn le(&self, other: &Self) -> bool {
        self.lt(other) ||
        (self.year == other.year &&
        self.month == other.month &&
        self.day == other.day &&
        self.hour == other.hour &&
        self.minute == other.minute &&
        self.second == other.second)

    }
    fn lt(&self, other: &Self) -> bool {

        if self.year < other.year {
           return true; 
        }
        else if self.month < other.month {
           return true; 
        }
        else if self.day < other.day {
           return true; 
        }
        else if self.hour < other.hour {
           return true; 
        }
        else if self.minute < other.minute {
           return true; 
        }
        else if self.second < other.second {
           return true; 
        }
        false
    }
}
impl std::cmp::PartialEq for Datetime {
    fn eq(&self, other: &Self) -> bool {
        self.year == other.year &&
        self.month == other.month &&
        self.day == other.day &&
        self.hour == other.hour &&
        self.minute == other.minute &&
        self.second == other.second
    }

    fn ne(&self, other: &Self) -> bool {

        self.year != other.year ||
        self.month != other.month ||
        self.day != other.day ||
        self.hour != other.hour ||
        self.minute != other.minute ||
        self.second != other.second
    }
}

impl std::ops::Sub for Datetime {
    type Output = Self;

    fn sub(self: Datetime, other: Datetime) -> Self::Output {
        Self {
            year: self.year - other.year,
            month: self.month - other.month,
            day: self.day - other.day,
            hour: self.hour - other.hour,
            minute: self.minute - other.minute,
            second: self.second - other.second
        }
    }
}

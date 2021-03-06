//
//  ProjectEnums.swift
//  Goalie
//
//  Created by Gregory Klein on 12/7/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import Foundation

extension NSDate {
   var month: Int {
      return NSCalendar.currentCalendar().components((.Month), fromDate: self).month
   }
}

public enum ActiveState: Int {
   case Today, Tomorrow, Idle
}

public enum Month: Int {
   case Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
   
   init(date: NSDate)
   {
      var rawValue = date.month - 1
      if rawValue < 0 || rawValue >= 12 {
         rawValue = 0
      }
      self.init(rawValue: rawValue)!
   }
}

extension Month
{
   var text: String {
      switch self
      {
      case .Jan: return "JAN"
      case .Feb: return "FEB"
      case .Mar: return "MAR"
      case .Apr: return "APR"
      case .May: return "MAY"
      case .Jun: return "JUN"
      case .Jul: return "JUL"
      case .Aug: return "AUG"
      case .Sep: return "SEP"
      case .Oct: return "OCT"
      case .Nov: return "NOV"
      case .Dec: return "DEC"
      }
   }
   
   var fullName: String {
      switch self
      {
      case .Jan: return "January"
      case .Feb: return "February"
      case .Mar: return "March"
      case .Apr: return "April"
      case .May: return "May"
      case .Jun: return "June"
      case .Jul: return "July"
      case .Aug: return "August"
      case .Sep: return "September"
      case .Oct: return "October"
      case .Nov: return "November"
      case .Dec: return "December"
      }
   }
}
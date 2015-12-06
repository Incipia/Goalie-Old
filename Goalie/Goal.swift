//
//  Goal.swift
//  Goalie
//
//  Created by Gregory Klein on 12/4/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit
import CoreData

public final class Goal: ManagedObject
{
   @NSManaged public var title: String
   @NSManaged public var summary: String?
   @NSManaged public var monthValue: Int16
   @NSManaged public private(set) var creationDate: NSDate
   
   @NSManaged public private(set) var parent: Goal?
   @NSManaged public private(set) var children: Set<Goal>
   
   public static func insertIntoContext(moc: NSManagedObjectContext, title: String, summary: String) -> Goal
   {
      let goal: Goal = moc.insertObject()
      goal.title = title
      goal.summary = summary
      return goal
   }
   
   public static func insertIntoContext(moc: NSManagedObjectContext, title: String, parent: Goal) -> Goal
   {
      let goal: Goal = moc.insertObject()
      goal.title = title
      
      guard goal != parent else { return goal }
      goal.parent = parent
      
      return goal
   }
   
   public override func awakeFromInsert() {
      creationDate = NSDate()
   }
}

extension Goal: ManagedObjectType
{
   public static var entityName: String {
      return "Goal"
   }
   
   public static var defaultSortDescriptors: [NSSortDescriptor] {
      return [NSSortDescriptor(key: "title", ascending: true)]
   }
   
   public static var defaultPredicate: NSPredicate? {
      return NSPredicate(format: "parent == nil")
   }
}

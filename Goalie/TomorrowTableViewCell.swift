//
//  TomorrowTableViewCell.swift
//  Goalie
//
//  Created by Gregory Klein on 12/9/15.
//  Copyright © 2015 Incipia. All rights reserved.
//

import UIKit

class TomorrowTableViewCell: GoalieTableViewCell
{
   @IBOutlet weak private var _titleLabel: UILabel! {
      didSet {
         _titleLabel.font = ThemeAllGoalsLabelFont
         _titleLabel.textColor = ThemeTitleTextColor
      }
   }
   @IBOutlet weak private var _monthLabel: UILabel! {
      didSet {
         _monthLabel.font = ThemeSubgoalsLabelFont
         _monthLabel.textColor = ThemeTabBarColor
      }
   }
   
   private weak var _goal: Goal!
   
   @IBAction private func _arrowButtonPressed()
   {
      _goal.managedObjectContext?.performChanges({ () -> () in
         self._goal.activeState = .Today
      })
   }
}

extension TomorrowTableViewCell: ConfigurableCell
{
   func configureForObject(object: Goal)
   {
      _goal = object
      _titleLabel.text = object.title
      _monthLabel.text = object.parent!.title
      
      var titleAttributes: [String : AnyObject] = [NSFontAttributeName : ThemeAllGoalsLabelFont]
      if object.completed == true {
         titleAttributes[NSStrikethroughStyleAttributeName] = 1
      }
      
      let attributedTitleText = NSAttributedString(string: object.title, attributes: titleAttributes)
      _titleLabel.attributedText = attributedTitleText
   }
}

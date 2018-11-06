//
//  GoalTableViewCell.swift
//  GoalTracker
//
//  Created by Ethan Furstoss on 11/4/18.
//  Copyright © 2018 Ethan Furstoss. All rights reserved.
//

import UIKit

class GoalTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var goalTitleLabel: UILabel!
    
    @IBOutlet weak var goalTimeStampLabel: UILabel!
    
    var goal: Goal?{
        didSet{
            //Calling the function to set the view whenever we set this cell's goal.
            setUpView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
    func setUpView(){
        //Unwrapping our optional goal.
        
        guard let unwrappedGoal = goal else { return }
        
        //NOTE: You don't have to name it so explicitly. But hoping it helps initially.
        
        goalTitleLabel.text = unwrappedGoal.name
        //Can't set the text to a double!
        goalTimeStampLabel.text = "\(unwrappedGoal.dateCreated)"
        
    }
}

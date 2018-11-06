//
//  ViewController.swift
//  GoalTracker
//
//  Created by Ethan Furstoss on 11/4/18.
//  Copyright © 2018 Ethan Furstoss. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController {
    
    
    
    @IBOutlet weak var goalInputTextField: UITextField!
    @IBOutlet weak var goalsTableView: UITableView!
    
    var goals = [Goal]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NOTE: I set the tableview datasource and delegate within the storyboard!
    }
    
    
    @IBAction func pressedAddNewGoal(_ sender: UIButton) {
        //Making sure that the text field has somethign in it and unwrapping the text in it.
        guard let newGoalTitle = goalInputTextField.text, newGoalTitle.isEmpty == false else { return}
        let dateStamp = NSDate().timeIntervalSince1970
        
        //Instantiating my new goal.
        let newGoal = Goal(name: newGoalTitle, dateCreated: dateStamp)
        //Appending the goal to my goal array.
        goals.append(newGoal)
        
        
        goalInputTextField.text = ""
        goalsTableView.reloadData()
    }
}


//Any extension of a class is esentially the same as having this code within the actual class, but it helps seperate thigns and keep it neat.
extension GoalViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as! GoalTableViewCell
        
        cell.goal = goals[indexPath.row]
        
        return cell
    }
    
    
    
    
}

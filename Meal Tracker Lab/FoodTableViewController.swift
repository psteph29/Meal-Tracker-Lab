//
//  FoodTableViewController.swift
//  Meal Tracker Lab
//
//  Created by Paige Stephenson on 3/9/23.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
        return [
            Meal(name: "Breakfast", food: [
                Food(name: "Bacon", description: "Extra Crispy"),
                Food(name: "Hashbrowns", description: "Extra Crispy"),
                Food(name: "Eggs", description: "Scrambled")
            ]
                ),
            Meal(name: "Lunch", food: [
                Food(name: "Chicken Nuggets", description: "Extra Crispy with Chik fil a Sauce"),
                Food(name: "Green Beans", description: "Steamed"),
                Food(name: "Rice", description: "Sushi Rice")
            ]
                ),
            Meal(name: "Dinner", food: [
                Food(name: "Mac and Cheese", description: "Extra Cheesy"),
                Food(name: "Chicken", description: "Grilled"),
                Food(name: "Salad", description: "With ranch")])
        ]
    }
    
    
    //    Above I created a computed property, meals, of type [Meal]. This property returns three Meal objects in an array with the order: breakfast, lunch, dinner.
    //    There are 3 food objects for the food array on each meal object
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section > meals.count {
            return 0
        } else {
            return meals[section].food.count
        }
    }
    //    Accessing the meal for the given function and returning the number of food items in that meal
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        let food = meals[indexPath.section].food[indexPath.row]
        
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description
        return cell
        
        //  Access the view for the row using indexPath.section and from the returned meal, access the food for the row using indexPath.row
        
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}

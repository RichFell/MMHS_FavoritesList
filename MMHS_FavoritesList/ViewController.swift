//
//  ViewController.swift
//  MMHS_FavoritesList
//
//  Created by Richard Fellure on 7/14/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
                            
    @IBOutlet var tableView: UITableView
    var favorites = ["Snowboarding", "Coding", "Muay Thai", "Jet Skiing"]

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func onButtonPressedAddFavorite(sender: AnyObject)
    {
        let alert = UIAlertController(title: "Add another favorite activity", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler({ textField in
            textField.placeholder = "Add a new favorite"
            })

        let cancelAction = UIAlertAction(title: "Cancel", style:.Cancel, handler: ({ action in

            }))
        alert.addAction(cancelAction)

        let saveAction = UIAlertAction(title: "Add", style: .Default, handler: ({ action in

            let textField = alert.textFields[0] as UITextField
            self.favorites.append(textField.text)

            self.tableView.reloadData()
            }))
        alert.addAction(saveAction)

        self.presentViewController(alert, animated: true, completion: nil)

    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath) as UITableViewCell
        let favorite = favorites[indexPath.row] as String

        cell.textLabel.text = favorite

        return cell
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return favorites.count
    }
}


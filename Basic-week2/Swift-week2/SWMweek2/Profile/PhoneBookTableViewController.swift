//
//  PhoneBookTableViewController.swift
//  Profile
//
//  Created by sooyeon Shim on 02/07/2019.
//  Copyright © 2019 sooyeon Shim. All rights reserved.
//

import UIKit

class PhoneBookTableViewController: UITableViewController {
    
    // MARK:- Properties
    let cellIdentifier: String = "cell"
    var friends: [Friends] = []
    
    // MARK:- Methods
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserInformation.sharedInstance.initProperty()
        navigationItem.title = "연락처"
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAssets: NSDataAsset = NSDataAsset(name: "studyMember")
            else {
                return
        }
        
        do {
            self.friends = try jsonDecoder.decode([Friends].self, from: dataAssets.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }

    // MARK: TableView delegate & data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionHeader: String?
        switch section {
        case 0:
            sectionHeader = "My Profile"
        case 1:
            sectionHeader = "My Friends"
        default:
            sectionHeader = nil
        }
        
        return sectionHeader
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return self.friends.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? PhoneBookTableViewCell
            else {
                return UITableViewCell()
        }

        if indexPath.section == 0 {
            cell.tag = -1
            cell.textLabel?.text = UserInformation.sharedInstance.name
            return cell
        } else {
            let friend: Friends = self.friends[indexPath.row]
            cell.tag = indexPath.row
            cell.textLabel?.text = friend.name
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProfile" {
            if let destination = segue.destination as? ProfileViewController {
                let index = (sender as? PhoneBookTableViewCell)?.tag
                if index == -1 {
                    destination.friend = nil
                } else {
                    destination.friend = friends[index ?? 0]
                }
            }
        }
    }
}

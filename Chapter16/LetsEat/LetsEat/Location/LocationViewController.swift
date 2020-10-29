//
//  LocationViewController.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 28/10/2020.
//

import UIKit

class LocationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let manager = LocationDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: Private Extension
private extension LocationViewController {
    
    func initialize() {
        manager.fetch()
    }
}

// MARK: UITableViewDataSource
extension LocationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        cell.textLabel?.text = manager.locationItem(at: indexPath)
        return cell
    }
    
}

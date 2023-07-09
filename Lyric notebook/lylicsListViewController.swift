//
//  lylicsListViewController.swift
//  Lyric notebook
//
//  Created by Yui Kamijo on R 5/07/09.
//

import UIKit

class LylicsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var data: [[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchLylicsData()
        tableView.reloadData()
    }
}


extension LylicsListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LylicsCell") as! LylicsTableViewCell
        
        cell.label.text = data[indexPath.row]["lylics"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    private func fetchLylicsData(){
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "lylics") != nil{
            self.data = userDefaults.object(forKey: "lylics") as! [[String : Any]]
        }
    }
    
}

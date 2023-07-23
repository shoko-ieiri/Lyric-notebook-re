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
        //TODO: 追加
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchLylicsData()
        tableView.reloadData()
    }
    
     func fetchLylicsData(){
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "lylics") != nil{
            self.data = userDefaults.object(forKey: "lylics") as! [[String : Any]]
        }
    }
}


extension LylicsListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LylicsCell") as! LylicsTableViewCell
        
        cell.label.text = data[indexPath.section]["lylics"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    //TODO: 追加
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2 // お好みで
    }
    
    //TODO: 追加
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let marginView = UIView()
        marginView.backgroundColor = .clear
        return marginView
    }
    
    //TODO: 追加
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count  // 表示するデータが入っている配列を想定
    }
    
    
    
   
    
}

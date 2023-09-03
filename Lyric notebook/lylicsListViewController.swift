//
//  lylicsListViewController.swift
//  Lyric notebook
//
//  Created by Yui Kamijo on R 5/07/09.
//

import UIKit

class LylicsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var button: UIButton!
    
    //    FAB
    var startingFrame : CGRect!
    var endingFrame : CGRect!
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) && self.button.isHidden {
            self.button.isHidden = false
            self.button.frame = startingFrame
            UIView.animate(withDuration: 1.0) {
                self.button.frame = self.endingFrame
            }
        }
    }
    func configureSizes() {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        startingFrame = CGRect(x: 0, y: screenHeight+100, width: screenWidth, height: 100)
        endingFrame = CGRect(x: 0, y: screenHeight-100, width: screenWidth, height: 100)
        
    }
    
    
    var data: [[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        //TODO: 追加
        tableView.separatorStyle = .none
        //        buttonを角丸にする
        button.layer.cornerRadius = 32
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

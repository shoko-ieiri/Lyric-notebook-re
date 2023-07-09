//
//  AddViewController.swift
//  Lyric notebook
//
//  Created by Yui Kamijo on R 5/06/25.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!

    
    var data: [[String:Any]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        //MARK: once we get data
        if userDefaults.object(forKey: "lylics") != nil{
            self.data = userDefaults.object(forKey: "lylics") as! [[String : Any]]
        }
        view.backgroundColor = .purple
        
        //TODO: making toolbar
        let toolBarHeight = 50
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: Int(UIScreen.main.bounds.height) - toolBarHeight, width: Int(UIScreen.main.bounds.width), height: toolBarHeight))
        
        let cameraButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.camera, target: self, action: nil)
        toolBar.items = [cameraButton]
        
        self.view.addSubview(toolBar)
    }
    
    
    @IBAction func tappedSaveButton(_ sender: Any) {
        
        let lyricsText: String = textField.text!
        let detailText: String = textView.text!
        
        let addedData: [String:Any] = [
            "lylics": lyricsText,
            "detail": detailText
        ]
        //MARK: add data
        data.append(addedData)
        UserDefaults.standard.setValue(data, forKey: "lylics")
    }
    // Do any additional setup after loading the view.
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


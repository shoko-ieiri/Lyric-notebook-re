//
//  LylicsTableViewCell.swift
//  Lyric notebook
//
//  Created by Yui Kamijo on R 5/07/09.
//

import UIKit

class LylicsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
        
        //TODO: 追加
               backgroundImageView.layer.cornerRadius = 20
               backgroundImageView.clipsToBounds = true
    }

    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



//
//  TestCell.swift
//  PopMenuDemo
//
//  Created by mac on 2025/3/10.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

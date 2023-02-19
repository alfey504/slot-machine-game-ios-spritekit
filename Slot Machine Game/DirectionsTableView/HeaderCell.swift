//
//  TableViewCell.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-02-18.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var header: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setHeader(header: String){
        self.header.text = header
    }

}

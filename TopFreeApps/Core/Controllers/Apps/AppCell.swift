//
//  AppTblViewCell.swift
//  TopFreeApps
//
//  Created by Hemal Swarnasiri on 2023-01-16.
//

import UIKit

class AppCell: UITableViewCell {

    @IBOutlet var lblAppName: UILabel!
    @IBOutlet var lblReleaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

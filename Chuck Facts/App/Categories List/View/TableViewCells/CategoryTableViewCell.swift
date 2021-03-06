//
//  CategoryTableViewCell.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/23/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryView = UIImageView(image: UIImage(named: "disclosure-icon"))
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = .darkNavigationColor
        selectedBackgroundView = bgColorView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(with category: Category) {
        categoryLabel.text = category.capitalized
    }

}

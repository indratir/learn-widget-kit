//
//  MyOrdersItemCell.swift
//  LearnWidgetKit
//
//  Created by Indra Tirta Nugraha on 14/08/22.
//

import UIKit

final class MyOrdersItemCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    func configure(_ viewParam: MyOrderItemViewParam) {
        iconImageView.image = viewParam.iconImage
        labelType.text = viewParam.type
        labelDesc.text = viewParam.desc
        labelTitle.text = viewParam.title
        labelDate.text = viewParam.date
    }
    
}

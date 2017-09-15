//
//  RepositoiresTableViewCell.swift
//  desafio-mobile-ios
//
//  Created by Jean Carlos on 9/12/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoiresTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var lblRepositorieName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblNameSurname: UILabel!
    @IBOutlet weak var imgAvatarHeightConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        imgAvatar.layer.cornerRadius = imgAvatarHeightConstraint.constant / 2
        imgAvatar.layer.masksToBounds = true
    }
    
    func initWithRepositorie(_ repositorie : Repositorie) {
        lblRepositorieName.text = repositorie.nameRepositories
        
        let imgAvatarURL = URL(string: (repositorie.owner?.avatarURL)!)
        imgAvatar.sd_setImage(with: imgAvatarURL)
        
        lblUserName.text = repositorie.owner?.login
        lblNameSurname.text = repositorie.full_name
        
        lblDescription.text = repositorie.description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

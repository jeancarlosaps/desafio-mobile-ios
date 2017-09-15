//
//  PullRequestsTableViewCell.swift
//  desafio-mobile-ios
//
//  Created by Jean Carlos on 9/12/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import UIKit
import SDWebImage

class PullRequestsTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var lblPullRequestTitle: UILabel!
    @IBOutlet weak var lblPullRequestBody: UILabel!
    @IBOutlet weak var lblPullRequestCreator: UILabel!
    @IBOutlet weak var imgAvatarPullRequestCreator: UIImageView!
    @IBOutlet weak var imgAvatarPullRequestCreatorHeightConstraint: NSLayoutConstraint!
    
    //MARK: Método para customização de elementos da célula chamada no lifecycle da tableview
    override func awakeFromNib() {
        super.awakeFromNib()
        //Custom
        imgAvatarPullRequestCreator.layer.cornerRadius = imgAvatarPullRequestCreatorHeightConstraint.constant / 2
        imgAvatarPullRequestCreator.layer.masksToBounds = true
        imgAvatarPullRequestCreator.layer.borderColor = UIColor.gray.cgColor
        imgAvatarPullRequestCreator.layer.borderWidth = 1.0
    }

    func initWithPullRequest(_ pullRequest: PullRequests) {
        lblPullRequestTitle.text = pullRequest.title
        lblPullRequestBody.text = pullRequest.body
        lblPullRequestCreator.text = pullRequest.user?.login
        
        let imgAvatarPullRequestCreatorURL = URL(string: (pullRequest.user?.avatarURL)!)
        imgAvatarPullRequestCreator.sd_setImage(with: imgAvatarPullRequestCreatorURL)
        
    }

}

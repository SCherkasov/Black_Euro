//
//  CollectionViewCell.swift
//  Black_Euro
//
//  Created by Stanislav Cherkasov on 19.05.2018.
//  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var coImage: UIImageView!
    
    let cardBackTag = 0
    let cardFrontTag = 1
    
    var cardViews: (frontView: UIImageView, backView: UIImageView)?
    
    var imgViewFront: UIImageView!
    var imgViewBack: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgViewFront = self.createCardWithImage(imageName: "1", tag: self.cardFrontTag)
        imgViewBack = self.createCardWithImage(imageName: "2", tag: self.cardBackTag)
        cardViews = (frontView: imgViewFront, backView: imgViewBack)
        contentView.addSubview(imgViewBack)
    }
    private func createCardWithImage(imageName: String, tag: Int) -> UIImageView {
        let newCardImageView = UIImageView(frame: self.frame)
        newCardImageView.image = UIImage(named: imageName)
        newCardImageView.tag = tag
        
        return newCardImageView
    }
    
    func flipCardAnimation(indexPath: IndexPath) {
        
        if (imgViewBack.superview != nil) {
            cardViews = (frontView: imgViewFront, backView: imgViewBack)
        }else{
            cardViews = (frontView: imgViewBack, backView: imgViewFront)
        }
        
        let transitionOptions = UIViewAnimationOptions.transitionFlipFromLeft
        
        UIView.transition(with: self.contentView, duration: 1.0, options: transitionOptions, animations: {
            
            self.cardViews!.backView.removeFromSuperview()
            
            self.contentView.addSubview(self.cardViews!.frontView)
            
        }, completion: { finished in
            print(indexPath)
        })
        
    }
}

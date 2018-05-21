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
    
    public var frontImageName: String? {
        didSet {
            if let name = self.frontImageName {
                let imageView
                    = self.createCardWithImage(
                        imageName: name,
                        tag: self.cardFrontTag
                )
                
                self.frontImageView = imageView
                
                self.add(imageView: imageView, isFrontCard: true)
            }
        }
    }
    
    public var backImageName: String? {
        didSet {
            if let name = self.backImageName {
                let imageView
                    = self.createCardWithImage(
                        imageName: name,
                        tag: self.cardBackTag
                )
                
                self.backImageView = imageView
                
                self.add(imageView: imageView, isFrontCard: false)
            }
        }
    }
    
    private var frontImageView: UIImageView?
    private var backImageView: UIImageView?
    private var isFrontCardShown = false
    
    func add(imageView: UIImageView, isFrontCard: Bool) {
        _ = self.contentView.subviews.map { $0.removeFromSuperview() }
        
        self.contentView.addSubview(imageView)
        
        self.isFrontCardShown = isFrontCard
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let imageView = self.backImageView {
            self.add(imageView: imageView, isFrontCard: false)
        }
    }
    
    private func createCardWithImage(imageName: String, tag: Int) -> UIImageView {
        let newCardImageView = UIImageView(frame: self.frame)
        newCardImageView.image = UIImage(named: imageName)
        newCardImageView.tag = tag
        
        return newCardImageView
    }
    
    func flipCardAnimation(indexPath: IndexPath) {
        
        if let frontImageView = self.frontImageView,
            let backImageView = self.backImageView
        {
            let toImageView = self.isFrontCardShown ? backImageView : frontImageView
    
            UIView.transition(
                with: self.contentView,
                duration: 1.0,
                options: UIViewAnimationOptions.transitionFlipFromLeft,
                animations: {
                    self.add(imageView: toImageView, isFrontCard: !self.isFrontCardShown)
                }, completion: { finished in
                    print(indexPath)
                }
            )
        }
    }
}

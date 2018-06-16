//
//  CollectionViewController.swift
//  Black_Euro
//
//  Created by Stanislav Cherkasov on 19.05.2018.
//  Copyright © 2018 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import FirebaseAuth

class CollectionViewController: UICollectionViewController {

    var pict1 = ["1", "2", "3", "4"]
    var pict2 = ["5", "6", "7", "8"]
    
    var reuseIdentifier = "CollectionViewCell"
    
  
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        if let user = Auth.auth().currentUser {
//            self.performSegue(withIdentifier: "signInGoodSegue", sender: self)
//        }
//    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 
        return 8
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
        cell.flipCardAnimation(indexPath: indexPath)
    }
    
    
}

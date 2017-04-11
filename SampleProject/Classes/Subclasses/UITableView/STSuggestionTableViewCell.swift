//
//  STSuggestionTableViewCell.swift
//  STREET
//
//  Created by Waris Shams on 04/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STSuggestionTableViewCell: UITableViewCell , UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var suggestedProfifilePic: UIImageView!
    @IBOutlet weak var lblLike: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!


    override func awakeFromNib() {
        super.awakeFromNib()
     
        let suggestionCell = UINib(nibName: "STFriendSuggestionCollectionCell", bundle: nil)
        self.collectionView!.registerNib(suggestionCell, forCellWithReuseIdentifier: "STFriendSuggestionCollectionCell")
//        UtilityFunctions.setViewCornerRadius(self, radius: suggestionCell)
     
    
}

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

          }
   
    
    
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let friendSuggestionCell = collectionView.dequeueReusableCellWithReuseIdentifier("STFriendSuggestionCollectionCell", forIndexPath: indexPath) as! STFriendSuggestionCollectionCell
        friendSuggestionCell.friendsImage.image = UIImage(named: "image2")
        if indexPath.row == 3
        {
               friendSuggestionCell.friendsImage.image = UIImage(named: "image-placeholder-1")
        }
        
        return friendSuggestionCell
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        
        let widthHeight = self.frame.size.width / 5
        
        return CGSizeMake(widthHeight, widthHeight)
    }

    
}

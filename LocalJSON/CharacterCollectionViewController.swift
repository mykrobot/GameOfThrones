//
//  CharacterCollectionViewController.swift
//  LocalJSON
//
//  Created by Michael Mecham on 8/2/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

private let reuseIdentifier = "characterCell"

class CharacterCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak private var flowLayout: UICollectionViewFlowLayout!
    private let kMargin = CGFloat(2.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFlowLayout()
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: #selector(updateViews(_:)), name: CharacterNotificationCompleteKey, object: nil)
    }

    @objc private func updateViews(notification: NSNotification) {
        collectionView?.reloadData()
    }
    
    private func setupFlowLayout() {
        flowLayout.sectionInset = UIEdgeInsetsMake(0, kMargin, 0, kMargin)
        flowLayout.minimumLineSpacing = 2
        flowLayout.minimumInteritemSpacing = 2
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailSegue" {
            let detailVC = segue.destinationViewController as? CharacterDetailViewController
            if let cell = (sender as? UICollectionViewCell), indexPath = collectionView?.indexPathForCell(cell) {
                let character = CharacterController.sharedController.charactersArray[indexPath.item]
                detailVC?.character = character
            }
        }
    }
 
    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CharacterController.sharedController.charactersArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? CharacterCollectionViewCell
        let character = CharacterController.sharedController.charactersArray[indexPath.row]
        cell?.updateViewWithCharacter(character)
        return cell ?? CharacterCollectionViewCell()
    }
    
    // Mark: - Collection View Delegate Flow Layout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let collectionConstraint = NSLayoutConstraint(item: collectionView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
        view.addConstraint(collectionConstraint)
        
        let viewWidth = view.frame.width
        let viewWidthminusMargin = viewWidth - 6 * kMargin
        let itemDimension = viewWidthminusMargin / 3.0
        
        let viewHeight = view.frame.height
        let viewHeightMinusMargin = viewHeight - 6 * kMargin
        let itemDimensionHeight = viewHeightMinusMargin / 6.0
        
        return CGSize(width: itemDimension, height: itemDimensionHeight)
    }
}

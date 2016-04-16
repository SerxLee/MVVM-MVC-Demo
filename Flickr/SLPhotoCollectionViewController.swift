//
//  SLPhotoCollectionViewController.swift
//  Flickr
//
//  Created by Serx on 16/4/15.
//  Copyright © 2016年 serxlee. All rights reserved.
//

import UIKit

class SLPhotoCollectionViewController: UICollectionViewController {
    
    var viewModel = SLPhotoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
            receive the notification posted from SLPhotoViewModel
            and then execute the reloadData method
        */
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SLPhotoCollectionViewController.getDataAndReload), name: NSMetadataQueryDidUpdateNotification, object: nil)
    }
    func getDataAndReload(){
        self.collectionView?.reloadData()
    }
    
    //UICollectionViewDataSource
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let photoArr = self.viewModel.photosArray as NSArray
        return photoArr.count
    }
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let identifier:String = "collectionCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) 
        let imageView = UIImageView()
        imageView.image = self.viewModel.photosArray[indexPath.row] as? UIImage
        cell.contentView.addSubview(imageView)
        return cell
    }
}
    
    
    
    
//    private var myContext = 0

    
//    //add observer
//    func setUpObservers(){
//        self.viewModel.addObserver(self, forKeyPath: "photosArray", options: NSKeyValueObservingOptions.New, context: &myContext)
//    }
    
    
//
//    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
//        
//        let a = change![NSKeyValueChangeNewKey]
//        
//        viewModel.photosArray = (a as! NSMutableArray)
//        
//        
//    }
    
//}

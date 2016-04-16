//
//  SLPhotosViewModel.swift
//  Flickr
//
//  Created by Serx on 16/4/15.
//  Copyright © 2016年 serxlee. All rights reserved.
//

import Foundation

class SLPhotoViewModel: NSObject{
    
    /*
        photosArray is the data that 
            used by SLPhotoCollectionViewController and
            handled by SLPhotoViewModel
        which it born.
    */
    dynamic var photosArray: NSMutableArray = NSMutableArray()
    
    func fetchPhotoFromFlickr(){
        
        //TODO: newPhotosArray is the new data re-get from http://api.flickr........
        
        let newPhotosArray: NSMutableArray = NSMutableArray()
        
        //handle the newData in the viewModle
        dispatch_async(dispatch_get_main_queue()) {
            self.photosArray.removeAllObjects()
            self.photosArray = newPhotosArray
        }
        NSNotificationCenter.defaultCenter().postNotificationName(NSMetadataQueryDidUpdateNotification, object: nil)
    }
}
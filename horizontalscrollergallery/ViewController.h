//
//  ViewController.h
//  horizontalscrollergallery
//
//  Created by Gaurav Amrutiya on 18/09/17.
//  Copyright © 2017 Gaurav Amrutiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *headerArr;
    int selectedHeader;
    
}

@property (weak, nonatomic) IBOutlet UICollectionView *headerCollectionVw;

@end


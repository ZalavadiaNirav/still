//
//  galleryCollectionVw.h
//  horizontalscrollergallery
//
//  Created by Gaurav Amrutiya on 19/09/17.
//  Copyright © 2017 Gaurav Amrutiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface galleryCollectionVw : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *projectImage;
@property (weak, nonatomic) IBOutlet UILabel *areaLbl;
@property (weak, nonatomic) IBOutlet UILabel *priceLbl;
@property (weak, nonatomic) IBOutlet UILabel *statusLbl;
@property (weak, nonatomic) IBOutlet UILabel *possessionLbl;

@end

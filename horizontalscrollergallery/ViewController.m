//
//  ViewController.m
//  horizontalscrollergallery
//
//  Created by Gaurav Amrutiya on 18/09/17.
//  Copyright © 2017 Gaurav Amrutiya. All rights reserved.
//

#import "ViewController.h"
#import "hederCollectionVw.h"
#import "galleryCollectionVw.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    headerArr=@[@"1 BHK",@"3 BHK"];
    selectedHeader=0;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section==0)
        return [headerArr count];
    else
        return 2;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (IBAction)backWardAction:(id)sender {
    if(selectedHeader>=1)
    {
        selectedHeader--;
        // scroll to the cell
        NSIndexPath *selectedIndexPath=[NSIndexPath indexPathForRow:selectedHeader inSection:0];
        [_headerCollectionVw scrollToItemAtIndexPath:selectedIndexPath
                                   atScrollPosition:UICollectionViewScrollPositionBottom
                                           animated:YES];
        
        // call delegate method
        [self collectionView:_headerCollectionVw didSelectItemAtIndexPath:selectedIndexPath];
    }
    
}
- (IBAction)forwardAction:(id)sender {
    if(selectedHeader<([headerArr count]-1))
    {
        selectedHeader++;
        // scroll to the cell
        NSIndexPath *selectedIndexPath=[NSIndexPath indexPathForRow:selectedHeader inSection:0];
        [_headerCollectionVw scrollToItemAtIndexPath:selectedIndexPath
                                    atScrollPosition:UICollectionViewScrollPositionBottom
                                            animated:YES];
        
        // call delegate method
        [self collectionView:_headerCollectionVw didSelectItemAtIndexPath:selectedIndexPath];
    }
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell;
    if(indexPath.section==0)
    {
        hederCollectionVw *cell=(hederCollectionVw *)[collectionView dequeueReusableCellWithReuseIdentifier:@"headerID" forIndexPath:indexPath];
        cell.headerBtn.layer.borderWidth=0.3;
        cell.headerBtn.userInteractionEnabled=false;
        [cell.headerBtn setTitle:[NSString stringWithFormat:@"%@",[headerArr objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
        [cell.headerBtn setBackgroundColor:[UIColor whiteColor]];
        [cell.headerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        cell.headerBtn.tag=indexPath.row;
        return cell;
    }
    else if(indexPath.section==1)
    {
        galleryCollectionVw *cell=(galleryCollectionVw *)[collectionView dequeueReusableCellWithReuseIdentifier:@"galleryID" forIndexPath:indexPath];
        return cell;
    }
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return CGSizeMake(self.view.frame.size.width-20, 44);
    }
    else
        return CGSizeMake(self.view.frame.size.width-20, 120);

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        [_headerCollectionVw reloadSections:[NSIndexSet indexSetWithIndex:0]];
        hederCollectionVw *cell=(hederCollectionVw *)[collectionView cellForItemAtIndexPath:indexPath];
        selectedHeader=(int)indexPath.row;
        cell.headerBtn.backgroundColor=[UIColor blackColor];
        [cell.headerBtn setBackgroundColor:[UIColor blackColor]];
        NSLog(@"%ld BHK",indexPath.row);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  AnimalTableViewCell.h
//  TableViewLayout
//
//  Created by Oliver Foggin on 29/10/2014.
//  Copyright (c) 2014 Oliver Foggin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimalTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *animalImageView;
@property (weak, nonatomic) IBOutlet UILabel *animalNameLabel;

@end

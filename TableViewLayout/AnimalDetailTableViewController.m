//
//  ArticleTableViewController.m
//  TableViewLayout
//
//  Created by Oliver Foggin on 29/10/2014.
//  Copyright (c) 2014 Oliver Foggin. All rights reserved.
//

#import "AnimalDetailTableViewController.h"
#import "Animal.h"

@interface AnimalDetailTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *articleImageView;
@property (weak, nonatomic) IBOutlet UILabel *articleTextView;
@property (weak, nonatomic) IBOutlet UIImageView *authorImageView;
@property (weak, nonatomic) IBOutlet UILabel *authorNameLabel;

@end

@implementation AnimalDetailTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.titleLabel.text = self.animal.name;
    self.dateLabel.text = self.animal.species;
    self.articleImageView.image = [UIImage imageNamed:self.animal.photo];
    self.articleTextView.text = self.animal.text;
    self.authorImageView.image = [UIImage imageNamed:self.animal.authorPhoto];
    self.authorNameLabel.text = self.animal.authorName;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

@end

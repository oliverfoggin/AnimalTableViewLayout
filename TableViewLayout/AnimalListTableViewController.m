//
//  AnimalListTableViewController.m
//  TableViewLayout
//
//  Created by Oliver Foggin on 29/10/2014.
//  Copyright (c) 2014 Oliver Foggin. All rights reserved.
//

#import "AnimalListTableViewController.h"
#import "Animal.h"
#import "AnimalTableViewCell.h"
#import "AnimalDetailTableViewController.h"

@interface AnimalListTableViewController ()

@property (nonatomic, strong) NSArray *animals;

@end

@implementation AnimalListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Animals" ofType:@"plist"];
    
    NSArray *animalArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSDictionary *dictionary in animalArray) {
        Animal *animal = [Animal new];
        [animal setValuesForKeysWithDictionary:dictionary];
        [tempArray addObject:animal];
    }
    
    self.animals = tempArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.animals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnimalCell" forIndexPath:indexPath];
    
    // Configure the cell...
    [self configureAnimalCell:(AnimalTableViewCell *)cell withAnimal:self.animals[indexPath.row]];
    
    return cell;
}

- (void)configureAnimalCell:(AnimalTableViewCell *)cell withAnimal:(Animal *)animal
{
    cell.animalImageView.image = [UIImage imageNamed:animal.photo];
    cell.animalNameLabel.text = animal.name;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"animalSegue"]) {
        AnimalDetailTableViewController *controller = segue.destinationViewController;
        controller.animal = self.animals[[self.tableView indexPathForCell:sender].row];
    }
}

@end

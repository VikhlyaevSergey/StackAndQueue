//
//  StartViewController.m
//  SingleViewApp
//
//  Created by Сергей Вихляев on 08/07/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

#import "StartViewController.h"
#import "CollectionsViewController.h"

@interface StartViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *collectionsButton;

- (IBAction)collectionButtonWasPressed:(id)sender;

@end

@implementation StartViewController

#pragma mark - IBs
- (IBAction)collectionButtonWasPressed:(id)sender {
    [self routeToCollectionsVC];
}

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupVC];
}

#pragma mark - Logic
- (void)setupVC {

    // _contentView
    _contentView.layer.cornerRadius = 8;

    // _collectionsButton
    _collectionsButton.layer.cornerRadius = _collectionsButton.bounds.size.height / 2;
    _collectionsButton.layer.borderWidth = 1;
    _collectionsButton.layer.borderColor = UIColor.whiteColor.CGColor;
    _collectionsButton.tintColor = UIColor.whiteColor;
    [_collectionsButton setTitle:@"Collections" forState: UIControlStateNormal];
}

#pragma mark - Routing
- (void)routeToCollectionsVC {
    CollectionsViewController* collectionsVC = [CollectionsViewController new];
    [self.navigationController showViewController:collectionsVC sender:self];
}

@end

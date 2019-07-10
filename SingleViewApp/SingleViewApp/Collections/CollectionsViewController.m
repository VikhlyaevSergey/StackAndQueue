//
//  CollectionsViewController.m
//  SingleViewApp
//
//  Created by Сергей Вихляев on 08/07/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

#import "CollectionsViewController.h"
#import "StackObject.h"
#import "QueueObject.h"

#import "ValueCollectionViewCell.h"

// (1) Знакомство с Xcode, архитектура iOS, interface Builder

@interface CollectionsViewController () <SomeRetainDelegate> // (4)
@property (weak, nonatomic) IBOutlet UIView *stackView;
@property (weak, nonatomic) IBOutlet UIView *queueView;

@property (weak, nonatomic) IBOutlet UICollectionView *stackCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *queueCollectionView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet UIButton *removeTopButton;

@property (strong, nonatomic) StackObject* stackObject; // (2) Cтек и очередь
@property (strong, nonatomic) QueueObject* queueObject;

@end

@implementation CollectionsViewController

#pragma mark - IBActions
- (IBAction)segmentedControlWasChanged:(id)sender {
    if (_segmentedControl.selectedSegmentIndex == 1) {
        [_removeTopButton setEnabled:NO];
    } else {
        [_removeTopButton setEnabled:YES];
    }
}

- (IBAction)addRandomIntButtonWasPressed:(id)sender {
    NSInteger randomInteger = arc4random() % 100;
    __weak typeof(self) weakSelf = self;
    if (_segmentedControl.selectedSegmentIndex == 0) {
        [weakSelf.stackObject addElement:randomInteger withCompletion:^{
            [weakSelf.stackCollectionView reloadData];
            [weakSelf.stackCollectionView performBatchUpdates:nil completion:nil];
        } withFailure:^{
            [self showAlertWith:@"Count = 5" message:@"Before addition you must remove min 1 top element"];
        }];
    } else {
        [weakSelf.queueObject addElement:randomInteger withCompletion:^{
            [weakSelf.queueCollectionView reloadData];
            [weakSelf.stackCollectionView performBatchUpdates:nil completion:nil];
        }];
    }
}

- (IBAction)removeTopButtonWasPressed:(id)sender {
    __weak typeof(self) weakSelf = self;
    [weakSelf.stackObject removeElement:^{
        [weakSelf.stackCollectionView reloadData];
        [weakSelf.stackCollectionView performBatchUpdates:nil completion:nil];
    } withFailure:^ {
        [self showAlertWith:@"Stack is empty" message:@"Before removing you must add min 1 element"];
    }];
}

- (IBAction)removeAllButtonWasPressed:(id)sender {
    __weak typeof(self) weakSelf = self;
    if (_segmentedControl.selectedSegmentIndex == 0) {
        [weakSelf.stackObject removeAll:^{
            [weakSelf.stackCollectionView reloadData];
            [weakSelf.stackCollectionView performBatchUpdates:nil completion:nil];
        }];
    } else {
        [weakSelf.queueObject removeAll:^{
            [weakSelf.queueCollectionView reloadData];
            [weakSelf.queueCollectionView performBatchUpdates:nil completion:nil];
        }];
    }
}


#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupVC];
}

#pragma mark - Support func-s
- (void)setupVC {
    _stackObject = [StackObject new];
    _queueObject = [QueueObject new];

    [_queueCollectionView registerNib:[UINib nibWithNibName: @"ValueCollectionViewCell" bundle: NULL] forCellWithReuseIdentifier: @"ValueCollectionViewCell"];
    [_stackCollectionView registerNib:[UINib nibWithNibName: @"ValueCollectionViewCell" bundle: NULL] forCellWithReuseIdentifier: @"ValueCollectionViewCell"];

    [self delegating];
    [self setupUI];
}

- (void)delegating {
    _stackCollectionView.delegate = self;
    _stackCollectionView.dataSource = self;

    _queueCollectionView.delegate = self;
    _queueCollectionView.dataSource = self;
}

- (void)setupUI {
    _stackView.layer.cornerRadius = 8;
    _queueView.layer.cornerRadius = 8;
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ValueCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"ValueCollectionViewCell" forIndexPath:indexPath];

    cell.delegate = self; // (4) Тут могли бы начаться проблемы с retain cycle

    if (collectionView == _stackCollectionView) {
        [cell setValue: [_stackObject objectAtIndex: indexPath.row]];
    } else {
        [cell setValue: [_queueObject objectAtIndex: indexPath.row]];
    }

    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == _stackCollectionView) {
        return _stackObject.count;
    } else {
        return _queueObject.count;
    }
}

- (void)showAlertWith: (NSString*)title message:(NSString*)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Ok" style:(UIAlertActionStyleDefault) handler:NULL];
    [alert addAction:okAction];

    [self presentViewController:alert animated:YES completion:NULL];
}

- (void)dealloc {
    NSLog(@"CollectionsViewController - dealloc");
}

@end





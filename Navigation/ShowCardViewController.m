//
//  ShowCardViewController.m
//  Navigation
//
//  Created by tcz on 9/1/13.
//  Copyright (c) 2013 Maer Studios Inc. All rights reserved.
//

#import "ShowCardViewController.h"
#import "PlayingCardView.h"

@interface ShowCardViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playCardView;
@end

@implementation ShowCardViewController

-(void)viewDidLoad{
    self.playCardView.rank = self.rank;
    self.playCardView.suit = self.suit;
    self.playCardView.faceUp = YES;
}

@end

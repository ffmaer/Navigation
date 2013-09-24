//
//  ViewController.m
//  Navigation
//
//  Created by tcz on 9/1/13.
//  Copyright (c) 2013 Maer Studios Inc. All rights reserved.
//

#import "ViewController.h"
#import "ShowCardViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UISegmentedControl *suitSegmentedControl;
@property (weak, nonatomic) IBOutlet UISlider *rankSlider;

@end

@implementation ViewController

-(int)rank{
    return round(self.rankSlider.value);
}

-(NSString *)rankAsString{
    return [self rankStrings: [self rank]];
}

- (IBAction)showRank:(UISlider *)sender {
    NSString *rank = [self rankAsString];
    self.display.text = rank;
}

- (NSString *) rankStrings:(int) rank{
    NSArray *rankStrings = @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    return rankStrings[rank];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ShowCard"]){
        if([segue.destinationViewController isKindOfClass:[ShowCardViewController class]]){
            ShowCardViewController *scvc = (ShowCardViewController *)segue.destinationViewController;
            scvc.suit = [self suit];
            scvc.rank = [self rank];
            scvc.title = [[self rankAsString] stringByAppendingString:[self suit]];
        }
    }
}
-(NSString *)suit{
    return [self.suitSegmentedControl titleForSegmentAtIndex:self.suitSegmentedControl.selectedSegmentIndex];
}

@end

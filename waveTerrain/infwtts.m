//
//  infwtts.m
//  waveTerrain
//
//  Created by David Moya on 12/11/2013.
//  Copyright (c) 2013 David Moya. All rights reserved.
//

#import "infwtts.h"

@interface infwtts ()

@end

@implementation infwtts


//Was button to go back
-(IBAction)back
{
    [self.presentingViewController
          dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated{
    
    

}

//Hidden status Bar
-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

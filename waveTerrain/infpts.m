//
//  infpts.m
//  waveTerrain
//
//  Created by David Moya on 12/11/2013.
//  Copyright (c) 2013 David Moya. All rights reserved.
//

#import "infpts.h"

@interface infpts ()

@end

@implementation infpts

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
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource: @"index2" ofType:@"html"];
    
    NSData *htmlData = [ NSData dataWithContentsOfFile:htmlFile];
    
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [super viewDidLoad];
    
    [self.webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL ];
	// Do any additional setup after loading the view.
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

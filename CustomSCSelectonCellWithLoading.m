/*
 *  CustomSCSelectonWithLoadingCell.m
 *  psyTrack Clinician Tools
 *  Version: 1.0
 *
 *
 The MIT License (MIT)
 Copyright © 2011- 2021 Daniel Boice
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 *  Created by Daniel Boice on 1/9/12.
 *  Copyright (c) 2011 PsycheWeb LLC. All rights reserved.
 *
 *
 *	This notice may not be removed from this file.
 *
 */
#import "CustomSCSelectonCellWithLoading.h"

@implementation CustomSCSelectonCellWithLoading
@synthesize imageView, loadingImagesArray;
@synthesize image1,image2,image3,image4,image5,image6,image7,image8;

- (void) performInitialization
{
    [super performInitialization];

    // create the view that will execute our animation
    CGRect imageViewFrame;
    if ([SCUtilities is_iPad])
    {
        imageViewFrame = CGRectMake(self.frame.size.width - 110, (self.frame.size.height / 2) - 7, 45,14);
    }
    else
    {
        imageViewFrame = CGRectMake(self.frame.size.width - 75, (self.frame.size.height / 2) - 7, 45,14);
    }

    self.imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];

    // load all the frames of our animation

    self.image1 = [UIImage imageNamed:@"loading-1.png"];
    self.image2 = [UIImage imageNamed:@"loading-2.png"];
    self.image3 = [UIImage imageNamed:@"loading-3.png"];
    self.image4 = [UIImage imageNamed:@"loading-4.png"];
    self.image5 = [UIImage imageNamed:@"loading-5.png"];
    self.image6 = [UIImage imageNamed:@"loading-6.png"];
    self.image7 = [UIImage imageNamed:@"loading-7.png"];
    self.image8 = [UIImage imageNamed:@"loading-8.png"];
    //set contentMode to scale aspect to fit
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    self.loadingImagesArray = [[NSArray alloc]initWithObjects:image1,image2,image3,image4,image5,image6,image7, image8, nil];

    self.imageView.animationImages = loadingImagesArray;

    // all frames will execute in 1.75 seconds
    self.imageView.animationDuration = 0.4;
    // repeat the annimation forever
    self.imageView.animationRepeatCount = 0;
    // start animating

    [imageView setFrame:imageViewFrame];
    [self addSubview:(UIView *)imageView];
}


- (void) didSelectCell
{
    self.imageView.hidden = FALSE;
    [self.imageView startAnimating];
}


#pragma mark - View lifecycle

/*
   // Implement loadView to create a view hierarchy programmatically, without using a nib.
   - (void)loadView
   {
   }
 */

/*
   // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
   - (void)viewDidLoad
   {
    [super viewDidLoad];
   }
 */

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}


@end

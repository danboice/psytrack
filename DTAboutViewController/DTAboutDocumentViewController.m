//
//  DTAboutDocumentViewController.m
//
//  Created by Oliver on 03.09.09.
//  Copyright 2009 Drobnik.com. All rights reserved.
//

#import "DTAboutDocumentViewController.h"

#import "BigProgressView.h"
#import "TouchyWebView.h"
#import "NSString+Helpers.h"


@implementation DTAboutDocumentViewController

@synthesize webView, fullScreenViewing;


- (id) initWithDocumentURL:(NSURL *)url
{
	NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"psyTrack" ofType:@"bundle"];
	NSBundle *resourceBundle = [NSBundle bundleWithPath:bundlePath];
	
	self = [self initWithNibName:@"AboutDocumentViewController" bundle:resourceBundle];
	
	if (self)
	{
		prog = [[BigProgressView alloc] initWithFrame:CGRectMake(0, 64, 320, 367)];
		
		// we need to get the top window
		//	ELOAppDelegate *appDelegate = (ELOAppDelegate *)[[UIApplication sharedApplication] delegate];
		
		//	[appDelegate.window addSubview:prog];
		
		urlToLoadWhenAppearing = url ;
		self.title = @"Loading ...";
	}
	
	return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	if (urlToLoadWhenAppearing)
	{
		NSURLRequest *request=[NSURLRequest requestWithURL:urlToLoadWhenAppearing
											   cachePolicy:NSURLRequestUseProtocolCachePolicy
										   timeoutInterval:10.0];
		
		[webView loadRequest:request];
	}
	
	if (fullScreenViewing)
	{
		self.wantsFullScreenLayout = YES;
	}
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	
	[prog stopAnimating];
	[webView stopLoading];
	//self.navigationItem.rightBarButtonItem.enabled = YES; // for reloading when we return
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    [super viewDidUnload];
    
}





// does not work without changing something to the tab bar
// support rotation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES; // all supported
}


#pragma mark webView delegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	if (![urlToLoadWhenAppearing isFileURL])
	{
		[prog startAnimatingOverView:self.view];
	}
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	[prog stopAnimating];
	
	if (error.code==-999)  // cancelled request
	{
		return;
	}
	else if (error.code==102)  // unsupported document type
	{
		NSString *errorPage = [NSString pathForLocalizedFileInAppBundle:@"iphone" ofType:@"html"];
		NSURL *url = [NSURL fileURLWithPath:errorPage];
		
		[self.webView loadRequest:[NSURLRequest requestWithURL:url]];
		
		return;
	}
	else
	{
		UIAlertView * alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Failed to load document", @"Docs")
														 message:[error localizedDescription]
														delegate:self
											   cancelButtonTitle:NSLocalizedString(@"Ok", @"General")
											   otherButtonTitles:nil, nil];
		[alert show];
	}
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	[prog stopAnimating]; 
	
	if (fullScreenViewing)
	{
		[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
//		[[UIApplication sharedApplication] setStatusBarHidden:YES animated:YES];

		[self.navigationController setNavigationBarHidden:YES animated:YES];
	}
	
	NSString *title = [self.webView stringByEvaluatingJavaScriptFromString: @"document.title"];
	self.title = title;
}


- (void) touchAtPoint:(CGPoint)touchPoint
{
	if (!fullScreenViewing) return;
	
	CGPoint point = [webView convertPoint:touchPoint toView:self.navigationController.view];
	BOOL inTop = (point.y<80.0);
	
	[[UIApplication sharedApplication] setStatusBarHidden:!inTop withAnimation:UIStatusBarAnimationFade];
//	[[UIApplication sharedApplication] setStatusBarHidden:!inTop animated:YES];

	[self.navigationController setNavigationBarHidden:!inTop animated:YES];
}


@end


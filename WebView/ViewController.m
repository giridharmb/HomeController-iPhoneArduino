//
//  ViewController.m
//  WebView
//
//  Created by Giridhar Bhujanga on 1/14/15.
//  Copyright (c) 2015 Giridhar Bhujanga. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    webview.delegate = self;
    
    loadingIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(145, 190, 20,20)];
    
    [loadingIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [loadingIndicator setHidesWhenStopped:YES];
    
    [webview addSubview:loadingIndicator];

    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    

    
   [webview.scrollView setShowsHorizontalScrollIndicator:NO];
   [webview.scrollView setShowsVerticalScrollIndicator:YES];
    
    webview.scrollView.alwaysBounceVertical = NO;
    webview.scrollView.alwaysBounceHorizontal = NO;
    
    webview.scrollView.bounces = NO;
    
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.my-server.in/mypath/arduino/control.php"]]];
    
    
    /////////////////////////////////////////////////////////////////////////////////
    
    
}


-(void)webViewDidStartLoad:(UIWebView *)webView {
    [loadingIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
        [loadingIndicator stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



@implementation NSURLRequest (NSURLRequestWithIgnoreSSL)

+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host
{
    return YES;
}

@end

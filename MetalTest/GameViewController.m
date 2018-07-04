//
//  GameViewController.m
//  MetalTest
//
//  Created by Trystan Larey-Williams on 5/28/18.
//  Copyright © 2018 Blue Canvas Studios LLC. All rights reserved.
//

#import "GameViewController.h"
#import "Renderer.h"

@implementation GameViewController
{
    MTKView *_view;

    Renderer *_renderer;
}

- (void)loadView {
    self.view = [[MTKView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _view = (MTKView *)self.view;

    _view.device = MTLCreateSystemDefaultDevice();

    if(!_view.device)
    {
        NSLog(@"Metal is not supported on this device");
        self.view = [[NSView alloc] initWithFrame:self.view.frame];
        return;
    }

    _renderer = [[Renderer alloc] initWithMetalKitView:_view];

    [_renderer mtkView:_view drawableSizeWillChange:_view.bounds.size];

    _view.delegate = _renderer;
    
    CGRect newFrame = CGRectMake( _view.frame.origin.x, _view.frame.origin.y, 1920, 1080);
    _view.frame = newFrame;
}

- (void)keyDown:(NSEvent *)theEvent {
    NSLog(@"keyDown Detected");
}

- (void)mouseDown:(NSEvent *)theEvent {
    NSLog(@"mouseDown Detected");
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

@end

//
//  VideoPlayer.m
//  Interestmi
//
//  Created by Gagandeep Singh on 6/15/13.
//  Copyright (c) 2013 Gagandeep Singh. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import "VideoPlayer.h"
#define NUMBER_OF_VIDEOS 4

@interface VideoPlayer ()

@property (nonatomic, strong) NSString *index;
//@property (nonatomic, strong) NSString *thumbnailImage;
@property (nonatomic, strong) MPMoviePlayerController *videoPlayer;
@property (nonatomic, strong) UIImageView *thumbnailView;
@property (nonatomic, strong) UIButton *playButton;

@end

@implementation VideoPlayer

- (id)initWithFrame:(CGRect)frame index:(NSString *)index
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.index = index;
        [self showThumbnail];
        [self showPlayButton];
    }
    return self;
}

-(void)showThumbnail {
    if (!self.thumbnailView) {
        self.thumbnailView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.thumbnailView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"thumbnail%@",self.index]]];
        [self addSubview:self.thumbnailView];
    }
}

-(void)hideThumbnail {
    if (self.thumbnailView) {
        [self.thumbnailView removeFromSuperview];
        self.thumbnailView = nil;
    }
}

- (void)showPlayButton {
    if (!self.playButton) {
        self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.playButton setImage:[UIImage imageNamed:@"PlayButton.png"] forState:UIControlStateNormal];
        [self.playButton setFrame:CGRectMake(self.bounds.size.width/2 - 40, self.bounds.size.height/2 - 40, 80, 80)];
        [self.playButton addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.playButton];
    }
}

- (void)hidePlayButton {
    if (self.playButton) {
        [self.playButton removeFromSuperview];
        self.playButton = nil;
    }
}

- (void)playVideo {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(videoFinishedPlaying:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.videoPlayer];
    //hide the play button
    [self hidePlayButton];
    //hide the thumbnail
    [self hideThumbnail];
    
    int videoIndex = ([self.index intValue] - 1)%NUMBER_OF_VIDEOS+1;
    //NSLog(@"Video index :: %u", videoIndex);
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                           pathForResource:[NSString stringWithFormat:@"video%u", videoIndex] ofType:@"mov"]];
    self.videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [self.videoPlayer setShouldAutoplay:NO];
    [self.videoPlayer.view setFrame:self.bounds];
    [self addSubview:self.videoPlayer.view];
    [self.videoPlayer play];
}

- (UIImage*)thumbnail {
    return [self.videoPlayer thumbnailImageAtTime:1 timeOption:MPMovieTimeOptionNearestKeyFrame];
}

- (BOOL)isFullScreen {
    return self.videoPlayer.isFullscreen;
}

-(void)setFullScreen:(BOOL)doFullScreen animated:(BOOL)animated {
    [self.videoPlayer setFullscreen:doFullScreen animated:animated];
}

- (void)cleanUp {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:self.videoPlayer];
    
    [self.videoPlayer.view removeFromSuperview];
    self.videoPlayer = nil;
    [self showThumbnail];
    [self showPlayButton];
}

#pragma mark - Notifications

- (void)videoFinishedPlaying:(NSNotification *)notification {
    NSNumber *reason = [[notification userInfo] objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
    switch ([reason intValue]) {
        case MPMovieFinishReasonPlaybackEnded:
            NSLog(@"playbackFinished. Reason: Playback Ended");
            break;
        case MPMovieFinishReasonPlaybackError:
            NSLog(@"playbackFinished. Reason: Playback Error");
            break;
        case MPMovieFinishReasonUserExited:
            NSLog(@"playbackFinished. Reason: User Exited");
            break;
        default:
            break;
    }
    
    // This might happen when the playback finishes in fullscreen mode, in which we have to manually call
    // setFullscreen with NO to restore the fullscreen display, or when the playback finishes in embedded
    // mode, in which we just need to clean up the resources here.
    if (self.videoPlayer.isFullscreen) {
        [self.videoPlayer setFullscreen:NO animated:YES];
    }
    
    [self cleanUp];
}

@end

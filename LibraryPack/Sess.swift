//
//  Sess.swift
//  LibraryPack
//
//  Created by Anish Kumar on 9/19/18.
//  Copyright © 2018 Akamai. All rights reserved.
//

//import Foundation
//
////SDWebImage Swift
//let sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
//VocServiceFactory.setupSessionConfiguration(sessionConfig)
//
//SDWebImageDownloader.shared() .createNewSession(with: sessionConfig)
//self.libraryImageView.sd_setImage(with: URL(string: "url"), placeholderImage: UIImage(named: "placeholder"))
//
//
////AFNetworking Objective c
//NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//[VocServiceFactory setupSessionConfiguration : configuration ]; // sessionConfig now uses SDK
//AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//
//NSURL *URL = [NSURL URLWithString:@"url"];
//NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//
//NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
//    //
//    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
//    //
//    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//    if (error) {
//    NSLog(@"Error: %@", error);
//    } else {
//    NSLog(@"%@ %@", response, responseObject);
//    }
//    }];
//[dataTask resume];
//
//
//NSURLSessionConfiguration * sessionConfig = [ NSURLSessionConfiguration defaultSessionConfiguration ];
//[ VocServiceFactory setupSessionConfiguration : sessionConfig ]; // sessionConfig now uses SDK
//NSURLSession * session = [ NSURLSession sessionWithConfiguration : sessionConfig delegate : self delegateQueue : nil ];
//
//// MAP: tell config to use Mobile Accelerator
//let sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
//VocServiceFactory.setupSessionConfiguration(sessionConfig)
////SDWeb
//SDWebImageDownloader.shared() .createNewSession(with: sessionConfig)
//self.libraryImageView.sd_setImage(with: URL(string: "imageURL"), placeholderImage: UIImage(named: "placeholder"))

//
//  ViewController.swift
//  imageScrollerEffect
//
//  Created by 章敏杰 on 16/3/2.
//  Copyright © 2016年 zmj. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UIScrollViewDelegate {
    
    var imageView:UIImageView!
    var scrollView:UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView = UIImageView(image: UIImage(named: "白色渡轮"))
        
        setupScrollView()
        scrollView.delegate = self
        
        setZoomScaleFor(scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setZoomScaleFor(scrollView.bounds.size)
        
        if  scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        
        recenterImage()
    }
    
    //setup scrollView
    
    private func setupScrollView() {
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.FlexibleWidth,.FlexibleWidth]
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    
    private func setZoomScaleFor(srollViewSize:CGSize) {
        
        let imageSize = imageView.bounds.size
        let widthScale = srollViewSize.width / imageSize.width
        let heightScale = srollViewSize.height / imageSize.height
        let minmunScale = min(widthScale,heightScale)
        
        scrollView.minimumZoomScale = minmunScale
        scrollView.maximumZoomScale = 4.0
    }
    private func recenterImage() {
        
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalspace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2.0 : 0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalspace, horizontalSpace, verticalspace, horizontalSpace)
    }
    
    func viewForZoomingInScrollView(scrollView:UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidZoom(scrollView:UIScrollView) {
        self.recenterImage()
    }

}

